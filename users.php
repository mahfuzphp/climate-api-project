<?php

/**
 * User management page
 */
require_once 'auth.php';
require_once 'database.php';

$auth = new Auth();
$db = new Database();

// Redirect if not logged in or doesn't have permission
if (!$auth->isLoggedIn() || !$auth->hasPermission('manage_users')) {
    header('Location: index.php');
    exit;
}

// Generate CSRF token
$csrfToken = $auth->generateCSRFToken();

// Handle form submissions
$message = '';
$messageType = '';

if ($_POST) {
    if (!hash_equals($csrfToken, $_POST['csrf_token'] ?? '')) {
        $message = 'Invalid CSRF token';
        $messageType = 'error';
    } else {
        if (isset($_POST['action'])) {
            switch ($_POST['action']) {
                case 'add_user':
                    try {
                        $username = trim($_POST['username']);
                        $name = trim($_POST['name']);
                        $password = $_POST['password'];
                        $role = $_POST['role'];

                        // Validate inputs
                        if (empty($username) || empty($name) || empty($password) || empty($role)) {
                            throw new Exception('All fields are required');
                        }

                        // Check if username already exists
                        $stmt = $db->prepare("SELECT COUNT(*) FROM users WHERE username = ?");
                        $stmt->execute([$username]);
                        if ($stmt->fetchColumn() > 0) {
                            throw new Exception('Username already exists');
                        }

                        // Hash password and insert user
                        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
                        $stmt = $db->prepare("INSERT INTO users (username, name, password, role, created_at) VALUES (?, ?, ?, ?, NOW())");
                        $stmt->execute([$username, $name, $hashedPassword, $role]);

                        $message = 'User added successfully';
                        $messageType = 'success';
                    } catch (Exception $e) {
                        $message = $e->getMessage();
                        $messageType = 'error';
                    }
                    break;

                case 'edit_password':
                    try {
                        $userId = $_POST['user_id'];
                        $newPassword = $_POST['new_password'];

                        if (empty($newPassword)) {
                            throw new Exception('Password cannot be empty');
                        }

                        $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
                        $stmt = $db->prepare("UPDATE users SET password = ? WHERE id = ?");
                        $stmt->execute([$hashedPassword, $userId]);

                        $message = 'Password updated successfully';
                        $messageType = 'success';
                    } catch (Exception $e) {
                        $message = $e->getMessage();
                        $messageType = 'error';
                    }
                    break;

                case 'delete_user':
                    try {
                        $userId = $_POST['user_id'];
                        $currentUserId = $auth->getCurrentUser()['id'];

                        if ($userId == $currentUserId) {
                            throw new Exception('You cannot delete your own account');
                        }

                        $stmt = $db->prepare("DELETE FROM users WHERE id = ?");
                        $stmt->execute([$userId]);

                        $message = 'User deleted successfully';
                        $messageType = 'success';
                    } catch (Exception $e) {
                        $message = $e->getMessage();
                        $messageType = 'error';
                    }
                    break;
            }
        }
    }
}

// Fetch all users
$stmt = $db->prepare("SELECT id, username, name, role, created_at, last_login FROM users ORDER BY created_at DESC");
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Queensland Climate Data Explorer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c5282;
            --secondary-color: #4299e1;
            --success-color: #38a169;
            --danger-color: #e53e3e;
            --warning-color: #d69e2e;
            --light-bg: #f7fafc;
            --border-color: #e2e8f0;
        }

        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }

        .main-content {
            padding: 2rem 0;
        }

        .page-header {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            border-left: 4px solid var(--primary-color);
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 2rem;
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 600;
            padding: 1.5rem;
            border: none;
        }

        .form-control,
        .form-select {
            border: 2px solid var(--border-color);
            border-radius: 8px;
            padding: 0.75rem;
            transition: all 0.3s ease;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(66, 153, 225, 0.25);
        }

        .btn {
            border-radius: 8px;
            padding: 0.5rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-1px);
        }

        .btn-warning {
            background: var(--warning-color);
            border-color: var(--warning-color);
        }

        .btn-danger {
            background: var(--danger-color);
            border-color: var(--danger-color);
        }

        .table {
            border-radius: 8px;
            overflow: hidden;
        }

        .table thead th {
            background: var(--light-bg);
            border: none;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            padding: 1rem;
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
            border-color: var(--border-color);
        }

        .table tbody tr:hover {
            background-color: rgba(66, 153, 225, 0.05);
        }

        .role-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .role-admin {
            background: #e53e3e;
            color: white;
        }

        .role-researcher {
            background: #2b6cb0;
            color: white;
        }

        .role-analyst {
            background: #38a169;
            color: white;
        }

        .role-officer {
            background: #d69e2e;
            color: white;
        }

        .role-public {
            background: #718096;
            color: white;
        }

        .role-viewer {
            background: #a0aec0;
            color: white;
        }

        .alert {
            border: none;
            border-radius: 8px;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
        }

        .modal-content {
            border: none;
            border-radius: 10px;
        }

        .modal-header {
            background: var(--light-bg);
            border-bottom: 2px solid var(--border-color);
        }

        .footer {
            background: var(--primary-color);
            color: white;
            text-align: center;
            padding: 2rem 0;
            margin-top: 3rem;
        }

        @media (max-width: 768px) {
            .table-responsive {
                font-size: 0.85rem;
            }

            .btn-group-vertical .btn {
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="index.php">
                <i class="fas fa-cloud-sun me-2"></i>
                Queensland Climate Data Explorer
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.php"><i class="fas fa-home me-1"></i>Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="import.php"><i class="fas fa-upload me-1"></i>Import Data</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="explore.php"><i class="fas fa-chart-line me-1"></i>Explore Data</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="users.php"><i class="fas fa-users me-1"></i>Manage Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php">
                            <i class="fas fa-sign-out-alt me-1"></i>
                            Logout (<?php echo htmlspecialchars($auth->getCurrentUser()['username']); ?>)
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container main-content">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="mb-0">
                <i class="fas fa-users-cog me-3"></i>
                User Management
            </h1>
            <p class="mt-2 mb-0 text-muted">Manage system users, roles, and permissions</p>
        </div>

        <!-- Messages -->
        <?php if ($message): ?>
            <div class="alert alert-<?php echo $messageType === 'success' ? 'success' : 'danger'; ?> alert-dismissible fade show" role="alert">
                <i class="fas fa-<?php echo $messageType === 'success' ? 'check-circle' : 'exclamation-triangle'; ?> me-2"></i>
                <?php echo htmlspecialchars($message); ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <?php endif; ?>

        <!-- Add New User Card -->
        <div class="card">
            <div class="card-header">
                <i class="fas fa-plus-circle me-2"></i>
                Add New User
            </div>
            <div class="card-body">
                <form method="POST" class="needs-validation" novalidate>
                    <input type="hidden" name="csrf_token" value="<?php echo $csrfToken; ?>">
                    <input type="hidden" name="action" value="add_user">

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="username" class="form-label">
                                <i class="fas fa-user me-1"></i>Username
                            </label>
                            <input type="text" class="form-control" id="username" name="username" required>
                            <div class="invalid-feedback">Please provide a username.</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="name" class="form-label">
                                <i class="fas fa-id-card me-1"></i>Full Name
                            </label>
                            <input type="text" class="form-control" id="name" name="name" required>
                            <div class="invalid-feedback">Please provide a full name.</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="password" class="form-label">
                                <i class="fas fa-lock me-1"></i>Password
                            </label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" name="password" required>
                                <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('password')">
                                    <i class="fas fa-eye" id="password-icon"></i>
                                </button>
                            </div>
                            <div class="invalid-feedback">Please provide a password.</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="role" class="form-label">
                                <i class="fas fa-user-tag me-1"></i>Role
                            </label>
                            <select class="form-select" id="role" name="role" required>
                                <option value="">Select a role...</option>
                                <option value="admin">Administrator</option>
                                <option value="researcher">Researcher</option>
                                <option value="analyst">Analyst</option>
                                <option value="officer">Officer</option>
                                <option value="public">Public User</option>
                                <option value="viewer">Viewer</option>
                            </select>
                            <div class="invalid-feedback">Please select a role.</div>
                        </div>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-plus me-2"></i>Add User
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Users List Card -->
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>
                    <i class="fas fa-list me-2"></i>
                    User List (<?php echo count($users); ?> users)
                </span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user me-1"></i>Username</th>
                                <th><i class="fas fa-id-card me-1"></i>Full Name</th>
                                <th><i class="fas fa-user-tag me-1"></i>Role</th>
                                <th><i class="fas fa-calendar me-1"></i>Created</th>
                                <th><i class="fas fa-sign-in-alt me-1"></i>Last Login</th>
                                <th><i class="fas fa-cogs me-1"></i>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (empty($users)): ?>
                                <tr>
                                    <td colspan="6" class="text-center py-4">
                                        <i class="fas fa-users fa-3x text-muted mb-3"></i>
                                        <p class="text-muted">No users found</p>
                                    </td>
                                </tr>
                            <?php else: ?>
                                <?php foreach ($users as $user): ?>
                                    <tr>
                                        <td>
                                            <strong><?php echo htmlspecialchars($user['username']); ?></strong>
                                        </td>
                                        <td><?php echo htmlspecialchars($user['name'] ?? 'N/A'); ?></td>
                                        <td>
                                            <span class="role-badge role-<?php echo $user['role']; ?>">
                                                <?php echo ucfirst($user['role']); ?>
                                            </span>
                                        </td>
                                        <td>
                                            <i class="fas fa-calendar-alt me-1"></i>
                                            <?php echo date('M j, Y', strtotime($user['created_at'])); ?>
                                        </td>
                                        <td>
                                            <?php if ($user['last_login']): ?>
                                                <i class="fas fa-clock me-1"></i>
                                                <?php echo date('M j, Y g:i A', strtotime($user['last_login'])); ?>
                                            <?php else: ?>
                                                <span class="text-muted">Never</span>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group">
                                                <button type="button" class="btn btn-warning"
                                                    onclick="openPasswordModal(<?php echo $user['id']; ?>, '<?php echo htmlspecialchars($user['username']); ?>')">
                                                    <i class="fas fa-key"></i>
                                                </button>
                                                <?php if ($user['id'] != $auth->getCurrentUser()['id']): ?>
                                                    <button type="button" class="btn btn-danger"
                                                        onclick="confirmDelete(<?php echo $user['id']; ?>, '<?php echo htmlspecialchars($user['username']); ?>')">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                <?php endif; ?>
                                            </div>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p class="mb-0">
                <i class="fas fa-copyright me-1"></i>
                <?php echo date('Y'); ?> Queensland Climate Data Explorer. All rights reserved.
            </p>
        </div>
    </footer>

    <!-- Password Change Modal -->
    <div class="modal fade" id="passwordModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <i class="fas fa-key me-2"></i>Change Password
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form method="POST" id="passwordForm">
                    <div class="modal-body">
                        <input type="hidden" name="csrf_token" value="<?php echo $csrfToken; ?>">
                        <input type="hidden" name="action" value="edit_password">
                        <input type="hidden" name="user_id" id="modal-user-id">

                        <p>Change password for user: <strong id="modal-username"></strong></p>

                        <div class="mb-3">
                            <label for="new_password" class="form-label">New Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="new_password" name="new_password" required>
                                <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('new_password')">
                                    <i class="fas fa-eye" id="new_password-icon"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-warning">
                            <i class="fas fa-save me-1"></i>Update Password
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-danger">
                        <i class="fas fa-exclamation-triangle me-2"></i>Confirm Delete
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form method="POST" id="deleteForm">
                    <div class="modal-body">
                        <input type="hidden" name="csrf_token" value="<?php echo $csrfToken; ?>">
                        <input type="hidden" name="action" value="delete_user">
                        <input type="hidden" name="user_id" id="delete-user-id">

                        <p>Are you sure you want to delete user: <strong id="delete-username"></strong>?</p>
                        <p class="text-danger"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">
                            <i class="fas fa-trash me-1"></i>Delete User
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script>
        // Form validation
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        // Toggle password visibility
        function togglePassword(fieldId) {
            const field = document.getElementById(fieldId);
            const icon = document.getElementById(fieldId + '-icon');

            if (field.type === 'password') {
                field.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                field.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }

        // Open password change modal
        function openPasswordModal(userId, username) {
            document.getElementById('modal-user-id').value = userId;
            document.getElementById('modal-username').textContent = username;
            document.getElementById('new_password').value = '';

            const modal = new bootstrap.Modal(document.getElementById('passwordModal'));
            modal.show();
        }

        // Confirm user deletion
        function confirmDelete(userId, username) {
            document.getElementById('delete-user-id').value = userId;
            document.getElementById('delete-username').textContent = username;

            const modal = new bootstrap.Modal(document.getElementById('deleteModal'));
            modal.show();
        }

        // Auto-hide alerts after 5 seconds
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);
    </script>
</body>

</html>