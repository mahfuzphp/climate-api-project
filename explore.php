<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

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

// Initialize database connection
$db = new Database();

// Get CSRF token
$csrfToken = $auth->generateCSRFToken();

// Get date range from database
try {
    $dateRangeQuery = "SELECT MIN(date) as min_date, MAX(date) as max_date FROM climate_data";
    $dateRangeResult = $db->query($dateRangeQuery);
    $dateRange = $dateRangeResult->fetch(PDO::FETCH_ASSOC);
    
    if (!$dateRange || !$dateRange['min_date']) {
        $dateRange = ['min_date' => '2020-01-01', 'max_date' => date('Y-m-d')];
    }
} catch (Exception $e) {
    error_log("Error getting date range: " . $e->getMessage());
    $dateRange = ['min_date' => '2020-01-01', 'max_date' => date('Y-m-d')];
}

// Get distinct locations from database
try {
    $locationsQuery = "SELECT DISTINCT location_id FROM climate_data ORDER BY location_id";
    $locationsResult = $db->query($locationsQuery);
    $locations = $locationsResult->fetchAll(PDO::FETCH_ASSOC);
} catch (Exception $e) {
    error_log("Error getting locations: " . $e->getMessage());
    $locations = [];
}

// Get distinct variables from database
try {
    $variablesQuery = "SELECT DISTINCT variable_code, variable_name FROM climate_data ORDER BY variable_name";
    $variablesResult = $db->query($variablesQuery);
    $variables = $variablesResult->fetchAll(PDO::FETCH_ASSOC);
} catch (Exception $e) {
    error_log("Error getting variables: " . $e->getMessage());
    $variables = [];
}

// Handle form submission and get data
$data = [];
$message = '';
$showData = false;

if ($_POST && isset($_POST['csrf_token']) && $auth->validateCSRFToken($_POST['csrf_token'])) {
    $showData = true;
    
    // Build query with filters
    $query = "SELECT location_id, date, variable_code, variable_name, value, unit, source, created_at 
              FROM climate_data WHERE 1=1";
    $params = [];
    
    // Date filters
    if (!empty($_POST['start_date'])) {
        $query .= " AND date >= ?";
        $params[] = $_POST['start_date'];
    }
    
    if (!empty($_POST['end_date'])) {
        $query .= " AND date <= ?";
        $params[] = $_POST['end_date'];
    }
    
    // Location filter
    if (!empty($_POST['location_id'])) {
        $query .= " AND location_id = ?";
        $params[] = $_POST['location_id'];
    }
    
    // Variable filter
    if (!empty($_POST['variable_code'])) {
        $query .= " AND variable_code = ?";
        $params[] = $_POST['variable_code'];
    }
    
    $query .= " ORDER BY date DESC, location_id, variable_code LIMIT 1000";
    
    try {
        $stmt = $db->prepare($query);
        $stmt->execute($params);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        $message = "Found " . count($data) . " records";
        if (count($data) >= 1000) {
            $message .= " (Limited to 1000 records)";
        }
    } catch (Exception $e) {
        $message = "Error: " . $e->getMessage();
        error_log("Query error: " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Data - Queensland Climate Data Explorer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .navbar-brand {
            font-weight: bold;
        }
        .card {
            margin-bottom: 2rem;
        }
        .table-responsive {
            max-height: 600px;
            overflow-y: auto;
        }
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
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
    
    <main class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">
                    <i class="bi bi-graph-up text-primary"></i>
                    Explore Climate Data
                </h2>
            </div>
        </div>
        
        <!-- Quick Stats Card -->
        <div class="card stats-card shadow">
            <div class="card-body">
                <div class="row text-center">
                    <div class="col-md-3">
                        <h4><?php echo count($locations); ?></h4>
                        <p class="mb-0">Locations</p>
                    </div>
                    <div class="col-md-3">
                        <h4><?php echo count($variables); ?></h4>
                        <p class="mb-0">Variables</p>
                    </div>
                    <div class="col-md-3">
                        <h4><?php echo $dateRange['min_date']; ?></h4>
                        <p class="mb-0">Start Date</p>
                    </div>
                    <div class="col-md-3">
                        <h4><?php echo $dateRange['max_date']; ?></h4>
                        <p class="mb-0">End Date</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Filter Card -->
        <div class="card shadow">
            <div class="card-header bg-light">
                <h5 class="card-title mb-0">
                    <i class="bi bi-funnel"></i> Filter Data
                </h5>
            </div>
            <div class="card-body">
                <form method="POST" action="">
                    <input type="hidden" name="csrf_token" value="<?php echo $csrfToken; ?>">
                    
                    <div class="row g-3">
                        <div class="col-md-3">
                            <label for="start_date" class="form-label">Start Date:</label>
                            <input type="date" 
                                   class="form-control" 
                                   id="start_date" 
                                   name="start_date"
                                   value="<?php echo $_POST['start_date'] ?? ''; ?>"
                                   min="<?php echo $dateRange['min_date']; ?>"
                                   max="<?php echo $dateRange['max_date']; ?>">
                        </div>
                        
                        <div class="col-md-3">
                            <label for="end_date" class="form-label">End Date:</label>
                            <input type="date" 
                                   class="form-control" 
                                   id="end_date" 
                                   name="end_date"
                                   value="<?php echo $_POST['end_date'] ?? ''; ?>"
                                   min="<?php echo $dateRange['min_date']; ?>"
                                   max="<?php echo $dateRange['max_date']; ?>">
                        </div>
                        
                        <div class="col-md-3">
                            <label for="location_id" class="form-label">Location ID:</label>
                            <select class="form-select" id="location_id" name="location_id">
                                <option value="">All Locations</option>
                                <?php foreach ($locations as $location): ?>
                                <option value="<?php echo htmlspecialchars($location['location_id']); ?>"
                                        <?php echo (isset($_POST['location_id']) && $_POST['location_id'] == $location['location_id']) ? 'selected' : ''; ?>>
                                    Location <?php echo htmlspecialchars($location['location_id']); ?>
                                </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        
                        <div class="col-md-3">
                            <label for="variable_code" class="form-label">Variable:</label>
                            <select class="form-select" id="variable_code" name="variable_code">
                                <option value="">All Variables</option>
                                <?php foreach ($variables as $variable): ?>
                                <option value="<?php echo htmlspecialchars($variable['variable_code']); ?>"
                                        <?php echo (isset($_POST['variable_code']) && $_POST['variable_code'] == $variable['variable_code']) ? 'selected' : ''; ?>>
                                    <?php echo htmlspecialchars($variable['variable_code']); ?> - <?php echo htmlspecialchars($variable['variable_name']); ?>
                                </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row g-3 mt-2">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary me-2">
                                <i class="bi bi-search"></i> Search Data
                            </button>
                            <a href="explore.php" class="btn btn-outline-secondary">
                                <i class="bi bi-arrow-clockwise"></i> Reset
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <?php if ($showData): ?>
        <!-- Results Card -->
        <div class="card shadow">
            <div class="card-header bg-light d-flex justify-content-between align-items-center">
                <h5 class="card-title mb-0">
                    <i class="bi bi-table"></i> Search Results
                </h5>
                <?php if (!empty($data)): ?>
                <div>
                    <button type="button" class="btn btn-outline-success btn-sm" onclick="exportCSV()">
                        <i class="bi bi-file-earmark-spreadsheet"></i> Export CSV
                    </button>
                </div>
                <?php endif; ?>
            </div>
            <div class="card-body">
                <?php if ($message): ?>
                <div class="alert alert-info" role="alert">
                    <i class="bi bi-info-circle"></i> <?php echo htmlspecialchars($message); ?>
                </div>
                <?php endif; ?>
                
                <?php if (!empty($data)): ?>
                <div class="table-responsive">
                    <table class="table table-striped table-hover" id="data-table">
                        <thead class="table-dark">
                            <tr>
                                <th>Location ID</th>
                                <th>Date</th>
                                <th>Variable Code</th>
                                <th>Variable Name</th>
                                <th>Value</th>
                                <th>Unit</th>
                                <th>Source</th>
                                <th>Created At</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($data as $row): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['location_id']); ?></td>
                                <td><?php echo htmlspecialchars($row['date']); ?></td>
                                <td>
                                    <span class="badge bg-primary">
                                        <?php echo htmlspecialchars($row['variable_code']); ?>
                                    </span>
                                </td>
                                <td><?php echo htmlspecialchars($row['variable_name']); ?></td>
                                <td class="text-end">
                                    <strong><?php echo number_format($row['value'], 4); ?></strong>
                                </td>
                                <td><?php echo htmlspecialchars($row['unit']); ?></td>
                                <td>
                                    <small class="text-muted"><?php echo htmlspecialchars($row['source']); ?></small>
                                </td>
                                <td>
                                    <small class="text-muted"><?php echo date('M j, Y H:i', strtotime($row['created_at'])); ?></small>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <?php else: ?>
                <div class="alert alert-warning" role="alert">
                    <i class="bi bi-exclamation-triangle"></i>
                    No data found matching your search criteria. Try adjusting your filters.
                </div>
                <?php endif; ?>
            </div>
        </div>
        <?php endif; ?>
        
        <!-- Sample Data Card -->
        <div class="card shadow">
            <div class="card-header bg-light">
                <h5 class="card-title mb-0">
                    <i class="bi bi-info-circle"></i> Available Variables
                </h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <?php foreach ($variables as $variable): ?>
                    <div class="col-md-4 mb-2">
                        <div class="d-flex align-items-center">
                            <span class="badge bg-secondary me-2"><?php echo htmlspecialchars($variable['variable_code']); ?></span>
                            <span><?php echo htmlspecialchars($variable['variable_name']); ?></span>
                        </div>
                    </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </main>
    
    <footer class="bg-light text-center py-3 mt-5">
        <div class="container">
            <p class="text-muted mb-0">
                &copy; <?php echo date('Y'); ?> Queensland Climate Data Explorer
            </p>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Export CSV function
        function exportCSV() {
            const table = document.getElementById('data-table');
            let csv = [];
            
            // Get headers
            const headers = [];
            table.querySelectorAll('thead th').forEach(th => {
                headers.push(th.textContent.trim());
            });
            csv.push(headers.join(','));
            
            // Get data rows
            table.querySelectorAll('tbody tr').forEach(tr => {
                const row = [];
                tr.querySelectorAll('td').forEach(td => {
                    // Clean up the cell content and escape quotes
                    let cellText = td.textContent.trim().replace(/"/g, '""');
                    row.push('"' + cellText + '"');
                });
                csv.push(row.join(','));
            });
            
            // Download CSV
            const csvContent = csv.join('\n');
            const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            
            if (link.download !== undefined) {
                const url = URL.createObjectURL(blob);
                link.setAttribute('href', url);
                link.setAttribute('download', 'climate_data_export_' + new Date().toISOString().split('T')[0] + '.csv');
                link.style.visibility = 'hidden';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
        }
        
        // Auto-submit form when filters change (optional)
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const selects = form.querySelectorAll('select');
            const dateInputs = form.querySelectorAll('input[type="date"]');
            
            // Uncomment below if you want auto-submit on filter change
            /*
            [...selects, ...dateInputs].forEach(element => {
                element.addEventListener('change', function() {
                    setTimeout(() => form.submit(), 100);
                });
            });
            */
        });
    </script>
</body>
</html>