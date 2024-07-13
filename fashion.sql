-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 13, 2024 lúc 07:44 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fashion`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `access_times`
--

CREATE TABLE `access_times` (
  `id` int UNSIGNED NOT NULL,
  `access_user_id` int DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `access_users`
--

CREATE TABLE `access_users` (
  `id` int UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(2, NULL, 1, 'Category 2', 'category-2', '2024-06-17 02:46:39', '2024-06-17 02:46:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(58, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"},\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true}}', 3),
(59, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 4),
(60, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(62, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(63, 8, 'desc', 'text', 'Desc', 1, 0, 1, 1, 1, 1, '{}', 6),
(64, 8, 'about', 'rich_text_box', 'About', 1, 0, 1, 1, 1, 1, '{}', 7),
(65, 8, 'sku', 'text', 'Sku', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(66, 8, 'category_id', 'text', 'Category Id', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 8),
(67, 8, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 4),
(68, 8, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 10),
(69, 8, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"},\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true}}', 3),
(70, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 11),
(71, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(72, 8, 'product_belongsto_product_category_relationship', 'relationship', 'Category', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\ProductCategory\",\"table\":\"product_categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(73, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(74, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"},\"validation\":{\"rule\":\"unique:discounts\",\"messages\":{\"unique\":\"This code already exist\"}}}', 2),
(75, 9, 'type', 'select_dropdown', 'Type', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"},\"default\":\"1\",\"options\":{\"1\":\"Percent\",\"2\":\"Number\"}}', 3),
(76, 9, 'amount', 'number', 'Amount', 0, 1, 1, 1, 1, 1, '{}', 4),
(77, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(78, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(79, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(80, 10, 'name', 'text', 'Họ tên người đặt', 1, 1, 1, 1, 1, 1, '{}', 2),
(81, 10, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(82, 10, 'phone', 'number', 'Số điện thoại', 1, 1, 1, 1, 1, 1, '{}', 3),
(83, 10, 'address', 'text', 'Địa chỉ', 1, 1, 1, 1, 1, 1, '{}', 5),
(86, 10, 'created_at', 'timestamp', 'Ngày đặt', 0, 0, 1, 1, 0, 1, '{}', 10),
(87, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(88, 10, 'coupon', 'text', 'Mã giảm giá', 0, 1, 1, 1, 1, 1, '{}', 8),
(89, 10, 'subPrice', 'text', 'Thành tiền', 0, 1, 1, 1, 1, 1, '{}', 7),
(90, 10, 'totalPrice', 'text', 'Tổng tiền', 0, 1, 1, 1, 1, 1, '{}', 9),
(91, 10, 'status', 'checkbox', 'Tình trạng', 0, 1, 1, 1, 1, 1, '{\"off\":\"Ch\\u01b0a ho\\u00e0n th\\u00e0nh\",\"on\":\"\\u0110\\u01a1n ho\\u00e0n th\\u00e0nh\"}', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(7, 'product_categories', 'product-categories', 'Product Category', 'Product Categories', 'voyager-anchor', 'App\\ProductCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-06-17 18:41:33', '2024-06-17 18:41:33'),
(8, 'products', 'products', 'Product', 'Products', 'voyager-basket', 'App\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-17 18:44:05', '2024-06-17 18:54:56'),
(9, 'discounts', 'discounts', 'Discount', 'Discounts', 'voyager-dollar', 'App\\Discount', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-23 19:11:12', '2024-06-23 19:38:09'),
(10, 'orders', 'orders', 'Order', 'Orders', 'voyager-credit-cards', 'App\\Order', NULL, 'App\\Http\\Controllers\\VoyagerController\\OrdersController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-24 03:02:12', '2024-06-24 21:16:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `type`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'GTX-4080', 1, 20, '2024-06-23 19:11:55', '2024-06-23 19:11:55'),
(2, 'GTX-4070', 2, 150000, '2024-06-23 19:12:13', '2024-06-23 19:12:13'),
(4, 'GTX-4060', 2, 140000, '2024-06-23 19:38:00', '2024-06-23 19:38:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-06-17 02:46:38', '2024-06-17 02:46:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2024-06-17 02:46:38', '2024-06-17 02:46:38', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 14, 3, '2024-06-17 02:46:38', '2024-06-17 18:38:13', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 15, 1, '2024-06-17 02:46:38', '2024-06-17 18:38:56', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 15, 2, '2024-06-17 02:46:38', '2024-06-17 18:38:56', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 7, '2024-06-17 02:46:38', '2024-06-17 18:47:42', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2024-06-17 02:46:38', '2024-06-17 18:27:45', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2024-06-17 02:46:38', '2024-06-17 18:27:45', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2024-06-17 02:46:38', '2024-06-17 18:27:45', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2024-06-17 02:46:38', '2024-06-17 18:27:45', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2024-06-17 02:46:38', '2024-06-17 18:47:42', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 14, 1, '2024-06-17 02:46:39', '2024-06-17 18:37:55', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 14, 2, '2024-06-17 02:46:39', '2024-06-17 18:37:55', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 2, '2024-06-17 02:46:39', '2024-06-17 18:37:52', 'voyager.pages.index', NULL),
(14, 1, 'Content Management', '', '_self', 'voyager-images', '#000000', NULL, 3, '2024-06-17 18:37:40', '2024-06-17 18:37:52', NULL, ''),
(15, 1, 'Account Setting', '', '_self', 'voyager-person', '#000000', NULL, 5, '2024-06-17 18:38:47', '2024-06-17 18:47:42', NULL, ''),
(16, 1, 'Product Categories', '', '_self', 'voyager-anchor', NULL, 18, 1, '2024-06-17 18:41:33', '2024-06-17 18:47:47', 'voyager.product-categories.index', NULL),
(17, 1, 'Products', '', '_self', 'voyager-basket', NULL, 18, 2, '2024-06-17 18:44:05', '2024-06-17 18:47:49', 'voyager.products.index', NULL),
(18, 1, 'Shop Management', '', '_self', 'voyager-basket', '#000000', NULL, 4, '2024-06-17 18:47:33', '2024-06-17 18:47:42', NULL, ''),
(19, 1, 'Discounts', '', '_self', 'voyager-dollar', NULL, 18, 3, '2024-06-23 19:11:12', '2024-06-23 19:11:32', 'voyager.discounts.index', NULL),
(20, 1, 'Orders', '', '_self', 'voyager-credit-cards', NULL, 18, 4, '2024-06-24 03:02:12', '2024-06-24 03:11:00', 'voyager.orders.index', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subPrice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalPrice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`, `coupon`, `subPrice`, `totalPrice`, `status`) VALUES
(10, 'Hoàng Nhật Minh', 'hoangnhatminh@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-24 20:31:00', '2024-06-24 21:17:04', 'GTX-4080', '1875000', '1500000', 1),
(11, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-25 01:33:42', '2024-06-25 01:33:42', 'Không dùng mã giảm giá', '950000', '950000', 0),
(12, 'admin', 'admin@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 01:34:19', '2024-06-25 01:34:19', 'GTX-4070', '625000', '475000', 0),
(13, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-25 01:35:12', '2024-06-25 01:35:12', 'Không dùng mã giảm giá', '2100000', '2100000', 0),
(14, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-25 02:14:20', '2024-06-25 02:14:20', 'Không dùng mã giảm giá', '9100000', '9100000', 0),
(15, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-25 02:15:42', '2024-06-25 02:15:42', 'Không dùng mã giảm giá', '1600000', '1600000', 0),
(16, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-25 02:17:07', '2024-06-25 02:17:07', 'Không dùng mã giảm giá', '700000', '700000', 0),
(17, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-25 02:25:59', '2024-06-25 02:25:59', 'Không dùng mã giảm giá', '200000', '200000', 0),
(18, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-25 02:31:34', '2024-06-25 02:31:34', 'Không dùng mã giảm giá', '300000', '300000', 0),
(19, 'admin', 'admin@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 17:56:06', '2024-06-25 17:56:06', 'GTX-4080', '300000', '240000', 0),
(20, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-25 18:04:02', '2024-06-25 18:04:02', 'Không dùng mã giảm giá', '240000', '240000', 0),
(21, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 18:05:46', '2024-06-25 18:05:46', 'Không dùng mã giảm giá', '320000', '320000', 0),
(22, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 18:06:05', '2024-06-25 18:06:05', 'Không dùng mã giảm giá', '200000', '200000', 0),
(23, 'Minh Admin', 'admin@admin.com', '0398435434', 'Thái Nguyên', '2024-06-25 18:15:08', '2024-06-25 18:15:08', 'Không dùng mã giảm giá', '300000', '300000', 0),
(24, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 18:34:33', '2024-06-25 18:34:33', 'Không dùng mã giảm giá', '75000', '75000', 0),
(25, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 18:58:18', '2024-06-25 18:58:18', 'Không dùng mã giảm giá', '300000', '300000', 0),
(26, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 19:03:52', '2024-06-25 19:03:52', 'Không dùng mã giảm giá', '300000', '300000', 0),
(27, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 20:46:34', '2024-06-25 20:46:34', 'GTX-4080', '75000', '60000', 0),
(28, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 21:04:21', '2024-06-25 21:04:21', 'GTX-4080', '450000', '360000', 0),
(29, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-25 21:04:49', '2024-06-25 21:04:49', 'Không dùng mã giảm giá', '100000', '100000', 0),
(30, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-27 03:18:02', '2024-06-27 03:18:02', 'GTX-4080', '670000', '536000', 0),
(31, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-28 06:50:41', '2024-06-28 06:50:41', 'Không dùng mã giảm giá', '190000', '190000', 0),
(32, 'Minh Admin', 'admin@admin.com', '0933123123', 'Thái Nguyên', '2024-06-28 06:59:38', '2024-06-28 06:59:38', 'Không dùng mã giảm giá', '120000', '120000', 0),
(33, 'Hoàng Nhật Minh', 'hoangnhatminh@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-28 06:59:52', '2024-06-28 06:59:52', 'Không dùng mã giảm giá', '200000', '200000', 0),
(34, 'Hoàng Nhật Minh', 'hoangnhatminh10042004@gmail.com', '0398435434', 'Neeld Lane', '2024-06-28 07:00:10', '2024-06-28 07:00:10', 'Không dùng mã giảm giá', '0', '0', 0),
(35, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-28 08:16:57', '2024-06-28 08:16:57', 'Không dùng mã giảm giá', '400000', '400000', 0),
(36, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0398435434', 'Thái Nguyên', '2024-06-28 08:17:35', '2024-06-28 08:17:35', 'Không dùng mã giảm giá', '600000', '600000', 0),
(37, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0933123123', 'Thái Nguyên', '2024-06-30 19:54:00', '2024-06-30 19:56:25', 'GTX-4080', '340000', '272000', 1),
(38, 'Hoàng Nhât Minh', 'kamiminh58@gmail.com', '0933123123', 'Thái Nguyên', '2024-07-02 00:04:32', '2024-07-02 00:04:32', 'GTX-4080', '470000', '376000', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `number` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_details`
--

INSERT INTO `orders_details` (`id`, `order_id`, `product_id`, `number`, `created_at`, `updated_at`, `product_name`, `product_price`, `product_image`) VALUES
(8, 10, 1, 15, '2024-06-24 20:31:11', '2024-06-24 20:31:11', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(9, 10, 2, 15, '2024-06-24 20:31:11', '2024-06-24 20:31:11', 'Táo Gala', '30000', 'http://fashion.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(10, 10, 3, 15, '2024-06-24 20:31:11', '2024-06-24 20:31:11', 'Dưa không hạt', '40000', 'http://fashion.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(11, 10, 4, 15, '2024-06-24 20:31:11', '2024-06-24 20:31:11', 'Xoài tứ quý', '15000', 'http://fashion.test/storage/products\\June2024\\AX9q95eZz9biFSLl05kN.jfif'),
(12, 10, 5, 15, '2024-06-24 20:31:11', '2024-06-24 20:31:11', 'Cam Cao Phong', '20000', 'http://fashion.test/storage/products\\June2024\\LrmSegpnBQ2Qn9WaQmwQ.jfif'),
(13, 11, 5, 10, '2024-06-25 01:33:42', '2024-06-25 01:33:42', 'Cam Cao Phong', '20000', 'http://fashion.test/storage/products\\June2024\\LrmSegpnBQ2Qn9WaQmwQ.jfif'),
(14, 11, 4, 10, '2024-06-25 01:33:42', '2024-06-25 01:33:42', 'Xoài tứ quý', '15000', 'http://fashion.test/storage/products\\June2024\\AX9q95eZz9biFSLl05kN.jfif'),
(15, 11, 1, 10, '2024-06-25 01:33:42', '2024-06-25 01:33:42', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(16, 11, 3, 10, '2024-06-25 01:33:42', '2024-06-25 01:33:42', 'Dưa không hạt', '40000', 'http://fashion.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(17, 12, 4, 5, '2024-06-25 01:34:19', '2024-06-25 01:34:19', 'Xoài tứ quý', '15000', 'http://fashion.test/storage/products\\June2024\\AX9q95eZz9biFSLl05kN.jfif'),
(18, 12, 5, 5, '2024-06-25 01:34:19', '2024-06-25 01:34:19', 'Cam Cao Phong', '20000', 'http://fashion.test/storage/products\\June2024\\LrmSegpnBQ2Qn9WaQmwQ.jfif'),
(19, 12, 2, 5, '2024-06-25 01:34:19', '2024-06-25 01:34:19', 'Táo Gala', '30000', 'http://fashion.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(20, 12, 1, 5, '2024-06-25 01:34:19', '2024-06-25 01:34:19', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(21, 12, 3, 5, '2024-06-25 01:34:19', '2024-06-25 01:34:19', 'Dưa không hạt', '40000', 'http://fashion.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(22, 13, 2, 50, '2024-06-25 01:35:12', '2024-06-25 01:35:12', 'Táo Gala', '30000', 'http://fashion.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(23, 13, 1, 30, '2024-06-25 01:35:12', '2024-06-25 01:35:12', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(24, 14, 3, 200, '2024-06-25 02:14:20', '2024-06-25 02:14:20', 'Dưa không hạt', '40000', 'http://fashion.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(25, 14, 4, 100, '2024-06-25 02:14:20', '2024-06-25 02:14:20', 'Xoài tứ quý', '15000', 'http://fashion.test/storage/products\\June2024\\AX9q95eZz9biFSLl05kN.jfif'),
(26, 15, 5, 70, '2024-06-25 02:15:42', '2024-06-25 02:15:42', 'Cam Cao Phong', '20000', 'http://fashion.test/storage/products\\June2024\\LrmSegpnBQ2Qn9WaQmwQ.jfif'),
(27, 16, 1, 30, '2024-06-25 02:17:07', '2024-06-25 02:17:07', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(28, 17, 1, 10, '2024-06-25 02:25:59', '2024-06-25 02:25:59', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(29, 18, 1, 15, '2024-06-25 02:31:34', '2024-06-25 02:31:34', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(30, 19, 5, 15, '2024-06-25 17:56:06', '2024-06-25 17:56:06', 'Cam Cao Phong', '20000', 'http://fashion.test/storage/products\\June2024\\LrmSegpnBQ2Qn9WaQmwQ.jfif'),
(31, 20, 1, 4, '2024-06-25 18:04:02', '2024-06-25 18:04:02', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(32, 21, 1, 16, '2024-06-25 18:05:46', '2024-06-25 18:05:46', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(33, 22, 1, 10, '2024-06-25 18:06:05', '2024-06-25 18:06:05', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(34, 23, 2, 10, '2024-06-25 18:15:08', '2024-06-25 18:15:08', 'Táo Gala', '30000', 'http://fashion.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(35, 24, 4, 5, '2024-06-25 18:34:33', '2024-06-25 18:34:33', 'Xoài tứ quý', '15000', 'http://fashion.test/storage/products\\June2024\\AX9q95eZz9biFSLl05kN.jfif'),
(36, 25, 1, 6, '2024-06-25 18:58:18', '2024-06-25 18:58:18', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(37, 25, 2, 6, '2024-06-25 18:58:18', '2024-06-25 18:58:18', 'Táo Gala', '30000', 'http://fashion.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(38, 26, 2, 10, '2024-06-25 19:03:52', '2024-06-25 19:03:52', 'Táo Gala', '30000', 'http://fashion.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(39, 27, 1, 3, '2024-06-25 20:46:34', '2024-06-25 20:46:34', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(40, 27, 4, 1, '2024-06-25 20:46:34', '2024-06-25 20:46:34', 'Xoài tứ quý', '15000', 'http://fashion.test/storage/products\\June2024\\AX9q95eZz9biFSLl05kN.jfif'),
(41, 28, 2, 5, '2024-06-25 21:04:21', '2024-06-25 21:04:21', 'Táo Gala', '30000', 'http://fashion.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(42, 28, 3, 5, '2024-06-25 21:04:21', '2024-06-25 21:04:21', 'Dưa không hạt', '40000', 'http://fashion.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(43, 28, 5, 5, '2024-06-25 21:04:21', '2024-06-25 21:04:21', 'Cam Cao Phong', '20000', 'http://fashion.test/storage/products\\June2024\\LrmSegpnBQ2Qn9WaQmwQ.jfif'),
(44, 29, 1, 5, '2024-06-25 21:04:49', '2024-06-25 21:04:49', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(45, 30, 1, 20, '2024-06-27 03:18:02', '2024-06-27 03:18:02', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(46, 30, 2, 9, '2024-06-27 03:18:02', '2024-06-27 03:18:02', 'Táo Gala', '30000', 'http://fashion.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(47, 31, 4, 2, '2024-06-28 06:50:41', '2024-06-28 06:50:41', 'Xoài tứ quý', '15000', 'http://fashion.test/storage/products\\June2024\\AX9q95eZz9biFSLl05kN.jfif'),
(48, 31, 1, 4, '2024-06-28 06:50:41', '2024-06-28 06:50:41', 'Chuối cau', '20000', 'http://fashion.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(49, 31, 3, 2, '2024-06-28 06:50:41', '2024-06-28 06:50:41', 'Dưa không hạt', '40000', 'http://fashion.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(50, 32, 3, 3, '2024-06-28 06:59:38', '2024-06-28 06:59:38', 'Dưa không hạt', '40000', 'http://fashion.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(51, 33, 3, 5, '2024-06-28 06:59:52', '2024-06-28 06:59:52', 'Dưa không hạt', '40000', 'http://fashion.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(52, 35, 3, 10, '2024-06-28 08:16:57', '2024-06-28 08:16:57', 'Dưa không hạt', '40000', 'http://alpine-shopping.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(53, 36, 3, 15, '2024-06-28 08:17:35', '2024-06-28 08:17:35', 'Dưa không hạt', '40000', 'http://alpine-shopping.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(54, 37, 3, 7, '2024-06-30 19:54:55', '2024-06-30 19:54:55', 'Dưa không hạt', '40000', 'http://alpine-shopping.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif'),
(55, 37, 2, 2, '2024-06-30 19:54:55', '2024-06-30 19:54:55', 'Táo Gala', '30000', 'http://alpine-shopping.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(56, 38, 1, 9, '2024-07-02 00:04:32', '2024-07-02 00:04:32', 'Chuối cau', '20000', 'http://alpine-shopping.test/storage/products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif'),
(57, 38, 2, 7, '2024-07-02 00:04:32', '2024-07-02 00:04:32', 'Táo Gala', '30000', 'http://alpine-shopping.test/storage/products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif'),
(58, 38, 3, 2, '2024-07-02 00:04:32', '2024-07-02 00:04:32', 'Dưa không hạt', '40000', 'http://alpine-shopping.test/storage/products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2024-06-17 02:46:39', '2024-06-17 02:46:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(2, 'browse_bread', NULL, '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(3, 'browse_database', NULL, '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(4, 'browse_media', NULL, '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(5, 'browse_compass', NULL, '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(6, 'browse_menus', 'menus', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(7, 'read_menus', 'menus', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(8, 'edit_menus', 'menus', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(9, 'add_menus', 'menus', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(10, 'delete_menus', 'menus', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(11, 'browse_roles', 'roles', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(12, 'read_roles', 'roles', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(13, 'edit_roles', 'roles', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(14, 'add_roles', 'roles', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(15, 'delete_roles', 'roles', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(16, 'browse_users', 'users', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(17, 'read_users', 'users', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(18, 'edit_users', 'users', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(19, 'add_users', 'users', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(20, 'delete_users', 'users', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(21, 'browse_settings', 'settings', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(22, 'read_settings', 'settings', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(23, 'edit_settings', 'settings', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(24, 'add_settings', 'settings', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(25, 'delete_settings', 'settings', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(26, 'browse_categories', 'categories', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(27, 'read_categories', 'categories', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(28, 'edit_categories', 'categories', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(29, 'add_categories', 'categories', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(30, 'delete_categories', 'categories', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(31, 'browse_posts', 'posts', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(32, 'read_posts', 'posts', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(33, 'edit_posts', 'posts', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(34, 'add_posts', 'posts', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(35, 'delete_posts', 'posts', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(36, 'browse_pages', 'pages', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(37, 'read_pages', 'pages', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(38, 'edit_pages', 'pages', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(39, 'add_pages', 'pages', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(40, 'delete_pages', 'pages', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(41, 'browse_product_categories', 'product_categories', '2024-06-17 18:41:33', '2024-06-17 18:41:33'),
(42, 'read_product_categories', 'product_categories', '2024-06-17 18:41:33', '2024-06-17 18:41:33'),
(43, 'edit_product_categories', 'product_categories', '2024-06-17 18:41:33', '2024-06-17 18:41:33'),
(44, 'add_product_categories', 'product_categories', '2024-06-17 18:41:33', '2024-06-17 18:41:33'),
(45, 'delete_product_categories', 'product_categories', '2024-06-17 18:41:33', '2024-06-17 18:41:33'),
(46, 'browse_products', 'products', '2024-06-17 18:44:05', '2024-06-17 18:44:05'),
(47, 'read_products', 'products', '2024-06-17 18:44:05', '2024-06-17 18:44:05'),
(48, 'edit_products', 'products', '2024-06-17 18:44:05', '2024-06-17 18:44:05'),
(49, 'add_products', 'products', '2024-06-17 18:44:05', '2024-06-17 18:44:05'),
(50, 'delete_products', 'products', '2024-06-17 18:44:05', '2024-06-17 18:44:05'),
(51, 'browse_discounts', 'discounts', '2024-06-23 19:11:12', '2024-06-23 19:11:12'),
(52, 'read_discounts', 'discounts', '2024-06-23 19:11:12', '2024-06-23 19:11:12'),
(53, 'edit_discounts', 'discounts', '2024-06-23 19:11:12', '2024-06-23 19:11:12'),
(54, 'add_discounts', 'discounts', '2024-06-23 19:11:12', '2024-06-23 19:11:12'),
(55, 'delete_discounts', 'discounts', '2024-06-23 19:11:12', '2024-06-23 19:11:12'),
(56, 'browse_orders', 'orders', '2024-06-24 03:02:12', '2024-06-24 03:02:12'),
(57, 'read_orders', 'orders', '2024-06-24 03:02:12', '2024-06-24 03:02:12'),
(58, 'edit_orders', 'orders', '2024-06-24 03:02:12', '2024-06-24 03:02:12'),
(59, 'add_orders', 'orders', '2024-06-24 03:02:12', '2024-06-24 03:02:12'),
(60, 'delete_orders', 'orders', '2024-06-24 03:02:12', '2024-06-24 03:02:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-06-17 02:46:39', '2024-06-17 02:46:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` int NOT NULL,
  `category_id` int NOT NULL,
  `price` int NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `desc`, `about`, `sku`, `category_id`, `price`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Chuối cau', 'Chuối cau', '<p>Chuối cau</p>\r\n<p>Chuối cau</p>\r\n<p>Chuối cau</p>\r\n<p>Chuối cau</p>\r\n<p>Chuối cau</p>\r\n<p>Chuối cau</p>\r\n<p>Chuối cau</p>\r\n<p>Chuối cau</p>\r\n<p>Chuối cau</p>', 150, 1, 20000, 'products\\June2024\\yUCSXeAr2kikbA2h6e3W.jfif', 'chuoi-cau', '2024-06-17 18:54:03', '2024-06-17 18:54:03'),
(2, 'Táo Gala', 'Táo Gala', '<p><strong>T&aacute;o Gala</strong></p>\r\n<p><strong>T&aacute;o Gala</strong></p>\r\n<p><strong>T&aacute;o Gala</strong></p>\r\n<p><strong>T&aacute;o Gala</strong></p>\r\n<p><strong>T&aacute;o Gala</strong></p>\r\n<p><strong>T&aacute;o Gala</strong></p>\r\n<p><strong>T&aacute;o Gala</strong></p>', 700, 2, 30000, 'products\\June2024\\WJcEtzWzFPqCN3QvJjAF.jfif', 'tao-gala', '2024-06-17 18:56:59', '2024-06-17 18:56:59'),
(3, 'Dưa không hạt', 'Dưa hấu không ruột', '<p>Dưa hấu kh&ocirc;ng ruột</p>\r\n<p>Dưa hấu kh&ocirc;ng ruột</p>\r\n<p>Dưa hấu kh&ocirc;ng ruột</p>\r\n<p>Dưa hấu kh&ocirc;ng ruột</p>\r\n<p>Dưa hấu kh&ocirc;ng ruột</p>\r\n<p>Dưa hấu kh&ocirc;ng ruột</p>', 500, 3, 40000, 'products\\June2024\\LQuFlrc3tp1Wf6f1tkoQ.jfif', 'dua-khong-hat', '2024-06-17 18:58:50', '2024-06-23 18:14:31'),
(4, 'Xoài tứ quý', 'Xoài tứ quý', '<p>Xo&agrave;i tứ qu&yacute;</p>\r\n<p>Xo&agrave;i tứ qu&yacute;</p>\r\n<p>Xo&agrave;i tứ qu&yacute;</p>\r\n<p>Xo&agrave;i tứ qu&yacute;</p>\r\n<p>Xo&agrave;i tứ qu&yacute;</p>\r\n<p>Xo&agrave;i tứ qu&yacute;</p>\r\n<p>Xo&agrave;i tứ qu&yacute;</p>\r\n<p>Xo&agrave;i tứ qu&yacute;</p>', 400, 4, 15000, 'products\\June2024\\AX9q95eZz9biFSLl05kN.jfif', 'xoai-tu-quy', '2024-06-17 19:00:37', '2024-06-17 19:00:37'),
(5, 'Cam Cao Phong', 'Cam Cao Phong', '<p>Cam Cao Phong</p>\r\n<p>Cam Cao Phong</p>\r\n<p>Cam Cao Phong</p>\r\n<p>Cam Cao Phong</p>\r\n<p>Cam Cao Phong</p>\r\n<p>Cam Cao Phong</p>\r\n<p>Cam Cao Phong</p>\r\n<p>Cam Cao Phong</p>', 800, 5, 20000, 'products\\June2024\\LrmSegpnBQ2Qn9WaQmwQ.jfif', 'cam-cao-phong', '2024-06-17 19:02:40', '2024-06-17 19:02:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Banana', 'banana', '2024-06-17 18:49:18', '2024-06-17 18:49:18'),
(2, 'Apple', 'apple', '2024-06-17 18:49:26', '2024-06-17 18:49:26'),
(3, 'Watermelon', 'watermelon', '2024-06-17 18:49:38', '2024-06-17 18:49:38'),
(4, 'Mango', 'mango', '2024-06-17 18:49:55', '2024-06-17 18:49:55'),
(5, 'Oranges', 'oranges', '2024-06-17 18:50:38', '2024-06-17 18:50:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2024-06-17 02:46:38', '2024-06-17 02:46:38'),
(2, 'user', 'Normal User', '2024-06-17 02:46:38', '2024-06-17 02:46:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Minh Fruits Shop', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Hi welcome to my shop', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\June2024\\KotVBaxrUIRFggdogrVd.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\June2024\\TE5uS308JZkr2DlBG6vg.jfif', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Fruits Shop', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome back, please login to manage your shop', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\June2024\\ZGMHGpm7ZXV2ka884iUt.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.email', 'Email', 'hoangnhatminh@gmail.com', NULL, 'text', 6, 'Site'),
(12, 'site.location', 'Location', 'Tân Lập - Thái Nguyên - Thái Nguyên', NULL, 'text', 7, 'Site');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2024-06-17 02:46:39', '2024-06-17 02:46:39'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2024-06-17 02:46:39', '2024-06-17 02:46:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Minh Admin', 'admin@admin.com', 'users\\June2024\\Em6OH2qchecVcCI79ngf.jpg', NULL, '$2y$10$srnLQ6JJT9sTATU0dA5INu2hhSMtJ9GRndgu/V58uZmZatBuqwj0C', '7O25uRzN5USVW2X4eHDhJB5QpX7OTv7FhK6h9tfeDmmbwtpG7hxfra9Y871r', '{\"locale\":\"en\"}', '2024-06-17 02:46:39', '2024-06-18 06:12:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `access_times`
--
ALTER TABLE `access_times`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `access_users`
--
ALTER TABLE `access_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Chỉ mục cho bảng `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discounts_name_unique` (`name`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Chỉ mục cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Chỉ mục cho bảng `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `access_times`
--
ALTER TABLE `access_times`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `access_users`
--
ALTER TABLE `access_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
