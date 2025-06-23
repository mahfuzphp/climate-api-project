<?php
// Enhanced SILO Climate Data Application - FIXED VARIABLE MAPPINGS
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
ini_set('display_errors', 1);
error_reporting(E_ALL);

if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

/**
 * Simple data exploration page
 */
require_once 'auth.php';
require_once 'database.php';

$auth = new Auth();

// Redirect if not logged in
if (!$auth->isLoggedIn()) {
    header('Location: login.php');
    exit;
}


$apiBaseUrl = "https://www.longpaddock.qld.gov.au/cgi-bin/silo/";
$apiUsername = "mahfuzphp@gmail.com";
$apiPassword = "apirequest";

$variableMapping = [
    'R' => 'Daily Rainfall',
    'X' => 'Maximum Temperature',
    'N' => 'Minimum Temperature',
    'J' => 'Solar Radiation',
    'V' => 'Vapour Pressure',
    'E' => 'Evaporation (Class A pan)',
    'H' => 'Relative Humidity (max temp)',
    'G' => 'Relative Humidity (min temp)'
];

$unitMapping = [
    'R' => 'mm',
    'X' => '°C',
    'N' => '°C',
    'J' => 'MJ/m²',
    'V' => 'hPa',
    'E' => 'mm',
    'H' => '%',
    'G' => '%'
];

$variableNames = [
    'R' => 'Daily Rainfall',
    'X' => 'Maximum Temperature',
    'N' => 'Minimum Temperature',
    'J' => 'Daily Solar Radiation',
    'V' => 'Vapour Pressure',
    'E' => 'Evaporation (Class A pan)',
    'H' => 'Relative Humidity (max temp)',
    'G' => 'Relative Humidity (min temp)'
];

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

function fetchFromAPI($endpoint, $params)
{
    global $apiBaseUrl;
    $url = $apiBaseUrl . $endpoint . "?" . http_build_query($params);
    $cacheDir = __DIR__ . '/cache';
    if (!is_dir($cacheDir)) mkdir($cacheDir, 0775, true);
    $cacheKey = md5($url);
    $cacheFile = $cacheDir . '/' . $cacheKey . '.json';
    $cacheTTL = 3600;

    if (file_exists($cacheFile) && (time() - filemtime($cacheFile)) < $cacheTTL) {
        error_log("Loaded from cache: $cacheFile");
        $cachedResponse = file_get_contents($cacheFile);
        $data = json_decode($cachedResponse, true);
        if (json_last_error() === JSON_ERROR_NONE) return $data;
    }

    error_log("API URL: " . $url);
    $ch = curl_init();
    curl_setopt_array($ch, [
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_ENCODING => "",
        CURLOPT_TIMEOUT => 30,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_USERAGENT => 'Mozilla/5.0',
        CURLOPT_HTTPHEADER => ['Accept: application/json']
    ]);
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $curlError = curl_error($ch);
    curl_close($ch);

    if ($curlError) {
        error_log("CURL Error: " . $curlError);
        return ['error' => 'API Connection Error'];
    }

    if ($httpCode !== 200) {
        error_log("HTTP Error: $httpCode Response: " . substr($response, 0, 200));
        return ['error' => "API returned HTTP $httpCode"];
    }

    $data = json_decode($response, true);
    if (json_last_error() === JSON_ERROR_NONE) {
        file_put_contents($cacheFile, $response);
        return $data;
    }

    return ['error' => 'Unable to parse API response'];
}

function saveClimateData($latitude, $longitude, $variable, $climateData, $variableNames, $unitMapping, $itemGroupName)
{
    $conn = getDbConnection();
    if (!$conn) return "Database connection failed";
    try {
        $conn->beginTransaction();
        $stmtLoc = $conn->prepare("INSERT IGNORE INTO locations (latitude, longitude) VALUES (:lat, :lon)");
        $stmtLoc->execute([':lat' => $latitude, ':lon' => $longitude]);

        $stmt = $conn->prepare("SELECT id FROM locations WHERE latitude = :lat AND longitude = :lon");
        $stmt->execute([':lat' => $latitude, ':lon' => $longitude]);
        $locationId = $stmt->fetchColumn();

        if (!$locationId) throw new Exception("Failed to get location ID");

        $stmtClimate = $conn->prepare("INSERT INTO climate_data 
                                     (location_id, date, variable_code, variable_name, value, unit, source, item_group_name) 
                                     VALUES (:location_id, :date, :variable_code, :variable_name, :value, :unit, :source, :item_group_name)
                                     ON DUPLICATE KEY UPDATE 
                                     value = :value, variable_name = :variable_name, unit = :unit, source = :source, item_group_name = :item_group_name");

        foreach ($climateData as $date => $data) {
            $stmtClimate->execute([
                ':location_id' => $locationId,
                ':date' => $date,
                ':variable_code' => $variable,
                ':variable_name' => $variableNames[$variable],
                ':value' => $data['value'],
                ':unit' => $data['unit'],
                ':source' => $data['source'],
                ':item_group_name' => $itemGroupName
            ]);
        }
        $conn->commit();
        return true;
    } catch (Exception $e) {
        $conn->rollBack();
        return "Database error: " . $e->getMessage();
    }
}

function getSavedClimateData()
{
    $conn = getDbConnection();
    if (!$conn) return [];
    try {
        $stmt = $conn->query("SELECT l.latitude, l.longitude, 
                             c.date, c.variable_code, c.variable_name, c.value, c.unit, c.source, c.created_at
                             FROM locations l
                             JOIN climate_data c ON l.id = c.location_id
                             ORDER BY c.created_at DESC, c.date ASC
                             LIMIT 100");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        error_log("Database error: " . $e->getMessage());
        return [];
    }
}

$climateData = [];
$error = '';
$message = '';
$searchPerformed = false;
$apiUrl = '';
$debugInfo = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit'])) {
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        $error = 'Security validation failed.';
    } else {
        $latitude = filter_input(INPUT_POST, 'latitude', FILTER_VALIDATE_FLOAT);
        $longitude = filter_input(INPUT_POST, 'longitude', FILTER_VALIDATE_FLOAT);
        $startDate = filter_input(INPUT_POST, 'start_date', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $endDate = filter_input(INPUT_POST, 'end_date', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $variable = filter_input(INPUT_POST, 'variable', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $itemGroupName = filter_input(INPUT_POST, 'item_group_name', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        if ($latitude === false || $longitude === false) {
            $error = 'Invalid coordinates';
        } elseif (empty($startDate) || empty($endDate)) {
            $error = 'Date range required';
        } elseif (empty($variable) || !isset($variableMapping[$variable])) {
            $error = 'Invalid climate variable';
        } elseif ($latitude < -29.0 || $latitude > -10.0 || $longitude < 138.0 || $longitude > 155.0) {
            $error = 'Coordinates must be within Queensland boundaries';
        } else {
            $params = [
                'lat' => round($latitude * 20) / 20,
                'lon' => round($longitude * 20) / 20,
                'start' => str_replace('-', '', $startDate),
                'finish' => str_replace('-', '', $endDate),
                'format' => 'json',
                'comment' => $variable,
                'username' => $apiUsername,
                'password' => $apiPassword
            ];
            $apiUrl = $apiBaseUrl . 'DataDrillDataset.php?' . http_build_query($params);
            $debugInfo = "API URL: " . $apiUrl . "\n" . "Parameters: " . print_r($params, true);

            $response = fetchFromAPI('DataDrillDataset.php', $params);
            if (isset($response['error'])) {
                $error = $response['error'];
                if (isset($response['raw_response'])) {
                    $debugInfo .= "\nRaw Response: " . $response['raw_response'];
                }
            } else {
                $searchPerformed = true;
                if (isset($response['data']) && is_array($response['data'])) {
                    foreach ($response['data'] as $item) {
                        if (isset($item['date']) && isset($item['variables']) && is_array($item['variables'])) {
                            $dateValue = $item['date'];
                            foreach ($item['variables'] as $varData) {
                                if (isset($varData['variable_code']) && isset($varData['value'])) {
                                    $varCode = $varData['variable_code'];
                                    $dataValue = $varData['value'];
                                    $source = isset($varData['source']) ? $varData['source'] : 'SILO';

                                    $variableCodeMap = [
                                        'max_temp' => 'X',
                                        'min_temp' => 'N',
                                        'daily_rain' => 'R',
                                        'solar_radiation' => 'J',
                                        'vapour_pressure' => 'V',
                                        'evaporation' => 'E',
                                        'rh_tmax' => 'H',
                                        'rh_tmin' => 'G'
                                    ];

                                    $mappedVar = isset($variableCodeMap[$varCode]) ? $variableCodeMap[$varCode] : $varCode;

                                    if ($mappedVar === $variable || $varCode === $variable) {
                                        $climateData[$dateValue] = [
                                            'value' => round(floatval($dataValue), 2),
                                            'unit' => $unitMapping[$variable] ?? 'N/A',
                                            'source' => 'SILO-' . $source,
                                            'variable_code' => $varCode
                                        ];
                                    }
                                }
                            }
                        }
                    }
                }

                if (!empty($climateData)) {
                    $saveResult = saveClimateData($latitude, $longitude, $variable, $climateData, $variableNames, $unitMapping, $itemGroupName);
                    if ($saveResult === true) {
                        $message = "Successfully imported " . count($climateData) . " records for " . $variableNames[$variable];
                    } else {
                        $error = "Data fetched but failed to save: " . $saveResult;
                    }
                } else {
                    $error = "No data found for the specified parameters";
                }
            }
        }
    }
}

$savedData = getSavedClimateData();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Import Data - Queensland Climate Data Explorer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px 0;
        }

        .card {
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            border: 1px solid rgba(0, 0, 0, 0.125);
        }

        .table-responsive {
            max-height: 400px;
            overflow-y: auto;
        }

        .api-url-display {
            background-color: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #dee2e6;
            word-break: break-all;
        }

        .api-url-display code {
            font-size: 11px;
            color: #0066cc;
            line-height: 1.4;
        }

        .variable-info {
            background-color: #e7f3ff;
            border: 1px solid #b3d9ff;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 15px;
        }

        .debug-info {
            background-color: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="bi bi-cloud-drizzle"></i>
                Queensland Climate Data Explorer
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.php">
                            <i class="bi bi-house"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="import.php">
                            <i class="bi bi-upload"></i> Import Data
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="explore.php">
                            <i class="bi bi-graph-up"></i> Explore Data
                        </a>
                    </li>
                    <?php if ($auth->hasPermission('manage_users')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="users.php">
                                <i class="bi bi-people"></i> Manage Users
                            </a>
                        </li>
                    <?php endif; ?>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                            <i class="bi bi-person-circle"></i>
                            <?php echo htmlspecialchars($auth->getCurrentUser()['username']); ?>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="logout.php">
                                    <i class="bi bi-box-arrow-right"></i> Logout
                                </a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12 text-center mb-4">
                <h2><i class="bi bi-upload text-primary"></i> Import Climate Data</h2>
            </div>
        </div>

        <!-- Variable Information -->
        <div class="variable-info">
            <h5>Available Climate Variables:</h5>
            <div class="row">
                <?php foreach ($variableNames as $code => $name): ?>
                    <div class="col-md-4 mb-2">
                        <strong><?php echo htmlspecialchars($name); ?></strong><br>
                        <small>Code: <?php echo htmlspecialchars($code); ?> | Unit: <?php echo htmlspecialchars($unitMapping[$code]); ?></small>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        <!-- Search Form -->
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h3 class="mb-0">Search & Save Climate Data</h3>
            </div>
            <div class="card-body">
                <?php if (!empty($error)): ?>
                    <div class="alert alert-danger"><?php echo $error; ?></div>
                <?php endif; ?>
                <?php if (!empty($message)): ?>
                    <div class="alert alert-success"><?php echo $message; ?></div>
                <?php endif; ?>

                <form method="post" action="">
                    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
                    <!-- Station Selector -->
                    <div class="mb-3">
                        <label for="qldStations" class="form-label">Select a Queensland Station:</label>
                        <select id="qldStations" class="form-select">
                            <option value="">-- Select Station --</option>
                        </select>
                        <div class="station-details mt-2 p-2 bg-light rounded" style="display: none;">
                            <small>
                                <strong>Selected Station:</strong> <span id="selectedStationName">N/A</span><br>
                                <strong>Coordinates:</strong> <span id="selectedStationCoords">N/A</span>
                            </small>
                        </div>
                    </div>

                    <!-- Coordinates -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="latitude" class="form-label">Latitude (-29.0 to -10.0)</label>
                            <input type="number" id="latitude" name="latitude" class="form-control"
                                step="0.01" min="-29.0" max="-10.0" required
                                value="<?php echo isset($_POST['latitude']) ? htmlspecialchars($_POST['latitude']) : '-27.47'; ?>">
                        </div>
                        <div class="col-md-6">
                            <label for="longitude" class="form-label">Longitude (138.0 to 155.0)</label>
                            <input type="number" id="longitude" name="longitude" class="form-control"
                                step="0.01" min="138.0" max="155.0" required
                                value="<?php echo isset($_POST['longitude']) ? htmlspecialchars($_POST['longitude']) : '153.03'; ?>">
                        </div>
                    </div>

                    <!-- Date Range -->
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="start_date" class="form-label">Start Date</label>
                            <input type="date" id="start_date" name="start_date" class="form-control" required
                                value="<?php echo isset($_POST['start_date']) ? htmlspecialchars($_POST['start_date']) : date('Y-m-d', strtotime('-1 month')); ?>">
                        </div>
                        <div class="col-md-4">
                            <label for="end_date" class="form-label">End Date</label>
                            <input type="date" id="end_date" name="end_date" class="form-control" required
                                value="<?php echo isset($_POST['end_date']) ? htmlspecialchars($_POST['end_date']) : date('Y-m-d'); ?>">
                        </div>
                        <div class="col-md-4">
                            <label for="variable" class="form-label">Climate Variable</label>
                            <select id="variable" name="variable" class="form-select" required>
                                <option value="">-- Select Variable --</option>
                                <?php foreach ($variableMapping as $key => $name): ?>
                                    <option value="<?php echo htmlspecialchars($key); ?>"
                                        <?php echo (isset($_POST['variable']) && $_POST['variable'] === $key) ? 'selected' : ''; ?>>
                                        <?php echo htmlspecialchars($variableNames[$key]); ?> (<?php echo htmlspecialchars($unitMapping[$key]); ?>)
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>

                    <!-- Item Group Name -->
                    <div class="mb-3">
                        <label for="item_group_name" class="form-label">Page Name</label>
                        <input type="text" id="item_group_name" name="item_group_name" class="form-control"
                            value="<?php echo isset($_POST['item_group_name']) ? htmlspecialchars($_POST['item_group_name']) : ''; ?>">
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" name="submit" class="btn btn-primary">Search & Save Data</button>
                </form>
            </div>
        </div>

        <!-- Results Display -->
        <?php if ($searchPerformed && !empty($climateData)): ?>
            <div class="card mb-4">
                <div class="card-header bg-success text-white">
                    <h4 class="mb-0">Search Results</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Variable</th>
                                    <th>Value</th>
                                    <th>Unit</th>
                                    <th>Source</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($climateData as $date => $data): ?>
                                    <tr>
                                        <td><?php echo htmlspecialchars($date); ?></td>
                                        <td><?php echo htmlspecialchars($variableNames[$_POST['variable']] ?? 'Unknown'); ?></td>
                                        <td><?php echo htmlspecialchars($data['value']); ?></td>
                                        <td><?php echo htmlspecialchars($data['unit']); ?></td>
                                        <td><?php echo htmlspecialchars($data['source']); ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <?php endif; ?>

        <!-- Saved Data Display -->
        <?php if (!empty($savedData)): ?>
            <div class="card">
                <div class="card-header bg-info text-white">
                    <h4 class="mb-0">Recently Saved Data (Last 100 records)</h4>
                </div>
                <div class="card-body">
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
                                    <th>Saved At</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($savedData as $row): ?>
                                    <tr>
                                        <td><?php echo htmlspecialchars($row['latitude'] . ', ' . $row['longitude']); ?></td>
                                        <td><?php echo htmlspecialchars($row['date']); ?></td>
                                        <td><?php echo htmlspecialchars($row['variable_name']); ?></td>
                                        <td><?php echo htmlspecialchars($row['value']); ?></td>
                                        <td><?php echo htmlspecialchars($row['unit']); ?></td>
                                        <td><?php echo htmlspecialchars($row['source']); ?></td>
                                        <td><?php echo htmlspecialchars(date('Y-m-d H:i', strtotime($row['created_at']))); ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Queensland stations list
        const qldStations = [{
                name: "Brisbane",
                lat: -27.47,
                lon: 153.03
            },
            {
                name: "Gold Coast",
                lat: -28.02,
                lon: 153.43
            },
            {
                name: "Sunshine Coast",
                lat: -26.65,
                lon: 153.07
            },
            {
                name: "Toowoomba",
                lat: -27.56,
                lon: 151.95
            },
            {
                name: "Cairns",
                lat: -16.92,
                lon: 145.77
            },
            {
                name: "Townsville",
                lat: -19.25,
                lon: 146.82
            },
            {
                name: "Mackay",
                lat: -21.15,
                lon: 149.18
            },
            {
                name: "Rockhampton",
                lat: -23.38,
                lon: 150.51
            },
            {
                name: "Bundaberg",
                lat: -24.87,
                lon: 152.35
            },
            {
                name: "Hervey Bay",
                lat: -25.29,
                lon: 152.85
            },
            {
                name: "Gladstone",
                lat: -23.84,
                lon: 151.26
            },
            {
                name: "Mount Isa",
                lat: -20.73,
                lon: 139.50
            },
            {
                name: "Charleville",
                lat: -26.41,
                lon: 146.26
            },
            {
                name: "Roma",
                lat: -26.57,
                lon: 148.79
            },
            {
                name: "Emerald",
                lat: -23.53,
                lon: 148.16
            },
            {
                name: "Longreach",
                lat: -23.44,
                lon: 144.25
            },
            {
                name: "Weipa",
                lat: -12.68,
                lon: 141.88
            },
            {
                name: "Thursday Island",
                lat: -10.58,
                lon: 142.22
            },
            {
                name: "Charters Towers",
                lat: -20.07,
                lon: 146.27
            },
            {
                name: "Ipswich",
                lat: -27.61,
                lon: 152.76
            }
        ];

        document.addEventListener('DOMContentLoaded', function() {
            const stationSelect = document.getElementById('qldStations');
            const stationDetails = document.querySelector('.station-details');
            const stationName = document.getElementById('selectedStationName');
            const stationCoords = document.getElementById('selectedStationCoords');
            const latInput = document.getElementById('latitude');
            const lonInput = document.getElementById('longitude');

            qldStations.sort((a, b) => a.name.localeCompare(b.name));

            qldStations.forEach(station => {
                const option = document.createElement('option');
                option.value = `${station.lat},${station.lon}`;
                option.textContent = `${station.name} (${station.lat}, ${station.lon})`;
                stationSelect.appendChild(option);
            });

            stationSelect.addEventListener('change', function() {
                if (this.value) {
                    const [lat, lon] = this.value.split(',');
                    const selectedStation = qldStations.find(s =>
                        s.lat.toString() === lat && s.lon.toString() === lon
                    );
                    if (selectedStation) {
                        latInput.value = lat;
                        lonInput.value = lon;
                        stationName.textContent = selectedStation.name;
                        stationCoords.textContent = `${lat}, ${lon}`;
                        stationDetails.style.display = 'block';
                    }
                } else {
                    stationDetails.style.display = 'none';
                }
            });

            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                const lat = parseFloat(latInput.value);
                const lon = parseFloat(lonInput.value);
                const startDate = document.getElementById('start_date').value;
                const endDate = document.getElementById('end_date').value;

                if (lat < -29.0 || lat > -10.0) {
                    alert('Latitude must be between -29.0 and -10.0 for Queensland');
                    e.preventDefault();
                    return;
                }
                if (lon < 138.0 || lon > 155.0) {
                    alert('Longitude must be between 138.0 and 155.0 for Queensland');
                    e.preventDefault();
                    return;
                }
                if (startDate && endDate && new Date(startDate) > new Date(endDate)) {
                    alert('Start date must be before end date');
                    e.preventDefault();
                    return;
                }
                if (startDate && endDate) {
                    const start = new Date(startDate);
                    const end = new Date(endDate);
                    const diffTime = Math.abs(end - start);
                    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                    if (diffDays > 365) {
                        if (!confirm('You are requesting more than 1 year of data. This may take a long time. Continue?')) {
                            e.preventDefault();
                            return;
                        }
                    }
                }
            });

            [latInput, lonInput].forEach(input => {
                input.addEventListener('change', function() {
                    const lat = parseFloat(latInput.value);
                    const lon = parseFloat(lonInput.value);
                    const matchingStation = qldStations.find(station =>
                        Math.abs(station.lat - lat) < 0.01 &&
                        Math.abs(station.lon - lon) < 0.01
                    );
                    if (matchingStation) {
                        stationSelect.value = `${matchingStation.lat},${matchingStation.lon}`;
                        stationName.textContent = matchingStation.name;
                        stationCoords.textContent = `${matchingStation.lat}, ${matchingStation.lon}`;
                        stationDetails.style.display = 'block';
                    } else {
                        stationSelect.value = '';
                        stationDetails.style.display = 'none';
                    }
                });
            });
        });
    </script>

</body>

</html>