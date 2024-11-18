-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 23, 2023 at 01:56 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scaffolding_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `NIC` varchar(15) NOT NULL,
  `Cus_name` varchar(11) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Mobile` int(15) DEFAULT NULL,
  `Dob` varchar(99) DEFAULT NULL,
  `Age` int(99) DEFAULT NULL,
  PRIMARY KEY (`NIC`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`NIC`, `Cus_name`, `Address`, `Mobile`, `Dob`, `Age`) VALUES
('992794283v', 'Yasiru12', '275/1,djdjdjd,djdjdjdjd', 779002537, 'Thursday, August 19, 1999', 24),
('992794284v', 'bbhh', '457/2,jkjk,jkhjhj', 915687260, 'Wednesday, July 14, 1999', 24),
('458796257v', 'bbhh', '457/2,njnjnjn,bhbhbhb', 751265843, 'Wednesday, July 14, 1999', 24),
('200012486v', 'Kamal', '124/6,kgfuyuiioj,sgegsc', 124536587, 'Monday, July 16, 1962', 61),
('992545782v', 'Yasiru25', '275/1,waduwelivitiya,Unanvitiya', 763674314, 'Tuesday, October 5, 1999', 24),
('111111111v', 'hasd', '124/1,gfhdk,jjjdd', 761245486, 'Thursday, July 6, 2000', 23),
('123456784v', 'asdf', '124/4,hbuhbuu,sdvfdf', 764571258, 'Tuesday, July 11, 2000', 23),
('123456789v', 'yasty', '122/2,jkkhk,gjfgjfjff', 768994224, 'Sunday, July 16, 2000', 23),
('123456257v', 'yasde.', '124/1,bmbmh,gjfjjnfn', 762451457, 'Thursday, August 12, 1999', 24),
('123256789v', 'Waruni', '262/1,xcvsdg,ssdgsgs', 763482749, 'Monday, July 16, 1990', 33);

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
CREATE TABLE IF NOT EXISTS `customer_order` (
  `Order_Id` int(11) NOT NULL AUTO_INCREMENT,
  `NIC` varchar(100) NOT NULL,
  `Order_Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Dates_Required` int(11) DEFAULT NULL,
  `Last_Date` date DEFAULT NULL,
  PRIMARY KEY (`Order_Id`),
  KEY `fk_NIC` (`NIC`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`Order_Id`, `NIC`, `Order_Date`, `Dates_Required`, `Last_Date`) VALUES
(1, '992794283v', '2023-08-23 13:24:26', 35, '2023-09-27'),
(2, '200012486v', '2023-08-23 16:48:16', 90, '2023-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `customer_pay`
--

DROP TABLE IF EXISTS `customer_pay`;
CREATE TABLE IF NOT EXISTS `customer_pay` (
  `Order_Id` int(11) NOT NULL,
  `NIC` varchar(100) NOT NULL,
  `Order_Price` int(11) NOT NULL,
  `Cus_Pay` int(11) DEFAULT '0',
  `Amounts_Receivable` int(11) DEFAULT NULL,
  PRIMARY KEY (`Order_Id`) USING BTREE,
  KEY `fk_NIC` (`NIC`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_pay`
--

INSERT INTO `customer_pay` (`Order_Id`, `NIC`, `Order_Price`, `Cus_Pay`, `Amounts_Receivable`) VALUES
(1, '992794283v', 2850, 850, 2000),
(2, '200012486v', 6500, 200, 6300);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `Item_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Item_name` varchar(50) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `Current_quantity` int(11) NOT NULL,
  `Item_price` int(11) NOT NULL,
  PRIMARY KEY (`Item_Id`) USING BTREE,
  UNIQUE KEY `Item_name` (`Item_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`Item_Id`, `Item_name`, `Quantity`, `Current_quantity`, `Item_price`) VALUES
(1, 'H Frame', 1000, 750, 10),
(2, 'Cross Bracing', 1000, 700, 10),
(3, 'Joint Pin', 2000, 1800, 5),
(4, 'Walking Board', 1000, 800, 10),
(5, 'Swivel Coupler', 600, 550, 5),
(6, 'Tube-20', 500, 500, 20),
(7, 'Tube-10', 800, 740, 10),
(8, 'Tube-5', 800, 800, 5),
(9, 'dsa', 100, 100, 20000),
(10, 'gfh', 400, 400, 1000),
(11, 'vbbbb', 2000, 2000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `Order_Id` int(11) NOT NULL,
  `Item_name` varchar(50) DEFAULT NULL,
  `Quantity` varchar(1000) NOT NULL,
  `Total_Price` int(11) NOT NULL,
  KEY `fk_Order_Id` (`Order_Id`),
  KEY `fk_Item_name` (`Item_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`Order_Id`, `Item_name`, `Quantity`, `Total_Price`) VALUES
(1, 'Cross Bracing', '100', 1000),
(1, 'H Frame', '50', 500),
(1, 'Joint Pin', '100', 500),
(1, 'Swivel Coupler', '50', 250),
(1, 'Tube-10', '60', 600),
(2, 'Cross Bracing', '200', 2000),
(2, 'H Frame', '200', 2000),
(2, 'Joint Pin', '100', 500),
(2, 'Walking Board', '200', 2000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
