-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2024 at 12:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_06_12_101620_create_products_table', 2),
(6, '2024_06_18_074930_create_orders_table', 3),
(7, '2024_06_18_074941_create_order_items_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `created_at`, `updated_at`, `image`) VALUES
(1, 'HACOM APOLLO I01 (I7 14700K/RTX 4070 TI)', 'Thông số sản phẩm\r\nCPU : INTEL i7-14700K\r\nMAIN : Z790M\r\nRAM : 32GB (2x16GB) DDR5\r\nSSD : 512GB SSD\r\nVGA: RTX 4070 Ti\r\nNGUỒN : 850W', 62999000, 10, '2024-06-12 03:59:40', '2024-06-12 03:59:40', 'product_images/vlYzrvbnhF9RQHMSWyuogNWeFMHQoT5DobNYfnSR.webp'),
(2, 'MINI C2 WHITE V2 (I5 12400F/GTX 1660 SUPER)', 'Thông số sản phẩm\r\nCPU : INTEL i5-12400F\r\nMAIN : B660M\r\nRAM : 8GB (1x8G) DDR4\r\nSSD : 500 GB SSD\r\nVGA: GTX 1660 Super\r\nNGUỒN : 550W', 15499000, 10, '2024-06-12 04:03:31', '2024-06-12 04:03:31', 'product_images/1BEJ14l8QOgmhUXBzohUyN673ifIVpHJwKhTLHC1.png'),
(3, 'POSEIDON (I7 13700F/RTX 4070)', 'Thông số sản phẩm\r\nCPU : INTEL i7-13700F\r\nMAIN : Z690\r\nRAM : 32GB (2x16G) DDR4\r\nSSD : 1TB SSD\r\nVGA: RTX 4070 12G\r\nNGUỒN : 750W', 50599000, 10, '2024-06-12 04:07:25', '2024-06-12 04:07:25', 'product_images/EopRbHBMFc82qn9XCLbQEknDQyS1ac67Vzo1Rj7E.webp'),
(4, 'SNIPER (R5 4600G/RADEON GRAPHICS)', 'Thông số sản phẩm\r\nCPU : AMD Ryzen 5 4600G\r\nMAIN : B450\r\nRAM : 16GB DDR4\r\nSSD : 500GB SSD\r\nVGA: Radeon™ Graphics\r\nNGUỒN : 500W', 8499000, 10, '2024-06-12 05:09:06', '2024-06-12 05:09:06', 'product_images/eagL0ymnsR5AifGjBrKH4MFBtHFQTZcEwBkYehia.webp'),
(5, 'SNIPER (I5 12400F/GTX 1660 SUPER)', 'Thông số sản phẩm\r\nCPU : INTEL i5-12400F\r\nMAIN : B660M\r\nRAM : 8GB (1x8GB) DDR4\r\nSSD : 250GB SSD\r\nVGA: GTX 1660 Super 6GB\r\nNGUỒN : 500W', 15299000, 10, '2024-06-12 06:44:03', '2024-06-12 06:44:03', 'product_images/2dryBTwkqbCTYNVLmarW0dr2gcAxY1BcdlJt0oNT.webp'),
(6, 'APOLLO I13 (I7 12700F/RTX 4060 TI)', 'Thông số sản phẩm\r\nCPU : INTEL i7-12700F\r\nMAIN : B760M\r\nRAM : 32GB (2x16GB) DDR4\r\nSSD : 500GB SSD\r\nVGA: RTX 4060 Ti\r\nNGUỒN : 750W', 33499000, 10, '2024-06-12 06:44:52', '2024-06-12 06:44:52', 'product_images/AlUz1s8PR2cUsSedUGeCBhBCf3UjfAZ18dC5ee33.webp'),
(7, 'POSEIDON LIMITED EDITION (I9 14900K/RTX 4090)', 'Thông số sản phẩm\r\nCPU : Intel i9-14900K\r\nMAIN : Z790\r\nRAM : 64GB (4x16GB) DDR5\r\nSSD : 1TB SSD\r\nVGA: NVIDIA 4090\r\nNGUỒN : 1050W', 119999000, 10, '2024-06-12 06:45:35', '2024-06-12 06:45:35', 'product_images/0ctz1mnxdpBI7HV2DaBJrgQTVbIKyYfnAaDoG7Lx.webp'),
(8, 'SNIPER S25 (I5 13400F/RTX 4060)', 'Thông số sản phẩm\r\nCPU : INTEL i5-13400F\r\nMAIN : B760M\r\nRAM : 16GB (2x8GB) DDR4\r\nSSD : 500GB SSD\r\nVGA: RTX 4060\r\nNGUỒN : 650W', 22499000, 10, '2024-06-12 06:47:10', '2024-06-12 06:47:10', 'product_images/wmNpowM0Qpp850YJJ1ks1oyRfPvhk6uqKmGCB0rx.webp'),
(9, 'APOLLO I07 (I7 14700F/RTX 3060)', 'Thông số sản phẩm\r\nCPU : INTEL i7-14700K\r\nMAIN : B760\r\nRAM : 16GB (2x8GB) DDR4\r\nSSD : 500GB SSD\r\nVGA: RTX 3060\r\nNGUỒN : 650W', 28999000, 10, '2024-06-12 06:48:37', '2024-06-12 06:48:37', 'product_images/n5wQKJuQ8hTbKATQ65irCRc2ejYPiRPolnjmAp6z.webp'),
(10, 'ASUS - I9 14900K/RTX 4090 (POWERED BY ASUS)', 'Thông số sản phẩm\r\nPC GAMING ĐẠT TIÊU CHUẨN POWERED BY ASUS DO ASUS CHỨNG NHẬN\r\nCPU : INTEL i9-14900K\r\nMAIN : Z790\r\nRAM : 64GB (2x32GB) DDR5\r\nSSD : 2TB SSD NVME 4x4\r\nVGA: RTX 4090', 148099000, 10, '2024-06-12 06:54:12', '2024-06-12 06:54:12', 'product_images/vao8TltW83rzr75yLsUM4c6hrhE7wU2i9AewiKFw.webp');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bui Vuong Truong', 'admin@gmail.com', NULL, '$2y$10$pYvcrHlSBFjsEL.U2ex5x.8CBseYQ/4I9XJIQZNF8zRbLYlR2q/R6', 'admin', NULL, '2024-06-12 03:32:52', '2024-06-12 03:32:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
