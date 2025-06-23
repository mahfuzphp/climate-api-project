<?php

/**
 * Auth Class
 * Handles user authentication and permissions
 */
class Auth
{
    private $user = null;

    public function __construct()
    {
        // Only start session if one isn't already active
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (isset($_SESSION['user'])) {
            $this->user = $_SESSION['user'];
        }
    }

    public function login($username, $password)
    {
        $db = new Database();
        $pdo = $db->getConnection();

        $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->execute([$username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {


            // Remove password from session data
            unset($user['password']);

            $this->user = $user;
            $_SESSION['user'] = $user;

            // Update last login
            $stmt = $pdo->prepare("UPDATE users SET last_login = NOW() WHERE id = ?");
            $stmt->execute([$user['id']]);

            return true;
        }

        return false;
    }

    public function logout()
    {
        $this->user = null;
        unset($_SESSION['user']);
        session_destroy();
    }

    public function isLoggedIn()
    {
        return $this->user !== null;
    }

    public function getCurrentUser()
    {
        return $this->user;
    }

    public function hasPermission($permission)
    {
        if (!$this->isLoggedIn()) {
            return false;
        }

        // Admin has all permissions
        if ($this->user['role'] === 'admin') {
            return true;
        }

        // Define role-based permissions
        $permissions = [
            'admin' => ['manage_users', 'import_data', 'export_data', 'view_data', 'edit_data'],
            'researcher' => ['import_data', 'export_data', 'view_data'],
            'viewer' => ['view_data']
        ];

        $role = $this->user['role'];

        if (!isset($permissions[$role])) {
            return false;
        }

        return in_array($permission, $permissions[$role]);
    }

    public function generateCSRFToken()
    {
        if (!isset($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }

        return $_SESSION['csrf_token'];
    }

    public function validateCSRFToken($token)
    {
        if (!isset($_SESSION['csrf_token']) || $token !== $_SESSION['csrf_token']) {
            return false;
        }

        return true;
    }
}
