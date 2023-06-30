-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 11, 2023 at 04:55 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coviid`
--
CREATE DATABASE IF NOT EXISTS `coviid` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `coviid`;

-- --------------------------------------------------------

--
-- Table structure for table `add_member`
--

DROP TABLE IF EXISTS `add_member`;
CREATE TABLE IF NOT EXISTS `add_member` (
  `mem_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `aadhar_num` decimal(12,0) NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `ph_num` decimal(10,0) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(70) NOT NULL,
  PRIMARY KEY (`mem_id`),
  UNIQUE KEY `aadhar_num` (`aadhar_num`),
  KEY `AFK2` (`email`)
) ;

--
-- Dumping data for table `add_member`
--

INSERT INTO `add_member` (`mem_id`, `fname`, `lname`, `dob`, `aadhar_num`, `gender`, `ph_num`, `email`, `address`) VALUES
(20, 'Justin', 'Cruzz', '2016-04-10', '231234543234', 'male', '5434544321', 'justin@gmail.com', 'Jhansa'),
(21, 'Sakshi', 'Srinivas', '2023-01-26', '987392873456', 'female', '3423432123', 'sakshi@gmail.com', 'Jhansi'),
(22, 'Kashish', 'Thakur', '2022-12-17', '657687986576', 'male', '7654237894', 'kashish@gmail.com', 'Mumbai'),
(23, 'Mehak', 'kashish', '2023-01-15', '101234567643', 'female', '9977141714', 'mehak@gmail.com', 'Kolkata'),
(24, 'Akash', 'Lina', '2023-01-18', '554432343222', 'female', '9878987898', 'akash@gmail.com', 'Kolkata'),
(25, 'Tara', 'Prasad', '2023-01-08', '983728376457', 'male', '9827364839', 'tara@gmail.com', 'Mumbai'),
(26, 'Sundus', 'naaz', '2023-01-04', '355514442229', 'female', '6754583200', 'sundus@gmail.com', 'Bengal'),
(27, 'Sohail', 'D', '2023-01-14', '126734562340', 'male', '6754583201', 'sohail@gmail.com', 'Mumbai'),
(28, 'Shreya', 'Prasad', '2020-01-30', '765409875432', 'female', '9977141713', 'shreya@gmail.com', 'Kanchi'),
(29, 'Pemaa', 'Hussain', '2023-01-20', '765409875490', 'female', '9876879801', 'pema@gmail.com', 'Srilanka'),
(30, 'Moose', 'Jattana', '2023-01-29', '657687986572', 'female', '7654237892', 'moose@gmail.com', 'Punjab');

-- --------------------------------------------------------

--
-- Table structure for table `book_slot`
--

DROP TABLE IF EXISTS `book_slot`;
CREATE TABLE IF NOT EXISTS `book_slot` (
  `slot_id` int NOT NULL AUTO_INCREMENT,
  `mem_id` int DEFAULT NULL,
  `vaccine_name` enum('COVAXIN','COVISHIELD') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `slot_date` date NOT NULL,
  `slot_time` time NOT NULL,
  `vcenter_id` int DEFAULT NULL,
  `doc_id` int DEFAULT NULL,
  PRIMARY KEY (`slot_id`),
  KEY `BFK1` (`mem_id`),
  KEY `BFK2` (`vcenter_id`),
  KEY `BFK3` (`doc_id`)
) ;

--
-- Dumping data for table `book_slot`
--

INSERT INTO `book_slot` (`slot_id`, `mem_id`, `vaccine_name`, `slot_date`, `slot_time`, `vcenter_id`, `doc_id`) VALUES
(20, 20, 'COVAXIN', '2023-02-07', '12:18:00', 2, 3),
(21, 21, 'COVAXIN', '2023-02-08', '16:20:00', 2, 1),
(22, 22, 'COVISHIELD', '2023-02-09', '14:22:00', 3, 2),
(23, 23, 'COVAXIN', '2023-02-09', '11:25:00', 5, 6),
(24, 24, 'COVISHIELD', '2023-02-12', '10:28:00', 3, 4),
(25, 25, 'COVAXIN', '2023-02-13', '13:30:00', 2, 4),
(26, 26, 'COVISHIELD', '2023-02-18', '14:33:00', 4, 7),
(27, 27, 'COVISHIELD', '2023-02-25', '13:40:00', 1, 5),
(28, 28, 'COVAXIN', '2023-02-16', '14:38:00', 3, 6),
(29, 29, 'COVAXIN', '2023-02-09', '14:41:00', 4, 1),
(30, 30, 'COVISHIELD', '2023-02-17', '13:47:00', 4, 8),
(31, 31, 'COVISHIELD', '2023-02-19', '14:26:00', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `doc_id` int NOT NULL AUTO_INCREMENT,
  `dname` varchar(30) NOT NULL,
  `ph_num` decimal(10,0) NOT NULL,
  PRIMARY KEY (`doc_id`)
) ;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doc_id`, `dname`, `ph_num`) VALUES
(2, 'Sneha', '3452765437'),
(1, 'Sunitha', '9873456756'),
(3, 'Srinidhi', '6764537827'),
(4, 'Justin DCruz', '8765241689'),
(5, 'Sushanth', '5467387623'),
(6, 'Parineethi', '9876567898'),
(7, 'Maze dsouza', '9812346721'),
(8, 'Neha', '2345643567');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `regs_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dob` date NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  PRIMARY KEY (`regs_id`,`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`regs_id`, `name`, `dob`, `username`, `email`, `password`, `gender`) VALUES
(7, 'Trupthi', '2023-01-05', 'Trupthi@01', 'trupthi@gmail.com', '1234', 'Female'),
(8, 'Shaishav', '2021-02-03', 'Shaishav@01', 'shaishav@gmail.com', '1234', 'Male'),
(9, 'Jimin', '2023-01-14', 'Jimin@01', 'jimin@gmail.com', '1234', 'Male'),
(10, 'Vasif', '2022-08-15', 'Vasif@01', 'vasif@gmail.com', '1234', 'Male'),
(11, 'Thrupthi', '2003-01-26', 'Thrupthi@01', 'thrupthi@gmail.com', '1234', 'Female'),
(13, 'Bheem', '2022-10-01', 'Bheem@01', 'bheem@gmail.com', '1234', 'Male'),
(14, 'Shizuka', '2023-01-07', 'Shizuka@01', 'shizuka@gmail.com', '1234', 'Female'),
(15, 'Hanuman', '2023-01-19', 'Hanuman@01', 'hanuman@gmail.com', '1234', 'Male'),
(16, 'Sakshi', '2023-01-04', 'sakshi@01', 'skshi@gmail.com', '1234', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_center`
--

DROP TABLE IF EXISTS `vaccine_center`;
CREATE TABLE IF NOT EXISTS `vaccine_center` (
  `vcenter_id` int NOT NULL AUTO_INCREMENT,
  `center_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `pincode` int NOT NULL,
  PRIMARY KEY (`vcenter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine_center`
--

INSERT INTO `vaccine_center` (`vcenter_id`, `center_name`, `address`, `pincode`) VALUES
(1, 'Manipal', 'Shimoga', 577204),
(2, 'Lion Safari', 'Shimoga', 577203),
(3, 'Nirmala hospital', 'Gopi circle', 577201),
(4, 'Narmada hospital', 'Bellari', 567201),
(5, 'Govt PU College', 'Palakkad', 876789);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
