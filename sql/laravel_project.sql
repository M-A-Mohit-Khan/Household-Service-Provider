-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 10:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `allservices`
--

CREATE TABLE `allservices` (
  `id` int(11) NOT NULL,
  `s_name` varchar(300) NOT NULL,
  `price` float NOT NULL,
  `services_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allservices`
--

INSERT INTO `allservices` (`id`, `s_name`, `price`, `services_id`) VALUES
(1, 'AC repair', 5000, 1),
(2, 'AC installation and uninstallation', 3000, 1),
(3, 'TV repairing', 2000, 2),
(4, 'Washing machine repairing', 2500, 2);

-- --------------------------------------------------------

--
-- Table structure for table `allusers`
--

CREATE TABLE `allusers` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `active_status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allusers`
--

INSERT INTO `allusers` (`id`, `username`, `password`, `email`, `phone`, `dob`, `gender`, `usertype`, `image`, `active_status`) VALUES
(6, 'farhan', '123123', 'm.a.mohit@gmail.com', '01646236444', '2022-03-13', 'Male', 'customer', 'Profile Picture/62Z2ijp7XMvgldfOtoSaSsnZCO5Sn7F832bj8KTi.png', 'active'),
(7, 'mohit5', '0cfa20667c6a512ff96c2341959e75ea', 'm.a.mohit.khan@gmail.com', '01646236444', '2022-03-04', 'Male', 'staff', 'storage/pictures/12.png', 'pending'),
(18, 'israk', '4297f44b13955235245b2497399d7a93', 'm.a.mohit.khan@gmail.com', '01857925154', '2022-04-15', 'Male', 'customer', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `branch_manager` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `username`, `password`, `email`, `phone`, `address`, `dob`, `gender`, `image`) VALUES
(3, 'azher', '4297f44b13955235245b2497399d7a93', 'anfo.45@gmail.com', '01845473224', NULL, '2022-04-01', 'Male', 'Profile Picture/Q48asc0QNNJFddpQuZ07SP9v70aekH3vz6tyN50h.png'),
(6, 'farhan', '96e79218965eb72c92a549dd5a330112', 'm.a.mohit.khan@gmail.com', '01646236444', NULL, '2022-03-13', 'Male', 'Profile Picture/62Z2ijp7XMvgldfOtoSaSsnZCO5Sn7F832bj8KTi.png'),
(12, 'farhan1', '96e79218965eb72c92a549dd5a330112', 'm.a.mohit.khan@gmail.com', '01646236444', NULL, '2022-03-15', 'Male', 'Profile Picture/ujUr9s7bmsiEJqMs97FP4deW9woTi3q3041h1DMT.png');

-- --------------------------------------------------------

--
-- Table structure for table `handovers`
--

CREATE TABLE `handovers` (
  `id` int(11) NOT NULL,
  `staff` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `area` varchar(100) NOT NULL,
  `amount` float DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `rating` int(32) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handovers`
--

INSERT INTO `handovers` (`id`, `staff`, `branch`, `area`, `amount`, `address`, `status`, `rating`, `Date`) VALUES
(1, 'karim', 'Motijeel', 'AC servicing', 1000, '||House no:23 , road :5 ,shapla sattar', 'active', NULL, NULL),
(2, 'akkas', 'banani', 'AC servicing', 1000, '||House no:3 , road :11 ,jame moshjid', 'active', NULL, NULL),
(3, 'farhad', 'uttora', 'AC servicing', 1000, '||House no:05 , road :6 ,House building', 'active', NULL, NULL),
(4, 'mohit', 'uttora', 'AC cooling problem', 1005, '||House no:05 , road :6 ,House building', 'accepted', 5, NULL),
(5, 'durjoy', 'banani', 'AC cooling problem', 1005, '||House no:3 , road :11 ,jame moshjid', 'active', NULL, NULL),
(6, 'nafis', 'uttora', 'AC installation & uninstallation', 1010, '||House no:05 , road :6 ,House building', 'active', NULL, NULL),
(7, 'mohit', 'uttora', 'AC cooling problem', 1005, 'House no: 03', 'accepted', NULL, NULL),
(8, 'mohit', 'uttora', 'AC cooling problem', 1005, 'house-02', 'active', NULL, NULL),
(9, 'mohit', 'uttora', 'AC cooling problem', 1005, 'House-25', 'accepted', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `list` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `branch` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `list`, `amount`, `branch`, `address`, `status`) VALUES
(1, 'farhan', '1,', 1000, 'Motijeel', 'House no:23 , road :5 ,shapla sattar', 'placed'),
(2, 'mohit', '1,2,', 2005, 'banani', 'House no:3 , road :11 ,jame moshjid', 'placed'),
(3, 'miti', '1,2,3,', 3015, 'uttora', 'House no:05 , road :6 ,House building', 'placed'),
(4, 'farhan', '2,3,', 5000, 'tongi', 'hdjahdkj', 'pending'),
(5, 'farhan', '1,', 1000, 'Motijeel', 'House no:23 , road :5 ,shapla sattar', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`) VALUES
(1, 'AC service'),
(2, 'Appliance repair');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `expertise_area` varchar(50) NOT NULL,
  `image` text DEFAULT NULL,
  `active_status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `username`, `password`, `email`, `phone`, `dob`, `gender`, `branch`, `expertise_area`, `image`, `active_status`) VALUES
(1, 'mohit', 'e3ceb5881a0a1fdaad01296d7554868d', 'm.a.mohit.khan@gmail.com', '01646236444', '2022-03-04', 'Male', 'Mohakhali', 'AC_repair', 'storage/pictures/12.png', 'active'),
(2, 'mohit123', '25d55ad283aa400af464c76d713c07ad', 'm.a.mohit.khan@gmail.com', '01646236444', '2022-03-08', 'Male', 'Mohakhali', 'AC_repair', 'storage/pictures/10.png', 'pending'),
(4, 'mohitm', '25d55ad283aa400af464c76d713c07ad', 'm.a.mohit.khan@gmail.com', '01646236444', '2022-03-10', 'Male', 'Mohakhali', 'AC_repair', 'storage/pictures/12.png', 'active'),
(5, 'mohit4', 'd0970714757783e6cf17b26fb8e2298f', 'm.a.mohit.khan@gmail.com', '01646236444', '2022-03-04', 'Male', 'Mohakhali', 'AC_repair', 'storage/pictures/12.png', 'pending'),
(6, 'mohit5', '0cfa20667c6a512ff96c2341959e75ea', 'm.a.mohit.khan@gmail.com', '01646236444', '2022-03-04', 'Male', 'Mohakhali', 'AC_repair', 'storage/pictures/12.png', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `transferrequests`
--

CREATE TABLE `transferrequests` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `curr_branch` varchar(50) NOT NULL,
  `des_branch` varchar(50) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transferrequests`
--

INSERT INTO `transferrequests` (`id`, `username`, `curr_branch`, `des_branch`, `status`) VALUES
(1, 'mohit', 'Mohakhali', 'Kuril', 'pending'),
(2, 'mohit', 'Mohakhali', 'Kuril', 'pending'),
(3, 'mohit', 'Mohakhali', 'Kuril', 'pending'),
(4, 'mohit', 'Mohakhali', 'Kuril', 'pending'),
(5, 'mohit', 'Mohakhali', 'Kuril', 'pending'),
(6, 'mohit', 'Mohakhali', 'Kuril', 'pending'),
(7, 'mohit', 'Mohakhali', 'Kuril', 'pending'),
(8, 'mohit', 'Mohakhali', 'Kuril', 'pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allservices`
--
ALTER TABLE `allservices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_allservice_FK` (`services_id`);

--
-- Indexes for table `allusers`
--
ALTER TABLE `allusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `handovers`
--
ALTER TABLE `handovers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transferrequests`
--
ALTER TABLE `transferrequests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allservices`
--
ALTER TABLE `allservices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `allusers`
--
ALTER TABLE `allusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `handovers`
--
ALTER TABLE `handovers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transferrequests`
--
ALTER TABLE `transferrequests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allservices`
--
ALTER TABLE `allservices`
  ADD CONSTRAINT `service_allservice_FK` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
