<?php
session_start();
require_once 'auth.php';
require_once 'database.php';

$auth = new Auth();

// Check if user is logged in
$isLoggedIn = $auth->isLoggedIn();
$currentUser = $isLoggedIn ? $auth->getCurrentUser() : null;

// Generate CSRF token for forms
$csrfToken = $auth->generateCSRFToken();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Queensland Climate Data Explorer</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <!-- Chart.js -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.css" rel="stylesheet">

    <style>
        /* Your custom styles here */
        body {
            background-color: #f8f9fa;
        }

        .navbar-nav .nav-link {
            color: white !important;
        }

        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .feature {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">Queensland Climate Explorer</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.php">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="import.php">Import Data</a></li>
                    <li class="nav-item"><a class="nav-link" href="explore.php">Explore Data</a></li>
                    <?php if ($isLoggedIn && $auth->hasPermission('manage_users')): ?>
                        <li class="nav-item"><a class="nav-link" href="users.php">Manage Users</a></li>
                    <?php endif; ?>
                    <?php if ($isLoggedIn): ?>
                        <li class="nav-item"><a class="nav-link" href="logout.php">Logout (<?= htmlspecialchars($currentUser['username']) ?>)</a></li>
                    <?php else: ?>
                        <li class="nav-item"><a class="nav-link" href="login.php">Login</a></li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <section class="welcome mb-5">
            <h2 class="mb-4">Welcome to the Queensland Climate Data Explorer</h2>
            <p>This application allows you to access, analyze, and visualize climate data from Queensland, Australia.</p>

            <?php if (!$isLoggedIn): ?>
                <div class="alert alert-info mt-3">
                    Please <a href="login.php" class="alert-link">login</a> to access all features.
                </div>
            <?php else:

                $db = new Database();
                $pdo = $db->getConnection();

                // Get comprehensive statistics
                $stats = [];

                // =============== CLIMATE DATA STATISTICS ===============

                // Total records
                $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM climate_data");
                $stmt->execute();
                $stats['total_records'] = $stmt->fetch(PDO::FETCH_ASSOC)['total'];

                // Average temperature (using variable_code 'X' for Maximum Temperature)
                $stmt = $pdo->prepare("SELECT AVG(value) as avg_temp FROM climate_data WHERE variable_code = 'X'");
                $stmt->execute();
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                $stats['avg_temperature'] = $result['avg_temp'] ? round($result['avg_temp'], 1) : 0;

                // Temperature range
                $stmt = $pdo->prepare("SELECT MIN(value) as min_temp, MAX(value) as max_temp FROM climate_data WHERE variable_code = 'X'");
                $stmt->execute();
                $temp_range = $stmt->fetch(PDO::FETCH_ASSOC);
                $stats['min_temperature'] = $temp_range['min_temp'] ? round($temp_range['min_temp'], 1) : 0;
                $stats['max_temperature'] = $temp_range['max_temp'] ? round($temp_range['max_temp'], 1) : 0;

                // Average humidity (using variable_code 'H' for Relative Humidity)
                $stmt = $pdo->prepare("SELECT AVG(value) as avg_humidity FROM climate_data WHERE variable_code = 'H'");
                $stmt->execute();
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                $stats['avg_humidity'] = $result['avg_humidity'] ? round($result['avg_humidity'], 1) : 0;

                // Data sources count
                $stmt = $pdo->prepare("SELECT COUNT(DISTINCT source) as source_count FROM climate_data");
                $stmt->execute();
                $stats['data_sources'] = $stmt->fetch(PDO::FETCH_ASSOC)['source_count'];

                // =============== LOCATION STATISTICS ===============

                // Total locations
                $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM locations");
                $stmt->execute();
                $stats['total_locations'] = $stmt->fetch(PDO::FETCH_ASSOC)['total'];

                // Get location details with climate data counts
                $stmt = $pdo->prepare("
        SELECT l.id, l.latitude, l.longitude, l.created_at,
               COUNT(cd.id) as data_count,
               MIN(cd.date) as earliest_data,
               MAX(cd.date) as latest_data
        FROM locations l
        LEFT JOIN climate_data cd ON l.id = cd.location_id
        GROUP BY l.id, l.latitude, l.longitude, l.created_at
        ORDER BY l.id
    ");
                $stmt->execute();
                $stats['locations_detail'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // =============== USER STATISTICS ===============

                // Total users
                $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM users");
                $stmt->execute();
                $stats['total_users'] = $stmt->fetch(PDO::FETCH_ASSOC)['total'];

                // Users by role
                $stmt = $pdo->prepare("SELECT role, COUNT(*) as count FROM users GROUP BY role ORDER BY count DESC");
                $stmt->execute();
                $stats['users_by_role'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // Active users (those who have logged in)
                $stmt = $pdo->prepare("SELECT COUNT(*) as active FROM users WHERE last_login IS NOT NULL");
                $stmt->execute();
                $stats['active_users'] = $stmt->fetch(PDO::FETCH_ASSOC)['active'];

                // Recent user activity
                $stmt = $pdo->prepare("
        SELECT username, role, last_login 
        FROM users 
        WHERE last_login IS NOT NULL 
        ORDER BY last_login DESC 
        LIMIT 5
    ");
                $stmt->execute();
                $stats['recent_activity'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // =============== CHART DATA ===============

                // Recent temperature data for chart (last 30 records)
                $stmt = $pdo->prepare("
        SELECT cd.date, cd.value as temperature, cd.location_id, l.latitude, l.longitude
        FROM climate_data cd
        LEFT JOIN locations l ON cd.location_id = l.id
        WHERE cd.variable_code = 'X' 
        ORDER BY cd.date DESC LIMIT 30
    ");
                $stmt->execute();
                $stats['recent_temp_data'] = array_reverse($stmt->fetchAll(PDO::FETCH_ASSOC));

                // Recent humidity data for chart
                $stmt = $pdo->prepare("
        SELECT cd.date, cd.value as humidity, cd.location_id, l.latitude, l.longitude
        FROM climate_data cd
        LEFT JOIN locations l ON cd.location_id = l.id
        WHERE cd.variable_code = 'H' 
        ORDER BY cd.date DESC LIMIT 30
    ");
                $stmt->execute();
                $stats['recent_humidity_data'] = array_reverse($stmt->fetchAll(PDO::FETCH_ASSOC));

                // Data by source
                $stmt = $pdo->prepare("
        SELECT source, COUNT(*) as count, 
               MIN(date) as first_date, MAX(date) as last_date
        FROM climate_data 
        GROUP BY source 
        ORDER BY count DESC
    ");
                $stmt->execute();
                $stats['data_by_source'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // Variable types summary
                $stmt = $pdo->prepare("
        SELECT variable_code, variable_name, COUNT(*) as count, 
               MIN(value) as min_val, MAX(value) as max_val, AVG(value) as avg_val, unit
        FROM climate_data 
        GROUP BY variable_code, variable_name, unit
        ORDER BY count DESC
    ");
                $stmt->execute();
                $stats['variable_summary'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

            ?>
                <div class="dashboard mt-4">
                    <div class="dashboard-header mb-4">
                        <h2>🌡️ Climate Data Analytics Dashboard</h2>
                        <p class="text-muted">Comprehensive overview of climate data, locations, and system usage</p>
                    </div>

                    <!-- Main Statistics Cards -->
                    <div class="row mb-4">
                        <div class="col-lg-2 col-md-4 col-sm-6 mb-3">
                            <div class="stat-card climate-card">
                                <div class="stat-icon">📊</div>
                                <h6>Total Records</h6>
                                <p class="stat-value"><?= number_format($stats['total_records']) ?></p>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mb-3">
                            <div class="stat-card temp-card">
                                <div class="stat-icon">🌡️</div>
                                <h6>Avg Temperature</h6>
                                <p class="stat-value"><?= $stats['avg_temperature'] ?>°C</p>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mb-3">
                            <div class="stat-card humidity-card">
                                <div class="stat-icon">💧</div>
                                <h6>Avg Humidity</h6>
                                <p class="stat-value"><?= $stats['avg_humidity'] ?>%</p>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mb-3">
                            <div class="stat-card location-card">
                                <div class="stat-icon">📍</div>
                                <h6>Locations</h6>
                                <p class="stat-value"><?= number_format($stats['total_locations']) ?></p>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mb-3">
                            <div class="stat-card user-card">
                                <div class="stat-icon">👥</div>
                                <h6>System Users</h6>
                                <p class="stat-value"><?= number_format($stats['total_users']) ?></p>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mb-3">
                            <div class="stat-card source-card">
                                <div class="stat-icon">🔗</div>
                                <h6>Data Sources</h6>
                                <p class="stat-value"><?= number_format($stats['data_sources']) ?></p>
                            </div>
                        </div>
                    </div>

                    <!-- Temperature Range Quick Stats -->
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <div class="card info-card">
                                <div class="card-body text-center">
                                    <h6>Temperature Range</h6>
                                    <div class="temp-range">
                                        <span class="temp-min">❄️ Min: <?= $stats['min_temperature'] ?>°C</span>
                                        <span class="temp-avg">🌡️ Avg: <?= $stats['avg_temperature'] ?>°C</span>
                                        <span class="temp-max">🔥 Max: <?= $stats['max_temperature'] ?>°C</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Charts Section -->
                    <div class="row mb-4">
                        <div class="col-xl-6 col-lg-12 mb-4">
                            <div class="card chart-card">
                                <div class="card-header">
                                    <h5>🌡️ Temperature Trends</h5>
                                    <small class="text-muted">Maximum temperature readings over time</small>
                                </div>
                                <div class="card-body">
                                    <div style="height: 300px;">
                                        <canvas id="temperatureChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-12 mb-4">
                            <div class="card chart-card">
                                <div class="card-header">
                                    <h5>💧 Humidity Trends</h5>
                                    <small class="text-muted">Relative humidity levels over time</small>
                                </div>
                                <div class="card-body">
                                    <div style="height: 300px;">
                                        <canvas id="humidityChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Data Tables Section -->
                    <div class="row mb-4">
                        <!-- Locations Table -->
                        <div class="col-xl-8 col-lg-12 mb-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5>📍 Monitoring Locations</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Coordinates</th>
                                                    <th>Data Records</th>
                                                    <th>Data Period</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($stats['locations_detail'] as $location): ?>
                                                    <tr>
                                                        <td><span class="badge badge-primary">Loc <?= $location['id'] ?></span></td>
                                                        <td>
                                                            <small>
                                                                <strong>Lat:</strong> <?= $location['latitude'] ?>°<br>
                                                                <strong>Lng:</strong> <?= $location['longitude'] ?>°
                                                            </small>
                                                        </td>
                                                        <td>
                                                            <span class="badge badge-info"><?= number_format($location['data_count']) ?> records</span>
                                                        </td>
                                                        <td>
                                                            <small>
                                                                <?php if ($location['earliest_data']): ?>
                                                                    <?= date('M j, Y', strtotime($location['earliest_data'])) ?><br>
                                                                    to <?= date('M j, Y', strtotime($location['latest_data'])) ?>
                                                                <?php else: ?>
                                                                    No data yet
                                                                <?php endif; ?>
                                                            </small>
                                                        </td>
                                                        <td>
                                                            <?php if ($location['data_count'] > 0): ?>
                                                                <span class="badge badge-success">Active</span>
                                                            <?php else: ?>
                                                                <span class="badge badge-warning">No Data</span>
                                                            <?php endif; ?>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Users Statistics -->
                        <div class="col-xl-4 col-lg-12 mb-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5>👥 System Users</h5>
                                </div>
                                <div class="card-body">
                                    <!-- User Role Distribution -->
                                    <h6>Users by Role</h6>
                                    <?php foreach ($stats['users_by_role'] as $role): ?>
                                        <div class="role-stat mb-2">
                                            <div class="d-flex justify-content-between">
                                                <span class="role-name"><?= ucfirst($role['role']) ?></span>
                                                <span class="role-count badge badge-secondary"><?= $role['count'] ?></span>
                                            </div>
                                            <div class="progress" style="height: 6px;">
                                                <div class="progress-bar" style="width: <?= ($role['count'] / $stats['total_users']) * 100 ?>%"></div>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>

                                    <hr>

                                    <!-- Activity Stats -->
                                    <div class="activity-stats">
                                        <div class="d-flex justify-content-between mb-2">
                                            <span>Active Users:</span>
                                            <span class="badge badge-success"><?= $stats['active_users'] ?>/<?= $stats['total_users'] ?></span>
                                        </div>
                                        <div class="progress mb-3" style="height: 8px;">
                                            <div class="progress-bar bg-success"
                                                style="width: <?= ($stats['active_users'] / $stats['total_users']) * 100 ?>%"></div>
                                        </div>
                                    </div>

                                    <!-- Recent Activity -->
                                    <?php if (!empty($stats['recent_activity'])): ?>
                                        <h6>Recent Login Activity</h6>
                                        <div class="recent-activity">
                                            <?php foreach ($stats['recent_activity'] as $activity): ?>
                                                <div class="activity-item">
                                                    <small>
                                                        <strong><?= htmlspecialchars($activity['username']) ?></strong>
                                                        <span class="badge badge-outline-<?= $activity['role'] === 'admin' ? 'danger' : 'primary' ?>"><?= $activity['role'] ?></span><br>
                                                        <span class="text-muted"><?= date('M j, Y H:i', strtotime($activity['last_login'])) ?></span>
                                                    </small>
                                                </div>
                                            <?php endforeach; ?>
                                        </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Variable Summary and Data Sources -->
                    <div class="row mb-4">
                        <div class="col-lg-8 mb-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5>📊 Variable Types</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Variable</th>
                                                    <th>Code</th>
                                                    <th>Records</th>
                                                    <th>Range</th>
                                                    <th>Average</th>
                                                    <th>Unit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($stats['variable_summary'] as $var): ?>
                                                    <tr>
                                                        <td><?= htmlspecialchars($var['variable_name']) ?></td>
                                                        <td><span class="badge badge-primary"><?= htmlspecialchars($var['variable_code']) ?></span></td>
                                                        <td><?= number_format($var['count']) ?></td>
                                                        <td>
                                                            <small>
                                                                <?= round($var['min_val'], 1) ?> - <?= round($var['max_val'], 1) ?>
                                                            </small>
                                                        </td>
                                                        <td><?= round($var['avg_val'], 1) ?></td>
                                                        <td><span class="unit-badge"><?= htmlspecialchars($var['unit']) ?></span></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 mb-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5>🔗 Data Sources</h5>
                                </div>
                                <div class="card-body">
                                    <?php foreach ($stats['data_by_source'] as $source): ?>
                                        <div class="source-item mb-3">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <strong><?= htmlspecialchars($source['source']) ?></strong><br>
                                                    <small class="text-muted">
                                                        <?= date('M j', strtotime($source['first_date'])) ?> -
                                                        <?= date('M j, Y', strtotime($source['last_date'])) ?>
                                                    </small>
                                                </div>
                                                <span class="badge badge-info"><?= number_format($source['count']) ?></span>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chart.js Scripts -->
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                    // Temperature Chart
                    const tempCtx = document.getElementById('temperatureChart');
                    if (tempCtx) {
                        new Chart(tempCtx, {
                            type: 'line',
                            data: {
                                labels: [<?php
                                            foreach ($stats['recent_temp_data'] as $data) {
                                                echo "'" . date('M j', strtotime($data['date'])) . "',";
                                            }
                                            ?>],
                                datasets: [{
                                    label: 'Max Temperature (°C)',
                                    data: [<?php
                                            foreach ($stats['recent_temp_data'] as $data) {
                                                echo $data['temperature'] . ',';
                                            }
                                            ?>],
                                    borderColor: '#ff6b6b',
                                    backgroundColor: 'rgba(255, 107, 107, 0.1)',
                                    borderWidth: 3,
                                    tension: 0.4,
                                    fill: true
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: {
                                        display: true,
                                        position: 'top'
                                    }
                                },
                                scales: {
                                    y: {
                                        beginAtZero: false,
                                        title: {
                                            display: true,
                                            text: 'Temperature (°C)'
                                        },
                                        grid: {
                                            color: 'rgba(0,0,0,0.1)'
                                        }
                                    },
                                    x: {
                                        grid: {
                                            color: 'rgba(0,0,0,0.1)'
                                        }
                                    }
                                }
                            }
                        });
                    }

                    // Humidity Chart
                    const humidityCtx = document.getElementById('humidityChart');
                    if (humidityCtx) {
                        new Chart(humidityCtx, {
                            type: 'line',
                            data: {
                                labels: [<?php
                                            foreach ($stats['recent_humidity_data'] as $data) {
                                                echo "'" . date('M j', strtotime($data['date'])) . "',";
                                            }
                                            ?>],
                                datasets: [{
                                    label: 'Relative Humidity (%)',
                                    data: [<?php
                                            foreach ($stats['recent_humidity_data'] as $data) {
                                                echo $data['humidity'] . ',';
                                            }
                                            ?>],
                                    borderColor: '#4ecdc4',
                                    backgroundColor: 'rgba(78, 205, 196, 0.1)',
                                    borderWidth: 3,
                                    tension: 0.4,
                                    fill: true
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: {
                                        display: true,
                                        position: 'top'
                                    }
                                },
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        max: 100,
                                        title: {
                                            display: true,
                                            text: 'Humidity (%)'
                                        },
                                        grid: {
                                            color: 'rgba(0,0,0,0.1)'
                                        }
                                    },
                                    x: {
                                        grid: {
                                            color: 'rgba(0,0,0,0.1)'
                                        }
                                    }
                                }
                            }
                        });
                    }
                </script>

                <style>
                    .dashboard-header {
                        text-align: center;
                        padding: 20px 0;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        border-radius: 15px;
                        margin-bottom: 30px;
                    }

                    .dashboard-header h2 {
                        margin-bottom: 5px;
                        font-weight: 700;
                    }

                    .stat-card {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 20px;
                        border-radius: 15px;
                        text-align: center;
                        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
                        transition: all 0.3s ease;
                        height: 120px;
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                    }

                    .climate-card {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    }

                    .temp-card {
                        background: linear-gradient(135deg, #ff6b6b 0%, #ffa500 100%);
                    }

                    .humidity-card {
                        background: linear-gradient(135deg, #4ecdc4 0%, #44a08d 100%);
                    }

                    .location-card {
                        background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
                        color: #333;
                    }

                    .user-card {
                        background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%);
                        color: #333;
                    }

                    .source-card {
                        background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%);
                        color: #333;
                    }

                    .stat-card:hover {
                        transform: translateY(-5px) scale(1.02);
                        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
                    }

                    .stat-icon {
                        font-size: 1.5rem;
                        margin-bottom: 5px;
                    }

                    .stat-card h6 {
                        margin-bottom: 8px;
                        font-weight: 600;
                        font-size: 0.9rem;
                    }

                    .stat-value {
                        font-size: 1.8rem;
                        font-weight: bold;
                        margin: 0;
                        line-height: 1;
                    }

                    .info-card {
                        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                        color: white;
                        border: none;
                    }

                    .temp-range {
                        display: flex;
                        justify-content: space-around;
                        margin-top: 10px;
                    }

                    .temp-range span {
                        padding: 5px 15px;
                        background: rgba(255, 255, 255, 0.2);
                        border-radius: 20px;
                        font-weight: 600;
                    }

                    .card {
                        border: none;
                        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                        border-radius: 15px;
                        transition: all 0.3s ease;
                    }

                    .card:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
                    }

                    .chart-card .card-header {
                        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                        color: white;
                        border-radius: 15px 15px 0 0;
                    }

                    .card-header {
                        background-color: #f8f9fa;
                        border-bottom: 1px solid #dee2e6;
                        font-weight: 600;
                        border-radius: 15px 15px 0 0;
                    }

                    .table {
                        border-radius: 10px;
                        overflow: hidden;
                    }

                    .table th {
                        border-top: none;
                        font-weight: 600;
                        color: #495057;
                        background-color: #f8f9fa;
                    }

                    .table-hover tbody tr:hover {
                        background-color: rgba(0, 123, 255, 0.05);
                    }

                    .badge {
                        font-size: 0.75rem;
                        padding: 0.375rem 0.75rem;
                    }

                    .badge-primary {
                        background-color: #007bff;
                    }

                    .badge-info {
                        background-color: #17a2b8;
                    }

                    .badge-success {
                        background-color: #28a745;
                    }

                    .badge-warning {
                        background-color: #ffc107;
                        color: #212529;
                    }

                    .badge-secondary {
                        background-color: #6c757d;
                    }

                    .role-stat {
                        margin-bottom: 15px;
                    }

                    .role-name {
                        font-weight: 600;
                    }

                    .progress {
                        border-radius: 10px;
                        overflow: hidden;
                    }

                    .progress-bar {
                        background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                        border-radius: 10px;
                    }

                    .activity-item {
                        padding: 8px 0;
                        border-bottom: 1px solid #eee;
                    }

                    .activity-item:last-child {
                        border-bottom: none;
                    }

                    .source-item {
                        padding: 10px;
                        background: #f8f9fa;
                        border-radius: 8px;
                        border-left: 4px solid #007bff;
                    }

                    .unit-badge {
                        background: #e9ecef;
                        color: #495057;
                        padding: 2px 8px;
                        border-radius: 12px;
                        font-size: 0.75rem;
                        font-weight: 600;
                    }

                    @media (max-width: 768px) {
                        .stat-value {
                            font-size: 1.5rem;
                        }

                        .temp-range {
                            flex-direction: column;
                            gap: 10px;
                        }

                        .dashboard-header h2 {
                            font-size: 1.5rem;
                        }
                    }
                </style>

            <?php endif; ?>
        </section>

        <section class="features mb-5">
            <h2 class="mb-4">Features</h2>
            <div class="feature-grid">
                <div class="feature">
                    <h3>Import Data</h3>
                    <p>Import climate data from the SILO API for any location in Queensland.</p>
                </div>
                <div class="feature">
                    <h3>Explore Data</h3>
                    <p>View and analyze climate data with interactive charts and tables.</p>
                </div>
                <div class="feature">
                    <h3>Export Results</h3>
                    <p>Export your data and analysis results in various formats.</p>
                </div>
            </div>
        </section>
    </div>

    <!-- Footer -->
    <footer class="bg-light py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">&copy; <?= date('Y') ?> Queensland Climate Data Explorer</p>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <!-- Chart.js for climate data visualization -->
    <?php if ($isLoggedIn && !empty($stats['recent_data'])): ?>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const ctx = document.getElementById('climateChart').getContext('2d');

                // Prepare data from PHP
                const dates = <?= json_encode(array_column(array_reverse($stats['recent_data']), 'date')) ?>;
                const temperatures = <?= json_encode(array_column(array_reverse($stats['recent_data']), 'temperature')) ?>;
                const rainfall = <?= json_encode(array_column(array_reverse($stats['recent_data']), 'rainfall')) ?>;

                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: dates,
                        datasets: [{
                                label: 'Temperature (°C)',
                                data: temperatures,
                                borderColor: '#ff6b6b',
                                backgroundColor: 'rgba(255, 107, 107, 0.1)',
                                yAxisID: 'y',
                                tension: 0.4
                            },
                            {
                                label: 'Rainfall (mm)',
                                data: rainfall,
                                borderColor: '#4ecdc4',
                                backgroundColor: 'rgba(78, 205, 196, 0.1)',
                                yAxisID: 'y1',
                                tension: 0.4
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                type: 'linear',
                                display: true,
                                position: 'left',
                                title: {
                                    display: true,
                                    text: 'Temperature (°C)'
                                }
                            },
                            y1: {
                                type: 'linear',
                                display: true,
                                position: 'right',
                                title: {
                                    display: true,
                                    text: 'Rainfall (mm)'
                                },
                                grid: {
                                    drawOnChartArea: false
                                }
                            }
                        }
                    }
                });
            });
        </script>
    <?php endif; ?>

</body>

</html>