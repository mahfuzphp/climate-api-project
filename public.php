<?php
error_reporting(E_ALL);

require_once 'database.php';

function getDbConnection()
{
    $host = 'localhost';
    $dbname = 'climate_data';
    $username = 'root';
    $password = '';
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        error_log("Database connection error: " . $e->getMessage());
        return false;
    }
}

// Get all available item group names
function getAllItemGroups()
{
    $conn = getDbConnection();
    if (!$conn) return [];

    try {
        $stmt = $conn->query("SELECT DISTINCT item_group_name FROM climate_data WHERE item_group_name IS NOT NULL AND item_group_name != '' ORDER BY item_group_name");
        return $stmt->fetchAll(PDO::FETCH_COLUMN);
    } catch (PDOException $e) {
        error_log("Database error: " . $e->getMessage());
        return [];
    }
}

// Get climate data for a specific group
function getGroupClimateData($groupName)
{
    $conn = getDbConnection();
    if (!$conn) return [];

    try {
        $stmt = $conn->prepare("SELECT l.latitude, l.longitude, 
                             c.date, c.variable_code, c.variable_name, c.value, c.unit, c.source, c.created_at, c.item_group_name
                             FROM locations l
                             JOIN climate_data c ON l.id = c.location_id
                             WHERE c.item_group_name = :group_name
                             ORDER BY c.date ASC");
        $stmt->execute([':group_name' => $groupName]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        error_log("Database error: " . $e->getMessage());
        return [];
    }
}

// Prepare data for chart
function prepareChartData($groupData)
{
    $chartData = [
        'labels' => [],
        'datasets' => []
    ];

    // Group data by variable
    $variableData = [];
    foreach ($groupData as $row) {
        $date = $row['date'];
        $variable = $row['variable_name'];
        $value = floatval($row['value']);

        if (!isset($variableData[$variable])) {
            $variableData[$variable] = [
                'label' => $variable,
                'data' => [],
                'borderColor' => getRandomColor(),
                'fill' => false
            ];
        }

        // Add date to labels if not already there
        if (!in_array($date, $chartData['labels'])) {
            $chartData['labels'][] = $date;
        }

        // Store value with date as key for later ordering
        $variableData[$variable]['dataByDate'][$date] = $value;
    }

    // Sort labels (dates) chronologically
    sort($chartData['labels']);

    // Reorganize data to match the order of labels
    foreach ($variableData as $variable => $dataset) {
        $orderedData = [];
        foreach ($chartData['labels'] as $date) {
            $orderedData[] = $dataset['dataByDate'][$date] ?? null;
        }

        $variableData[$variable]['data'] = $orderedData;
        unset($variableData[$variable]['dataByDate']);
        $chartData['datasets'][] = $variableData[$variable];
    }

    return $chartData;
}

// Generate random color for chart lines
function getRandomColor()
{
    $colors = [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 206, 86)',
        'rgb(75, 192, 192)',
        'rgb(153, 102, 255)',
        'rgb(255, 159, 64)',
        'rgb(199, 199, 199)',
        'rgb(83, 102, 255)',
        'rgb(40, 159, 64)',
        'rgb(210, 199, 199)'
    ];

    static $index = 0;
    $color = $colors[$index % count($colors)];
    $index++;
    return $color;
}

$allGroups = getAllItemGroups();
$groupData = [];
$selectedGroup = '';
$chartData = null;

// Check if group name is passed in URL
if (isset($_GET['group']) && !empty($_GET['group'])) {
    $selectedGroup = filter_var($_GET['group'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $groupData = getGroupClimateData($selectedGroup);

    // Prepare chart data if we have data
    if (!empty($groupData)) {
        $chartData = prepareChartData($groupData);
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Climate Data Viewer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .group-card {
            transition: transform 0.2s ease-in-out;
            border: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .group-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .group-item {
            cursor: pointer;
            border-left: 4px solid transparent;
            transition: all 0.3s ease;
        }

        .group-item:hover {
            border-left-color: #0d6efd;
            background-color: #f8f9fa;
        }

        .group-item.active {
            background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
            color: white;
            border-left-color: #ffffff;
        }

        .header-gradient {
            background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
        }

        .info-gradient {
            background: linear-gradient(135deg, #17a2b8 0%, #138496 100%);
        }

        .stats-card {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
        }
    </style>
</head>

<body class="bg-light">
    <div class="container-fluid py-4">
        <div class="row">
            <!-- Sidebar for Groups -->
            <div class="col-md-4 col-lg-3 mb-4">
                <div class="card group-card h-100">
                    <div class="card-header header-gradient text-white">
                        <h4 class="mb-0">
                            <i class="fas fa-layer-group me-2"></i>
                            Climate Data Groups
                        </h4>
                        <small class="opacity-75">Select a group to view data</small>
                    </div>
                    <div class="card-body p-0">
                        <?php if (!empty($allGroups)): ?>
                            <div class="list-group list-group-flush">
                                <?php foreach ($allGroups as $index => $group): ?>
                                    <a href="public.php?group=<?php echo urlencode($group); ?>"
                                        class="list-group-item list-group-item-action group-item d-flex justify-content-between align-items-center <?php echo ($selectedGroup === $group) ? 'active' : ''; ?>">
                                        <div>
                                            <strong><?php echo htmlspecialchars($group); ?></strong>
                                        </div>
                                        <small class="<?php echo ($selectedGroup === $group) ? 'text-white-50' : 'text-muted'; ?>">
                                            Group <?php echo $index + 1; ?>
                                        </small>
                                    </a>
                                <?php endforeach; ?>
                            </div>
                        <?php else: ?>
                            <div class="p-4 text-center text-muted">
                                <i class="fas fa-database fa-3x mb-3 opacity-50"></i>
                                <h5>No Groups Found</h5>
                                <p class="mb-0">Contact administrator to add data groups.</p>
                            </div>
                        <?php endif; ?>
                    </div>
                    <div class="card-footer bg-light">
                        <div class="text-center">
                            <small class="text-muted">
                                <i class="fas fa-info-circle me-1"></i>
                                Public Climate Data Viewer
                            </small>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Content Area -->
            <div class="col-md-8 col-lg-9">
                <?php if (!empty($selectedGroup)): ?>
                    <!-- Selected Group Header -->
                    <div class="card group-card mb-4">
                        <div class="card-header info-gradient text-white">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h3 class="mb-0"><?php echo htmlspecialchars($selectedGroup); ?></h3>
                                    <small class="opacity-75">Climate Data Analysis</small>
                                </div>
                                <?php if (!empty($groupData)): ?>
                                    <div class="text-end">
                                        <div class="badge bg-light text-dark fs-6">
                                            <?php echo count($groupData); ?> records
                                        </div>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>

                    <?php if (!empty($groupData)): ?>
                        <!-- Statistics Cards -->
                        <?php
                        $uniqueVariables = array_unique(array_column($groupData, 'variable_name'));
                        $uniqueLocations = array_unique(array_map(function ($row) {
                            return $row['latitude'] . ',' . $row['longitude'];
                        }, $groupData));
                        $dateRange = [
                            'min' => min(array_column($groupData, 'date')),
                            'max' => max(array_column($groupData, 'date'))
                        ];
                        ?>
                        <div class="row mb-4">
                            <div class="col-md-3 mb-3">
                                <div class="card stats-card">
                                    <div class="card-body text-center">
                                        <h4 class="mb-1"><?php echo count($uniqueVariables); ?></h4>
                                        <small>Variables</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <div class="card stats-card">
                                    <div class="card-body text-center">
                                        <h4 class="mb-1"><?php echo count($uniqueLocations); ?></h4>
                                        <small>Locations</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <div class="card stats-card">
                                    <div class="card-body text-center">
                                        <h4 class="mb-1"><?php echo count($groupData); ?></h4>
                                        <small>Records</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <div class="card stats-card">
                                    <div class="card-body text-center">
                                        <h4 class="mb-1"><?php echo date('Y', strtotime($dateRange['min'])) . '-' . date('Y', strtotime($dateRange['max'])); ?></h4>
                                        <small>Date Range</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Chart Container -->
                        <div class="card group-card mb-4">
                            <div class="card-header info-gradient text-white">
                                <h5 class="mb-0">
                                    <i class="fas fa-chart-line me-2"></i>
                                    Climate Data Visualization
                                </h5>
                            </div>
                            <div class="card-body">
                                <canvas id="climateChart" style="height: 400px;"></canvas>
                            </div>
                        </div>

                        <!-- Data Table -->
                        <div class="card group-card">
                            <div class="card-header info-gradient text-white">
                                <h5 class="mb-0">
                                    <i class="fas fa-table me-2"></i>
                                    Detailed Data Table
                                </h5>
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0">
                                        <thead class="table-light">
                                            <tr>
                                                <th class="fw-semibold">Location</th>
                                                <th class="fw-semibold">Date</th>
                                                <th class="fw-semibold">Variable</th>
                                                <th class="fw-semibold">Value</th>
                                                <th class="fw-semibold">Unit</th>
                                                <th class="fw-semibold">Source</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($groupData as $row): ?>
                                                <tr>
                                                    <td>
                                                        <small class="text-muted">Lat:</small> <?php echo htmlspecialchars($row['latitude']); ?><br>
                                                        <small class="text-muted">Lng:</small> <?php echo htmlspecialchars($row['longitude']); ?>
                                                    </td>
                                                    <td><?php echo date('M j, Y', strtotime($row['date'])); ?></td>
                                                    <td>
                                                        <span class="badge bg-primary"><?php echo htmlspecialchars($row['variable_name']); ?></span>
                                                    </td>
                                                    <td class="fw-bold"><?php echo htmlspecialchars($row['value']); ?></td>
                                                    <td><em><?php echo htmlspecialchars($row['unit']); ?></em></td>
                                                    <td><small><?php echo htmlspecialchars($row['source']); ?></small></td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    <?php else: ?>
                        <div class="card group-card">
                            <div class="card-body text-center py-5">
                                <i class="fas fa-exclamation-triangle fa-3x text-warning mb-3"></i>
                                <h4>No Data Available</h4>
                                <p class="text-muted">No data found for the selected group "<?php echo htmlspecialchars($selectedGroup); ?>".</p>
                            </div>
                        </div>
                    <?php endif; ?>
                <?php else: ?>
                    <!-- Welcome Screen -->
                    <div class="card group-card">
                        <div class="card-body text-center py-5">
                            <i class="fas fa-chart-bar fa-4x text-primary mb-4"></i>
                            <h2 class="mb-3">Climate Data Analysis</h2>
                            <p class="lead text-muted mb-4">Select a group from the sidebar to view climate data visualizations and detailed information.</p>
                            <?php if (!empty($allGroups)): ?>
                                <p class="text-muted">You have <strong><?php echo count($allGroups); ?> groups</strong> available for analysis.</p>
                            <?php else: ?>
                                <div class="alert alert-info d-inline-block">
                                    <strong>No Data Available:</strong> Contact administrator to add climate data.
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>

    <?php if (!empty($chartData)): ?>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const ctx = document.getElementById('climateChart').getContext('2d');
                const chartData = <?php echo json_encode($chartData); ?>;

                new Chart(ctx, {
                    type: 'line',
                    data: chartData,
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            x: {
                                title: {
                                    display: true,
                                    text: 'Date',
                                    font: {
                                        size: 14,
                                        weight: 'bold'
                                    }
                                },
                                grid: {
                                    color: 'rgba(0,0,0,0.1)'
                                }
                            },
                            y: {
                                title: {
                                    display: true,
                                    text: 'Value',
                                    font: {
                                        size: 14,
                                        weight: 'bold'
                                    }
                                },
                                grid: {
                                    color: 'rgba(0,0,0,0.1)'
                                }
                            }
                        },
                        plugins: {
                            title: {
                                display: true,
                                text: 'Climate Data Trends - <?php echo htmlspecialchars($selectedGroup); ?>',
                                font: {
                                    size: 16,
                                    weight: 'bold'
                                }
                            },
                            tooltip: {
                                mode: 'index',
                                intersect: false,
                                backgroundColor: 'rgba(0,0,0,0.8)',
                                titleColor: 'white',
                                bodyColor: 'white',
                                borderColor: '#ddd',
                                borderWidth: 1
                            },
                            legend: {
                                position: 'top',
                                labels: {
                                    usePointStyle: true,
                                    font: {
                                        size: 12
                                    }
                                }
                            }
                        },
                        elements: {
                            line: {
                                tension: 0.4
                            },
                            point: {
                                radius: 4,
                                hoverRadius: 6
                            }
                        }
                    }
                });
            });
        </script>
    <?php endif; ?>
</body>

</html>