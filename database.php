<?php
class Database
{
    private $host = 'localhost';
    private $db_name = 'climate_data';
    private $username = 'root';
    private $password = '';
    private $conn;

    public function __construct()
    {
        $this->getConnection();
    }

    public function getConnection()
    {
        if ($this->conn === null) {
            try {
                $this->conn = new PDO(
                    "mysql:host={$this->host};dbname={$this->db_name}",
                    $this->username,
                    $this->password
                );
                $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $this->conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
                $this->conn->exec("SET NAMES utf8");
            } catch (PDOException $e) {
                throw new Exception("Database connection error: " . $e->getMessage());
            }
        }

        return $this->conn;
    }

    // Add the missing prepare method
    public function prepare($sql)
    {
        return $this->getConnection()->prepare($sql);
    }

    // Optional: Add other common PDO methods for convenience
    public function query($sql)
    {
        return $this->getConnection()->query($sql);
    }

    public function exec($sql)
    {
        return $this->getConnection()->exec($sql);
    }

    public function lastInsertId()
    {
        return $this->getConnection()->lastInsertId();
    }
}
?>