-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2026 at 02:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sps`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `is_active`, `created_at`) VALUES
(1, 'Marbale', 'marble', 1, '2026-01-06 11:10:39'),
(2, 'Sandstone', 'sandstone', 1, '2026-01-06 11:23:32'),
(3, 'Granite', 'granite', 1, '2026-01-06 11:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `product_interest` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `newsletter` tinyint(1) DEFAULT 0,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `css_class` varchar(100) DEFAULT NULL,
  `animation_delay` varchar(10) DEFAULT '0s',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `short_description`, `image`, `css_class`, `animation_delay`, `is_active`, `created_at`) VALUES
(1, 'Geometric Panel', 'Traditional Rajasthani design', 'pro1.jpg', 'sandstone', '0.1s', 1, '2026-01-05 11:41:57');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `price_min` decimal(10,2) DEFAULT NULL,
  `price_max` decimal(10,2) DEFAULT NULL,
  `material` varchar(150) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `finish` varchar(150) DEFAULT NULL,
  `product_usage` varchar(150) DEFAULT NULL,
  `origin` varchar(150) DEFAULT NULL,
  `care_instructions` text DEFAULT NULL,
  `availability` enum('in_stock','made_to_order','both') DEFAULT 'in_stock',
  `delivery_in_stock` varchar(100) DEFAULT NULL,
  `delivery_custom` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `short_description`, `long_description`, `price`, `price_min`, `price_max`, `material`, `height`, `weight`, `finish`, `product_usage`, `origin`, `care_instructions`, `availability`, `delivery_in_stock`, `delivery_custom`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Marble Buddha Statue', 'marble-sitting-buddha-statue', 'Beautiful handcrafted white marble Buddha statue', 'This exquisite Marble Sitting Buddha Statue is meticulously handcrafted by skilled artisans from Rajasthan.', 12000.00, 9000.00, 15000.00, 'Premium White Makrana Marble', '18 Inches (Standard) | Custom sizes available', '12 kg (Approx)', 'Hand Polished to High Gloss', 'Indoor & Outdoor', 'Rajasthan, India', 'Wipe with soft cloth, avoid harsh chemicals', 'both', '5-7 business days', '15-20 days', 1, '2026-01-02 15:49:31', '2026-01-06 11:19:53'),
(2, 1, 'Marble Sitting Buddha Statue', 'marble-sitting-buddha', 'Peaceful white marble Buddha statue', 'Handcrafted marble sitting Buddha made by skilled artisans of Rajasthan.', 12000.00, 9000.00, 15000.00, 'White Makrana Marble', '18 inches', '12 kg', 'High Gloss Polish', 'Indoor & Outdoor', 'Rajasthan, India', 'Clean with dry cloth', 'in_stock', '5-7 days', '15-20 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(3, 1, 'Marble Standing Buddha', 'marble-standing-buddha', 'Elegant standing Buddha statue', 'Premium standing Buddha carved from Makrana marble.', 18000.00, 15000.00, 22000.00, 'White Makrana Marble', '30 inches', '20 kg', 'Hand Polished', 'Temple & Garden', 'Rajasthan, India', 'Avoid harsh chemicals', 'made_to_order', 'NA', '20-25 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(4, 1, 'Marble Ganesha Statue', 'marble-ganesha-statue', 'Marble Ganesha for home temple', 'Blessed marble Lord Ganesha statue with fine carving.', 8000.00, 6000.00, 12000.00, 'White Marble', '12 inches', '8 kg', 'Matte Finish', 'Home Temple', 'Jaipur, India', 'Soft cloth cleaning', 'in_stock', '4-6 days', '10-15 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(5, 2, 'Sandstone Wall Panel', 'sandstone-wall-panel', 'Traditional sandstone wall panel', 'Hand-carved sandstone panel inspired by Rajasthani art.', 9500.00, 8000.00, 14000.00, 'Natural Sandstone', '24 inches', '18 kg', 'Natural Finish', 'Wall Decoration', 'Jodhpur, India', 'Dry brushing only', 'made_to_order', 'NA', '15-20 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(6, 2, 'Sandstone Jali Design', 'sandstone-jali-design', 'Decorative sandstone jali', 'Traditional sandstone jali for ventilation and decor.', 11000.00, 9000.00, 16000.00, 'Pink Sandstone', '36 inches', '25 kg', 'Rough Finish', 'Exterior & Interior', 'Rajasthan, India', 'Water wash allowed', 'made_to_order', 'NA', '18-22 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(7, 3, 'Granite Garden Bench', 'granite-garden-bench', 'Strong granite bench for garden', 'Weather-resistant granite bench suitable for outdoor gardens.', 22000.00, 18000.00, 30000.00, 'Black Granite', '48 inches', '80 kg', 'Flamed Finish', 'Outdoor Seating', 'South India', 'Wash with water', 'in_stock', '7-10 days', '20-30 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(8, 3, 'Granite Temple Slab', 'granite-temple-slab', 'Granite slab for temple use', 'Solid granite slab ideal for temple platforms.', 16000.00, 14000.00, 22000.00, 'Grey Granite', '36 inches', '60 kg', 'Natural Finish', 'Temple Construction', 'India', 'No chemicals', 'made_to_order', 'NA', '25-30 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(9, 1, 'Marble Lotus Carving', 'marble-lotus-carving', 'Decorative marble lotus', 'Beautiful lotus carving symbolizing purity and peace.', 7000.00, 5000.00, 9000.00, 'White Marble', '10 inches', '6 kg', 'Polished', 'Home Decor', 'Agra, India', 'Clean gently', 'in_stock', '3-5 days', '7-10 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(10, 2, 'Sandstone Fountain', 'sandstone-fountain', 'Handcrafted sandstone fountain', 'Outdoor sandstone water fountain with traditional design.', 28000.00, 25000.00, 35000.00, 'Red Sandstone', '48 inches', '90 kg', 'Natural', 'Garden Decor', 'Rajasthan, India', 'Regular water cleaning', 'made_to_order', 'NA', '30-40 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(11, 1, 'Marble Tulsi Pot', 'marble-tulsi-pot', 'Marble Tulsi planter', 'Sacred marble Tulsi pot for home temples.', 4500.00, 3500.00, 6500.00, 'White Marble', '14 inches', '7 kg', 'Smooth Finish', 'Religious Use', 'Jaipur, India', 'Wipe clean', 'in_stock', '3-4 days', '8-10 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(12, 1, 'Marble Lion Statue', 'marble-lion-statue', 'Marble lion sculpture', 'Hand-carved marble lion statue.', 15000.00, 13000.00, 20000.00, 'White Marble', '24 inches', '22 kg', 'Polished', 'Entrance Decor', 'India', 'Dry cloth', 'made_to_order', 'NA', '20 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(13, 2, 'Sandstone Buddha Head', 'sandstone-buddha-head', 'Sandstone Buddha head', 'Antique-style Buddha head carving.', 9000.00, 7500.00, 12000.00, 'Sandstone', '16 inches', '10 kg', 'Antique Finish', 'Home Decor', 'India', 'Gentle clean', 'in_stock', '5 days', '12 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(14, 3, 'Granite Water Bowl', 'granite-water-bowl', 'Granite water bowl', 'Heavy-duty granite bowl.', 6000.00, 5000.00, 9000.00, 'Granite', '12 inches', '15 kg', 'Natural', 'Garden Decor', 'India', 'Water wash', 'in_stock', '4 days', '10 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(15, 1, 'Marble Radha Krishna', 'marble-radha-krishna', 'Radha Krishna marble statue', 'Divine Radha Krishna statue.', 20000.00, 18000.00, 28000.00, 'White Marble', '30 inches', '25 kg', 'Glossy', 'Temple', 'India', 'Soft cloth', 'made_to_order', 'NA', '25 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(16, 2, 'Sandstone Pillar', 'sandstone-pillar', 'Decorative sandstone pillar', 'Traditional architectural pillar.', 17000.00, 15000.00, 24000.00, 'Sandstone', '60 inches', '70 kg', 'Rough', 'Architecture', 'India', 'Dry clean', 'made_to_order', 'NA', '30 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(17, 3, 'Granite Shiva Lingam', 'granite-shiva-lingam', 'Granite Shiva Lingam', 'Sacred Shiva Lingam carved from granite.', 11000.00, 9000.00, 16000.00, 'Black Granite', '18 inches', '30 kg', 'Polished', 'Temple', 'India', 'Water wash', 'in_stock', '6 days', '14 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(18, 1, 'Marble Decorative Urn', 'marble-decorative-urn', 'Marble urn', 'Classic marble decorative urn.', 13000.00, 11000.00, 18000.00, 'White Marble', '22 inches', '18 kg', 'Polished', 'Garden Decor', 'India', 'Clean gently', 'made_to_order', 'NA', '18 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(19, 2, 'Sandstone Elephant Statue', 'sandstone-elephant-statue', 'Sandstone elephant', 'Hand-carved elephant statue.', 21000.00, 19000.00, 28000.00, 'Sandstone', '36 inches', '55 kg', 'Natural', 'Outdoor Decor', 'India', 'Water wash', 'made_to_order', 'NA', '28 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23'),
(20, 3, 'Granite Name Plate', 'granite-name-plate', 'Granite name plate', 'Custom engraved granite name plate.', 5000.00, 4000.00, 8000.00, 'Granite', '18 inches', '12 kg', 'Polished', 'Exterior Use', 'India', 'Wipe clean', 'in_stock', '3 days', '7 days', 1, '2026-01-06 11:24:23', '2026-01-06 11:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `feature_text` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `is_main` tinyint(1) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `is_main`, `sort_order`, `created_at`) VALUES
(1, 1, 'pro1.jpg', 1, 1, '2026-01-02 15:53:16'),
(2, 2, 'slider2.jpg', 0, 2, '2026-01-02 15:53:16'),
(3, 1, 'slider3.jpg', 0, 3, '2026-01-02 15:53:16'),
(4, 1, 'slider4.jpg', 0, 4, '2026-01-02 15:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `quote_requests`
--

CREATE TABLE `quote_requests` (
  `id` int(11) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `source` varchar(100) DEFAULT 'quote_modal',
  `ip_address` varchar(45) DEFAULT NULL,
  `is_contacted` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quote_requests`
--

INSERT INTO `quote_requests` (`id`, `mobile`, `product_id`, `source`, `ip_address`, `is_contacted`, `created_at`) VALUES
(1, '7850984303', 1, 'product_page', '::1', 0, '2026-01-05 10:27:55'),
(2, '7850984303', 0, 'product_page', '::1', 0, '2026-01-05 10:29:52'),
(3, '9876543210', 0, 'product_page', '::1', 0, '2026-01-06 10:01:40'),
(4, '8769664473', 0, 'product_page', '::1', 0, '2026-01-06 10:02:14'),
(5, '8905988715', 10, 'product_page', '::1', 0, '2026-01-06 10:03:05'),
(6, '1234567892', 7, 'product_page', '::1', 0, '2026-01-06 10:04:19'),
(7, '7850984303', 0, 'home_page', '::1', 0, '2026-01-06 10:13:59'),
(8, '8769664473', 0, 'home_page', '::1', 0, '2026-01-06 10:14:15'),
(9, '7850984303', 12, 'product_page', '::1', 0, '2026-01-06 10:14:52'),
(10, '1234567892', 8, 'product_page', '::1', 0, '2026-01-06 10:16:03'),
(11, '9876543210', 2, 'Home Page', '::1', 0, '2026-01-06 10:33:14'),
(12, '8769664473', 1, 'Home Page', '::1', 0, '2026-01-06 10:33:30'),
(13, '9876543210', 0, 'Home Page', '::1', 0, '2026-01-06 10:33:46'),
(14, '7850984303', 5, 'Home Page', '::1', 0, '2026-01-06 10:37:02'),
(15, '9876543210', 1, 'Home Page', '::1', 0, '2026-01-06 10:38:44'),
(16, '8765432109', 2, 'Home Page', '::1', 0, '2026-01-06 10:39:25'),
(17, '9876543210', 1, 'Home Page', '::1', 0, '2026-01-06 10:39:36'),
(18, '7850984303', 20, 'Home Page', '::1', 0, '2026-01-06 10:42:24'),
(19, '7850984303', 20, 'Home Page', '::1', 0, '2026-01-06 10:42:37'),
(20, '1234567892', 19, 'Home Page', '::1', 0, '2026-01-06 10:43:32'),
(21, '8905988715', 20, 'Home Page', '::1', 0, '2026-01-06 10:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `name`, `img`, `created_at`) VALUES
(1, 'Slider 1', 'slider1.jpg', '2026-01-01 16:59:21'),
(2, 'Slider 2', 'slider2.jpg', '2026-01-01 16:59:21'),
(3, 'Slider 3', 'slider3.jpg', '2026-01-01 16:59:26'),
(4, 'Slider 4', 'slider4.jpg', '2026-01-01 16:59:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `quote_requests`
--
ALTER TABLE `quote_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_features`
--
ALTER TABLE `product_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quote_requests`
--
ALTER TABLE `quote_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_features`
--
ALTER TABLE `product_features`
  ADD CONSTRAINT `product_features_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
