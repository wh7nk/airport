-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 30 May 2017, 17:02:27
-- Sunucu sürümü: 10.1.13-MariaDB
-- PHP Sürümü: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `airportdb`
--
CREATE DATABASE IF NOT EXISTS `airportdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `airportdb`;

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplayAllFlights` ()  NO SQL
select cg.flight_name,c.name as company_name, l.name as luggage_name, g.name as gate_name,
cg.take_off, cg.landing, cg.delay_time from companygatemapping cg, companies c, luggage l, gates g WHERE cg.company_id = c.id and cg.luggage_id = l.id and cg.gate_id = g.id and DATE(cg.take_off) = CURDATE()$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `admins`
--

INSERT INTO `admins` (`id`, `name`, `last_name`, `email`, `password`, `created_at`, `modified_at`) VALUES
(1, 'aslihan', 'gurkan', 'asli@gmail.com', 'd225b33f7bb4793c36c2fbff070f78a2f0183e5b', '2017-05-18 16:35:13', '2017-05-29 18:47:57');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`) VALUES
(1, 'Türk Hava Yolları', '2017-05-21 13:30:03'),
(2, 'SunExpress', '2017-05-21 13:30:28'),
(3, 'OnurAir', '2017-05-21 13:30:44'),
(4, 'AtlasJet', '2017-05-21 13:31:10'),
(5, 'FlyAir', '2017-05-21 13:31:33'),
(6, 'Pegasus Hava Yolları', '2017-05-21 13:31:55'),
(7, 'Atlas Global', '2017-05-21 13:32:10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `companygatemapping`
--

CREATE TABLE `companygatemapping` (
  `id` int(11) NOT NULL,
  `flight_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `luggage_id` int(11) NOT NULL,
  `gate_id` int(11) NOT NULL,
  `take_off` datetime NOT NULL,
  `landing` datetime NOT NULL,
  `delay_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `companygatemapping`
--

INSERT INTO `companygatemapping` (`id`, `flight_name`, `company_id`, `luggage_id`, `gate_id`, `take_off`, `landing`, `delay_time`, `created_at`) VALUES
(1, 'THY Test1', 1, 1, 1, '2017-05-24 22:00:00', '2017-05-25 21:34:37', 20, '2017-05-21 12:53:43'),
(2, 'xx', 2, 1, 1, '2017-05-21 11:22:10', '2017-05-30 11:04:00', 30, '2017-05-21 14:52:00'),
(3, 'A111', 1, 1, 1, '2017-05-26 19:48:00', '2017-05-26 23:59:00', 10, '2017-05-26 20:03:24'),
(5, 'ASL1', 1, 2, 2, '2017-05-29 21:26:14', '2017-05-29 22:42:22', 20, '2017-05-29 17:22:28'),
(6, '23', 2, 2, 3, '2017-05-29 12:00:00', '2017-06-29 13:00:00', 10, '2017-05-30 10:27:29');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `faillogins`
--

CREATE TABLE `faillogins` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `faillogins`
--

INSERT INTO `faillogins` (`id`, `email`, `ip`, `user_agent`, `failed_at`) VALUES
(1, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 11:57:56'),
(2, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 11:58:33'),
(3, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 12:00:09'),
(4, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 12:00:24'),
(5, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 19:48:38'),
(6, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 19:48:41'),
(7, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 19:48:46'),
(8, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:38:39'),
(9, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:38:42'),
(10, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:43:50'),
(11, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:44:05'),
(12, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:44:30'),
(13, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:46:04'),
(14, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:51:20'),
(15, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:54:03'),
(16, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:56:07'),
(17, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:06:05'),
(18, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:08:22'),
(19, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:28:08'),
(20, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:28:29'),
(21, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 20:55:30'),
(22, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:05:07'),
(23, '', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:31:23'),
(24, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:24'),
(25, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:28'),
(26, 'aslih@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:32'),
(27, 'aslih@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:35'),
(28, 'aslih@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:37'),
(29, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:40'),
(30, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:41'),
(31, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:43'),
(32, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 08:57:47'),
(33, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 09:14:17'),
(34, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 09:14:20'),
(35, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 09:14:22'),
(36, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 09:14:23'),
(37, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 09:14:24'),
(38, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 09:14:24'),
(39, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 09:14:30'),
(40, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 09:15:04'),
(41, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 17:33:19'),
(42, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:41:20'),
(43, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:41:29'),
(44, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:44:13'),
(45, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:44:20'),
(46, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:44:22'),
(47, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:44:35'),
(48, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 19:11:20'),
(49, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 19:11:26'),
(50, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 19:12:20'),
(51, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:18:39'),
(52, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:25:21'),
(53, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:25:23'),
(54, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:25:29'),
(55, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:25:31'),
(56, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:25:40'),
(57, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:25:47'),
(58, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:25:49'),
(59, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:55:41'),
(60, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:06:49'),
(61, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:06:51'),
(62, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:12'),
(63, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:23'),
(64, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:46'),
(65, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:48'),
(66, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:53'),
(67, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:55'),
(68, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:56'),
(69, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:56'),
(70, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:07:57'),
(71, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:08:01'),
(72, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:08:05'),
(73, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 14:38:46'),
(74, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 15:01:50');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gates`
--

CREATE TABLE `gates` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `gates`
--

INSERT INTO `gates` (`id`, `name`, `is_active`, `created_at`, `modified_at`) VALUES
(1, 'Gate 1', 0, '2017-05-19 11:32:11', '0000-00-00 00:00:00'),
(2, 'Gate 2', 1, '2017-05-19 11:32:11', '2017-05-27 01:38:55'),
(3, 'Gate 3', 1, '2017-05-19 14:31:13', '0000-00-00 00:00:00'),
(4, 'Gate 4', 1, '2017-05-19 14:31:13', '2017-05-27 01:28:11'),
(5, 'Gate 5', 1, '2017-05-19 14:31:34', '0000-00-00 00:00:00'),
(6, 'Gate 6', 1, '2017-05-19 14:31:34', '2017-05-27 01:33:38'),
(9, 'Gate1', 1, '2017-05-19 15:50:29', '0000-00-00 00:00:00'),
(10, 'Gate 502', 1, '2017-05-19 15:51:14', '0000-00-00 00:00:00'),
(13, 'Gate 25', 1, '2017-05-19 17:21:59', '0000-00-00 00:00:00');

--
-- Tetikleyiciler `gates`
--
DELIMITER $$
CREATE TRIGGER `status_handler` BEFORE UPDATE ON `gates` FOR EACH ROW SET NEW.`modified_at` = NEW.`modified_at` + INTERVAL 2 MINUTE
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `luggage`
--

CREATE TABLE `luggage` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `luggage`
--

INSERT INTO `luggage` (`id`, `name`, `created_at`) VALUES
(1, 'luggage1', '2017-05-19 14:20:03'),
(2, 'luggage2', '2017-05-19 14:20:03'),
(3, 'luggage3', '2017-05-19 14:20:10'),
(4, 'luggage4', '2017-05-19 14:20:10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `staff`
--

INSERT INTO `staff` (`id`, `name`, `last_name`, `email`, `password`, `is_active`, `created_at`, `modified_at`, `admin_id`) VALUES
(12, 'Yiğit', 'At', 'yigitat92@outlook.com', 'c6719483b739b174823fd9a0da0ca1e5023ce466', 1, '2017-05-23 20:22:58', '2017-05-24 00:03:54', 1),
(14, 'Emrah', 'EMREM', 'emrahemrem35@gmail.com', 'c303f6c29ea6a15e1b17978595e86c1cb4c5f53f', 1, '2017-05-26 21:48:07', '2017-05-27 00:49:50', 1),
(15, 'Aslıhan', 'Gürkan', 'asli@gmail.com', 'fe1383595de5a5436b0a30a9230204caf3271042', 0, '2017-05-29 17:27:37', '2017-05-29 20:27:37', 1),
(16, 'Aslıhan', 'Gürkan', 'aslihan.gurkan@ceng.deu.edu.tr', 'bea4a9dc5b4fae62eb98dde5bf566050b532b414', 1, '2017-05-29 17:28:34', '2017-05-29 22:12:50', 1),
(17, 'Emine', 'Arıkan', 'emine@gmail.com', 'c6d9034228fbef8f714370e165cc7dd1c27707db', 0, '2017-05-30 11:09:54', '2017-05-30 14:09:54', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stafftokenmapping`
--

CREATE TABLE `stafftokenmapping` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `stafftokenmapping`
--

INSERT INTO `stafftokenmapping` (`id`, `email`, `token`) VALUES
(3, 'emine@gmail.com', '6545551b8a'),
(4, 'emine@gmail.com', '519811a864'),
(5, 'emine@gmail.com', '301482f684'),
(6, 'emine@gmail.com', '8b791caa58'),
(7, 'emine@gmail.com', '736d043558'),
(8, 'emine@gmail.com', '5c05623a52');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `successfullogins`
--

CREATE TABLE `successfullogins` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logged_in_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `successfullogins`
--

INSERT INTO `successfullogins` (`id`, `email`, `ip`, `user_agent`, `logged_in_at`) VALUES
(1, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-20 22:06:25'),
(2, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-20 22:08:10'),
(3, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-20 22:28:51'),
(5, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-20 22:52:26'),
(6, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 11:21:37'),
(7, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 12:00:45'),
(8, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 12:47:54'),
(9, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 12:48:23'),
(10, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 12:49:53'),
(11, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 19:50:23'),
(12, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-21 20:09:48'),
(13, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:39:05'),
(14, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:45:02'),
(15, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 21:47:05'),
(16, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:02:59'),
(17, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:04:00'),
(18, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:04:30'),
(19, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:07:00'),
(20, 'aslihan.gurkan.ceng@edu.tr', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:07:56'),
(21, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-22 22:21:13'),
(22, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 20:03:40'),
(23, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 20:41:58'),
(24, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 20:54:27'),
(25, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 20:54:45'),
(26, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 20:55:41'),
(27, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:05:14'),
(28, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:07:44'),
(29, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:10:26'),
(30, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:12:46'),
(31, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:14:38'),
(32, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:18:35'),
(33, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:19:16'),
(34, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:21:50'),
(35, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:26:44'),
(36, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:28:09'),
(37, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:31:07'),
(38, 'yigitat92@outlook.com', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-23 21:38:09'),
(39, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-26 21:47:00'),
(40, 'emrahemrem35@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-26 21:50:16'),
(41, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 17:26:01'),
(42, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 17:33:35'),
(43, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:31:48'),
(44, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:32:03'),
(45, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:42:34'),
(46, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 18:48:34'),
(47, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 19:08:01'),
(48, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 19:12:26'),
(49, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-29 19:13:06'),
(50, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:18:48'),
(51, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 10:55:47'),
(52, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 11:08:11'),
(53, 'asli@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 14:38:52'),
(54, 'aslihan.gurkan@ceng.deu.edu.tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '2017-05-30 15:01:55');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `companygatemapping`
--
ALTER TABLE `companygatemapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_name` (`flight_name`),
  ADD KEY `take_off` (`take_off`);

--
-- Tablo için indeksler `faillogins`
--
ALTER TABLE `faillogins`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `luggage`
--
ALTER TABLE `luggage`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `stafftokenmapping`
--
ALTER TABLE `stafftokenmapping`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `successfullogins`
--
ALTER TABLE `successfullogins`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Tablo için AUTO_INCREMENT değeri `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Tablo için AUTO_INCREMENT değeri `companygatemapping`
--
ALTER TABLE `companygatemapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Tablo için AUTO_INCREMENT değeri `faillogins`
--
ALTER TABLE `faillogins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- Tablo için AUTO_INCREMENT değeri `gates`
--
ALTER TABLE `gates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Tablo için AUTO_INCREMENT değeri `luggage`
--
ALTER TABLE `luggage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Tablo için AUTO_INCREMENT değeri `stafftokenmapping`
--
ALTER TABLE `stafftokenmapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Tablo için AUTO_INCREMENT değeri `successfullogins`
--
ALTER TABLE `successfullogins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
DELIMITER $$
--
-- Olaylar
--
CREATE DEFINER=`root`@`localhost` EVENT `status_handler` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-05-27 00:00:00' ENDS '2017-07-27 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE gates SET is_active = 0$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
