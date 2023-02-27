-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2023 at 05:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `numfu_customer`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` varchar(10) NOT NULL,
  `addrss_deails` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cate_id` varchar(10) NOT NULL,
  `cate_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `commission_id` int(10) NOT NULL,
  `max_order_allowed` int(2) NOT NULL,
  `commission_percent` int(3) NOT NULL,
  `drivers_rate` decimal(3,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_admin`
--

CREATE TABLE `contact_admin` (
  `contact_id` int(10) NOT NULL,
  `FAQ` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `other_details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cate_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cust_firstname` varchar(100) NOT NULL,
  `cust_lastname` varchar(100) NOT NULL,
  `cust_email` varchar(50) NOT NULL,
  `cust_phone` varchar(10) NOT NULL,
  `profile_pricture` varchar(100) NOT NULL,
  `account_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `cust_address_id` int(10) NOT NULL,
  `cust_id` varchar(10) NOT NULL,
  `address_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(10) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `driver_telephone` varchar(10) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `profile_image` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `driver_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_list`
--

CREATE TABLE `food_list` (
  `food_id` int(10) NOT NULL,
  `food_name` varchar(100) NOT NULL,
  `food_price` float NOT NULL,
  `food_image` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `cate_id` varchar(10) NOT NULL,
  `food_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(10) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `res_id` int(10) NOT NULL,
  `total_amount` int(10) NOT NULL,
  `date_order_place` date NOT NULL,
  `date_order_delivery` date NOT NULL,
  `driver_id` varchar(10) NOT NULL,
  `order_other` varchar(255) NOT NULL,
  `delivery_charge` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(10) NOT NULL,
  `food_id` varchar(10) NOT NULL,
  `order_id` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL,
  `total_amount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `order_history_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `order_status_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `wallet_id` int(10) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promo_id` int(10) NOT NULL,
  `promo_name` varchar(50) NOT NULL,
  `creation_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `promotion_type` int(1) NOT NULL,
  `discount_level` int(1) NOT NULL,
  `discount_value` decimal(18,2) NOT NULL,
  `minimum_price` decimal(18,2) NOT NULL,
  `maximum_price` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_admin`
--

CREATE TABLE `promotion_admin` (
  `promo_admin_id` int(10) NOT NULL,
  `promo_name` varchar(50) NOT NULL,
  `create_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `promotion_type` int(1) NOT NULL,
  `discount_value` decimal(18,2) NOT NULL,
  `minimum_price` decimal(18,2) NOT NULL,
  `maximum_price` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating_food`
--

CREATE TABLE `rating_food` (
  `rating_food_id` int(10) NOT NULL,
  `menu_id` int(10) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `score` int(11) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `date_recorded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating_rider`
--

CREATE TABLE `rating_rider` (
  `rating_id` int(10) NOT NULL,
  `rider_id` int(10) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `score` int(11) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `date_recrded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_order_food_status`
--

CREATE TABLE `ref_order_food_status` (
  `order_status_id` int(10) NOT NULL,
  `order_id` varchar(10) NOT NULL,
  `order_status_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `res_id` int(10) NOT NULL,
  `res_name` varchar(100) NOT NULL,
  `complete_address` varchar(200) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `company_logo` varchar(50) NOT NULL,
  `res_telephone` varchar(10) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `res_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`res_id`, `res_name`, `complete_address`, `email_address`, `owner_name`, `company_logo`, `res_telephone`, `latitude`, `longitude`, `username`, `password`, `res_status`) VALUES
(1, 'ร้านวัน', 'หฟหก', 'jet2', '123', '', '123213', '213', '123', '123', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `topup`
--

CREATE TABLE `topup` (
  `topup_id` int(10) NOT NULL,
  `wallet_id` int(10) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `topup_amount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `wallet_id` int(10) NOT NULL,
  `cust_id` varchar(10) NOT NULL,
  `wallet_amount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`commission_id`);

--
-- Indexes for table `contact_admin`
--
ALTER TABLE `contact_admin`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`cust_address_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `food_list`
--
ALTER TABLE `food_list`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promo_id`);

--
-- Indexes for table `promotion_admin`
--
ALTER TABLE `promotion_admin`
  ADD PRIMARY KEY (`promo_admin_id`);

--
-- Indexes for table `rating_food`
--
ALTER TABLE `rating_food`
  ADD PRIMARY KEY (`rating_food_id`);

--
-- Indexes for table `rating_rider`
--
ALTER TABLE `rating_rider`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`res_id`);

--
-- Indexes for table `topup`
--
ALTER TABLE `topup`
  ADD PRIMARY KEY (`topup_id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `commission_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_admin`
--
ALTER TABLE `contact_admin`
  MODIFY `contact_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cate_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `cust_address_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_list`
--
ALTER TABLE `food_list`
  MODIFY `food_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `order_history_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promo_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_admin`
--
ALTER TABLE `promotion_admin`
  MODIFY `promo_admin_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating_food`
--
ALTER TABLE `rating_food`
  MODIFY `rating_food_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating_rider`
--
ALTER TABLE `rating_rider`
  MODIFY `rating_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `res_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `topup`
--
ALTER TABLE `topup`
  MODIFY `topup_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `wallet_id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
