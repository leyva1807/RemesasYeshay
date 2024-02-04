-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-02-2024 a las 22:56:14
-- Versión del servidor: 10.6.15-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u518384558_remesasyeshay`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'leyva1807@gmail.com', 'webmaster', NULL, '6279053428d5c1652098356.png', '$2y$10$phLWp.oTADSxMbLu42Ps0e4j8b7Hu4fBL/ghhETsXWam4fKmTHsHm', 'th1oxAGGrnXQngBOfYpueG5iDUWJ7DMm9CcJfC1MkqnjaPfWuDt1iVRuDpzE', NULL, '2022-05-09 10:42:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `agent_id`, `title`, `is_read`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'A new contact message has been submitted', 0, '/admin/ticket/view/1', '2024-01-27 19:26:16', '2024-01-27 19:26:16'),
(2, 0, 0, 'A new contact message has been submitted', 0, '/admin/ticket/view/2', '2024-01-28 13:43:49', '2024-01-28 13:43:49'),
(3, 0, 0, 'A new contact message has been submitted', 0, '/admin/ticket/view/3', '2024-01-31 03:07:01', '2024-01-31 03:07:01'),
(4, 0, 0, 'A new contact message has been submitted', 0, '/admin/ticket/view/4', '2024-01-31 03:14:57', '2024-01-31 03:14:57'),
(5, 0, 0, 'A new contact message has been submitted', 0, '/admin/ticket/view/5', '2024-01-31 05:29:40', '2024-01-31 05:29:40'),
(6, 0, 0, 'A new contact message has been submitted', 0, '/admin/ticket/view/6', '2024-02-02 15:19:08', '2024-02-02 15:19:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agents`
--

CREATE TABLE `agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agent_password_resets`
--

CREATE TABLE `agent_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `dial_code` varchar(255) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) DEFAULT NULL,
  `is_sending` tinyint(1) NOT NULL DEFAULT 1,
  `is_receiving` tinyint(1) NOT NULL DEFAULT 1,
  `has_agent` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country_delivery_method`
--

CREATE TABLE `country_delivery_method` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delivery_method_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cron_jobs`
--

CREATE TABLE `cron_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `cron_schedule_id` int(11) NOT NULL DEFAULT 0,
  `next_run` datetime DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cron_jobs`
--

INSERT INTO `cron_jobs` (`id`, `name`, `alias`, `action`, `url`, `cron_schedule_id`, `next_run`, `last_run`, `is_running`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Conversion Rate', 'conversion_ratre', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"currencyConversionRate\"]', NULL, 1, '2023-10-19 12:32:59', '2023-10-19 12:32:58', 1, 1, '2023-10-03 05:34:20', '2023-10-19 06:32:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cron_job_logs`
--

CREATE TABLE `cron_job_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cron_job_id` int(11) NOT NULL DEFAULT 0,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cron_schedules`
--

CREATE TABLE `cron_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `interval` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cron_schedules`
--

INSERT INTO `cron_schedules` (`id`, `name`, `interval`, `status`, `created_at`, `updated_at`) VALUES
(1, '1 Seconds', 1, 1, '2023-10-03 05:33:13', '2023-10-05 07:36:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency_conversion_rates`
--

CREATE TABLE `currency_conversion_rates` (
  `id` int(11) NOT NULL,
  `from_country` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `to_country` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `id` bigint(20) NOT NULL,
  `country_delivery_method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fixed_charge` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery_methods`
--

CREATE TABLE `delivery_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `send_money_id` int(11) NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `payment_try` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_app` tinyint(1) NOT NULL DEFAULT 0,
  `token` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"--------------------------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2023-10-19 06:39:11'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"--------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"--------------------\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2023-10-19 06:39:08'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2022-06-05 08:05:37'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, '2022-06-15 01:25:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2022-05-25 07:05:23'),
(18, 'user.kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-05-25 07:19:17', '2022-05-25 07:19:17'),
(19, 'agent.kyc', '[]', '2022-05-25 07:19:17', '2023-10-19 06:38:01'),
(21, 'personal-user.kyc', '[]', '2023-07-17 10:47:40', '2023-10-19 06:38:05'),
(22, 'business-user.kyc', '[]', '2023-07-17 10:48:43', '2023-10-19 06:37:55'),
(23, 'business-account.data', '{\"business_location\":{\"name\":\"Business Location\",\"label\":\"business_location\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"New York\",\"Washington\",\"California\"],\"type\":\"select\"},\"business_size\":{\"name\":\"Business Size\",\"label\":\"business_size\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"Small\",\"Medium\",\"Large\"],\"type\":\"select\"}}', '2023-07-18 10:30:13', '2023-07-18 15:11:05'),
(28, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:17:09', '2023-10-01 22:17:09'),
(29, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:17:23', '2023-10-01 22:17:23'),
(30, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:17:34', '2023-10-01 22:17:34'),
(31, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:17:54', '2023-10-01 22:17:54'),
(32, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:18:06', '2023-10-01 22:18:06'),
(33, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:18:19', '2023-10-01 22:18:19'),
(34, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:18:28', '2023-10-01 22:18:28'),
(35, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:18:47', '2023-10-01 22:18:47'),
(36, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:18:56', '2023-10-01 22:18:56'),
(37, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:19:07', '2023-10-01 22:19:07'),
(38, 'service_form', '{\"account\":{\"name\":\"Account\",\"label\":\"account\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-01 22:19:19', '2023-10-01 22:19:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) DEFAULT NULL,
  `data_values` longtext DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `tempname`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"remittance\",\"remit\",\"remitto\",\"remesa\",\"money transfer\",\"transfer money\",\"send money\",\"payout money\",\"cash pickup\"],\"description\":\"ViserRemit is a remittance transfer system to transfer money abroad.\",\"social_title\":\"ViserRemit - Ultimiate Remittance Solution\",\"social_description\":\"ViserRemit is a remittance transfer system to transfer money abroad.\",\"image\":\"64b6959d020c81689687453.png\"}', 'templates.basic.', '2020-07-04 23:42:52', '2023-07-18 23:37:33'),
(2, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\",\"status\":1}', 'templates.basic.', '2020-07-04 23:42:52', '2022-03-30 11:23:12'),
(3, 'maintenance.data', '{\"description\":\"<h2 style=\\\"text-align: center;\\\"><span style=\\\"color: var(--bs-body-color); text-align: var(--bs-body-text-align);\\\"><font size=\\\"6\\\">We\'re just tuning up a few things.<\\/font><\\/span><\\/h2><p>We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<br><\\/p>\"}', 'templates.basic.', '2020-07-04 23:42:52', '2022-06-09 10:25:33'),
(4, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"admin\",\"blog\",\"aaaa\",\"ddd\",\"aaa\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"Viserlab Limited\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"5fa397a629bee1604556710.jpg\"}', 'templates.basic.', '2020-07-04 17:42:52', '2021-01-03 01:43:02'),
(5, 'app.content', '{\"has_image\":\"1\",\"heading\":\"Use Apps on Mobile\",\"short_description\":\"Download our app for free to send money online in minutes to over 130 other countries. Track your payments and view your transfer history from anywhere.\",\"play_store_url\":\"https:\\/\\/play.google.com\\/store\\/apps\",\"app_store_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\",\"image\":\"6219f7fc6f4b21645869052.png\",\"play_store_icon\":\"628f6921cfb821653565729.png\",\"app_store_icon\":\"628f6921f2ad41653565729.png\"}', 'templates.basic.', '2020-10-27 18:51:20', '2022-06-09 10:58:59'),
(6, 'blog.content', '{\"heading\":\"Latest Blog Post\",\"description\":\"Donec sodales sagittis magna. Sed consequat leo eget bibendum sodales augue velit cursus nunc\"}', 'templates.basic.', '2020-10-27 18:51:34', '2022-06-07 10:49:55'),
(7, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c38990fe81652081545.jpeg\"}', 'templates.basic.', '2020-10-27 18:57:19', '2022-05-09 06:02:25'),
(9, 'contact.content', '{\"has_image\":\"1\",\"title\":\"Leave a Message\",\"description\":\"If you have any queries about sending money or currency rates feel free to ask us.\",\"email\":\"support@mail.com\",\"address\":\"15205 North Kierland Blvd.100 Old City\",\"mobile\":\"0123 - 4567 -890\",\"latitude\":\"40.6708314\",\"longitude\":\"-73.9529734\",\"image\":\"62a026df63bf31654662879.png\"}', 'templates.basic.', '2020-10-27 18:59:19', '2022-06-09 07:53:43'),
(10, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c3967cbc61652081558.jpg\"}', 'templates.basic.', '2020-10-30 18:39:05', '2022-05-09 06:02:38'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', 'templates.basic.', '2020-11-11 22:07:30', '2022-05-31 04:42:35'),
(36, 'service.content', '{\"has_image\":\"1\",\"heading\":\"We\'ve Our Agents Worldwide.\",\"description_one\":\"Maecenas tempus tellus eget condimentum rhoncus sequam semper libero sit amet adipiscing sem neque. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor econsequat vitae eleifend enim. Aliquam lorem ante dapibus in viverra quifeugiat a telluasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aliquam lorem ante dapibus in viverra quifeugiat a telluasellus viverra nulla ut metus varius laoreet. Quisque rutrum\",\"description_two\":\"Aenean imperdiet.Etiam ultricies nisi vel augue. Maecenas tempus tellus eget condimentum rhoncus sequam semper libero sit amet adipiscing sem neque. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor econsequat vitae eleifend enim. Aliquam lorem ante dapibus in viverra quifeugiat a telluasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet.Etiam ultricies nisi vel augue.\",\"button_link\":\"user\\/register\",\"button_text\":\"HOW TO TRANSFER\",\"image\":\"6219fb960bf421645869974.png\"}', 'templates.basic.', '2021-03-05 19:27:34', '2022-06-11 09:18:37'),
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Transfer Remittance at Low Cost\",\"description\":\"ViserRemit offers you to send money to your friends and family at a low price and in a simple way.\",\"button_text\":\"Get Registered\",\"button_link\":\"user\\/register\",\"youtube_link\":\"https:\\/\\/www.youtube.com\\/watch?v=WOb4cj7izpE\",\"image\":\"6219f4548f0c31645868116.png\"}', 'templates.basic.', '2021-05-02 00:09:30', '2022-06-09 10:35:36'),
(41, 'cookie.data', '{\"link\":\"#\",\"description\":\"<font color=\\\"#ffffff\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size: 18px;\\\">We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.<\\/span><\\/font><br>\",\"status\":1}', 'templates.basic.', '2020-07-04 17:42:52', '2021-06-06 03:43:37'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"margin-top:0px;margin-bottom:1rem;font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);margin-right:0px;margin-left:0px;\\\">What information do we collect?<\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-weight:400;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-weight:400;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-weight:400;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-weight:400;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-weight:400;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-weight:400;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-weight:400;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div><\\/div>\"}', 'templates.basic.', '2021-06-09 02:50:42', '2022-05-21 04:54:11'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We Don\'t support any child porn or such material.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No harassing material that may cause people to retaliate against you.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No phishing pages.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious Botnets are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Php\\/CGI proxies are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">CGI-IRC is strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Terms &amp; Conditions for Users<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Support<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-weight:700;font-size:18px;\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Hang tight for additional update discharge.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Ownership<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Warranty<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Unauthorized\\/Illegal Usage<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Payment\\/Refund Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Free Balance \\/ Coupon Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div><\\/div>\"}', 'templates.basic.', '2021-06-09 02:51:18', '2022-05-21 04:55:06'),
(44, 'feature.element', '{\"title\":\"Cheap Rate\",\"description\":\"We offer you a lower cost to send money outside the country.\",\"icon\":\"<i class=\\\"las la-percent\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 03:13:26', '2022-06-11 07:37:58'),
(45, 'feature.element', '{\"title\":\"Safe and Secure\",\"description\":\"Sending remittances is safe and secure as recipients receive money from our agents.\",\"icon\":\"<i class=\\\"las la-shield-alt\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 03:13:44', '2022-06-09 10:53:38'),
(46, 'feature.element', '{\"title\":\"Fast Transfer\",\"description\":\"Transferring money through ViserRemit is just a matter of moments.\",\"icon\":\"<i class=\\\"las la-exchange-alt\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 03:13:59', '2022-06-11 07:38:09'),
(47, 'app.element', '{\"key_feature_item\":\"The best rates on the market\"}', 'templates.basic.', '2022-02-26 03:22:29', '2022-02-26 03:22:29'),
(50, 'how_to_receive.content', '{\"heading\":\"How to Receive Money\",\"description\":\"Donec sodales sagittis magna. Sed consequat leo eget bibendum sodales augue velit cursus nunc\"}', 'templates.basic.', '2022-02-26 03:44:36', '2022-06-11 09:20:38'),
(51, 'how_to_receive.element', '{\"title\":\"Find Agent\",\"description\":\"To receive the sent amount you need to go to our agent\'s location.\",\"icon\":\"<i class=\\\"la la-map-marker-alt\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 03:45:36', '2022-06-11 09:32:28'),
(52, 'how_to_receive.element', '{\"title\":\"Give Transaction No.\",\"description\":\"Give the transaction number of send-money to our agent.\",\"icon\":\"<i class=\\\"la la-credit-card\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 03:45:51', '2022-06-11 09:33:57'),
(53, 'how_to_receive.element', '{\"title\":\"Verify Yourself\",\"description\":\"To complete the payout you have to be verified via a verification code.\",\"icon\":\"<i class=\\\"la la-mobile-alt\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 03:46:14', '2022-06-11 09:35:16'),
(54, 'transfer.content', '{\"has_image\":\"1\",\"heading\":\"Transfer funds across the globe, without extra fees\",\"description\":\"Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor econsequat vitae eleifend enim. Aliquam lorem ante dapibus in viverra quifeugiat a telluasel. world class Money Transfer\",\"button_link\":\"user\\/register\",\"button_text\":\"Get started\",\"image\":\"621a04dab60911645872346.png\"}', 'templates.basic.', '2022-02-26 04:15:46', '2022-06-07 10:47:13'),
(55, 'transfer.element', '{\"key_features\":\"100% Trusted\"}', 'templates.basic.', '2022-02-26 04:16:10', '2022-02-26 04:16:10'),
(56, 'transfer.element', '{\"key_features\":\"Fast and Easy Transfer\"}', 'templates.basic.', '2022-02-26 04:16:14', '2022-05-21 03:39:01'),
(57, 'transfer.element', '{\"key_features\":\"Life Support\"}', 'templates.basic.', '2022-02-26 04:16:22', '2022-02-26 04:16:22'),
(58, 'transfer.element', '{\"key_features\":\"Global Coverage\"}', 'templates.basic.', '2022-02-26 04:16:27', '2022-02-26 04:16:27'),
(59, 'transfer.element', '{\"key_features\":\"On time\"}', 'templates.basic.', '2022-02-26 04:16:36', '2022-02-26 04:16:36'),
(60, 'transfer.element', '{\"key_features\":\"No Hidden Charge\"}', 'templates.basic.', '2022-02-26 04:16:43', '2022-02-26 04:16:43'),
(61, 'choose_us.content', '{\"has_image\":\"1\",\"heading\":\"Why People Choose Us for Money Transfer\",\"image\":\"621a0b0fa9da71645873935.png\"}', 'templates.basic.', '2022-02-26 04:42:15', '2022-06-07 10:47:43'),
(62, 'choose_us.element', '{\"title\":\"Cheaper Than Your Bank\",\"description\":\"Convert data noise to intelligent insights for competitive differentiation.\",\"icon\":\"<i class=\\\"fas fa-landmark\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 04:42:36', '2022-02-26 04:42:36'),
(63, 'choose_us.element', '{\"title\":\"Always Supportive\",\"description\":\"Convert data noise to intelligent insights for competitive differentiation.\",\"icon\":\"<i class=\\\"fas fa-comments\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 04:42:58', '2022-02-26 04:43:35'),
(64, 'choose_us.element', '{\"title\":\"Trust is Important\",\"description\":\"Convert data noise to intelligent insights for competitive differentiation.\",\"icon\":\"<i class=\\\"fas fa-shield-alt\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 04:43:19', '2022-02-26 04:43:19'),
(65, 'testimonial.content', '{\"heading\":\"What Our Client Says\",\"description\":\"Donec sodales sagittis magna. Sed consequat leo eget bibendum sodales augue velit cursus nunc\"}', 'templates.basic.', '2022-02-26 04:53:31', '2022-06-11 04:47:29'),
(66, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Muscan Roshid\",\"designation\":\"Customer, USA\",\"star_count\":\"5\",\"date\":\"25 December 2022 , 08:30 PM\",\"description\":\"Maecenas tempus tellus eget condiment oncus sem quam semper libero sit amet adipiscingm neque sed ipsum. Nam quam nunc\",\"image\":\"6278c77fcefb91652082559.jpg\"}', 'templates.basic.', '2022-02-26 04:55:45', '2022-06-11 05:30:18'),
(67, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Muscan Roshid\",\"designation\":\"Customer, USA\",\"star_count\":\"5\",\"date\":\"25 December 2022 , 08:30 PM\",\"description\":\"Maecenas tempus tellus eget condiment oncus sem quam semper libero sit amet adipiscingm neque sed ipsum. Nam quam nunc\",\"image\":\"6278c795ce10c1652082581.jpg\"}', 'templates.basic.', '2022-02-26 04:56:22', '2022-05-09 06:19:46'),
(68, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Muscan Roshid\",\"designation\":\"Customer, USA\",\"star_count\":\"5\",\"date\":\"25 December 2022 , 08:30 PM\",\"description\":\"Maecenas tempus tellus eget condiment oncus sem quam semper libero sit amet adipiscingm neque sed ipsum. Nam quam nunc\",\"image\":\"6278c7ccdec7d1652082636.jpg\"}', 'templates.basic.', '2022-02-26 04:57:03', '2022-05-09 06:20:36'),
(69, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Muscan Roshid\",\"designation\":\"Customer, USA\",\"star_count\":\"5\",\"date\":\"25 December 2022 , 08:30 PM\",\"description\":\"Maecenas tempus tellus eget condiment oncus sem quam semper libero sit amet adipiscingm neque sed ipsum. Nam quam nunc\",\"image\":\"6278c7e1418fb1652082657.jpg\"}', 'templates.basic.', '2022-02-26 04:57:30', '2022-05-09 06:20:57'),
(70, 'video.content', '{\"has_image\":\"1\",\"heading\":\"Watch Us to Know More\",\"description\":\"Donec sodales sagittis magna. Sed consequat leo eget bibendum sodales augue velit cursus nunc\",\"youtube_link\":\"https:\\/\\/www.youtube.com\\/watch?v=WOb4cj7izpE\",\"image\":\"621a122d40c351645875757.png\"}', 'templates.basic.', '2022-02-26 05:12:37', '2022-06-07 10:48:47'),
(71, 'counter.element', '{\"title\":\"Happy Customer\",\"digit\":\"3600\",\"icon\":\"<i class=\\\"fas fa-grin-beam\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 05:15:48', '2022-02-26 05:15:48'),
(72, 'counter.element', '{\"title\":\"Transfer Money\",\"digit\":\"4587\",\"icon\":\"<i class=\\\"fas fa-coins\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 05:16:06', '2022-02-26 05:16:06'),
(73, 'counter.element', '{\"title\":\"Service Area\",\"digit\":\"2200\",\"icon\":\"<i class=\\\"fas fa-globe\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 05:16:20', '2022-02-26 05:16:20'),
(74, 'how_work.content', '{\"heading\":\"How to Send Remittance\",\"description\":\"Donec sodales sagittis magna. Sed consequat leo eget bibendum sodales augue velit cursus nunc\"}', 'templates.basic.', '2022-02-26 05:22:30', '2022-06-11 09:43:37'),
(75, 'how_work.element', '{\"title\":\"Send Money Request\",\"description\":\"At first you need to submit the required information from send money page to issue a send money request.\",\"icon\":\"<i class=\\\"fas fa-exchange-alt\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 05:22:45', '2022-06-11 09:48:06'),
(76, 'how_work.element', '{\"title\":\"Complete Payment\",\"description\":\"After submitting te send money request you have to complete the payment process by a payment method.\",\"icon\":\"<i class=\\\"fas fa-receipt\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 05:22:53', '2022-06-11 09:49:45'),
(77, 'how_work.element', '{\"title\":\"Give Transaction No.\",\"description\":\"After completeing the payment process send the transaction number to your recipent.\",\"icon\":\"<i class=\\\"fas fa-wallet\\\"><\\/i>\"}', 'templates.basic.', '2022-02-26 05:23:01', '2022-06-11 09:52:08'),
(78, 'faq.content', '{\"has_image\":\"1\",\"heading\":\"What do you wish to know?\",\"image\":\"6294492a3cf571653885226.png\"}', 'templates.basic.', '2022-02-26 05:27:39', '2022-06-07 10:56:31'),
(79, 'faq.element', '{\"question\":\"What is a multi-currency account and how does it work?\",\"answer\":\"Sed mollis, eros et ultrices tempus, mauris ipsum aliquam libero, non adipiscing dolor urna a orci. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi sem ut ipsum. Cras varius. Vivamus in erat ut urna cursus vestibulum. Fusce a quam.\\r\\n\\r\\nPraesent metus tellus, elementum eu, semper a, adipiscing nec, purus. Nunc egestas, augue at pellentesque laoreet, felis eros vehicula leo, at malesuada velit leo quis pede. Phasellus magna. Nunc nec neque. In turpis.\"}', 'templates.basic.', '2022-02-26 05:28:09', '2022-05-09 05:43:35'),
(80, 'faq.element', '{\"question\":\"How to Set up your first transfer?\",\"answer\":\"Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Aenean viverra rhoncus pede. Proin magna. Nam pretium turpis et arcu. Fusce a quam.\\r\\n\\r\\nVivamus euismod mauris. Pellentesque dapibus hendrerit tortor. Fusce ac felis sit amet ligula pharetra condimentum. Vestibulum suscipit nulla quis orci. Sed fringilla mauris sit amet nibh.\"}', 'templates.basic.', '2022-02-26 05:28:31', '2022-05-09 05:43:51'),
(83, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c4c0b4a6a1652081856.jpg\"}', 'templates.basic.', '2022-02-26 06:21:37', '2022-05-09 06:07:37'),
(84, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c41115d081652081681.jpg\"}', 'templates.basic.', '2022-02-26 06:21:54', '2022-05-09 06:04:41');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `tempname`, `created_at`, `updated_at`) VALUES
(85, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c4d9390b41652081881.jpg\"}', 'templates.basic.', '2022-02-26 06:22:10', '2022-05-09 06:08:01'),
(86, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c3fa7da901652081658.jpg\"}', 'templates.basic.', '2022-02-26 06:22:49', '2022-05-09 06:04:18'),
(87, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c3f0ab2331652081648.jpg\"}', 'templates.basic.', '2022-02-26 06:23:07', '2022-05-09 06:04:09'),
(88, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c3d8d7e6f1652081624.jpg\"}', 'templates.basic.', '2022-02-26 06:23:29', '2022-05-09 06:03:45'),
(89, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Fuga odit repellat alias animi totam officiis facere dolore.\",\"description\":\"<p class=\\\"fs--18px\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:1.125rem;\\\">Nobis, maiores. Dolores nesciunt, quibusdam sed, velit dicta qui atque, ad doloribus eveniet cupiditate pariatur doloremque nihil harum nemo voluptatum illum. Alias doloribus eveniet cupiditate.<\\/p><p class=\\\"mt-3\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Fugiat doloremque mollitia a adipisci voluptas natus aperiam numquam libero facilis. Veniam dignissimos natus ab doloremque exercitationem minima neque, iusto, ullam nostrum impedit dolores quos architecto aut ipsa nihil dolore facere, inventore quidem voluptates. Impedit, obcaecati numquam! Corrupti eos alias quibusdam sint cupiditate at iure reprehenderit a debitis id enim explicabo, nemo expedita magni nesciunt excepturi dicta omnis. Minus quibusdam nulla officia eos ipsam soluta, iusto omnis repellendus consequuntur cupiditate temporibus, commodi expedita atque architecto praesentium suscipit molestias dignissimos, impedit itaque aliquam nam dolore explicabo! Ad dolores beatae ipsum nemo provident voluptatibus Minus quibusdam nulla officia eos.<\\/p><blockquote style=\\\"margin-top:1.25rem;padding:1.875rem;background-color:rgb(241,241,241);font-style:italic;color:rgb(102,102,102);font-size:15px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur autem quis odio, praesentium deserunt est dolores aliquid, eos officia ad quia voluptatum, tempore nulla ex necessitatibus recusandae itaque ipsam beatae. Corrupti eos alias quibusdam sint cupiditate dolores beatae.<\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(102,102,102);font-size:15px;\\\">Totam minima nulla, placeat quidem, omnis sed laboriosam fuga maxime animi, cupiditate molestias consectetur. Labore, assumenda eaque. Officiis voluptas accusantium alias nostrum fugit dolore eos blanditiis aperiam, illo consequuntur repellendus doloribus a porro exercitationem quia. Accusamus molestiae beatae alias, veritatis delectus reiciendis est harum ex nesciunt rem? Recusandae et nihil id ducimus aliquid, pariatur aut tempore doloremque ratione cum in non eius maiores a voluptatum, quam aliquam perspiciatis magnam provident. Et odit saepe illo libero, voluptatem optio aliquam deserunt nam accusamus in commodi dolorum pariatur. Et quo labore velit nesciunt.<\\/p>\",\"image\":\"6278c43063d2f1652081712.jpg\"}', 'templates.basic.', '2022-02-26 06:23:51', '2022-05-09 06:05:13'),
(90, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"62a19658ee1f41654756952.png\"}', 'templates.basic.', '2022-02-26 06:47:05', '2022-06-09 05:12:33'),
(91, 'login.content', '{\"has_image\":\"1\",\"image\":\"629ddc59573e31654512729.png\"}', 'templates.basic.', '2022-02-26 23:06:58', '2022-06-06 09:28:35'),
(92, 'register.content', '{\"has_image\":\"1\",\"image\":\"629dddc255daf1654513090.png\"}', 'templates.basic.', '2022-02-26 23:31:39', '2022-06-06 09:28:10'),
(93, 'policy_pages.element', '{\"title\":\"Refund Policy\",\"details\":\"<div class=\\\"content-block\\\" style=\\\"color:rgb(101,101,101);font-family:\'Open Sans\', sans-serif;\\\"><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We endeavor to make our clients happy with the item they\'ve bought from us. In case you\'re experiencing difficulty with excellent items or trust it is blemished, or potentially you\'re feeling baffled, at that point please present a pass to our Helpdesk to report your inadequate item and our team will help you at the earliest opportunity. For a harmed content, augmentation or layout, we will demand from you a connection and add a screen capture of the issue to be shipped off our help administration.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Refund Is Not Possible When:<\\/h3><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">The framework turns out great on your side yet includes don\'t match or you may have thought something different.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Your necessities are currently modified and you needn\'t bother with the Script anymore.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You end up discovering some other Software which you believe is better.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You don\'t need a site or administration right now.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Our highlights don\'t address your issues and prerequisites or aren\'t as extensive as you suspected.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You don\'t have such an environment for your worker to run our framework.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">On the off chance that you as of now download our framework.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><span style=\\\"font-weight:bolder;\\\">No returns\\/refunds will be offered for digital products except if the product you\\u2019ve purchased is:<\\/span><\\/p><ul><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Completely non-functional \\/ not same as demo.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If you\\u2019ve opened a support ticket but you didn\'t get any response in 48 hours (2 Business days).<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">The product description was fully misleading.<\\/li><\\/ul><p style=\\\"margin-right:0px;margin-left:0px;\\\"><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><\\/p><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Please also note that:<\\/h3><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Refunds can take up to 45 days (depends on Bank and payment Methods) to reflect in your account.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We normally charge 20% (4% gateway fee + 9% Dispute Fee + 7% Processing Fee) as Refund Processing fee.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You can cancel your account at any time; no refunds for cancellation.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You will be unable to download or use the item when you claim for refund.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If you have been downloaded items then no refund allowed.<\\/li><\\/ul><\\/div><\\/div>\"}', 'templates.basic.', '2022-02-27 05:51:52', '2022-05-21 04:55:33'),
(95, 'brand.element', '{\"has_image\":\"1\",\"image\":\"621b702f10f031645965359.png\"}', 'templates.basic.', '2022-02-27 06:04:37', '2022-02-27 06:05:59'),
(96, 'brand.element', '{\"has_image\":\"1\",\"image\":\"621b70350b8891645965365.png\"}', 'templates.basic.', '2022-02-27 06:04:43', '2022-02-27 06:06:05'),
(97, 'brand.element', '{\"has_image\":\"1\",\"image\":\"621b70418387f1645965377.png\"}', 'templates.basic.', '2022-02-27 06:04:48', '2022-02-27 06:06:17'),
(98, 'brand.element', '{\"has_image\":\"1\",\"image\":\"621b7049b95561645965385.png\"}', 'templates.basic.', '2022-02-27 06:05:02', '2022-02-27 06:06:25'),
(99, 'brand.element', '{\"has_image\":\"1\",\"image\":\"621b70515615b1645965393.png\"}', 'templates.basic.', '2022-02-27 06:06:33', '2022-02-27 06:06:33'),
(100, 'brand.element', '{\"has_image\":\"1\",\"image\":\"621b7055cd50a1645965397.png\"}', 'templates.basic.', '2022-02-27 06:06:37', '2022-02-27 06:06:37'),
(102, 'app.element', '{\"key_feature_item\":\"200+ Payment gateway\"}', 'templates.basic.', '2022-05-09 04:57:37', '2022-05-26 10:16:55'),
(103, 'app.element', '{\"key_feature_item\":\"Easy Money Transfer\"}', 'templates.basic.', '2022-05-09 04:57:55', '2022-05-26 10:17:00'),
(105, 'faq.element', '{\"question\":\"In ut quam vitae odio Pellentesque dapib?\",\"answer\":\"<div>Aliquam erat volutpat. Praesent vestibulum dapibus nibh. Curabitur blandit mollis lacus.\\u00a0<span style=\\\"font-size:1rem;\\\">Sed aliquam ultrices mauris. Vivamus consectetuer hendrerit lacus. Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus.<\\/span><\\/div>\"}', 'templates.basic.', '2022-05-09 05:26:29', '2022-05-09 05:26:30'),
(106, 'faq.element', '{\"question\":\"Proin pretium leo ac pellentesque Sed cursus tur?\",\"answer\":\"<div>Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Nunc nonummy metus. Praesent metus tellus, elementum eu, semper a, adipiscing nec, purus.\\u00a0<span style=\\\"font-size:1rem;\\\">Cras non dolor. Fusce neque. Phasellus consectetuer vestibulum elit. Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus.<\\/span><\\/div>\"}', 'templates.basic.', '2022-05-09 05:26:57', '2022-05-09 05:26:57'),
(107, 'faq.element', '{\"question\":\"Lorem ipsum dolor sit amet Nulla consequat ma?\",\"answer\":\"<div>Nullam accumsan lorem in dui. Vivamus quis mi. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.\\u00a0<span style=\\\"font-size:1rem;\\\">Duis leo. Vivamus aliquet elit ac nisl. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.\\u00a0<\\/span><span><font color=\\\"#212529\\\">Sed hendrerit. Phasellus ullamcorper ipsum rutrum nunc. Praesent ut ligula non mi varius sagittis.<\\/font><\\/span><\\/div>\"}', 'templates.basic.', '2022-05-09 05:27:34', '2022-05-09 05:27:34'),
(108, 'counter.element', '{\"title\":\"Daily transection\",\"digit\":\"25\",\"icon\":\"<i class=\\\"las la-exchange-alt\\\"><\\/i>\"}', 'templates.basic.', '2022-05-12 05:27:39', '2022-05-12 05:27:39'),
(109, 'kyc_instruction.content', '{\"user_kyc_instructions\":\"KYC is a mandatory process for identifying and verifying the identity of the client when sending money using our remittance site. After providing some of the information requested by the administrator, one of our administrators will verify it and declare you as KYC verified.\",\"agent_kyc_instructions\":\"KYC is a mandatory process for identifying and verifying the identity of the client when payout, sending money, withdraw, deposit using our remittance site. After providing some of the information requested by the administrator, one of our administrators will verify it and declare you as KYC verified.\"}', 'templates.basic.', '2022-05-21 05:53:03', '2022-05-21 05:58:36'),
(110, 'user_kyc_instruction.content', '{\"instructions_before_submit\":\"KYC is a mandatory process for identifying and verifying the identity of the client when sending money using our remittance site. After providing some of the information requested by the administrator, one of our administrators will verify it and declare you as KYC verified.\",\"instructions_after_submit\":\"d\"}', 'templates.basic.', '2022-05-21 06:01:30', '2022-05-21 06:01:30'),
(111, 'kyc_instruction_user.content', '{\"verification_instruction\":\"KYC is a mandatory process for identifying and verifying the identity of the client when sending money using our remittance site. After providing all of the information requested by the administrator, one of our administrators will verify it and declare you as KYC verified.\",\"pending_instruction\":\"Please be patient. Your KYC data has been accepted, one of our administrators will verify the authenticity and declare you as KYC verified.\"}', 'templates.basic.', '2022-05-21 06:04:15', '2022-05-21 06:16:28'),
(112, 'kyc_instruction_agent.content', '{\"verification_instruction\":\"KYC is a mandatory process for identifying and verifying the identity of the client when payout, sending money, withdraw, deposit using our remittance site. After providing some of the information requested by the administrator, one of our administrators will verify it and declare you as KYC verified.\",\"pending_instruction\":\"Please be patient. Your KYC data has been accepted, one of our administrators will verify the authenticity and declare you as verified.\"}', 'templates.basic.', '2022-05-21 06:04:24', '2022-05-21 06:16:44'),
(113, 'about.content', '{\"has_image\":\"1\",\"heading\":\"About Transfer funds across the globe\",\"description\":\"Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor econsequat vitae eleifend enim. Aliquam lorem ante dapibus in viverra quifeugiat a telluasel. world class Money Transfer\",\"image\":\"62945d656bac11653890405.png\"}', 'templates.basic.', '2022-05-30 04:30:05', '2022-06-07 10:42:15'),
(114, 'about.element', '{\"feature_item\":\"Must have medical certificat\"}', 'templates.basic.', '2022-05-30 04:30:10', '2022-05-30 04:41:52'),
(115, 'about.element', '{\"feature_item\":\"Curabitur ulorper ultricies\"}', 'templates.basic.', '2022-05-30 04:30:13', '2022-05-30 04:43:24'),
(116, 'about.element', '{\"feature_item\":\"Fringilla mauris sit amet\"}', 'templates.basic.', '2022-05-30 04:30:16', '2022-05-30 04:42:14'),
(117, 'about.element', '{\"feature_item\":\"Aenean leo ligula porttitor\"}', 'templates.basic.', '2022-05-30 04:30:19', '2022-05-30 04:42:25'),
(118, 'about.element', '{\"feature_item\":\"Maecenas tempus tellus\"}', 'templates.basic.', '2022-05-30 04:30:23', '2022-05-30 04:42:34'),
(119, 'about.element', '{\"feature_item\":\"Must have medical\"}', 'templates.basic.', '2022-05-30 04:30:28', '2022-05-30 04:42:48'),
(120, 'social_icon.element', '{\"title\":\"Instagram\",\"icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', 'templates.basic.', '2022-05-31 04:43:01', '2022-05-31 04:43:01'),
(121, 'social_icon.element', '{\"title\":\"Twitter\",\"icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/www.twitter.com\\/\"}', 'templates.basic.', '2022-05-31 04:43:21', '2022-05-31 04:43:21'),
(122, 'social_icon.element', '{\"title\":\"Linked In\",\"icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\\/\"}', 'templates.basic.', '2022-05-31 04:43:38', '2022-05-31 04:43:38'),
(123, 'feature.content', '{\"heading\":\"The Things We Offer You\"}', 'templates.basic.', '2022-06-09 10:45:58', '2022-06-11 09:17:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 0, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"--------------------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:42:14'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 0, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"--------------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:42:47'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:43:35'),
(4, 0, 104, 'Skrill', 'Skrill', 0, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"--------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------------\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:43:19'),
(5, 0, 105, 'PayTM', 'Paytm', 0, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"--------------------\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"--------------------\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"--------------------\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"--------------------\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"--------------------\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"--------------------\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"--------------------\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:42:40'),
(6, 0, 106, 'Payeer', 'Payeer', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"--------------------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2023-10-19 06:42:09'),
(7, 0, 107, 'PayStack', 'Paystack', 0, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"--------------------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2023-10-19 06:42:29'),
(8, 0, 108, 'VoguePay', 'Voguepay', 0, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:40:25'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"--------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"--------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:41:29'),
(10, 0, 110, 'RazorPay', 'Razorpay', 0, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"--------------------\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"--------------------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:43:13'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:43:39'),
(12, 0, 112, 'Instamojo', 'Instamojo', 0, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"--------------------\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"--------------------\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"--------------------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:41:37'),
(13, 0, 501, 'Blockchain', 'Blockchain', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"--------------------\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"--------------------\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:40:37'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"--------------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"--------------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"--------------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:41:13'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:41:19'),
(17, 0, 505, 'Coingate', 'Coingate', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:41:06'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"--------------------\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2023-10-19 06:40:57'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', 0, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"--------------------\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"--------------------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:42:21'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"--------------------\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2023-10-19 06:44:13'),
(27, 0, 115, 'Mollie', 'Mollie', 0, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"--------------------\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"--------------------\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-10-19 06:41:46'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', 0, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"--------------------\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"--------------------\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2023-10-19 06:40:52'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', 0, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"--------------------\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2023-10-19 06:41:42'),
(44, 0, 122, 'BTCPay', 'BTCPay', 0, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"-------\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"------\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/yourbtcpaserver.lndyn.com\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"----------\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, NULL),
(45, 0, 123, 'Now payments hosted', 'NowPaymentsHosted', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"--------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-10-19 06:42:04'),
(46, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"--------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-10-19 06:42:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(11) DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) DEFAULT NULL,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) DEFAULT NULL,
  `cur_text` varchar(40) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_body` varchar(255) DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `base_color` varchar(40) DEFAULT NULL,
  `agent_fixed_commission` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `agent_percent_commission` decimal(5,2) NOT NULL DEFAULT 0.00,
  `referral_commission` decimal(5,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `commission_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_send_money_limit` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `user_daily_send_money_limit` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `user_monthly_send_money_limit` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `agent_send_money_limit` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `agent_daily_send_money_limit` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `agent_monthly_send_money_limit` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `resent_code_duration` int(11) NOT NULL DEFAULT 0,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text DEFAULT NULL,
  `global_shortcodes` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `multi_language` tinyint(1) NOT NULL DEFAULT 1,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) DEFAULT NULL,
  `system_info` text DEFAULT NULL,
  `last_cron` datetime DEFAULT NULL,
  `kyc_modules` longtext DEFAULT NULL,
  `referral_system` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `agent_module` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `agent_charges` text DEFAULT NULL,
  `firebase_config` text DEFAULT NULL,
  `push_notify` tinyint(1) NOT NULL DEFAULT 1,
  `conversion_rate_api` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `agent_fixed_commission`, `agent_percent_commission`, `referral_commission`, `commission_count`, `user_send_money_limit`, `user_daily_send_money_limit`, `user_monthly_send_money_limit`, `agent_send_money_limit`, `agent_daily_send_money_limit`, `agent_monthly_send_money_limit`, `resent_code_duration`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `multi_language`, `registration`, `active_template`, `system_info`, `last_cron`, `kyc_modules`, `referral_system`, `agent_module`, `agent_charges`, `firebase_config`, `push_notify`, `conversion_rate_api`, `created_at`, `updated_at`) VALUES
(1, 'ViserRemit', 'USD', '$', 'no-reply@viserlab.com', '<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>\n</title>\n<style type=\"text/css\">\n	.ReadMsgBody {\n		width: 100%;\n		background-color: #ffffff;\n	}\n	.ExternalClass {\n		width: 100%;\n		background-color: #ffffff;\n	}\n	.ExternalClass,\n	.ExternalClass p,\n	.ExternalClass span,\n	.ExternalClass font,\n	.ExternalClass td,\n	.ExternalClass div {\n		line-height: 100%;\n	}\n	html {\n		width: 100%;\n	}\n	body {\n		-webkit-text-size-adjust: none;\n		-ms-text-size-adjust: none;\n		margin: 0;\n		padding: 0;\n	}\n	table {\n		border-spacing: 0;\n		table-layout: fixed;\n		margin: 0 auto;\n		border-collapse: collapse;\n	}\n	table table table {\n		table-layout: auto;\n	}\n	.yshortcuts a {\n		border-bottom: none !important;\n	}\n	img:hover {\n		opacity: 0.9 !important;\n	}\n	a {\n		color: #0087ff;\n		text-decoration: none;\n	}\n	.textbutton a {\n		font-family: \"open sans\", arial, sans-serif !important;\n	}\n	.btn-link a {\n		color: #ffffff !important;\n	}\n	@media only screen and (max-width: 480px) {\n		body {\n			width: auto !important;\n		}\n		*[class=\"table-inner\"] {\n			width: 90% !important;\n			text-align: center !important;\n		}\n		*[class=\"table-full\"] {\n			width: 100% !important;\n			text-align: center !important;\n		} /* image */\n		img[class=\"img1\"] {\n			width: 100% !important;\n			height: auto !important;\n		}\n	}\n\n</style>\n<table bgcolor=\"#030442\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td height=\"50\">\n			</td>\n		</tr>\n		<tr>\n			<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n					<tbody>\n						<tr>\n							<td align=\"center\" width=\"600\">\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n									<tbody>\n										<tr>\n											<td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\n												<table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"20\">\n															</td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">\n															This is a System Generated Email</td>\n														</tr>\n														<tr>\n															<td height=\"20\">\n															</td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tbody>\n										<tr>\n											<td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"35\">\n															</td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"vertical-align:top;font-size:0;\">\n																<a href=\"#\">\n																	<img style=\"display:block; line-height:0px; font-size:0px; border:0px; width: 240px;\" width=\"240px\" src=\"https://viserlab.com/assets/images/logoIcon/logo-dark.png\" alt=\"img\">\n																</a>\n															</td>\n														</tr>\n														<tr>\n															<td height=\"40\"></td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"font-family: Open Sans, Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">\n															Hello {{fullname}} ({{username}}) </td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n																<table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n																	<tbody>\n																		<tr>\n																			<td height=\"20\" style=\" border-bottom:3px solid #0087ff;\">\n																			</td>\n																		</tr>\n																	</tbody>\n																</table>\n															</td>\n														</tr>\n														<tr>\n															<td height=\"30\"></td>\n														</tr>\n														<tr>\n															<td align=\"left\" style=\"font-family: Open sans, Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">\n															{{message}}</td>\n														</tr>\n														<tr>\n															<td height=\"60\"></td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n										<tr>\n											<td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"10\"></td>\n														</tr>\n														<tr>\n															<td class=\"preference-link\" align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#95a5a6; font-size:14px;\">\n																© 2023 <a href=\"#\">{{site_name}}</a> &nbsp;. All Rights Reserved. </td>\n														</tr>\n														<tr>\n															<td height=\"10\"></td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n		<tr>\n			<td height=\"60\"></td>\n		</tr>\n	</tbody>\n</table>\n</html>\n', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', '446DFF', 3.00000000, 0.50, 0.00, 1, 100.00000000, 1000.00000000, 10000.00000000, 1000.00000000, 10000.00000000, 100000.00000000, 120, '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 'basic', '[]', '2023-10-19 12:32:58', NULL, 1, 1, '{\"fixed_charge\":\"0\",\"percent_charge\":\"0.5\"}', '{\"apiKey\":\"AIzaSyDPRuyryXhSypi3I0hZPnQwk-NYQbHGlFA\",\"authDomain\":\"viserlab-113d9.firebaseapp.com\",\"projectId\":\"viserlab-113d9\",\"storageBucket\":\"viserlab-113d9.appspot.com\",\"messagingSenderId\":\"618036904644\",\"appId\":\"1:618036904644:web:81aae2bdb0da81aa1fbf91\",\"measurementId\":\"G-L5VYMVDCLB\",\"serverKey\":\"AAAAj-XewsQ:APA91bFE_mVG8bhvtOoy8G-qlicZUFSO_JqPuIzlY2WbD7y4A2FJfT1Ksw8sp3pR4JEHUcE74AhiG4byLemK_XijVyhglwzwF3U1ktfpscoAkCTDb0MaDXTyyNWwYRqK0VepoQ9Y7jJI\"}', 1, '{\"status\":false}', NULL, '2024-01-26 04:36:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2020-07-06 03:47:55', '2022-04-09 03:47:04'),
(5, 'Hindi', 'hn', 0, '2020-12-29 02:20:07', '2022-04-09 03:47:04'),
(9, 'Bangla', 'bn', 0, '2021-03-14 04:37:41', '2022-03-30 12:31:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) DEFAULT NULL,
  `sent_from` varchar(40) DEFAULT NULL,
  `sent_to` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', NULL, NULL, '[]', 1, 1, NULL, NULL),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'KYC has been rejected', NULL, NULL, '[]', 1, 1, NULL, NULL),
(18, 'SEND_MONEY_COMPLETE', 'Send- Money - Payment Confirmation', '[Payment Confirmation] Send Money Completed Successfully', '<div>This is a payment receipt for your send money from <i>{{sending_country}}</i> to <i>{{recipient__country}}</i>.</div>\r\n<div><br></div>\r\n<div>The payment has been completed Successfully</div>\r\n\r\n<div><br></div>\r\n\r\n<div>Sending Amount: {{sending_amount}} {{sending_currency}}</div>\r\n<div>Receiver Wil Get: {{recipient_amount}} {{recipient_currency}}</div>\r\n<div>Transaction Number: #{{trx}}</div>\r\n\r\n<div><br></div>\r\n<div>Note: This email will serve as an official receipt for this payment.</div>', '{{recipient_amount}} {{recipient_amount}} sent successfully to {{recipient__country}}.\r\nTransaction Number: #{{trx}}', '{\"trx\":\"Transaction number for the send money\",\"sending_country\":\"Country name of sender\",\"sending_amount\":\"Amount of sender\",\"sending_currency\":\"currency of the Sender country\",\"recipient__country\":\"Country name of receiver\",\"recipient_amount\":\"Amount will be recived\",\"recipient_currency\":\"Currency of the reciever country\"}', 1, 1, '2021-11-03 12:00:00', '2021-11-04 09:02:58'),
(19, 'SEND_MONEY_RECEIVED', 'Send - Money - Received', '[Payout Confirmation] The recipient has received the money you sent', '<div>This is a payment receipt for your send money to {{recipient_country}}.</div>\r\n<div><br></div>\r\n<div>The transaction has been completed Successfully.</div>\r\n\r\n<div><br></div>\r\n\r\n<div>Received Amount: {{recipient_amount}} {{recipient_currency}}</div><div>Trx: {{trx}}</div>\r\n\r\n<div><br></div>\r\n<div>Note: This email will serve as an official receipt for this payment.</div>', 'This is a payment receipt for your send money to {{recipient_country}}. {{recipient_amount}} {{recipient_currency}} payout successful for trx - {{trx}}.', '{\"recipient__country\":\"Country name of receiver\",\"recipient_amount\":\"Amount will be recived\",\"recipient_currency\":\"Currency of the reciever country\",\"trx\":\"Transaction id\"}', 1, 1, '2021-11-03 12:00:00', '2022-06-04 08:30:52'),
(20, 'SEND_MONEY_REJECT', 'Send- Money - Rejected', '[Manual Payment Confirmation] Manual Payment Rejected', '<div>This is a payment receipt for your send money from <i>{{sending_country}}</i> to <i>{{recipient__country}}</i>.</div>\r\n<div><br></div>\r\n<div>The payment has been rejected</div>\r\n\r\n<div><br></div>\r\n\r\n<div>Sending Amount: {{sending_amount}} {{sending_currency}}</div>\r\n<div>Receiver Wil Get: {{recipient_amount}} {{recipient_currency}}</div>\r\n<div>Transaction Number: #{{trx}}</div>\r\n<div><br></div>\r\n<div>Admin Message: {{message}}</div>\r\n<div><br></div>\r\n<div>Note: This email will serve as an official receipt for this payment.</div>', 'Manual payment for {{recipient_amount}} {{recipient_currency}}  to {{recipient__country}} is rejected due to {{message}}.\r\nTransaction Number: #{{trx}}', '{\"trx\":\"Transaction number for the send money\",\"sending_country\":\"Country name of sender\",\"sending_amount\":\"Amount of sender\",\"sending_currency\":\"currency of the Sender country\",\"recipient__country\":\"Country name of receiver\",\"recipient_amount\":\"Amount will be recived\",\"recipient_currency\":\"Currency of the reciever country\",\"message\":\"Admin message\"}', 1, 1, '2021-11-03 12:00:00', '2021-11-04 09:02:58'),
(21, 'SEND_MONEY_REQUEST', 'Send- Money - Request', 'Payment Request Submitted Successfully', '	<div>This is to notify you that your payment request of <b>{{amount}} {{currency}}</b> via\r\n		<i>{{method_name}}</i> has been submitted successfully\r\n	</div>\r\n	<div><br></div>\r\n\r\n	<div>Amount: {{amount}} {{currency}}</div>\r\n	<div>Charge: {{charge}} {{currency}}</div>\r\n	<div>Conversion Rate: 1 {{currency}} = {{rate}} {{method_currency}}</div>\r\n	<div>Payable: {{method_amount}} {{method_currency}}</div>\r\n	<div>Paid via: {{method_name}}</div>\r\n	<div>Transaction Number: #{{trx}}</div>\r\n	<div><br></div>\r\n	<div><br></div>\r\n\r\n\r\n	<div>Note: This is not the final confirmation for the payment. Our team will cross-check your information and you will\r\n		receive another confirmation once we review and take an action.</div>', 'Payment request of {{amount}} {{currrency}} by {{method_name}} submitted successfully.\r\nTransaction Number: #{{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"currency\":\"Base currency of the system\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2021-11-04 09:02:58'),
(22, 'SEND_MONEY_REFUND', 'Send- Money - Refund', 'Send Money Refunded', '<div>This is a payment receipt for your send money from <i>{{sending_country}}</i> to <i>{{recipient__country}}</i>.</div>\r\n<div><br></div>\r\n<div>The payment has been refunded</div>\r\n\r\n<div><br></div>\r\n\r\n<div>Sending Amount: {{sending_amount}} {{sending_currency}}</div>\r\n<div>Receiver Wil Get: {{recipient_amount}} {{recipient_amount}}</div>\r\n<div>Transaction Number: #{{trx}}</div>\r\n<div><br></div>\r\n<div>Admin Message: {{message}}</div>\r\n<div><br></div>\r\n<div>Note: This email will serve as an official receipt for this payment.</div>', 'Send money for {{recipient_amount}} {{recipient_currency}}  to {{recipient__country}} is refunded due to {{message}}.\r\nTransaction Number: #{{trx}}', '{\"trx\":\"Transaction number for the send money\",\"sending_country\":\"Country name of sender\",\"sending_amount\":\"Amount of sender\",\"sending_currency\":\"currency of the Sender country\",\"recipient__country\":\"Country name of receiver\",\"recipient_amount\":\"Amount will be recived\",\"recipient_currency\":\"Currency of the reciever country\",\"message\":\"Admin message\"}', 1, 1, '2021-11-03 12:00:00', '2021-11-04 09:02:58'),
(23, 'AGENT_ACCOUNT_CREATED', 'Agent - account - created', 'Agent account created successfully', '<div>Congratulations! Your account has been successfully created. Now you can use all the agent services we provide.</div><div><br></div><div>Use these credentials for your first login:</div><div><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">-&nbsp;</span><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">Username: {{username}}</span></div><div>- Password: {{password}}</div>\r\n<div><br></div><div>Please&nbsp;<a href=\"{{login_url}}\" title=\"Click this link\" target=\"_blank\">Click this link</a>&nbsp;to login and reset your password.</div><div><br></div><div>All the best.</div>', 'Congratulations! Your account has been successfully created. Now you can use all the agent services we provide. Use these credentials for your first login:\r\n- Username: {{username}}\r\n- Password: {{password}} \r\nPlease go {{login_url}} and reset your password. All the best.', '{\"username\": \"Username of created agent\",\"password\": \"Password of created agent\",\"login_link\": \"Agent login link\"}', 1, 1, '2021-11-03 12:00:00', '2022-06-04 05:07:43'),
(25, 'PUSH_NOTIFICATION', 'Push Notification', '{{title}}', '<div>{{title}}</div>{{subject}}<div><br></div>', '{{title}}\r\n{{subject}}', '{\"title\": \"Notification Title\",\"subject\": \"Notification Subject\"}', 0, 0, '2021-11-03 06:00:00', '2023-09-30 04:33:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `slug` varchar(40) DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"feature\",\"app\",\"service\",\"how_work\",\"transfer\",\"choose_us\",\"testimonial\",\"video\",\"counter\",\"how_to_receive\",\"faq\",\"blog\",\"brand\"]', 1, '2020-07-11 06:23:58', '2022-06-11 09:53:35'),
(4, 'Blog', 'blog', 'templates.basic.', NULL, 1, '2020-10-22 01:14:43', '2022-06-11 09:37:48'),
(5, 'Contact', 'contact', 'templates.basic.', '[\"faq\"]', 1, '2020-10-22 01:14:53', '2022-06-11 09:40:17'),
(19, 'About Us', 'about-us', 'templates.default.', '[\"about\",\"blog\",\"counter\"]', 0, '2022-04-23 10:32:21', '2022-04-23 10:32:21'),
(20, 'FAQ', 'faq', 'templates.default.', '[\"faq\",\"call_to_action\",\"blog\"]', 0, '2022-04-23 10:32:21', '2022-04-23 10:32:21'),
(22, 'About', 'about-us', 'templates.basic.', '[\"about\",\"how_to_receive\",\"blog\",\"brand\"]', 0, '2022-05-26 10:33:43', '2022-06-01 07:50:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recipients`
--

CREATE TABLE `recipients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sending_purposes`
--

CREATE TABLE `sending_purposes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `send_money`
--

CREATE TABLE `send_money` (
  `id` int(10) UNSIGNED NOT NULL,
  `mtcn_number` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `country_delivery_method_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'receiver country delivery method',
  `service_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'receiver country service',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `service_form_data` text DEFAULT NULL COMMENT 'receiver country service form',
  `base_currency_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `base_currency_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `sending_country_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sending_currency` varchar(255) DEFAULT NULL,
  `sending_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `sending_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `recipient_country_id` int(10) UNSIGNED NOT NULL,
  `recipient_currency` varchar(255) DEFAULT NULL,
  `recipient_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `conversion_rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `base_currency_rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `sender` longtext DEFAULT NULL,
  `recipient` longtext DEFAULT NULL,
  `source_of_fund_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sending_purpose_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `verification_code` varchar(40) DEFAULT NULL,
  `verification_time` datetime NOT NULL DEFAULT current_timestamp(),
  `payout_by` int(10) UNSIGNED DEFAULT 0,
  `payment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = initiated; 1 = success; 2 = pending; 3 = rejected',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = initiated, 1 = completed, 2 = pending, 3 = refunded	',
  `admin_feedback` longtext DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_delivery_method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `source_of_funds`
--

CREATE TABLE `source_of_funds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `support_messages`
--

INSERT INTO `support_messages` (`id`, `support_ticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Hi there \r\n \r\nJust checked your remesasyeshay.com baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Calhoun\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', '2024-01-27 19:26:16', '2024-01-27 19:26:16'),
(2, 2, 0, 'Ofokfojfief jwlkfeejereghfj iewojfekfjergij wiojewjfewitghuhwrgtjgh ewjhfwqjhdfuewgtuiwe huegfrwgyewgtywegt remesasyeshay.com', '2024-01-28 13:43:49', '2024-01-28 13:43:49'),
(3, 3, 0, 'Howdy \r\n \r\nI have just verified your SEO on  remesasyeshay.com for its SEO metrics and saw that your website could use an upgrade. \r\n \r\nWe will increase your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Forman\r\n \r\nDigital X SEO Experts', '2024-01-31 03:07:01', '2024-01-31 03:07:01'),
(4, 4, 0, 'You are reading this message and I can make your ad message reach millions of sites in the same manner. It\'s a low-priced and efficient way to spread your message.For more information, please email me or skype me below.\r\n\r\nP. Stewart\r\nEmail: 3qv8f8@gomail2.xyz\r\nSkype: live:.cid.37ffc6c14225a4a8', '2024-01-31 03:14:57', '2024-01-31 03:14:57'),
(5, 5, 0, 'Hello, \r\n \r\nWe extend warm greetings to your esteemed company and formally invite you to register as a vendor for potential partnerships in upcoming projects with SAUDI ARAMCO/UAE in 2024/2025. \r\n \r\nThese projects offer a global opportunity, welcoming participation from companies worldwide. Should your company express interest in this endeavor, we kindly request confirmation by contacting ibrahim@aramcointernational.net of intent by requesting the necessary documents. \r\n \r\nYour interest is highly valued, and we eagerly await your prompt response. \r\n \r\nBest Regards, \r\n \r\nMr. Sam Ibrahim \r\nibrahim@aramcointernational.net \r\nhttp://www.aramcointernational.net/ \r\nContract & Supplier Services Management', '2024-01-31 05:29:40', '2024-01-31 05:29:40'),
(6, 6, 0, 'Greetings\r\n\r\nFor a limited time we would like to offer you a NO-COST Reputation Video that you can put on your Website, LinkedIn, Facebook, Instagram etc.\r\n\r\nWe simply turn your static 5 Star Reviews into SEO content and will be seen on the Front Page of Google when prospects are looking up your Online Reputation.\r\n\r\nWhat\'s the Catch - excellent question - if you like the video we produce for you, all we need from you is 3 referrals. When you introduce them to us, and they decide to work with us, they will get a 50% Discount from our retail pricing. But you get it for NO-COST just for introducing them to us!\r\n\r\nGET YOUR NO-COST VIDEO HERE:\r\nhttps://YourFreeReputationVideo.repvids.com\r\n\r\nThank You,\r\nMedia Relations', '2024-02-02 15:19:08', '2024-02-02 15:19:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `ticket` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `agent_id`, `name`, `email`, `ticket`, `subject`, `status`, `priority`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'Mike Calhoun', 'mikeFloonmela@gmail.com', '59294022', 'FREE fast ranks for remesasyeshay.com', 0, 2, '2024-01-27 19:26:16', '2024-01-27 19:26:16', '2024-01-27 19:26:16'),
(2, 0, 0, 'Charlesneuct', 'yasen.krasen.13+76457@mail.ru', '44801422', 'Miieefjief jiwjdwkijdwf iwkdqdjwifehfuwi kwkdwjejeieifw jwioodwijrewhe', 0, 2, '2024-01-28 13:43:49', '2024-01-28 13:43:49', '2024-01-28 13:43:49'),
(3, 0, 0, 'Mike Forman', 'peterHeituit@gmail.com', '40944987', 'Whitehat SEO for remesasyeshay.com', 0, 2, '2024-01-31 03:07:01', '2024-01-31 03:07:01', '2024-01-31 03:07:01'),
(4, 0, 0, 'Horace Tubb', 'horace.tubb@msn.com', '14713682', 'To the remesasyeshay.com Owner.', 0, 2, '2024-01-31 03:14:57', '2024-01-31 03:14:57', '2024-01-31 03:14:57'),
(5, 0, 0, 'Sam Ibrahim', 'aramco@mbox.re', '06831002', 'Expression of Interest for Vendors and Partnership Registration', 0, 2, '2024-01-31 05:29:40', '2024-01-31 05:29:40', '2024-01-31 05:29:40'),
(6, 0, 0, 'Kirk Bassler', 'bassler.kirk@googlemail.com', '12586169', 'Hi remesasyeshay.com Owner.', 0, 2, '2024-02-02 15:19:08', '2024-02-02 15:19:08', '2024-02-02 15:19:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(40) DEFAULT NULL,
  `update_log` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_bonus_given` int(10) UNSIGNED DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `type` tinyint(1) DEFAULT 0,
  `business_profile_data` text DEFAULT NULL,
  `kyc_data` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified	',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `per_send_money_limit` decimal(28,8) DEFAULT 0.00000000,
  `daily_send_money_limit` decimal(28,8) DEFAULT 0.00000000,
  `monthly_send_money_limit` decimal(28,8) DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indices de la tabla `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indices de la tabla `agent_password_resets`
--
ALTER TABLE `agent_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `country_delivery_method`
--
ALTER TABLE `country_delivery_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `delivery_method_id` (`delivery_method_id`);

--
-- Indices de la tabla `cron_jobs`
--
ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cron_schedules`
--
ALTER TABLE `cron_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `currency_conversion_rates`
--
ALTER TABLE `currency_conversion_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `delivery_methods`
--
ALTER TABLE `delivery_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sending_purposes`
--
ALTER TABLE `sending_purposes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `send_money`
--
ALTER TABLE `send_money`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sending_country_id` (`sending_country_id`),
  ADD KEY `recipient_country_id` (`recipient_country_id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `source_of_funds`
--
ALTER TABLE `source_of_funds`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indices de la tabla `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `agent_password_resets`
--
ALTER TABLE `agent_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `country_delivery_method`
--
ALTER TABLE `country_delivery_method`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cron_jobs`
--
ALTER TABLE `cron_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cron_schedules`
--
ALTER TABLE `cron_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `currency_conversion_rates`
--
ALTER TABLE `currency_conversion_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `delivery_methods`
--
ALTER TABLE `delivery_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT de la tabla `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recipients`
--
ALTER TABLE `recipients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sending_purposes`
--
ALTER TABLE `sending_purposes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `send_money`
--
ALTER TABLE `send_money`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `source_of_funds`
--
ALTER TABLE `source_of_funds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
