-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 20, 2025 at 03:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `main_branch` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `is_enabled`, `created_at`, `updated_at`, `main_branch`) VALUES
(1, 'Mandikatar', 1, '2023-02-19 13:25:51', '2023-08-12 06:35:14', '1'),
(2, 'Gongabu', 1, '2023-02-19 22:53:32', '2023-02-19 22:53:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone_number`, `created_at`, `updated_at`) VALUES
(9, 'Binay', '9849823198', '2023-08-17 09:38:53', '2023-08-17 09:38:53');

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
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'pan', '128990364', '2023-08-13 05:17:48', '2023-08-17 09:37:33'),
(2, 'inventory_request_time', '07:27', '2023-08-13 05:17:48', '2023-08-17 19:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_has_roles`
--

CREATE TABLE `group_has_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `name`, `total`, `created_at`, `updated_at`) VALUES
(1, 'Bun', '95', '2023-08-13 05:41:29', '2023-08-17 09:30:48'),
(2, 'Coke', '0', '2023-08-16 06:13:37', '2023-08-17 09:41:13'),
(3, 'Coffee Beans', '0', '2023-08-16 06:13:47', '2023-08-17 09:41:13'),
(4, 'Fanta', '0', '2023-08-16 06:58:08', '2023-08-16 06:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_requests`
--

CREATE TABLE `inventory_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_requests`
--

INSERT INTO `inventory_requests` (`id`, `branch_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 2, 4, 'Completed', '2023-08-17 09:40:53', '2023-08-17 09:41:13'),
(4, 2, 4, 'Rejected', '2023-08-17 09:41:05', '2023-08-17 09:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_request_items`
--

CREATE TABLE `inventory_request_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventory_request_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_request_items`
--

INSERT INTO `inventory_request_items` (`id`, `inventory_request_id`, `inventory_id`, `quantity`, `created_at`, `updated_at`) VALUES
(7, 3, 2, 1.00, '2023-08-17 09:40:53', '2023-08-17 09:40:53'),
(8, 3, 3, 1.00, '2023-08-17 09:40:53', '2023-08-17 09:40:53'),
(9, 4, 2, 1.00, '2023-08-17 09:41:05', '2023-08-17 09:41:05'),
(10, 4, 3, 1.00, '2023-08-17 09:41:05', '2023-08-17 09:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `discount_percent` varchar(255) NOT NULL,
  `discount_amount` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `received_amount` varchar(255) NOT NULL,
  `changed_amount` varchar(255) NOT NULL,
  `payment_method_id` varchar(255) DEFAULT NULL,
  `prepared_by_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `customer_id`, `sub_total`, `discount_percent`, `discount_amount`, `total`, `received_amount`, `changed_amount`, `payment_method_id`, `prepared_by_id`, `status`, `created_at`, `updated_at`, `branch_id`) VALUES
(14, 'MV0001', 9, '830', '10', '0', '747', '1000', '802', '1', 'Second USer', 'Paid', '2023-08-17 09:38:53', '2023-08-17 09:39:15', '2');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_has_products`
--

CREATE TABLE `invoice_has_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_has_products`
--

INSERT INTO `invoice_has_products` (`id`, `invoice_id`, `product_id`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(18, 14, 1, '170', '4', '680', '2023-08-17 09:38:53', '2023-08-17 09:38:53'),
(19, 14, 2, '50', '3', '150', '2023-08-17 09:38:54', '2023-08-17 09:38:54');

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
(5, '2023_02_19_183418_create_products_table', 2),
(6, '2023_02_19_190350_create_branches_table', 3),
(7, '2023_02_20_064530_create_settings_table', 4),
(8, '2023_02_21_055003_create_customers_table', 5),
(9, '2023_02_21_101252_create_payment_methods_table', 6),
(10, '2023_02_22_102738_create_invoices_table', 7),
(11, '2023_02_25_022617_create_invoice_has_products_table', 7),
(12, '2023_08_12_105359_add_column_to_settings_table', 8),
(13, '2023_08_12_110607_create_settings_table', 9),
(14, '2023_08_13_104447_create_global_settings_table', 10),
(15, '2023_08_13_111204_create_inventories_table', 11),
(16, '2023_08_14_141226_create_inventory_requests_table', 12),
(17, '2023_08_14_141253_create_inventory_request_items_table', 12),
(18, '2024_02_17_081658_create_roles_table', 13),
(19, '2024_02_17_081950_create_groups_table', 14),
(20, '2024_02_17_082050_create_group_has_roles_table', 15),
(21, '2024_02_17_092344_add_group_id_to_users', 15),
(22, '2024_03_01_022857_create_products_table', 16),
(23, '2025_01_19_065438_add_is_enabled_to_users_table', 17);

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
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `is_enabled`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 1, '2023-02-21 04:40:56', '2023-02-21 04:40:56'),
(2, 'Mobile Banking', 1, '2023-03-05 20:54:58', '2023-03-05 20:54:58');

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
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `discounted_price` varchar(255) DEFAULT NULL,
  `sale_price` varchar(255) DEFAULT NULL,
  `display_image` varchar(255) NOT NULL,
  `images` longtext NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_out_of_stock` tinyint(1) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `discounted_price`, `sale_price`, `display_image`, `images`, `short_description`, `is_new`, `is_out_of_stock`, `is_enabled`, `created_at`, `updated_at`) VALUES
(1, 'Pizza', 'pizza', '420', '20', '400', 'uploads/product/bg-1737304412.jpg', 'uploads/product/bg-1737304412-0.jpg', 'Thin base with cheesy fillings', 1, 0, 1, '2025-01-19 10:48:32', '2025-01-19 23:30:15'),
(2, 'Burger', 'burger', '280', '20', '260', 'uploads/product/bg-1737307025.jpg', 'uploads/product/bg-1737307025-0.jpg', 'Finger licking good', 1, 0, 1, '2025-01-19 11:32:05', '2025-01-19 11:32:05'),
(3, 'Black Coffee', 'black-coffee', '220', '20', '200', 'uploads/product/bg-1737310683.jpg', 'uploads/product/bg-1737310683-0.jpg', 'Pure and Strong', 1, 0, 1, '2025-01-19 12:33:03', '2025-01-19 12:33:03'),
(4, 'Cappuccino', 'cappuccino', '280', '10', '270', 'uploads/product/bg-1737310798.jpg', 'uploads/product/bg-1737310798-0.jpg', 'Brew taste of coffee', 1, 0, 1, '2025-01-19 12:34:58', '2025-01-19 12:34:58'),
(5, 'Latte', 'latte', '310', '10', '300', 'uploads/product/bg-1737310958.jpg', 'uploads/product/bg-1737310958-0.jpg', 'a milk coffee that boasts a silky layer of foam as a real highlight to the drink', 1, 0, 1, '2025-01-19 12:37:38', '2025-01-19 12:37:38'),
(6, 'Black Tea', 'black-tea', '120', '20', '100', 'uploads/product/bg-1737311575.jpg', 'uploads/product/bg-1737311575-0.jpg', 'a fragrant beverage made from the dried or fresh leaves of the evergreen shrub Camellia sinensis', 1, 0, 1, '2025-01-19 12:47:55', '2025-01-19 12:47:55'),
(7, 'Milk Tea', 'milk-tea', '160', '10', '150', 'uploads/product/bg-1737344224.jpg', 'uploads/product/bg-1737344224-0.jpg', 'Queen of caffeine.', 1, 0, 1, '2025-01-19 21:52:04', '2025-01-19 21:52:04'),
(8, 'Hot Lemon with Honey & Ginger', 'hot-lemon-with-honey-&-ginger', '220', '20', '200', 'uploads/product/bg-1737344468.jpg', 'uploads/product/bg-1737344468-0.jpg', 'Soul Refreshing', 1, 0, 1, '2025-01-19 21:56:08', '2025-01-19 21:56:08'),
(9, 'Mojito', 'mojito', '230', '10', '220', 'uploads/product/bg-1737349741.jpg', 'uploads/product/bg-1737349741-0.jpg', 'Refreshing fresh.', 1, 0, 1, '2025-01-19 23:24:01', '2025-01-19 23:24:01'),
(11, 'Strawberry Refresher', 'strawberry-refresher', '260', '10', '250', 'uploads/product/bg-1737350006.webp', 'uploads/product/bg-1737350006-0.webp', 'Fresh taste of strawberry.', 1, 0, 1, '2025-01-19 23:28:26', '2025-01-19 23:28:26'),
(12, 'Kiwi Refresher ', 'kiwi-refresher', '280', '10', '270', 'uploads/product/bg-1737350221.jpg', 'uploads/product/bg-1737350221-0.jpg', 'Fresh taste of Kiwi.', 1, 0, 1, '2025-01-19 23:32:01', '2025-01-19 23:32:01'),
(13, 'Iced Americano', 'iced-americano', '310', '10', '300', 'uploads/product/bg-1737350666.jpg', 'uploads/product/bg-1737350666-0.jpg', 'Cold version of your favourite coffee.', 1, 0, 1, '2025-01-19 23:39:26', '2025-01-19 23:39:26'),
(14, 'Americano', 'americano', '240', '10', '230', 'uploads/product/bg-1737351428.webp', 'uploads/product/bg-1737351428-0.webp', 'Rich, bold flavor similar to brewed coffee but with a smoother taste.', 1, 0, 1, '2025-01-19 23:52:08', '2025-01-19 23:52:08'),
(15, 'Espresso', 'espresso', '260', '10', '250', 'uploads/product/bg-1737351652.webp', 'uploads/product/bg-1737351652-0.webp', 'A delicious concentrated form of coffee, served in shots.', 1, 0, 1, '2025-01-19 23:55:52', '2025-01-19 23:55:52'),
(16, 'Iced Matcha latte', 'iced-matcha-latte', '360', '10', '350', 'uploads/product/bg-1737351882.jpg', 'uploads/product/bg-1737351882-0.jpg', 'A matcha latte (matcha tea + milk) that is served cold over ice.', 1, 0, 1, '2025-01-19 23:59:42', '2025-01-19 23:59:42'),
(17, 'Iced Matcha Coffee', 'iced-matcha-coffee', '380', '10', '370', 'uploads/product/bg-1737352068.jpg', 'uploads/product/bg-1737352068-0.jpg', 'Finely ground green tea powder, freshly brewed filter coffee and a small amount of milk.', 1, 0, 1, '2025-01-20 00:02:48', '2025-01-20 00:02:48'),
(18, 'Matcha Tea', 'matcha-tea', '280', '20', '260', 'uploads/product/bg-1737355659.webp', 'uploads/product/bg-1737355659-0.webp', 'Matcha-ing my mood with a vibrant green delight.', 1, 0, 1, '2025-01-20 01:02:39', '2025-01-20 01:02:39'),
(19, 'French Fries', 'french-fries', '210', '10', '200', 'uploads/product/bg-1737356041.jpg', 'uploads/product/bg-1737356041-0.jpg', 'Freakin\' Hot Fries.', 1, 0, 1, '2025-01-20 01:09:01', '2025-01-20 01:09:01'),
(20, 'Club Sandwich', 'club-sandwich', '260', '10', '250', 'uploads/product/bg-1737356207.jpg', 'uploads/product/bg-1737356207-0.jpg', 'A sandwich of occasionally toasted bread, sliced cooked poultry, fried bacon, lettuce, tomato, and mayonnaise.', 1, 0, 1, '2025-01-20 01:11:47', '2025-01-20 01:11:47'),
(21, 'Grilled Cheese Sandwich', 'grilled-cheese-sandwich', '280', '10', '270', 'uploads/product/bg-1737356334.jpg', 'uploads/product/bg-1737356334-0.jpg', 'A sandwich made with cheese between slices of bread.', 1, 0, 1, '2025-01-20 01:13:54', '2025-01-20 01:13:54'),
(22, 'Nachos ', 'nachos', '320', '10', '310', 'uploads/product/bg-1737356591.jpg', 'uploads/product/bg-1737356591-0.jpg', 'A dish of tortilla chips topped with melted cheese and often also with other savoury toppings.', 1, 0, 1, '2025-01-20 01:18:11', '2025-01-20 01:18:11'),
(23, 'Chocolate Milkshake', 'chocolate-milkshake', '280', '10', '270', 'uploads/product/bg-1737356827.jpg', 'uploads/product/bg-1737356827-0.jpg', 'Usually prepared by milk, ice cream or iced milk, emulsifier and/or stabilizer, and flavorings or sweeteners', 1, 0, 1, '2025-01-20 01:22:07', '2025-01-20 01:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_role_id` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `side_bar_colour` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `side_nav_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `branch_id`, `name`, `address`, `side_bar_colour`, `number`, `side_nav_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'MV Burger', 'Mandikatar', 'Primary', '9808898593', 'Dark', '2023-08-12 05:56:23', '2023-08-17 09:36:39'),
(3, 1, 'MV Burger', 'Manikatar', 'Primary', '99999', 'Dark', '2023-08-12 06:00:28', '2023-08-12 06:00:28'),
(4, 2, 'MV Burger', 'Gonagbu 26, Kathmandu', 'Primary', '9808898593', 'Dark', '2023-08-12 06:22:53', '2023-08-17 09:36:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `type` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `group_id`, `email_verified_at`, `password`, `branch`, `is_enabled`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super@admin.com', NULL, NULL, '$2y$10$8hS2fhCjl3Wap9CUdiBW0.fJHSZ6HWJXyV4.H.C3rA.eP5u7Xd/mq', NULL, 1, 'admin', '6qPRMO4yh8vNnBdxUdkgLknDhIlwgcMLzY6bBIU1KC5TO2yJigwKfBOGefOx', '2023-02-19 08:28:00', '2023-02-19 09:55:22'),
(4, 'Second USer', 'second@user.com', NULL, NULL, '$2y$10$jRr.Ykx1F9sIczqpEzFqVuVXzLTPLb9OXa1AmkZz6g7nzCKjYHGmK', '2', 1, 'user', 'Uzsl92mAtplulcxg7XE1FopIAGBLypXdcN6xMTUFMh6Sa3K3edwfvzZdEZ34', '2023-08-13 05:42:58', '2023-08-13 05:42:58'),
(5, 'Ram', 'ram@mvburger.com', NULL, NULL, '$2y$10$ABLP1IgWHneI8VjHBR4P4uas6XzHDeRwStJV3iM6JQ62YIGyNk33W', '1', 1, 'user', NULL, '2023-08-17 09:38:21', '2023-08-17 09:38:21'),
(6, 'Test User', 'test@example.com', NULL, '2025-01-19 03:45:12', '$2y$10$4UTd3ccOln4j1hdAkOSV4ucX9/wW2086gaf86cVwIBIWPZOHkRIUq', NULL, 1, 'user', 'M3RZqJHY6twTZnlltFxuNnPqKKrsMmVJZlPMFZaWxDaDmuOnkW4AGWWQKtW0', '2025-01-19 03:45:12', '2025-01-19 03:45:12'),
(7, 'Tanya Adhikari', 'tanya@gmail.com', NULL, '2025-01-19 08:26:36', '$2y$10$ImPTXCCVNq2NhQ084I33EeFrulL2jDOCKwWtOcDOLTDGMDyzKrP5S', NULL, 1, 'user', 'J8lBMhzRIFPs4UsWCaO53PiZRmKOT054kEECVvui9vZS0LjD62IpFtJqMcAG', '2025-01-19 08:26:36', '2025-01-19 08:26:36'),
(8, 'John Doe', 'John@gmail.com', NULL, '2025-01-19 10:31:39', '$2y$10$NjCj625vG8h8pSRR.YJnc.wBLXRxiF813FdmX0JL/VpeInRzX9Isu', NULL, 1, 'user', 'q1qoHmKN11ABrnxAjvmujYkGMw0L0U9qPytyyc4rkUhIPSkWVMg886RqTeXW', '2025-01-19 10:31:39', '2025-01-19 10:31:39'),
(9, 'user', 'user@gmail.com', NULL, '2025-01-19 11:29:21', '$2y$10$mnHfKvJHDwK2pwK27Hs2BeATHnbi9jwPjmOqQ6f3tlXe98ZudhJoK', NULL, 1, 'user', 'f2OudchuvL', '2025-01-19 11:29:21', '2025-01-19 11:29:21'),
(10, 'Pradip Neupane', 'pradip@gmail.com', NULL, '2025-01-20 01:44:32', '$2y$10$GGCV5lqtalnRLi0vL/cq/ur6Xtc.5zvDYj7xC6f/3FXXg9File5Qy', NULL, 1, 'user', '9cs75PFSBHJnoj7cA4dEtTq91NyDEHyNFC8U6id2BE1KuR4g9sM6pBkeo6Q7', '2025-01-20 01:44:32', '2025-01-20 01:44:32');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_has_roles`
--
ALTER TABLE `group_has_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_requests`
--
ALTER TABLE `inventory_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_request_items`
--
ALTER TABLE `inventory_request_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_has_products`
--
ALTER TABLE `invoice_has_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
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
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_has_roles`
--
ALTER TABLE `group_has_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory_requests`
--
ALTER TABLE `inventory_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory_request_items`
--
ALTER TABLE `inventory_request_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `invoice_has_products`
--
ALTER TABLE `invoice_has_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
