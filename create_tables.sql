-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for climate_data
DROP DATABASE IF EXISTS `climate_data`;
CREATE DATABASE IF NOT EXISTS `climate_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `climate_data`;

-- Dumping structure for table climate_data.climate_data
DROP TABLE IF EXISTS `climate_data`;
CREATE TABLE IF NOT EXISTS `climate_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `date` date NOT NULL,
  `variable_code` varchar(20) NOT NULL,
  `variable_name` varchar(100) NOT NULL,
  `value` decimal(10,4) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `source` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_record` (`location_id`,`date`,`variable_code`),
  CONSTRAINT `climate_data_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table climate_data.climate_data: ~569 rows (approximately)
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(1, 1, '2025-05-22', 'N', 'Minimum Temperature', 7.4000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(2, 1, '2025-05-23', 'N', 'Minimum Temperature', 9.4000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(3, 1, '2025-05-24', 'N', 'Minimum Temperature', 10.7000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(4, 1, '2025-05-25', 'N', 'Minimum Temperature', 13.1000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(5, 1, '2025-05-26', 'N', 'Minimum Temperature', 17.6000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(6, 1, '2025-05-27', 'N', 'Minimum Temperature', 19.7000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(7, 1, '2025-05-28', 'N', 'Minimum Temperature', 13.8000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(8, 1, '2025-05-29', 'N', 'Minimum Temperature', 12.1000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(9, 1, '2025-05-30', 'N', 'Minimum Temperature', 10.5000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(10, 1, '2025-05-31', 'N', 'Minimum Temperature', 6.6000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(11, 1, '2025-06-01', 'N', 'Minimum Temperature', 7.8000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(12, 1, '2025-06-02', 'N', 'Minimum Temperature', 10.4000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(13, 1, '2025-06-03', 'N', 'Minimum Temperature', 7.8000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(14, 1, '2025-06-04', 'N', 'Minimum Temperature', 6.7000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(15, 1, '2025-06-05', 'N', 'Minimum Temperature', 5.1000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(16, 1, '2025-06-06', 'N', 'Minimum Temperature', 3.9000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(17, 1, '2025-06-07', 'N', 'Minimum Temperature', 9.5000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(18, 1, '2025-06-08', 'N', 'Minimum Temperature', 5.5000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(19, 1, '2025-06-09', 'N', 'Minimum Temperature', 5.2000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(20, 1, '2025-06-10', 'N', 'Minimum Temperature', 1.6000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(21, 1, '2025-06-11', 'N', 'Minimum Temperature', 0.6000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(22, 1, '2025-06-12', 'N', 'Minimum Temperature', 1.8000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(23, 1, '2025-06-13', 'N', 'Minimum Temperature', 1.9000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(24, 1, '2025-06-14', 'N', 'Minimum Temperature', 2.6000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(25, 1, '2025-06-15', 'N', 'Minimum Temperature', 3.0000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(26, 1, '2025-06-16', 'N', 'Minimum Temperature', 4.6000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(27, 1, '2025-06-17', 'N', 'Minimum Temperature', 12.1000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(28, 1, '2025-06-18', 'N', 'Minimum Temperature', 7.8000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(29, 1, '2025-06-19', 'N', 'Minimum Temperature', 7.7000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(30, 1, '2025-06-20', 'N', 'Minimum Temperature', 7.7000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(31, 1, '2025-06-21', 'N', 'Minimum Temperature', 8.6000, '°C', 'SILO-25', '2025-06-22 09:24:55');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(32, 2, '2025-05-22', 'X', 'Maximum Temperature', 25.9000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(33, 2, '2025-05-23', 'X', 'Maximum Temperature', 25.4000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(34, 2, '2025-05-24', 'X', 'Maximum Temperature', 26.5000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(35, 2, '2025-05-25', 'X', 'Maximum Temperature', 27.3000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(36, 2, '2025-05-26', 'X', 'Maximum Temperature', 26.9000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(37, 2, '2025-05-27', 'X', 'Maximum Temperature', 28.9000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(38, 2, '2025-05-28', 'X', 'Maximum Temperature', 22.9000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(39, 2, '2025-05-29', 'X', 'Maximum Temperature', 22.2000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(40, 2, '2025-05-30', 'X', 'Maximum Temperature', 18.6000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(41, 2, '2025-05-31', 'X', 'Maximum Temperature', 20.2000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(42, 2, '2025-06-01', 'X', 'Maximum Temperature', 23.1000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(43, 2, '2025-06-02', 'X', 'Maximum Temperature', 23.2000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(44, 2, '2025-06-03', 'X', 'Maximum Temperature', 23.8000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(45, 2, '2025-06-04', 'X', 'Maximum Temperature', 22.3000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(46, 2, '2025-06-05', 'X', 'Maximum Temperature', 21.4000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(47, 2, '2025-06-06', 'X', 'Maximum Temperature', 22.9000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(48, 2, '2025-06-07', 'X', 'Maximum Temperature', 24.7000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(49, 2, '2025-06-08', 'X', 'Maximum Temperature', 22.5000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(50, 2, '2025-06-09', 'X', 'Maximum Temperature', 19.7000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(51, 2, '2025-06-10', 'X', 'Maximum Temperature', 19.5000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(52, 2, '2025-06-11', 'X', 'Maximum Temperature', 19.1000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(53, 2, '2025-06-12', 'X', 'Maximum Temperature', 19.0000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(54, 2, '2025-06-13', 'X', 'Maximum Temperature', 19.0000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(55, 2, '2025-06-14', 'X', 'Maximum Temperature', 20.5000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(56, 2, '2025-06-15', 'X', 'Maximum Temperature', 22.2000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(57, 2, '2025-06-16', 'X', 'Maximum Temperature', 22.5000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(58, 2, '2025-06-17', 'X', 'Maximum Temperature', 18.4000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(59, 2, '2025-06-18', 'X', 'Maximum Temperature', 21.7000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(60, 2, '2025-06-19', 'X', 'Maximum Temperature', 22.7000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(61, 2, '2025-06-20', 'X', 'Maximum Temperature', 21.7000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(62, 2, '2025-06-21', 'X', 'Maximum Temperature', 20.2000, '°C', 'SILO-25', '2025-06-22 09:28:36');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(63, 3, '2025-05-22', 'H', 'Relative Humidity (max temp)', 36.3000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(64, 3, '2025-05-23', 'H', 'Relative Humidity (max temp)', 57.6000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(65, 3, '2025-05-24', 'H', 'Relative Humidity (max temp)', 51.5000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(66, 3, '2025-05-25', 'H', 'Relative Humidity (max temp)', 49.1000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(67, 3, '2025-05-26', 'H', 'Relative Humidity (max temp)', 47.5000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(68, 3, '2025-05-27', 'H', 'Relative Humidity (max temp)', 44.1000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(69, 3, '2025-05-28', 'H', 'Relative Humidity (max temp)', 55.1000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(70, 3, '2025-05-29', 'H', 'Relative Humidity (max temp)', 76.4000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(71, 3, '2025-05-30', 'H', 'Relative Humidity (max temp)', 61.4000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(72, 3, '2025-05-31', 'H', 'Relative Humidity (max temp)', 43.5000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(73, 3, '2025-06-01', 'H', 'Relative Humidity (max temp)', 40.3000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(74, 3, '2025-06-02', 'H', 'Relative Humidity (max temp)', 50.5000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(75, 3, '2025-06-03', 'H', 'Relative Humidity (max temp)', 41.5000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(76, 3, '2025-06-04', 'H', 'Relative Humidity (max temp)', 35.9000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(77, 3, '2025-06-05', 'H', 'Relative Humidity (max temp)', 31.9000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(78, 3, '2025-06-06', 'H', 'Relative Humidity (max temp)', 34.9000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(79, 3, '2025-06-07', 'H', 'Relative Humidity (max temp)', 51.4000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(80, 3, '2025-06-08', 'H', 'Relative Humidity (max temp)', 43.0000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(81, 3, '2025-06-09', 'H', 'Relative Humidity (max temp)', 27.4000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(82, 3, '2025-06-10', 'H', 'Relative Humidity (max temp)', 33.5000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(83, 3, '2025-06-11', 'H', 'Relative Humidity (max temp)', 19.9000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(84, 3, '2025-06-12', 'H', 'Relative Humidity (max temp)', 29.9000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(85, 3, '2025-06-13', 'H', 'Relative Humidity (max temp)', 22.8000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(86, 3, '2025-06-14', 'H', 'Relative Humidity (max temp)', 32.0000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(87, 3, '2025-06-15', 'H', 'Relative Humidity (max temp)', 24.4000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(88, 3, '2025-06-16', 'H', 'Relative Humidity (max temp)', 44.9000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(89, 3, '2025-06-17', 'H', 'Relative Humidity (max temp)', 81.4000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(90, 3, '2025-06-18', 'H', 'Relative Humidity (max temp)', 68.0000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(91, 3, '2025-06-19', 'H', 'Relative Humidity (max temp)', 47.7000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(92, 3, '2025-06-20', 'H', 'Relative Humidity (max temp)', 45.6000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(93, 3, '2025-06-21', 'H', 'Relative Humidity (max temp)', 44.1000, '%', 'SILO-26', '2025-06-22 09:33:25');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(125, 2, '2024-10-08', 'H', 'Relative Humidity (max temp)', 49.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(126, 2, '2024-10-09', 'H', 'Relative Humidity (max temp)', 63.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(127, 2, '2024-10-10', 'H', 'Relative Humidity (max temp)', 68.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(128, 2, '2024-10-11', 'H', 'Relative Humidity (max temp)', 53.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(129, 2, '2024-10-12', 'H', 'Relative Humidity (max temp)', 48.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(130, 2, '2024-10-13', 'H', 'Relative Humidity (max temp)', 70.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(131, 2, '2024-10-14', 'H', 'Relative Humidity (max temp)', 51.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(132, 2, '2024-10-15', 'H', 'Relative Humidity (max temp)', 51.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(133, 2, '2024-10-16', 'H', 'Relative Humidity (max temp)', 56.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(134, 2, '2024-10-17', 'H', 'Relative Humidity (max temp)', 55.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(135, 2, '2024-10-18', 'H', 'Relative Humidity (max temp)', 52.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(136, 2, '2024-10-19', 'H', 'Relative Humidity (max temp)', 49.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(137, 2, '2024-10-20', 'H', 'Relative Humidity (max temp)', 55.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(138, 2, '2024-10-21', 'H', 'Relative Humidity (max temp)', 51.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(139, 2, '2024-10-22', 'H', 'Relative Humidity (max temp)', 44.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(140, 2, '2024-10-23', 'H', 'Relative Humidity (max temp)', 54.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(141, 2, '2024-10-24', 'H', 'Relative Humidity (max temp)', 47.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(142, 2, '2024-10-25', 'H', 'Relative Humidity (max temp)', 28.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(143, 2, '2024-10-26', 'H', 'Relative Humidity (max temp)', 49.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(144, 2, '2024-10-27', 'H', 'Relative Humidity (max temp)', 58.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(145, 2, '2024-10-28', 'H', 'Relative Humidity (max temp)', 55.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(146, 2, '2024-10-29', 'H', 'Relative Humidity (max temp)', 47.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(147, 2, '2024-10-30', 'H', 'Relative Humidity (max temp)', 58.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(148, 2, '2024-10-31', 'H', 'Relative Humidity (max temp)', 51.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(149, 2, '2024-11-01', 'H', 'Relative Humidity (max temp)', 44.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(150, 2, '2024-11-02', 'H', 'Relative Humidity (max temp)', 57.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(151, 2, '2024-11-03', 'H', 'Relative Humidity (max temp)', 53.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(152, 2, '2024-11-04', 'H', 'Relative Humidity (max temp)', 54.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(153, 2, '2024-11-05', 'H', 'Relative Humidity (max temp)', 48.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(154, 2, '2024-11-06', 'H', 'Relative Humidity (max temp)', 58.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(155, 2, '2024-11-07', 'H', 'Relative Humidity (max temp)', 48.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(156, 2, '2024-11-08', 'H', 'Relative Humidity (max temp)', 60.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(157, 2, '2024-11-09', 'H', 'Relative Humidity (max temp)', 56.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(158, 2, '2024-11-10', 'H', 'Relative Humidity (max temp)', 62.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(159, 2, '2024-11-11', 'H', 'Relative Humidity (max temp)', 61.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(160, 2, '2024-11-12', 'H', 'Relative Humidity (max temp)', 60.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(161, 2, '2024-11-13', 'H', 'Relative Humidity (max temp)', 59.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(162, 2, '2024-11-14', 'H', 'Relative Humidity (max temp)', 47.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(163, 2, '2024-11-15', 'H', 'Relative Humidity (max temp)', 61.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(164, 2, '2024-11-16', 'H', 'Relative Humidity (max temp)', 71.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(165, 2, '2024-11-17', 'H', 'Relative Humidity (max temp)', 58.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(166, 2, '2024-11-18', 'H', 'Relative Humidity (max temp)', 58.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(167, 2, '2024-11-19', 'H', 'Relative Humidity (max temp)', 78.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(168, 2, '2024-11-20', 'H', 'Relative Humidity (max temp)', 76.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(169, 2, '2024-11-21', 'H', 'Relative Humidity (max temp)', 62.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(170, 2, '2024-11-22', 'H', 'Relative Humidity (max temp)', 77.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(171, 2, '2024-11-23', 'H', 'Relative Humidity (max temp)', 64.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(172, 2, '2024-11-24', 'H', 'Relative Humidity (max temp)', 54.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(173, 2, '2024-11-25', 'H', 'Relative Humidity (max temp)', 51.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(174, 2, '2024-11-26', 'H', 'Relative Humidity (max temp)', 59.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(175, 2, '2024-11-27', 'H', 'Relative Humidity (max temp)', 65.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(176, 2, '2024-11-28', 'H', 'Relative Humidity (max temp)', 63.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(177, 2, '2024-11-29', 'H', 'Relative Humidity (max temp)', 68.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(178, 2, '2024-11-30', 'H', 'Relative Humidity (max temp)', 78.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(179, 2, '2024-12-01', 'H', 'Relative Humidity (max temp)', 72.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(180, 2, '2024-12-02', 'H', 'Relative Humidity (max temp)', 61.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(181, 2, '2024-12-03', 'H', 'Relative Humidity (max temp)', 62.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(182, 2, '2024-12-04', 'H', 'Relative Humidity (max temp)', 70.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(183, 2, '2024-12-05', 'H', 'Relative Humidity (max temp)', 67.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(184, 2, '2024-12-06', 'H', 'Relative Humidity (max temp)', 55.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(185, 2, '2024-12-07', 'H', 'Relative Humidity (max temp)', 55.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(186, 2, '2024-12-08', 'H', 'Relative Humidity (max temp)', 46.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(187, 2, '2024-12-09', 'H', 'Relative Humidity (max temp)', 65.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(188, 2, '2024-12-10', 'H', 'Relative Humidity (max temp)', 70.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(189, 2, '2024-12-11', 'H', 'Relative Humidity (max temp)', 66.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(190, 2, '2024-12-12', 'H', 'Relative Humidity (max temp)', 56.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(191, 2, '2024-12-13', 'H', 'Relative Humidity (max temp)', 57.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(192, 2, '2024-12-14', 'H', 'Relative Humidity (max temp)', 72.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(193, 2, '2024-12-15', 'H', 'Relative Humidity (max temp)', 65.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(194, 2, '2024-12-16', 'H', 'Relative Humidity (max temp)', 70.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(195, 2, '2024-12-17', 'H', 'Relative Humidity (max temp)', 70.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(196, 2, '2024-12-18', 'H', 'Relative Humidity (max temp)', 71.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(197, 2, '2024-12-19', 'H', 'Relative Humidity (max temp)', 47.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(198, 2, '2024-12-20', 'H', 'Relative Humidity (max temp)', 53.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(199, 2, '2024-12-21', 'H', 'Relative Humidity (max temp)', 51.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(200, 2, '2024-12-22', 'H', 'Relative Humidity (max temp)', 59.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(201, 2, '2024-12-23', 'H', 'Relative Humidity (max temp)', 52.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(202, 2, '2024-12-24', 'H', 'Relative Humidity (max temp)', 50.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(203, 2, '2024-12-25', 'H', 'Relative Humidity (max temp)', 46.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(204, 2, '2024-12-26', 'H', 'Relative Humidity (max temp)', 49.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(205, 2, '2024-12-27', 'H', 'Relative Humidity (max temp)', 45.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(206, 2, '2024-12-28', 'H', 'Relative Humidity (max temp)', 53.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(207, 2, '2024-12-29', 'H', 'Relative Humidity (max temp)', 66.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(208, 2, '2024-12-30', 'H', 'Relative Humidity (max temp)', 57.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(209, 2, '2024-12-31', 'H', 'Relative Humidity (max temp)', 63.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(210, 2, '2025-01-01', 'H', 'Relative Humidity (max temp)', 51.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(211, 2, '2025-01-02', 'H', 'Relative Humidity (max temp)', 67.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(212, 2, '2025-01-03', 'H', 'Relative Humidity (max temp)', 61.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(213, 2, '2025-01-04', 'H', 'Relative Humidity (max temp)', 55.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(214, 2, '2025-01-05', 'H', 'Relative Humidity (max temp)', 55.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(215, 2, '2025-01-06', 'H', 'Relative Humidity (max temp)', 52.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(216, 2, '2025-01-07', 'H', 'Relative Humidity (max temp)', 50.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(217, 2, '2025-01-08', 'H', 'Relative Humidity (max temp)', 52.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(218, 2, '2025-01-09', 'H', 'Relative Humidity (max temp)', 57.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(219, 2, '2025-01-10', 'H', 'Relative Humidity (max temp)', 65.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(220, 2, '2025-01-11', 'H', 'Relative Humidity (max temp)', 72.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(221, 2, '2025-01-12', 'H', 'Relative Humidity (max temp)', 68.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(222, 2, '2025-01-13', 'H', 'Relative Humidity (max temp)', 62.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(223, 2, '2025-01-14', 'H', 'Relative Humidity (max temp)', 57.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(224, 2, '2025-01-15', 'H', 'Relative Humidity (max temp)', 51.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(225, 2, '2025-01-16', 'H', 'Relative Humidity (max temp)', 45.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(226, 2, '2025-01-17', 'H', 'Relative Humidity (max temp)', 38.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(227, 2, '2025-01-18', 'H', 'Relative Humidity (max temp)', 48.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(228, 2, '2025-01-19', 'H', 'Relative Humidity (max temp)', 56.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(229, 2, '2025-01-20', 'H', 'Relative Humidity (max temp)', 43.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(230, 2, '2025-01-21', 'H', 'Relative Humidity (max temp)', 50.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(231, 2, '2025-01-22', 'H', 'Relative Humidity (max temp)', 48.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(232, 2, '2025-01-23', 'H', 'Relative Humidity (max temp)', 56.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(233, 2, '2025-01-24', 'H', 'Relative Humidity (max temp)', 51.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(234, 2, '2025-01-25', 'H', 'Relative Humidity (max temp)', 54.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(235, 2, '2025-01-26', 'H', 'Relative Humidity (max temp)', 57.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(236, 2, '2025-01-27', 'H', 'Relative Humidity (max temp)', 61.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(237, 2, '2025-01-28', 'H', 'Relative Humidity (max temp)', 48.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(238, 2, '2025-01-29', 'H', 'Relative Humidity (max temp)', 55.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(239, 2, '2025-01-30', 'H', 'Relative Humidity (max temp)', 58.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(240, 2, '2025-01-31', 'H', 'Relative Humidity (max temp)', 59.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(241, 2, '2025-02-01', 'H', 'Relative Humidity (max temp)', 58.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(242, 2, '2025-02-02', 'H', 'Relative Humidity (max temp)', 51.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(243, 2, '2025-02-03', 'H', 'Relative Humidity (max temp)', 58.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(244, 2, '2025-02-04', 'H', 'Relative Humidity (max temp)', 65.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(245, 2, '2025-02-05', 'H', 'Relative Humidity (max temp)', 65.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(246, 2, '2025-02-06', 'H', 'Relative Humidity (max temp)', 59.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(247, 2, '2025-02-07', 'H', 'Relative Humidity (max temp)', 55.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(248, 2, '2025-02-08', 'H', 'Relative Humidity (max temp)', 55.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(249, 2, '2025-02-09', 'H', 'Relative Humidity (max temp)', 51.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(250, 2, '2025-02-10', 'H', 'Relative Humidity (max temp)', 54.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(251, 2, '2025-02-11', 'H', 'Relative Humidity (max temp)', 59.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(252, 2, '2025-02-12', 'H', 'Relative Humidity (max temp)', 59.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(253, 2, '2025-02-13', 'H', 'Relative Humidity (max temp)', 62.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(254, 2, '2025-02-14', 'H', 'Relative Humidity (max temp)', 61.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(255, 2, '2025-02-15', 'H', 'Relative Humidity (max temp)', 58.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(256, 2, '2025-02-16', 'H', 'Relative Humidity (max temp)', 43.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(257, 2, '2025-02-17', 'H', 'Relative Humidity (max temp)', 45.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(258, 2, '2025-02-18', 'H', 'Relative Humidity (max temp)', 50.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(259, 2, '2025-02-19', 'H', 'Relative Humidity (max temp)', 54.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(260, 2, '2025-02-20', 'H', 'Relative Humidity (max temp)', 48.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(261, 2, '2025-02-21', 'H', 'Relative Humidity (max temp)', 46.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(262, 2, '2025-02-22', 'H', 'Relative Humidity (max temp)', 49.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(263, 2, '2025-02-23', 'H', 'Relative Humidity (max temp)', 55.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(264, 2, '2025-02-24', 'H', 'Relative Humidity (max temp)', 55.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(265, 2, '2025-02-25', 'H', 'Relative Humidity (max temp)', 51.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(266, 2, '2025-02-26', 'H', 'Relative Humidity (max temp)', 49.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(267, 2, '2025-02-27', 'H', 'Relative Humidity (max temp)', 51.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(268, 2, '2025-02-28', 'H', 'Relative Humidity (max temp)', 50.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(269, 2, '2025-03-01', 'H', 'Relative Humidity (max temp)', 51.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(270, 2, '2025-03-02', 'H', 'Relative Humidity (max temp)', 46.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(271, 2, '2025-03-03', 'H', 'Relative Humidity (max temp)', 50.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(272, 2, '2025-03-04', 'H', 'Relative Humidity (max temp)', 47.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(273, 2, '2025-03-05', 'H', 'Relative Humidity (max temp)', 51.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(274, 2, '2025-03-06', 'H', 'Relative Humidity (max temp)', 55.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(275, 2, '2025-03-07', 'H', 'Relative Humidity (max temp)', 57.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(276, 2, '2025-03-08', 'H', 'Relative Humidity (max temp)', 90.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(277, 2, '2025-03-09', 'H', 'Relative Humidity (max temp)', 86.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(278, 2, '2025-03-10', 'H', 'Relative Humidity (max temp)', 77.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(279, 2, '2025-03-11', 'H', 'Relative Humidity (max temp)', 63.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(280, 2, '2025-03-12', 'H', 'Relative Humidity (max temp)', 65.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(281, 2, '2025-03-13', 'H', 'Relative Humidity (max temp)', 58.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(282, 2, '2025-03-14', 'H', 'Relative Humidity (max temp)', 56.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(283, 2, '2025-03-15', 'H', 'Relative Humidity (max temp)', 61.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(284, 2, '2025-03-16', 'H', 'Relative Humidity (max temp)', 58.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(285, 2, '2025-03-17', 'H', 'Relative Humidity (max temp)', 47.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(286, 2, '2025-03-18', 'H', 'Relative Humidity (max temp)', 54.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(287, 2, '2025-03-19', 'H', 'Relative Humidity (max temp)', 59.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(288, 2, '2025-03-20', 'H', 'Relative Humidity (max temp)', 70.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(289, 2, '2025-03-21', 'H', 'Relative Humidity (max temp)', 63.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(290, 2, '2025-03-22', 'H', 'Relative Humidity (max temp)', 61.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(291, 2, '2025-03-23', 'H', 'Relative Humidity (max temp)', 65.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(292, 2, '2025-03-24', 'H', 'Relative Humidity (max temp)', 73.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(293, 2, '2025-03-25', 'H', 'Relative Humidity (max temp)', 74.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(294, 2, '2025-03-26', 'H', 'Relative Humidity (max temp)', 72.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(295, 2, '2025-03-27', 'H', 'Relative Humidity (max temp)', 75.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(296, 2, '2025-03-28', 'H', 'Relative Humidity (max temp)', 88.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(297, 2, '2025-03-29', 'H', 'Relative Humidity (max temp)', 75.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(298, 2, '2025-03-30', 'H', 'Relative Humidity (max temp)', 55.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(299, 2, '2025-03-31', 'H', 'Relative Humidity (max temp)', 53.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(300, 2, '2025-04-01', 'H', 'Relative Humidity (max temp)', 65.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(301, 2, '2025-04-02', 'H', 'Relative Humidity (max temp)', 95.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(302, 2, '2025-04-03', 'H', 'Relative Humidity (max temp)', 70.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(303, 2, '2025-04-04', 'H', 'Relative Humidity (max temp)', 67.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(304, 2, '2025-04-05', 'H', 'Relative Humidity (max temp)', 50.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(305, 2, '2025-04-06', 'H', 'Relative Humidity (max temp)', 55.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(306, 2, '2025-04-07', 'H', 'Relative Humidity (max temp)', 49.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(307, 2, '2025-04-08', 'H', 'Relative Humidity (max temp)', 54.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(308, 2, '2025-04-09', 'H', 'Relative Humidity (max temp)', 55.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(309, 2, '2025-04-10', 'H', 'Relative Humidity (max temp)', 54.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(310, 2, '2025-04-11', 'H', 'Relative Humidity (max temp)', 58.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(311, 2, '2025-04-12', 'H', 'Relative Humidity (max temp)', 68.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(312, 2, '2025-04-13', 'H', 'Relative Humidity (max temp)', 61.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(313, 2, '2025-04-14', 'H', 'Relative Humidity (max temp)', 60.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(314, 2, '2025-04-15', 'H', 'Relative Humidity (max temp)', 62.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(315, 2, '2025-04-16', 'H', 'Relative Humidity (max temp)', 51.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(316, 2, '2025-04-17', 'H', 'Relative Humidity (max temp)', 44.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(317, 2, '2025-04-18', 'H', 'Relative Humidity (max temp)', 46.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(318, 2, '2025-04-19', 'H', 'Relative Humidity (max temp)', 54.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(319, 2, '2025-04-20', 'H', 'Relative Humidity (max temp)', 58.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(320, 2, '2025-04-21', 'H', 'Relative Humidity (max temp)', 58.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(321, 2, '2025-04-22', 'H', 'Relative Humidity (max temp)', 52.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(322, 2, '2025-04-23', 'H', 'Relative Humidity (max temp)', 50.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(323, 2, '2025-04-24', 'H', 'Relative Humidity (max temp)', 76.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(324, 2, '2025-04-25', 'H', 'Relative Humidity (max temp)', 76.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(325, 2, '2025-04-26', 'H', 'Relative Humidity (max temp)', 61.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(326, 2, '2025-04-27', 'H', 'Relative Humidity (max temp)', 56.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(327, 2, '2025-04-28', 'H', 'Relative Humidity (max temp)', 42.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(328, 2, '2025-04-29', 'H', 'Relative Humidity (max temp)', 49.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(329, 2, '2025-04-30', 'H', 'Relative Humidity (max temp)', 53.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(330, 2, '2025-05-01', 'H', 'Relative Humidity (max temp)', 46.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(331, 2, '2025-05-02', 'H', 'Relative Humidity (max temp)', 53.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(332, 2, '2025-05-03', 'H', 'Relative Humidity (max temp)', 53.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(333, 2, '2025-05-04', 'H', 'Relative Humidity (max temp)', 58.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(334, 2, '2025-05-05', 'H', 'Relative Humidity (max temp)', 62.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(335, 2, '2025-05-06', 'H', 'Relative Humidity (max temp)', 60.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(336, 2, '2025-05-07', 'H', 'Relative Humidity (max temp)', 54.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(337, 2, '2025-05-08', 'H', 'Relative Humidity (max temp)', 49.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(338, 2, '2025-05-09', 'H', 'Relative Humidity (max temp)', 62.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(339, 2, '2025-05-10', 'H', 'Relative Humidity (max temp)', 62.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(340, 2, '2025-05-11', 'H', 'Relative Humidity (max temp)', 70.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(341, 2, '2025-05-12', 'H', 'Relative Humidity (max temp)', 67.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(342, 2, '2025-05-13', 'H', 'Relative Humidity (max temp)', 59.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(343, 2, '2025-05-14', 'H', 'Relative Humidity (max temp)', 68.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(344, 2, '2025-05-15', 'H', 'Relative Humidity (max temp)', 61.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(345, 2, '2025-05-16', 'H', 'Relative Humidity (max temp)', 58.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(346, 2, '2025-05-17', 'H', 'Relative Humidity (max temp)', 62.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(347, 2, '2025-05-18', 'H', 'Relative Humidity (max temp)', 57.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(348, 2, '2025-05-19', 'H', 'Relative Humidity (max temp)', 51.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(349, 2, '2025-05-20', 'H', 'Relative Humidity (max temp)', 46.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(350, 2, '2025-05-21', 'H', 'Relative Humidity (max temp)', 55.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(351, 2, '2025-05-22', 'H', 'Relative Humidity (max temp)', 52.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(352, 2, '2025-05-23', 'H', 'Relative Humidity (max temp)', 43.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(353, 2, '2025-05-24', 'H', 'Relative Humidity (max temp)', 43.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(354, 2, '2025-05-25', 'H', 'Relative Humidity (max temp)', 49.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(355, 2, '2025-05-26', 'H', 'Relative Humidity (max temp)', 56.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(356, 2, '2025-05-27', 'H', 'Relative Humidity (max temp)', 54.2000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(357, 2, '2025-05-28', 'H', 'Relative Humidity (max temp)', 31.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(358, 2, '2025-05-29', 'H', 'Relative Humidity (max temp)', 44.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(359, 2, '2025-05-30', 'H', 'Relative Humidity (max temp)', 71.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(360, 2, '2025-05-31', 'H', 'Relative Humidity (max temp)', 79.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(361, 2, '2025-06-01', 'H', 'Relative Humidity (max temp)', 63.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(362, 2, '2025-06-02', 'H', 'Relative Humidity (max temp)', 59.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(363, 2, '2025-06-03', 'H', 'Relative Humidity (max temp)', 60.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(364, 2, '2025-06-04', 'H', 'Relative Humidity (max temp)', 46.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(365, 2, '2025-06-05', 'H', 'Relative Humidity (max temp)', 39.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(366, 2, '2025-06-06', 'H', 'Relative Humidity (max temp)', 44.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(367, 2, '2025-06-07', 'H', 'Relative Humidity (max temp)', 51.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(368, 2, '2025-06-08', 'H', 'Relative Humidity (max temp)', 41.5000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(369, 2, '2025-06-09', 'H', 'Relative Humidity (max temp)', 44.9000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(370, 2, '2025-06-10', 'H', 'Relative Humidity (max temp)', 36.6000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(371, 2, '2025-06-11', 'H', 'Relative Humidity (max temp)', 34.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(372, 2, '2025-06-12', 'H', 'Relative Humidity (max temp)', 40.1000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(373, 2, '2025-06-13', 'H', 'Relative Humidity (max temp)', 37.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(374, 2, '2025-06-14', 'H', 'Relative Humidity (max temp)', 37.8000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(375, 2, '2025-06-15', 'H', 'Relative Humidity (max temp)', 40.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(376, 2, '2025-06-16', 'H', 'Relative Humidity (max temp)', 40.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(377, 2, '2025-06-17', 'H', 'Relative Humidity (max temp)', 61.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(378, 2, '2025-06-18', 'H', 'Relative Humidity (max temp)', 44.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(379, 2, '2025-06-19', 'H', 'Relative Humidity (max temp)', 45.7000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(380, 2, '2025-06-20', 'H', 'Relative Humidity (max temp)', 54.0000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(381, 2, '2025-06-21', 'H', 'Relative Humidity (max temp)', 66.4000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(382, 2, '2025-06-22', 'H', 'Relative Humidity (max temp)', 71.3000, '%', 'SILO-26', '2025-06-23 03:13:04');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(383, 2, '2025-05-23', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(384, 2, '2025-05-24', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(385, 2, '2025-05-25', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(386, 2, '2025-05-26', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(387, 2, '2025-05-27', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(388, 2, '2025-05-28', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(389, 2, '2025-05-29', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(390, 2, '2025-05-30', 'R', 'Daily Rainfall', 0.7000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(391, 2, '2025-05-31', 'R', 'Daily Rainfall', 4.4000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(392, 2, '2025-06-01', 'R', 'Daily Rainfall', 26.7000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(393, 2, '2025-06-02', 'R', 'Daily Rainfall', 0.1000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(394, 2, '2025-06-03', 'R', 'Daily Rainfall', 0.8000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(395, 2, '2025-06-04', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(396, 2, '2025-06-05', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(397, 2, '2025-06-06', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(398, 2, '2025-06-07', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(399, 2, '2025-06-08', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:21:59');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(400, 2, '2025-06-09', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(401, 2, '2025-06-10', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(402, 2, '2025-06-11', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(403, 2, '2025-06-12', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(404, 2, '2025-06-13', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(405, 2, '2025-06-14', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(406, 2, '2025-06-15', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(407, 2, '2025-06-16', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(408, 2, '2025-06-17', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(409, 2, '2025-06-18', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(410, 2, '2025-06-19', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(411, 2, '2025-06-20', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(412, 2, '2025-06-21', 'R', 'Daily Rainfall', 0.1000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(413, 2, '2025-06-22', 'R', 'Daily Rainfall', 2.2000, 'mm', 'SILO-25', '2025-06-23 07:22:00');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(444, 2, '2025-06-22', 'X', 'Maximum Temperature', 20.8000, '°C', 'SILO-75', '2025-06-23 07:22:14');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(445, 2, '2025-05-23', 'N', 'Minimum Temperature', 11.9000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(446, 2, '2025-05-24', 'N', 'Minimum Temperature', 13.7000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(447, 2, '2025-05-25', 'N', 'Minimum Temperature', 14.0000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(448, 2, '2025-05-26', 'N', 'Minimum Temperature', 16.4000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(449, 2, '2025-05-27', 'N', 'Minimum Temperature', 16.2000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(450, 2, '2025-05-28', 'N', 'Minimum Temperature', 13.2000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(451, 2, '2025-05-29', 'N', 'Minimum Temperature', 14.3000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(452, 2, '2025-05-30', 'N', 'Minimum Temperature', 15.6000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(453, 2, '2025-05-31', 'N', 'Minimum Temperature', 15.9000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(454, 2, '2025-06-01', 'N', 'Minimum Temperature', 15.8000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(455, 2, '2025-06-02', 'N', 'Minimum Temperature', 15.0000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(456, 2, '2025-06-03', 'N', 'Minimum Temperature', 15.8000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(457, 2, '2025-06-04', 'N', 'Minimum Temperature', 12.5000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(458, 2, '2025-06-05', 'N', 'Minimum Temperature', 8.4000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(459, 2, '2025-06-06', 'N', 'Minimum Temperature', 9.8000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(460, 2, '2025-06-07', 'N', 'Minimum Temperature', 11.9000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(461, 2, '2025-06-08', 'N', 'Minimum Temperature', 9.0000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(462, 2, '2025-06-09', 'N', 'Minimum Temperature', 7.9000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(463, 2, '2025-06-10', 'N', 'Minimum Temperature', 8.7000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(464, 2, '2025-06-11', 'N', 'Minimum Temperature', 9.0000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(465, 2, '2025-06-12', 'N', 'Minimum Temperature', 5.5000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(466, 2, '2025-06-13', 'N', 'Minimum Temperature', 4.3000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(467, 2, '2025-06-14', 'N', 'Minimum Temperature', 6.1000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(468, 2, '2025-06-15', 'N', 'Minimum Temperature', 7.2000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(469, 2, '2025-06-16', 'N', 'Minimum Temperature', 7.9000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(470, 2, '2025-06-17', 'N', 'Minimum Temperature', 10.8000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(471, 2, '2025-06-18', 'N', 'Minimum Temperature', 11.7000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(472, 2, '2025-06-19', 'N', 'Minimum Temperature', 10.2000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(473, 2, '2025-06-20', 'N', 'Minimum Temperature', 11.6000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(474, 2, '2025-06-21', 'N', 'Minimum Temperature', 11.9000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(475, 2, '2025-06-22', 'N', 'Minimum Temperature', 13.3000, '°C', 'SILO-25', '2025-06-23 07:22:34');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(476, 9, '2025-05-23', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(477, 9, '2025-05-24', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(478, 9, '2025-05-25', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(479, 9, '2025-05-26', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(480, 9, '2025-05-27', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(481, 9, '2025-05-28', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(482, 9, '2025-05-29', 'R', 'Daily Rainfall', 2.8000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(483, 9, '2025-05-30', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(484, 9, '2025-05-31', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(485, 9, '2025-06-01', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(486, 9, '2025-06-02', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(487, 9, '2025-06-03', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(488, 9, '2025-06-04', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(489, 9, '2025-06-05', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(490, 9, '2025-06-06', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(491, 9, '2025-06-07', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(492, 9, '2025-06-08', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(493, 9, '2025-06-09', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(494, 9, '2025-06-10', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(495, 9, '2025-06-11', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(496, 9, '2025-06-12', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(497, 9, '2025-06-13', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(498, 9, '2025-06-14', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(499, 9, '2025-06-15', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(500, 9, '2025-06-16', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(501, 9, '2025-06-17', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(502, 9, '2025-06-18', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(503, 9, '2025-06-19', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(504, 9, '2025-06-20', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(505, 9, '2025-06-21', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(506, 9, '2025-06-22', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:22:47');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(507, 10, '2025-05-23', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(508, 10, '2025-05-24', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(509, 10, '2025-05-25', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(510, 10, '2025-05-26', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(511, 10, '2025-05-27', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(512, 10, '2025-05-28', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(513, 10, '2025-05-29', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(514, 10, '2025-05-30', 'R', 'Daily Rainfall', 18.7000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(515, 10, '2025-05-31', 'R', 'Daily Rainfall', 6.1000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(516, 10, '2025-06-01', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(517, 10, '2025-06-02', 'R', 'Daily Rainfall', 0.2000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(518, 10, '2025-06-03', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(519, 10, '2025-06-04', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(520, 10, '2025-06-05', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(521, 10, '2025-06-06', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(522, 10, '2025-06-07', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(523, 10, '2025-06-08', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(524, 10, '2025-06-09', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(525, 10, '2025-06-10', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(526, 10, '2025-06-11', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(527, 10, '2025-06-12', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(528, 10, '2025-06-13', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(529, 10, '2025-06-14', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(530, 10, '2025-06-15', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(531, 10, '2025-06-16', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(532, 10, '2025-06-17', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(533, 10, '2025-06-18', 'R', 'Daily Rainfall', 0.8000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(534, 10, '2025-06-19', 'R', 'Daily Rainfall', 0.4000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(535, 10, '2025-06-20', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(536, 10, '2025-06-21', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(537, 10, '2025-06-22', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:32:15');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(538, 11, '2025-05-23', 'R', 'Daily Rainfall', 0.2000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(539, 11, '2025-05-24', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(540, 11, '2025-05-25', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(541, 11, '2025-05-26', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(542, 11, '2025-05-27', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(543, 11, '2025-05-28', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(544, 11, '2025-05-29', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(545, 11, '2025-05-30', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(546, 11, '2025-05-31', 'R', 'Daily Rainfall', 11.7000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(547, 11, '2025-06-01', 'R', 'Daily Rainfall', 3.5000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(548, 11, '2025-06-02', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(549, 11, '2025-06-03', 'R', 'Daily Rainfall', 2.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(550, 11, '2025-06-04', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(551, 11, '2025-06-05', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(552, 11, '2025-06-06', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(553, 11, '2025-06-07', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(554, 11, '2025-06-08', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(555, 11, '2025-06-09', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(556, 11, '2025-06-10', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(557, 11, '2025-06-11', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(558, 11, '2025-06-12', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(559, 11, '2025-06-13', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(560, 11, '2025-06-14', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(561, 11, '2025-06-15', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(562, 11, '2025-06-16', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(563, 11, '2025-06-17', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(564, 11, '2025-06-18', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(565, 11, '2025-06-19', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(566, 11, '2025-06-20', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(567, 11, '2025-06-21', 'R', 'Daily Rainfall', 0.0000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(568, 11, '2025-06-22', 'R', 'Daily Rainfall', 0.3000, 'mm', 'SILO-25', '2025-06-23 07:59:32');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(569, 11, '2025-05-23', 'X', 'Maximum Temperature', 25.9000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(570, 11, '2025-05-24', 'X', 'Maximum Temperature', 27.4000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(571, 11, '2025-05-25', 'X', 'Maximum Temperature', 28.1000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(572, 11, '2025-05-26', 'X', 'Maximum Temperature', 28.4000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(573, 11, '2025-05-27', 'X', 'Maximum Temperature', 29.4000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(574, 11, '2025-05-28', 'X', 'Maximum Temperature', 23.2000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(575, 11, '2025-05-29', 'X', 'Maximum Temperature', 21.9000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(576, 11, '2025-05-30', 'X', 'Maximum Temperature', 18.0000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(577, 11, '2025-05-31', 'X', 'Maximum Temperature', 21.3000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(578, 11, '2025-06-01', 'X', 'Maximum Temperature', 23.5000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(579, 11, '2025-06-02', 'X', 'Maximum Temperature', 23.3000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(580, 11, '2025-06-03', 'X', 'Maximum Temperature', 23.8000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(581, 11, '2025-06-04', 'X', 'Maximum Temperature', 22.2000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(582, 11, '2025-06-05', 'X', 'Maximum Temperature', 21.5000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(583, 11, '2025-06-06', 'X', 'Maximum Temperature', 22.8000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(584, 11, '2025-06-07', 'X', 'Maximum Temperature', 25.1000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(585, 11, '2025-06-08', 'X', 'Maximum Temperature', 22.6000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(586, 11, '2025-06-09', 'X', 'Maximum Temperature', 19.8000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(587, 11, '2025-06-10', 'X', 'Maximum Temperature', 19.9000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(588, 11, '2025-06-11', 'X', 'Maximum Temperature', 19.4000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(589, 11, '2025-06-12', 'X', 'Maximum Temperature', 19.6000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(590, 11, '2025-06-13', 'X', 'Maximum Temperature', 19.4000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(591, 11, '2025-06-14', 'X', 'Maximum Temperature', 20.8000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(592, 11, '2025-06-15', 'X', 'Maximum Temperature', 22.5000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(593, 11, '2025-06-16', 'X', 'Maximum Temperature', 22.7000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(594, 11, '2025-06-17', 'X', 'Maximum Temperature', 17.9000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(595, 11, '2025-06-18', 'X', 'Maximum Temperature', 21.5000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(596, 11, '2025-06-19', 'X', 'Maximum Temperature', 22.8000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(597, 11, '2025-06-20', 'X', 'Maximum Temperature', 22.3000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(598, 11, '2025-06-21', 'X', 'Maximum Temperature', 20.9000, '°C', 'SILO-25', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(599, 11, '2025-06-22', 'X', 'Maximum Temperature', 21.1000, '°C', 'SILO-75', '2025-06-23 07:59:49');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(600, 11, '2025-05-23', 'N', 'Minimum Temperature', 9.6000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(601, 11, '2025-05-24', 'N', 'Minimum Temperature', 12.2000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(602, 11, '2025-05-25', 'N', 'Minimum Temperature', 11.0000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(603, 11, '2025-05-26', 'N', 'Minimum Temperature', 14.0000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(604, 11, '2025-05-27', 'N', 'Minimum Temperature', 12.6000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(605, 11, '2025-05-28', 'N', 'Minimum Temperature', 10.6000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(606, 11, '2025-05-29', 'N', 'Minimum Temperature', 11.7000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(607, 11, '2025-05-30', 'N', 'Minimum Temperature', 14.4000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(608, 11, '2025-05-31', 'N', 'Minimum Temperature', 14.8000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(609, 11, '2025-06-01', 'N', 'Minimum Temperature', 14.4000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(610, 11, '2025-06-02', 'N', 'Minimum Temperature', 12.7000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(611, 11, '2025-06-03', 'N', 'Minimum Temperature', 14.8000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(612, 11, '2025-06-04', 'N', 'Minimum Temperature', 10.3000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(613, 11, '2025-06-05', 'N', 'Minimum Temperature', 5.4000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(614, 11, '2025-06-06', 'N', 'Minimum Temperature', 5.2000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(615, 11, '2025-06-07', 'N', 'Minimum Temperature', 9.4000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(616, 11, '2025-06-08', 'N', 'Minimum Temperature', 5.6000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(617, 11, '2025-06-09', 'N', 'Minimum Temperature', 3.9000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(618, 11, '2025-06-10', 'N', 'Minimum Temperature', 7.0000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(619, 11, '2025-06-11', 'N', 'Minimum Temperature', 6.3000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(620, 11, '2025-06-12', 'N', 'Minimum Temperature', 1.2000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(621, 11, '2025-06-13', 'N', 'Minimum Temperature', 0.0000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(622, 11, '2025-06-14', 'N', 'Minimum Temperature', 2.5000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(623, 11, '2025-06-15', 'N', 'Minimum Temperature', 2.3000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(624, 11, '2025-06-16', 'N', 'Minimum Temperature', 2.3000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(625, 11, '2025-06-17', 'N', 'Minimum Temperature', 7.6000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(626, 11, '2025-06-18', 'N', 'Minimum Temperature', 8.0000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(627, 11, '2025-06-19', 'N', 'Minimum Temperature', 5.4000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(628, 11, '2025-06-20', 'N', 'Minimum Temperature', 5.8000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(629, 11, '2025-06-21', 'N', 'Minimum Temperature', 8.1000, '°C', 'SILO-25', '2025-06-23 08:00:07');
INSERT INTO `climate_data` (`id`, `location_id`, `date`, `variable_code`, `variable_name`, `value`, `unit`, `source`, `created_at`) VALUES
	(630, 11, '2025-06-22', 'N', 'Minimum Temperature', 10.7000, '°C', 'SILO-25', '2025-06-23 08:00:07');

-- Dumping structure for table climate_data.locations
DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_coords` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table climate_data.locations: ~6 rows (approximately)
INSERT INTO `locations` (`id`, `latitude`, `longitude`, `created_at`) VALUES
	(1, -23.440000, 144.250000, '2025-06-22 09:24:55');
INSERT INTO `locations` (`id`, `latitude`, `longitude`, `created_at`) VALUES
	(2, -27.470000, 153.030000, '2025-06-22 09:28:36');
INSERT INTO `locations` (`id`, `latitude`, `longitude`, `created_at`) VALUES
	(3, -20.070000, 146.270000, '2025-06-22 09:33:25');
INSERT INTO `locations` (`id`, `latitude`, `longitude`, `created_at`) VALUES
	(9, -20.730000, 139.500000, '2025-06-23 07:22:47');
INSERT INTO `locations` (`id`, `latitude`, `longitude`, `created_at`) VALUES
	(10, -24.870000, 152.350000, '2025-06-23 07:32:15');
INSERT INTO `locations` (`id`, `latitude`, `longitude`, `created_at`) VALUES
	(11, -27.610000, 152.760000, '2025-06-23 07:59:32');

-- Dumping structure for table climate_data.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` enum('admin','analyst','researcher','officer','public') NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table climate_data.users: ~5 rows (approximately)
INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `last_login`, `created_at`) VALUES
	(1, 'admin_user', '$2y$10$GPvfc2EAx19XRmlVeVTQHuAJX2V5DFYdhz/r2dHGZNSwzUEv1t696', 'admin', 'admin', '2025-06-23 10:28:17', '2025-06-23 05:11:03');
INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `last_login`, `created_at`) VALUES
	(2, 'data_analyst', '$2y$10$tlKhfa1um4hD9hq9s.c3eu0db2GLWBP1Y3xdG/BTmdtzDeCSFWBdi', 'analyst', 'analyst', NULL, '2025-06-23 05:11:04');
INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `last_login`, `created_at`) VALUES
	(3, 'research_user', '$2y$10$KaN5/Wes2CR4wZlnQRF90O4MGryIrhldxZ2K0YPtR4VO3zHA2z/ri', 'researcher', 'researcher', NULL, '2025-06-23 05:11:05');
INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `last_login`, `created_at`) VALUES
	(4, 'public_user', '$2y$10$EY1pDjPSp5R2zCEc6hW64.M3KTrLdw0tVj4andHHQJnlHkLSZiq2e', 'public', 'public', NULL, '2025-06-23 05:11:06');
INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `last_login`, `created_at`) VALUES
	(5, 'officer_user', '$2y$10$rfvpvctLSzMfovWh16cufeEmN7rojmhea7S/1eEXkggn8RvzTlEVW', 'officer', 'officer', NULL, '2025-06-23 05:11:06');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
