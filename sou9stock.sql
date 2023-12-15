-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 22 nov. 2023 à 17:59
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sou9stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` varchar(255) DEFAULT NULL,
  `two_factor_recovery_codes` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_photo_path` varchar(255) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`, `profile_photo_path`, `current_team_id`) VALUES
(1, 'admin admmin', 'adminmn@gmail.com', '2023-11-01 17:44:29', '$2y$10$2Ru2KlM0UYYMKD1G69DZPOrYQGDEo1g2oP/X/xseiyujN.tbG0NAG', NULL, NULL, 'KcAuaQkLuM', '2023-11-01 17:44:29', '2023-11-01 17:44:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'My Shop Solaire', 'My Shop Solaire', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(2, 'Alimentaire', 'Alimentaire', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(3, 'Droguerie', 'Droguerie', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(4, 'Informatique', 'Informatique', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(5, 'Produits du Terroir', 'Produits du Terroir', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(6, 'Poisson', 'Poisson', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(7, 'Cuisines', 'Cuisines', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(8, 'Materiel de peche', 'Materiel de peche', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(9, 'Service', 'Service', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(10, 'Bonocation', 'Bonocation', '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(12, 'service touristique ', 'service touristique', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'fleuriste ', 'fleuriste ', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_10_04_082105_create_sessions_table', 1),
(7, '2023_10_16_102436_create_categories_table', 1),
(8, '2023_10_16_110323_create_products_table', 1),
(9, '2023_10_16_114343_create_orders_table', 1),
(10, '2023_10_16_124943_create_admins_table', 1),
(11, '2023_10_17_121430_add_profile_photo_to_admins', 1),
(12, '2023_10_17_121709_add_current_team_id_to_admins', 1),
(13, '2023_10_25_092813_create_services_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `delivered` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_name`, `qty`, `price`, `total`, `paid`, `delivered`, `created_at`, `updated_at`) VALUES
(1, 2, 'Neque nam qui nulla optio ut voluptatem.', 6, 487.00, 5287.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(2, 2, 'Suscipit numquam esse doloribus sapiente dolores reprehenderit debitis.', 10, 841.00, 8115.00, 0, 1, '2023-11-01 17:44:29', '2023-11-09 21:54:57'),
(3, 2, 'Fugiat magni et eum neque.', 8, 334.00, 3635.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(4, 2, 'Eos tempora libero eveniet quos neque ut illum.', 5, 285.00, 6269.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(5, 2, 'Dolores qui aliquam qui eveniet porro.', 9, 572.00, 2016.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(6, 2, 'Id reiciendis iure laborum ipsum vel quo omnis.', 9, 184.00, 1742.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(7, 2, 'Sequi qui dolores sint vero ut.', 9, 232.00, 5260.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(8, 2, 'Ratione vel eveniet enim fugit ratione consequuntur itaque quia.', 10, 838.00, 1092.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(9, 2, 'Pariatur dolorum beatae iste aut.', 8, 670.00, 5482.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(10, 2, 'Facilis consequatur reiciendis provident quas mollitia veritatis facere.', 2, 138.00, 2907.00, 0, 0, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(11, 13, 'dsfghh', 1, 889.00, 889.00, 0, 0, '2023-11-17 10:37:56', '2023-11-17 10:37:56'),
(12, 14, 'flurs 2', 1, 110.00, 110.00, 0, 0, '2023-11-18 21:03:52', '2023-11-18 21:03:52'),
(13, 14, 'shop solaire 3', 1, 478.00, 478.00, 0, 0, '2023-11-18 21:03:52', '2023-11-18 21:03:52'),
(14, 14, 'poissant 2', 1, 70.00, 70.00, 0, 0, '2023-11-18 21:03:52', '2023-11-18 21:03:52'),
(15, 14, 'cuisin 4', 1, 130.00, 130.00, 0, 0, '2023-11-18 21:03:52', '2023-11-18 21:03:52'),
(16, 14, 'cuisin 1', 1, 100.00, 100.00, 0, 0, '2023-11-18 21:03:52', '2023-11-18 21:03:52'),
(17, 14, 'shop solaire1', 1, 678.00, 678.00, 0, 0, '2023-11-18 21:03:52', '2023-11-18 21:03:52'),
(18, 14, 'shop solaire1', 1, 678.00, 678.00, 0, 0, '2023-11-18 21:05:06', '2023-11-18 21:05:06'),
(19, 14, 'cuisin 4', 1, 130.00, 130.00, 0, 0, '2023-11-19 21:19:42', '2023-11-19 21:19:42'),
(20, 14, 'shop solaire1', 1, 678.00, 678.00, 0, 0, '2023-11-19 21:23:47', '2023-11-19 21:23:47'),
(21, 14, 'shop solaire1', 1, 678.00, 678.00, 0, 0, '2023-11-19 21:26:44', '2023-11-19 21:26:44'),
(22, 14, 'shop solaire1', 1, 678.00, 678.00, 0, 0, '2023-11-19 21:28:47', '2023-11-19 21:28:47');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
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
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `old_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `inStock` int(11) NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `price`, `old_price`, `inStock`, `qty`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(32, 'shop solaire1', 'shop-solaire1', 'shop solaire1', 678.00, 679.00, 6, 0, 'images/products/1700222135_74X8kBThEuu0PKGUjDMHqUTLJvlJqziVxwgSZA8B.jpeg', 1, '2023-11-17 10:55:35', '2023-11-17 10:55:35'),
(33, 'shop solaire 2', 'shop-solaire-2', 'shop solaire 2', 78.00, 79.00, 4, 0, 'images/products/1700222179_C542E42_web.png', 1, '2023-11-17 10:56:19', '2023-11-17 10:56:19'),
(34, 'shop solaire 3', 'shop-solaire-3', 'shop solaire 3', 478.00, 479.00, 3, 0, 'images/products/1700222214_camera-de-surveillance-solaire-exterieure-lylu-solar-wifi-camera-5g-etanche-v380-hd-p2p-wifi-sodi00-7207.jpg', 1, '2023-11-17 10:56:54', '2023-11-17 10:56:54'),
(35, 'shop solaire 4', 'shop-solaire-4', 'shop solaire 4', 347.00, 349.00, 6, 0, 'images/products/1700222259_cb5b583f3ed0531c2becf1098dd7f015.jpg', 1, '2023-11-17 10:57:39', '2023-11-17 10:57:39'),
(36, 'shop solaire 5', 'shop-solaire-5', 'shop solaire 5', 678.00, 689.00, 9, 0, 'images/products/1700222294_fb835251-7f30-46c4-a614-100abcba931f.png', 1, '2023-11-17 10:58:14', '2023-11-17 10:58:14'),
(37, 'shop solaire 6', 'shop-solaire-6', 'shop solaire 6', 78.00, 79.00, 3, 0, 'images/products/1700222328_must-3kva-768x768.jpg', 1, '2023-11-17 10:58:48', '2023-11-17 10:58:48'),
(38, 'shop solaire 7', 'shop-solaire-7', 'shop solaire 7', 458.00, 478.00, 2, 0, 'images/products/1700222412_Projecteur-solaire.jpg', 1, '2023-11-17 11:00:12', '2023-11-17 11:00:12'),
(39, 'shop solaire 8', 'shop-solaire-8', 'shop solaire 8', 459.00, 467.00, 9, 0, 'images/products/1700222449_Sans-titre3.jpg', 1, '2023-11-17 11:00:49', '2023-11-17 11:00:49'),
(40, 'shop solaire9', 'shop-solaire9', 'shop solaire9', 347.00, 400.00, 8, 0, 'images/products/1700222485_Screenshot 2023-06-07 121014.png', 1, '2023-11-17 11:01:25', '2023-11-17 11:01:25'),
(41, 'shop solaire 10', 'shop-solaire-10', 'shop solaire 10', 399.00, 410.00, 10, 0, 'images/products/1700222528_Untitled-2.png', 1, '2023-11-17 11:02:08', '2023-11-17 11:02:08'),
(42, 'shop solaire 11', 'shop-solaire-11', 'shop solaire 11', 78.00, 79.00, 4, 0, 'images/products/1700222566_ULTRACEL-PNG.png', 1, '2023-11-17 11:02:46', '2023-11-17 11:02:46'),
(43, 'flurs 1', 'flurs-1', 'flurs 1', 100.00, 110.00, 9, 0, 'images/products/1700222674_WhatsApp Image 2023-11-17 at 11.36.06_c75e8bdb.jpg', 13, '2023-11-17 11:04:34', '2023-11-17 11:04:34'),
(44, 'flurs 2', 'flurs-2', 'flurs 2', 110.00, 120.00, 9, 0, 'images/products/1700222707_WhatsApp Image 2023-11-17 at 11.36.05_e5f9e8ab.jpg', 13, '2023-11-17 11:05:07', '2023-11-17 11:05:07'),
(45, 'flurs 3', 'flurs-3', 'flurs 3', 120.00, 130.00, 9, 0, 'images/products/1700222747_WhatsApp Image 2023-11-17 at 11.36.06_57ffc31f.jpg', 13, '2023-11-17 11:05:47', '2023-11-17 11:05:47'),
(46, 'flurs 4', 'flurs-4', 'flurs 4', 140.00, 150.00, 9, 0, 'images/products/1700222782_WhatsApp Image 2023-11-17 at 11.36.06_09c612ae.jpg', 13, '2023-11-17 11:06:22', '2023-11-17 11:06:22'),
(47, 'poissant 1', 'poissant-1', 'poissant 1', 56.00, 67.00, 6, 0, 'images/products/1700223066_WhatsApp Image 2023-11-17 at 11.36.04_105afd16.jpg', 6, '2023-11-17 11:11:06', '2023-11-17 11:11:06'),
(48, 'poissant 2', 'poissant-2', 'poissant 2', 70.00, 78.00, 4, 0, 'images/products/1700223179_WhatsApp Image 2023-11-17 at 11.36.03_d99a9bdb.jpg', 6, '2023-11-17 11:12:59', '2023-11-17 11:12:59'),
(49, 'cuisin 1', 'cuisin-1', 'cuisin 1', 100.00, 110.00, 2, 0, 'images/products/1700223247_WhatsApp Image 2023-11-17 at 11.35.54_b773a1c4.jpg', 7, '2023-11-17 11:14:07', '2023-11-17 11:14:07'),
(50, 'cuisin 2', 'cuisin-2', 'cuisin 2', 110.00, 120.00, 3, 0, 'images/products/1700223285_WhatsApp Image 2023-11-17 at 11.35.53_1c773a48.jpg', 7, '2023-11-17 11:14:45', '2023-11-17 11:14:45'),
(51, 'cuisin 3', 'cuisin-3', 'cuisin 3', 120.00, 125.00, 4, 0, 'images/products/1700223328_WhatsApp Image 2023-11-17 at 11.35.49_ad7c7ae5.jpg', 7, '2023-11-17 11:15:28', '2023-11-17 11:15:28'),
(52, 'cuisin 4', 'cuisin-4', 'cuisin 4', 130.00, 135.00, 5, 0, 'images/products/1700223362_WhatsApp Image 2023-11-17 at 11.35.53_caadfb3a.jpg', 7, '2023-11-17 11:16:02', '2023-11-17 11:16:02');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('b0m0P4k5v6W6uO78ijRpBrVVchJSVEnG5gSxpJbT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHc3bFV5Tk9DVEpmMXNlampLVm90R1hqaHFYS1VCRzJnT2NHalZrZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1700655531),
('n9OwJSKD9H1wKkTUomS6224ChkkFCworEXuERqWb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid3dhQlFQdm1YalM3cEV3VFVGSGdTSGowOWdzZkhuTjZyWDdHV0NOdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1700432990),
('NOhb9rkWa5liH6S8K1WRTZVjjS0WRZYwZvme08wI', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSjhIcWduc0VBV1A1aGRnYkE5NUdFTTdRQ2xBTHhhcHJRYzVybnQ1SCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE0O30=', 1700436783);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `code` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `adresse`, `city`, `country`, `active`, `code`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Reinhold Zemlak PhD', 'stroman.leila@example.org', '2023-11-01 17:44:28', '$2y$10$2UeLaThvC6ORzuPeUNQhu.dJxxBaKguTKNeN7CpmjjrWAAqkMLYTC', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'l2LXmMacoN', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(2, 'Dr. Kip Donnelly Sr.', 'weimann.christine@example.com', '2023-11-01 17:44:28', '$2y$10$.pilRJLUNRMxtwvXNZhl7.mNlMQouX9eN7mJ0M/ZyLFCLqdjhYW/m', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'FWgFOqnX1G', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(3, 'Lou Hickle', 'leta.mueller@example.com', '2023-11-01 17:44:28', '$2y$10$rhC9qjwGY2R4p5tr66Xez.S5S0I8qtPy3q9ARbCdALfalQgc8DyTi', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'kVO463ExJJ', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(4, 'Julien Tremblay', 'brionna85@example.com', '2023-11-01 17:44:28', '$2y$10$S90gIeZrMMUxQMZANtMt6.fsP4LED33rUURa21HlOeCwaUQ1LhAc.', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'XN7ojQXrpN', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(5, 'Mr. Gerhard Cremin', 'dillon51@example.net', '2023-11-01 17:44:28', '$2y$10$buw1YO7pKj2I/8qKio4zm.ccaqAh1Lus6agjnnPqVKhE5QpvYdh1q', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'i39VLLuLZu', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(6, 'Brenden Gleichner', 'xgerhold@example.org', '2023-11-01 17:44:28', '$2y$10$bLxplM7LxTU/TiuQH1fH0OKRnwtZr461DGL5KRBL6nHEAq695Liri', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'POImXG1rDS', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(7, 'Jazmyne Block Sr.', 'isobel52@example.com', '2023-11-01 17:44:28', '$2y$10$jjlJJwN60g/sFGt7XRlNlOAp/Vi/GqR7FGNXKI8flJ6Rk7uVfZFmq', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'oBfGW4FdWf', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(8, 'Freida Gusikowski', 'okuneva.noe@example.com', '2023-11-01 17:44:28', '$2y$10$gmdzO5Mi2daT18cYVvB/teMNwn.DgjwzF0mwhvLX8Q.mpnkX0Sreu', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '3v480Bm7Xd', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(9, 'Prof. Soledad Bergstrom PhD', 'jaron.carroll@example.com', '2023-11-01 17:44:28', '$2y$10$a8/Vm2IVCtpCS1pJYOSJPeuKxZvouIsZQBYAnDU5yCelojko0O89.', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'MXzfMSbu1x', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(10, 'Jaylon Farrell', 'alize24@example.net', '2023-11-01 17:44:29', '$2y$10$.MDTdxY9AKM5dWJ2Bix1vu4llwb///iVPoaCGWd9lane5EiwxaZ1e', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'OL8i1Z8fp4', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(11, 'Test User', 'meryem@email.com', '2023-11-01 17:44:29', '$2y$10$SGlpnDXLm/tfyflwBj2oQ.rlPN0cLep9RNMzLgFlawhYObDKlFAJO', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'W4WjZRiQTc', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(12, 'Aisha Reichel', 'test511@example.com', '2023-11-01 17:44:29', '$2y$10$WAQZMXrAv6V8NG67qYRffuKjKzqoe1b4Qa8I/P3QqpBkSDw87I9M2', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'NshFRnDzIr', NULL, NULL, '2023-11-01 17:44:29', '2023-11-01 17:44:29'),
(13, 'maryam', 'maryam01@gmail.com', NULL, '$2y$10$ffRw.8luqQR7033M/TQOIuspNxIqGaFRrGRrWaDC2zjzlwM/U4kgS', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-11-02 08:37:47', '2023-11-02 08:37:47'),
(14, 'mouad', 'mouad@gmail.com', NULL, '$2y$10$fabU7h8.d.orKd/rTvz7beq7AF4LHMFQ/cGgIdby5hVRvKqXMoyDK', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-11-18 20:49:47', '2023-11-18 20:49:47');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
