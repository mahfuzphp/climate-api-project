<?php
session_start();
error_reporting(E_ALL);

require_once 'auth.php';
require_once 'database.php';

$auth = new Auth();

// Redirect if not logged in
if (!$auth->isLoggedIn()) {
    header('Location: login.php');
    exit;
}

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
function getAllItemGroups() {
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
function getGroupClimateData($groupName) {
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
function prepareChartData($groupData) {
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
function getRandomColor() {
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
    <title>Climate Data by Group</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12 mb-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h3 class="mb-0">Climate Data by Group</h3>
                    </div>
                    <div class="card-body">
                        <h5>Available Item Groups:</h5>
                        <div class="list-group mb-4">
                            <?php foreach ($allGroups as $group): ?>
                                <a href="group_data.php?group=<?php echo urlencode($group); ?>" 
                                   class="list-group-item list-group-item-action <?php echo ($selectedGroup === $group) ? 'active' : ''; ?>">
                                    <?php echo htmlspecialchars($group); ?>
                                </a>
                            <?php endforeach; ?>
                            
                            <?php if (empty($allGroups)): ?>
                                <div class="alert alert-info">No item groups found. Add data with group names first.</div>
                            <?php endif; ?>
                        </div>
                        
                        <a href="import.php" class="btn btn-secondary mb-4">Back to Import</a>
                        
                        <?php if (!empty($selectedGroup)): ?>
                            <h4>Data for Group: <?php echo htmlspecialchars($selectedGroup); ?></h4>
                            
                            <?php if (!empty($groupData)): ?>
                                <!-- Chart Container -->
                                <div class="card mb-4">
                                    <div class="card-header bg-info text-white">
                                        <h5 class="mb-0">Climate Data Visualization</h5>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="climateChart" width="400" height="200"></canvas>
                                    </div>
                                </div>
                                
                                <!-- Data Table -->
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Location</th>
                                                <th>Date</th>
                                                <th>Variable</th>
                                                <th>Value</th>
                                                <th>Unit</th>
                                                <th>Source</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($groupData as $row): ?>
                                                <tr>
                                                    <td><?php echo htmlspecialchars($row['latitude'] . ', ' . $row['longitude']); ?></td>
                                                    <td><?php echo htmlspecialchars($row['date']); ?></td>
                                                    <td><?php echo htmlspecialchars($row['variable_name']); ?></td>
                                                    <td><?php echo htmlspecialchars($row['value']); ?></td>
                                                    <td><?php echo htmlspecialchars($row['unit']); ?></td>
                                                    <td><?php echo htmlspecialchars($row['source']); ?></td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php else: ?>
                                <div class="alert alert-warning">No data found for this group.</div>
                            <?php endif; ?>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
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
                                text: 'Date'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Value'
                            }
                        }
                    },
                    plugins: {
                        title: {
                            display: true,
                            text: 'Climate Data Trends'
                        },
                        tooltip: {
                            mode: 'index',
                            intersect: false
                        },
                        legend: {
                            position: 'top',
                        }
                    }
                }
            });
        });
    </script>
    <?php endif; ?>
</body>
</html>