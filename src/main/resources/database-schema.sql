-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- batch_test 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `batch_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `batch_test`;

-- 테이블 batch_test.test_data 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `insert_timestamp` datetime(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- 테이블 데이터 batch_test.test_data:~100 rows (대략적) 내보내기
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
INSERT INTO `test_data` (`id`, `description`, `duration`, `insert_timestamp`, `title`, `update_timestamp`) VALUES
	(1, 'test-description-1', NULL, '2021-04-25 07:09:15.012537', 'test-title-1', NULL),
	(2, 'test-description-2', NULL, '2021-04-25 07:09:15.137600', 'test-title-2', NULL),
	(3, 'test-description-3', NULL, '2021-04-25 07:09:15.262269', 'test-title-3', NULL),
	(4, 'test-description-4', NULL, '2021-04-25 07:09:15.412607', 'test-title-4', NULL),
	(5, 'test-description-5', NULL, '2021-04-25 07:09:15.670617', 'test-title-5', NULL),
	(6, 'test-description-6', NULL, '2021-04-25 07:09:15.790632', 'test-title-6', NULL),
	(7, 'test-description-7', NULL, '2021-04-25 07:09:15.904631', 'test-title-7', NULL),
	(8, 'test-description-8', NULL, '2021-04-25 07:09:16.021497', 'test-title-8', NULL),
	(9, 'test-description-9', NULL, '2021-04-25 07:09:16.240287', 'test-title-9', NULL),
	(10, 'test-description-10', NULL, '2021-04-25 07:09:16.412947', 'test-title-10', NULL),
	(11, 'test-description-11', NULL, '2021-04-25 07:09:16.513079', 'test-title-11', NULL),
	(12, 'test-description-12', NULL, '2021-04-25 07:09:16.629415', 'test-title-12', NULL),
	(13, 'test-description-13', NULL, '2021-04-25 07:09:16.922851', 'test-title-13', NULL),
	(14, 'test-description-14', NULL, '2021-04-25 07:09:17.382041', 'test-title-14', NULL),
	(15, 'test-description-15', NULL, '2021-04-25 07:09:17.489625', 'test-title-15', NULL),
	(16, 'test-description-16', NULL, '2021-04-25 07:09:17.548674', 'test-title-16', NULL),
	(17, 'test-description-17', NULL, '2021-04-25 07:09:17.613317', 'test-title-17', NULL),
	(18, 'test-description-18', NULL, '2021-04-25 07:09:17.714890', 'test-title-18', NULL),
	(19, 'test-description-19', NULL, '2021-04-25 07:09:17.779746', 'test-title-19', NULL),
	(20, 'test-description-20', NULL, '2021-04-25 07:09:17.840635', 'test-title-20', NULL),
	(21, 'test-description-21', NULL, '2021-04-25 07:09:17.913720', 'test-title-21', NULL),
	(22, 'test-description-22', NULL, '2021-04-25 07:09:18.006433', 'test-title-22', NULL),
	(23, 'test-description-23', NULL, '2021-04-25 07:09:18.071713', 'test-title-23', NULL),
	(24, 'test-description-24', NULL, '2021-04-25 07:09:18.140133', 'test-title-24', NULL),
	(25, 'test-description-25', NULL, '2021-04-25 07:09:18.204699', 'test-title-25', NULL),
	(26, 'test-description-26', NULL, '2021-04-25 07:09:18.265707', 'test-title-26', NULL),
	(27, 'test-description-27', NULL, '2021-04-25 07:09:18.331751', 'test-title-27', NULL),
	(28, 'test-description-28', NULL, '2021-04-25 07:09:18.457195', 'test-title-28', NULL),
	(29, 'test-description-29', NULL, '2021-04-25 07:09:18.601172', 'test-title-29', NULL),
	(30, 'test-description-30', NULL, '2021-04-25 07:09:18.773587', 'test-title-30', NULL),
	(31, 'test-description-31', NULL, '2021-04-25 07:09:18.882957', 'test-title-31', NULL),
	(32, 'test-description-32', NULL, '2021-04-25 07:09:19.283740', 'test-title-32', NULL),
	(33, 'test-description-33', NULL, '2021-04-25 07:09:19.380309', 'test-title-33', NULL),
	(34, 'test-description-34', NULL, '2021-04-25 07:09:19.823956', 'test-title-34', NULL),
	(35, 'test-description-35', NULL, '2021-04-25 07:09:19.880647', 'test-title-35', NULL),
	(36, 'test-description-36', NULL, '2021-04-25 07:09:19.949462', 'test-title-36', NULL),
	(37, 'test-description-37', NULL, '2021-04-25 07:09:20.013718', 'test-title-37', NULL),
	(38, 'test-description-38', NULL, '2021-04-25 07:09:20.075274', 'test-title-38', NULL),
	(39, 'test-description-39', NULL, '2021-04-25 07:09:20.147584', 'test-title-39', NULL),
	(40, 'test-description-40', NULL, '2021-04-25 07:09:20.238513', 'test-title-40', NULL),
	(41, 'test-description-41', NULL, '2021-04-25 07:09:20.323610', 'test-title-41', NULL),
	(42, 'test-description-42', NULL, '2021-04-25 07:09:20.388614', 'test-title-42', NULL),
	(43, 'test-description-43', NULL, '2021-04-25 07:09:20.457406', 'test-title-43', NULL),
	(44, 'test-description-44', NULL, '2021-04-25 07:09:20.582612', 'test-title-44', NULL),
	(45, 'test-description-45', NULL, '2021-04-25 07:09:20.646774', 'test-title-45', NULL),
	(46, 'test-description-46', NULL, '2021-04-25 07:09:20.706747', 'test-title-46', NULL),
	(47, 'test-description-47', NULL, '2021-04-25 07:09:20.771953', 'test-title-47', NULL),
	(48, 'test-description-48', NULL, '2021-04-25 07:09:20.832603', 'test-title-48', NULL),
	(49, 'test-description-49', NULL, '2021-04-25 07:09:20.990647', 'test-title-49', NULL),
	(50, 'test-description-50', NULL, '2021-04-25 07:09:21.106477', 'test-title-50', NULL),
	(51, 'test-description-51', NULL, '2021-04-25 07:09:21.250824', 'test-title-51', NULL),
	(52, 'test-description-52', NULL, '2021-04-25 07:09:21.373490', 'test-title-52', NULL),
	(53, 'test-description-53', NULL, '2021-04-25 07:09:21.481270', 'test-title-53', NULL),
	(54, 'test-description-54', NULL, '2021-04-25 07:09:21.572607', 'test-title-54', NULL),
	(55, 'test-description-55', NULL, '2021-04-25 07:09:22.174374', 'test-title-55', NULL),
	(56, 'test-description-56', NULL, '2021-04-25 07:09:22.681646', 'test-title-56', NULL),
	(57, 'test-description-57', NULL, '2021-04-25 07:09:22.799706', 'test-title-57', NULL),
	(58, 'test-description-58', NULL, '2021-04-25 07:09:22.863779', 'test-title-58', NULL),
	(59, 'test-description-59', NULL, '2021-04-25 07:09:22.965804', 'test-title-59', NULL),
	(60, 'test-description-60', NULL, '2021-04-25 07:09:23.091611', 'test-title-60', NULL),
	(61, 'test-description-61', NULL, '2021-04-25 07:09:23.155613', 'test-title-61', NULL),
	(62, 'test-description-62', NULL, '2021-04-25 07:09:23.216363', 'test-title-62', NULL),
	(63, 'test-description-63', NULL, '2021-04-25 07:09:23.281118', 'test-title-63', NULL),
	(64, 'test-description-64', NULL, '2021-04-25 07:09:23.341707', 'test-title-64', NULL),
	(65, 'test-description-65', NULL, '2021-04-25 07:09:23.406648', 'test-title-65', NULL),
	(66, 'test-description-66', NULL, '2021-04-25 07:09:23.491667', 'test-title-66', NULL),
	(67, 'test-description-67', NULL, '2021-04-25 07:09:23.555579', 'test-title-67', NULL),
	(68, 'test-description-68', NULL, '2021-04-25 07:09:23.625237', 'test-title-68', NULL),
	(69, 'test-description-69', NULL, '2021-04-25 07:09:23.692357', 'test-title-69', NULL),
	(70, 'test-description-70', NULL, '2021-04-25 07:09:23.758226', 'test-title-70', NULL),
	(71, 'test-description-71', NULL, '2021-04-25 07:09:23.825306', 'test-title-71', NULL),
	(72, 'test-description-72', NULL, '2021-04-25 07:09:23.967880', 'test-title-72', NULL),
	(73, 'test-description-73', NULL, '2021-04-25 07:09:24.064562', 'test-title-73', NULL),
	(74, 'test-description-74', NULL, '2021-04-25 07:09:24.308633', 'test-title-74', NULL),
	(75, 'test-description-75', NULL, '2021-04-25 07:09:24.449751', 'test-title-75', NULL),
	(76, 'test-description-76', NULL, '2021-04-25 07:09:24.539620', 'test-title-76', NULL),
	(77, 'test-description-77', NULL, '2021-04-25 07:09:24.719657', 'test-title-77', NULL),
	(78, 'test-description-78', NULL, '2021-04-25 07:09:24.956663', 'test-title-78', NULL),
	(79, 'test-description-79', NULL, '2021-04-25 07:09:25.249807', 'test-title-79', NULL),
	(80, 'test-description-80', NULL, '2021-04-25 07:09:25.405989', 'test-title-80', NULL),
	(81, 'test-description-81', NULL, '2021-04-25 07:09:25.466827', 'test-title-81', NULL),
	(82, 'test-description-82', NULL, '2021-04-25 07:09:25.591493', 'test-title-82', NULL),
	(83, 'test-description-83', NULL, '2021-04-25 07:09:25.741729', 'test-title-83', NULL),
	(84, 'test-description-84', NULL, '2021-04-25 07:09:25.806388', 'test-title-84', NULL),
	(85, 'test-description-85', NULL, '2021-04-25 07:09:25.866581', 'test-title-85', NULL),
	(86, 'test-description-86', NULL, '2021-04-25 07:09:25.931706', 'test-title-86', NULL),
	(87, 'test-description-87', NULL, '2021-04-25 07:09:25.992220', 'test-title-87', NULL),
	(88, 'test-description-88', NULL, '2021-04-25 07:09:26.056942', 'test-title-88', NULL),
	(89, 'test-description-89', NULL, '2021-04-25 07:09:26.116739', 'test-title-89', NULL),
	(90, 'test-description-90', NULL, '2021-04-25 07:09:26.173503', 'test-title-90', NULL),
	(91, 'test-description-91', NULL, '2021-04-25 07:09:26.241294', 'test-title-91', NULL),
	(92, 'test-description-92', NULL, '2021-04-25 07:09:26.306509', 'test-title-92', NULL),
	(93, 'test-description-93', NULL, '2021-04-25 07:09:26.366654', 'test-title-93', NULL),
	(94, 'test-description-94', NULL, '2021-04-25 07:09:26.656198', 'test-title-94', NULL),
	(95, 'test-description-95', NULL, '2021-04-25 07:09:26.791818', 'test-title-95', NULL),
	(96, 'test-description-96', NULL, '2021-04-25 07:09:26.906959', 'test-title-96', NULL),
	(97, 'test-description-97', NULL, '2021-04-25 07:09:27.025035', 'test-title-97', NULL),
	(98, 'test-description-98', NULL, '2021-04-25 07:09:27.141859', 'test-title-98', NULL),
	(99, 'test-description-99', NULL, '2021-04-25 07:09:27.302671', 'test-title-99', NULL),
	(100, 'test-description-100', NULL, '2021-04-25 07:09:27.423643', 'test-title-100', NULL);
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
