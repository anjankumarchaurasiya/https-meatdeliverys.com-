-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2022 at 05:28 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meatdelivery_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `remember_token` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_notification`
--

CREATE TABLE `admin_notification` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `title1` varchar(255) DEFAULT NULL,
  `title2` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `off` varchar(10) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `title1`, `title2`, `url`, `off`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nuts & Snacks', 'Buy More & Save More', 'https://meatdeliverys.com/', '6%', '1631101259.jpg', 0, '2021-09-07 18:32:31', '2021-10-09 15:17:44'),
(2, 'Chicken', 'Buy More & Save More', 'https://meatdeliverys.com/', '5%', '1631101228.jpg', 0, '2021-09-07 18:34:24', '2021-10-09 15:17:24'),
(3, 'Fresh raw meat', 'Greate Offers', 'https://meatdeliverys.com/', '9', '1631102220.jpg', 0, '2021-09-08 11:54:53', '2021-10-09 15:16:49');

-- --------------------------------------------------------

--
-- Table structure for table `company_setting`
--

CREATE TABLE `company_setting` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(50) NOT NULL,
  `logo_dark` varchar(255) DEFAULT NULL,
  `responsive_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_setting`
--

INSERT INTO `company_setting` (`id`, `name`, `address`, `location`, `phone`, `email`, `website`, `description`, `logo`, `logo_dark`, `responsive_logo`, `favicon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MeatDeliverys', 'No. 1983, South end D street road, Jaynagar 9th block, Bangalore Karnataka 560069', 'US', '9931762370', 'meatdeliverys@gmail.com', 'https://meatdeliverys.com/', 'The entire food industry is booming with Application launches and campaigns to generate a user base.\r\nThe restaurant business is in revolutionizing pace. Food chain business is competing in the market with technology but the sure-shot solution is Applicat', '6157088965ad9.png', '6157088965ad9.png', '60bb4appa6554.svg', '615709ebcd106.jpg', '2019-11-15 00:00:00', '2021-10-09 14:03:51', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `discount` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `max_use` int(11) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `end_date` varchar(50) NOT NULL,
  `use_count` int(11) NOT NULL,
  `use_for` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `country`, `currency`, `code`, `symbol`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek'),
(2, 'America', 'Dollars', 'USD', '$'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋'),
(4, 'Argentina', 'Pesos', 'ARS', '$'),
(5, 'Aruba', 'Guilders', 'AWG', 'Afl'),
(6, 'Australia', 'Dollars', 'AUD', '$'),
(7, 'Azerbaijan', 'New Manats', 'AZN', '₼'),
(8, 'Bahamas', 'Dollars', 'BSD', '$'),
(9, 'Barbados', 'Dollars', 'BBD', '$'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.'),
(11, 'Belgium', 'Euro', 'EUR', '€'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$'),
(13, 'Bermuda', 'Dollars', 'BMD', '$'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM'),
(16, 'Botswana', 'Pula', 'BWP', 'P'),
(17, 'Bulgaria', 'Leva', 'BGN', 'Лв.'),
(18, 'Brazil', 'Reais', 'BRL', 'R$'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£\r\n'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$'),
(21, 'Cambodia', 'Riels', 'KHR', '៛'),
(22, 'Canada', 'Dollars', 'CAD', '$'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$'),
(24, 'Chile', 'Pesos', 'CLP', '$'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥'),
(26, 'Colombia', 'Pesos', 'COP', '$'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn'),
(29, 'Cuba', 'Pesos', 'CUP', '₱'),
(30, 'Cyprus', 'Euro', 'EUR', '€'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$'),
(35, 'Egypt', 'Pounds', 'EGP', '£'),
(36, 'El Salvador', 'Colones', 'SVC', '$'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£'),
(38, 'Euro', 'Euro', 'EUR', '€'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£'),
(40, 'Fiji', 'Dollars', 'FJD', '$'),
(41, 'France', 'Euro', 'EUR', '€'),
(42, 'Ghana', 'Cedis', 'GHC', 'GH₵'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£'),
(44, 'Greece', 'Euro', 'EUR', '€'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q'),
(46, 'Guernsey', 'Pounds', 'GGP', '£'),
(47, 'Guyana', 'Dollars', 'GYD', '$'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr'),
(53, 'India', 'Rupees', 'INR', '₹'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp'),
(55, 'Iran', 'Rials', 'IRR', '﷼'),
(56, 'Ireland', 'Euro', 'EUR', '€'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£'),
(58, 'Israel', 'New Shekels', 'ILS', '₪'),
(59, 'Italy', 'Euro', 'EUR', '€'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$'),
(61, 'Japan', 'Yen', 'JPY', '¥'),
(62, 'Jersey', 'Pounds', 'JEP', '£'),
(63, 'Kazakhstan', 'Tenge', 'KZT', '₸'),
(64, 'Korea (North)', 'Won', 'KPW', '₩'),
(65, 'Korea (South)', 'Won', 'KRW', '₩'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'Лв'),
(67, 'Laos', 'Kips', 'LAK', '	₭'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls'),
(69, 'Lebanon', 'Pounds', 'LBP', '£'),
(70, 'Liberia', 'Dollars', 'LRD', '$'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt'),
(73, 'Luxembourg', 'Euro', 'EUR', '€'),
(74, 'Macedonia', 'Denars', 'MKD', 'Ден\r\n'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM'),
(76, 'Malta', 'Euro', 'EUR', '€'),
(77, 'Mauritius', 'Rupees', 'MUR', '₹'),
(78, 'Mexico', 'Pesos', 'MXN', '$'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮'),
(80, 'Mozambique', 'Meticais', 'MZN', 'MT'),
(81, 'Namibia', 'Dollars', 'NAD', '$'),
(82, 'Nepal', 'Rupees', 'NPR', '₹'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ'),
(84, 'Netherlands', 'Euro', 'EUR', '€'),
(85, 'New Zealand', 'Dollars', 'NZD', '$'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$'),
(87, 'Nigeria', 'Nairas', 'NGN', '₦'),
(88, 'North Korea', 'Won', 'KPW', '₩'),
(89, 'Norway', 'Krone', 'NOK', 'kr'),
(90, 'Oman', 'Rials', 'OMR', '﷼'),
(91, 'Pakistan', 'Rupees', 'PKR', '₹'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs'),
(94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php'),
(96, 'Poland', 'Zlotych', 'PLN', 'zł'),
(97, 'Qatar', 'Rials', 'QAR', '﷼'),
(98, 'Romania', 'New Lei', 'RON', 'lei'),
(99, 'Russia', 'Rubles', 'RUB', '₽'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼'),
(102, 'Serbia', 'Dinars', 'RSD', 'ع.د'),
(103, 'Seychelles', 'Rupees', 'SCR', '₹'),
(104, 'Singapore', 'Dollars', 'SGD', '$'),
(105, 'Slovenia', 'Euro', 'EUR', '€'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$'),
(107, 'Somalia', 'Shillings', 'SOS', 'S'),
(108, 'South Africa', 'Rand', 'ZAR', 'R'),
(109, 'South Korea', 'Won', 'KRW', '₩'),
(110, 'Spain', 'Euro', 'EUR', '€'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₹'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF'),
(114, 'Suriname', 'Dollars', 'SRD', '$'),
(115, 'Syria', 'Pounds', 'SYP', '£'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$'),
(117, 'Thailand', 'Baht', 'THB', '฿'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$'),
(119, 'Turkey', 'Lira', 'TRY', 'TL'),
(120, 'Turkey', 'Liras', 'TRL', '₺'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£'),
(124, 'United States of America', 'Dollars', 'USD', '$'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U'),
(126, 'Uzbekistan', 'Sums', 'UZS', 'so\'m'),
(127, 'Vatican City', 'Euro', 'EUR', '€'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs'),
(129, 'Vietnam', 'Dong', 'VND', '₫\r\n'),
(130, 'Yemen', 'Rials', 'YER', '﷼'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `general_setting`
--

CREATE TABLE `general_setting` (
  `id` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `request_duration` int(11) DEFAULT NULL,
  `default_driver_radius` int(11) DEFAULT NULL,
  `sell_product` int(11) NOT NULL DEFAULT 0,
  `default_food_order_status` varchar(50) DEFAULT NULL,
  `default_grocery_order_status` varchar(50) DEFAULT NULL,
  `map_key` varchar(255) DEFAULT NULL,
  `lat` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `push_notification` int(11) NOT NULL,
  `onesignal_app_id` varchar(255) DEFAULT NULL,
  `onesignal_project_number` varchar(255) DEFAULT NULL,
  `onesignal_api_key` varchar(255) DEFAULT NULL,
  `onesignal_auth_key` varchar(255) DEFAULT NULL,
  `web_notification` int(11) NOT NULL DEFAULT 0,
  `web_onesignal_app_id` varchar(255) DEFAULT NULL,
  `web_onesignal_api_key` varchar(255) DEFAULT NULL,
  `web_onesignal_auth_key` varchar(255) DEFAULT NULL,
  `sms_twilio` int(11) NOT NULL,
  `twilio_account_id` varchar(255) DEFAULT NULL,
  `twilio_auth_token` varchar(255) DEFAULT NULL,
  `twilio_phone_number` varchar(50) DEFAULT NULL,
  `mail_notification` int(11) NOT NULL,
  `mail_host` varchar(255) DEFAULT NULL,
  `mail_port` varchar(255) DEFAULT NULL,
  `mail_username` varchar(255) DEFAULT NULL,
  `mail_password` varchar(255) DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `delivery_charge` varchar(255) DEFAULT NULL,
  `delivery_charge_amount` int(11) DEFAULT 0,
  `delivery_charge_per` int(11) DEFAULT 0,
  `commission_amount` int(11) NOT NULL DEFAULT 0,
  `commission_per` int(11) NOT NULL DEFAULT 0,
  `user_verify` int(11) NOT NULL,
  `phone_verify` int(11) NOT NULL,
  `email_verify` int(11) NOT NULL,
  `license_key` varchar(255) DEFAULT NULL,
  `license_name` varchar(255) DEFAULT NULL,
  `license_status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_setting`
--

INSERT INTO `general_setting` (`id`, `currency`, `request_duration`, `default_driver_radius`, `sell_product`, `default_food_order_status`, `default_grocery_order_status`, `map_key`, `lat`, `lang`, `push_notification`, `onesignal_app_id`, `onesignal_project_number`, `onesignal_api_key`, `onesignal_auth_key`, `web_notification`, `web_onesignal_app_id`, `web_onesignal_api_key`, `web_onesignal_auth_key`, `sms_twilio`, `twilio_account_id`, `twilio_auth_token`, `twilio_phone_number`, `mail_notification`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `sender_email`, `delivery_charge`, `delivery_charge_amount`, `delivery_charge_per`, `commission_amount`, `commission_per`, `user_verify`, `phone_verify`, `email_verify`, `license_key`, `license_name`, `license_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INR', 60000, 50, 2, 'Pending', 'Pending', '1', '12.9063', '77.5857', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 'SK48fbdc4933cab6fd6bbb41bbd8e65adc', 'rUzPTBtCsC78InLKwmGGj9Dm71wfssf0', '8073916617', 1, 'meatdeliverys.com', '465', 'noreply@meatdeliverys.com', 'Bangalore@007', 'noreply@meatdeliverys.com\r\n', '0', 50, 5, 20, 10, 1, 0, 1, NULL, NULL, 0, '2019-11-15 00:00:00', '2021-11-12 12:25:50', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_category`
--

CREATE TABLE `grocery_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_category`
--

INSERT INTO `grocery_category` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chicken', '1633790519.png', 0, '2021-09-08 10:28:14', '2021-10-09 14:41:59'),
(2, 'Mutton', '1633790888.png', 0, '2021-09-08 10:44:45', '2021-10-09 14:48:08'),
(3, 'Pork', '1633791178.png', 0, '2021-09-08 10:52:42', '2021-10-09 14:52:58'),
(4, 'Beef', '1633791663.png', 0, '2021-09-08 11:02:38', '2021-10-09 15:01:03'),
(5, 'Prawns', '1633791922.png', 0, '2021-09-08 11:34:30', '2021-10-09 15:05:22'),
(6, 'Fish', '1633792176.png', 0, '2021-09-08 11:37:46', '2021-10-09 15:09:36'),
(7, 'Country Chicken', '1635861935.jpg', 0, '2021-11-02 14:05:35', '2021-11-02 14:05:35'),
(8, 'Rabbit', '1635863474.png', 0, '2021-11-02 14:31:14', '2021-11-02 14:31:14'),
(9, 'Duck', '1635863754.png', 0, '2021-11-02 14:35:54', '2021-11-02 14:35:54'),
(10, 'Quail', '1635864349.jpg', 0, '2021-11-02 14:45:49', '2021-11-02 14:45:49'),
(11, 'Turkey', '1635864823.jpg', 0, '2021-11-02 14:53:43', '2021-11-02 14:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_item`
--

CREATE TABLE `grocery_item` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(255) DEFAULT NULL,
  `fake_price` int(11) DEFAULT NULL,
  `sell_price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `gallery` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_unit` varchar(20) NOT NULL,
  `top_featured` tinyint(1) NOT NULL DEFAULT 0,
  `detail` text NOT NULL,
  `detail_desc` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_item`
--

INSERT INTO `grocery_item` (`id`, `name`, `shop_id`, `user_id`, `category_id`, `subcategory_id`, `fake_price`, `sell_price`, `image`, `gallery`, `description`, `brand`, `weight`, `status`, `stock`, `stock_unit`, `top_featured`, `detail`, `detail_desc`, `created_at`, `updated_at`) VALUES
(61, 'Chicken Skinless ( Curry Cut )', 3, 1, 1, 1, 169, 151, '61588e601a5ca.png', '', 'Chicken Skinless  Curry Cut', NULL, NULL, 0, 100, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"151\",\"fake_price\":\"169\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Chicken Skinless ( Curry Cut )</span><br></p>', '2021-10-09 13:57:51', '2021-10-09 15:11:56'),
(63, 'Chicken Boneless ( curry cut )', 3, 1, 1, 1, 247, 218, '615ab2ab14e62.png', '', 'Chicken Boneless curry cut', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"218\",\"fake_price\":\"247\"}]', '<p>Chicken Boneless&nbsp; curry cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(64, 'Chicken Kheema / Mince', 3, 1, 1, 1, 251, 225, '615ab40b2bf4c.jpg', '', 'Chicken Kheema', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"225\",\"fake_price\":\"251\"}]', '<p>Chicken Kheema<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(65, 'Chicken Drumsticks ( With Skin )', 3, 1, 1, 1, 245, 218, '615ab61521156.jpg', '', 'Chicken Drumsticks With Skin', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"218\",\"fake_price\":\"245\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Chicken Drumsticks&nbsp; With Skin&nbsp;</span><br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(66, 'Chicken Lollipop', 3, 1, 1, 1, 245, 219, '615ab73de595b.jpg', '', 'Chicken Lollipop', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"219\",\"fake_price\":\"245\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Chicken Lollipop</span><br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(67, 'Chicken Wings ( with skin )', 3, 1, 1, 1, 246, 219, '615ab81ebd989.jpg', '', 'Chicken Wings  with skin', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"219\",\"fake_price\":\"246\"}]', '<p>Chicken Wings&nbsp; with skin<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(68, 'Chicken Breast Skinless Boneless ( Without Cutting )', 3, 1, 1, 1, 245, 217, '615ab96730eb7.jpg', '', 'Chicken Breast Skinless Boneless  Without Cutting', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"217\",\"fake_price\":\"245\"}]', '<p>Chicken Breast Skinless Boneless&nbsp; Without Cutting&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(69, 'Chicken Liver & Gizzard', 3, 1, 1, 1, 95, 85, '615aba326ec4b.jpg', '', 'Chicken Liver & Gizzard', 'chicken', NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"85\",\"fake_price\":\"95\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Chicken Liver &amp; Gizzard&nbsp;</span><br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(70, 'Chicken Skinless Whole Leg ( Without Cutting )', 3, 1, 1, 1, 215, 199, '615abb0b740b2.jpg', '', 'Chicken Skinless Whole Leg  Without Cutting', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"199\",\"fake_price\":\"215\"}]', '<p>Chicken Skinless Whole Leg&nbsp; Without Cutting&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(71, 'Chicken with skin ( Curry Cut )', 3, 1, 1, 1, 167, 151, '615abbb9d1eb5.jpg', '', 'Chicken with skin  Curry Cut', 'chicken', NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"151\",\"fake_price\":\"167\"}]', '<p>Chicken with skin&nbsp; Curry Cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(72, 'Chicken Whole thigh leg with skin ( Without Cut )', 3, 1, 1, 1, 168, 155, '615ad158e2f8b.jpg', '', 'Chicken Whole thigh leg with skin  Without Cut', NULL, NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"155\",\"fake_price\":\"168\"}]', '<p>Chicken Whole thigh leg with skin&nbsp; Without Cut&nbsp;</p><p><br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(73, 'Chicken Breast With skin ( Without Cut )', 3, 1, 1, 1, 244, 218, '615ad1edb8be9.jpg', '', 'Chicken Breast With skin  Without Cut', NULL, NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"218\",\"fake_price\":\"244\"}]', '<p>Chicken Breast With skin&nbsp; Without Cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(74, 'Chicken Drumsticks Skinless', 3, 1, 1, 1, 244, 219, '615ad2a7785b1.jpg', '', 'Chicken Drumsticks Skinless', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"219\",\"fake_price\":\"244\"}]', '<p>Chicken Drumsticks Skinless&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(75, 'Chicken Skinless Whole Bird  ( Without Cut )', 3, 1, 1, 1, 552, 449, '615ad51b16fd6.jpeg', '', 'Chicken Skinless Whole Bird  Without Cut', NULL, NULL, 0, 200, 'kg', 0, '[{\"qty\":\"1\",\"unit\":\"kg\",\"price\":\"449\",\"fake_price\":\"552\"}]', '<p>Chicken Skinless Whole Bird&nbsp; Without Cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(76, 'Chicken With Skin Whole Bird - ( Without Cut )', 3, 1, 1, 1, 455, 422, '615ad5d5e35e4.png', '', 'Chicken With Skin Whole Bird  Without Cut', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"1\",\"unit\":\"kg\",\"price\":\"422\",\"fake_price\":\"455\"}]', '<p>Chicken With Skin Whole Bird&nbsp; Without Cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(77, 'Chicken Skinless ( Biryani Cut )', 3, 1, 1, 1, 177, 155, '615ad736e1663.jpg', '', 'Chicken Skinless Biryani Cut', NULL, NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"155\",\"fake_price\":\"177\"}]', '<p>Chicken Skinless Biryani Cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(78, 'Chicken With Skin ( Biryani Cut )', 3, 1, 1, 1, 159, 148, '615ad9e0782d2.png', '', 'Chicken With Skin Biryani Cut', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"148\",\"fake_price\":\"159\"}]', '<p>Chicken With Skin Biryani Cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(79, 'Mutton Curry Cut ( Goat )', 3, 1, 2, 2, 467, 425, '615bc9c629fc9.jpg', '', 'Mutton Curry Cut ( Goat )', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"425\",\"fake_price\":\"467\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Mutton Curry Cut Goat&nbsp;</span><br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(80, 'Mutton Boneless Curry Cut ( Goat )', 3, 1, 2, 2, 670, 535, '615bcb0bd141d.jpg', '', 'Mutton Boneless Curry Cut Goat', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"535\",\"fake_price\":\"670\"}]', '<p>Mutton Boneless Curry Cut ( Goat )<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(81, 'Mutton  Liver', 3, 1, 2, 2, 450, 399, '615bcbdde4e44.jpg', '', 'Mutton  Liver', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"399\",\"fake_price\":\"450\"}]', '<p>Mutton&nbsp; Liver<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(82, 'Mutton Kheema', 3, 1, 2, 2, 590, 525, '615bce5eb32cd.png', '', 'Mutton Kheema', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"525\",\"fake_price\":\"590\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Mutton Kheema</span><br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(83, 'Mutton chops', 3, 1, 2, 2, 590, 444, '615bcf0567548.jpg', '', 'Mutton chops', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"444\",\"fake_price\":\"590\"}]', '<p>Mutton chops<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(84, 'Beef with Bone ( Curry Cut )', 3, 1, 4, 3, 270, 225, '615bd64bf1eca.jpg', '', 'Beef with Bone Curry Cut', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"225\",\"fake_price\":\"270\"}]', '<p>Beef with Bone Curry Cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(85, 'Beef Boneless ( Curry Cut )', 3, 1, 4, 3, 289, 249, '615bd6f5df1c7.jpg', '', 'Beef Boneless Curry Cut', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"249\",\"fake_price\":\"289\"}]', '<p>Beef Boneless Curry Cut&nbsp;<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(86, 'Beef Kheema', 3, 1, 4, 3, 299, 255, '615bd7da6904c.jpg', '', 'Beef Kheema', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"255\",\"fake_price\":\"299\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Beef Kheema</span><br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(87, 'Beef Boneless  Chops', 3, 1, 4, 3, 290, 265, '615bda0a9f492.jpg', '', 'Beef Boneless  Chops', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"265\",\"fake_price\":\"290\"}]', '<p>Beef Boneless&nbsp; Chops<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(88, 'Beef Slice Cut (Boneless)', 3, 1, 4, 3, 295, 265, '615bdc2698eef.jpg', '615bdc269908b.jpg', 'Beef Slice Cut Boneless', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"265\",\"fake_price\":\"295\"}]', '<p>Beef Slice Cut Boneless<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(89, 'Beef Rib chops', 3, 1, 4, 3, 270, 220, '615bdefbacf91.jpg', '', 'Beef Rib chops', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"220\",\"fake_price\":\"270\"}]', '<p>Beef Rib chops<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(90, 'Pork Boneless (Skinless)', 3, 1, 3, 4, 379, 315, '615be21648f67.jpg', '', 'Pork Boneless Skinless', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"315\",\"fake_price\":\"379\"}]', '<p>Pork Boneless Skinless<br></p>', '2021-10-09 13:57:51', '2021-10-09 13:57:51'),
(91, 'Chicken Skinless ( Curry Cut )', 1, 1, 1, 1, 169, 151, '61588e601a5ca.png', '', 'Chicken Skinless  Curry Cut', NULL, NULL, 0, 100, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"151\",\"fake_price\":\"169\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Chicken Skinless ( Curry Cut )</span><br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(92, 'Chicken Boneless ( curry cut )', 1, 1, 1, 1, 247, 218, '615ab2ab14e62.png', '', 'Chicken Boneless curry cut', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"218\",\"fake_price\":\"247\"}]', '<p>Chicken Boneless&nbsp; curry cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(93, 'Chicken Kheema / Mince', 1, 1, 1, 1, 251, 225, '615ab40b2bf4c.jpg', '', 'Chicken Kheema', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"225\",\"fake_price\":\"251\"}]', '<p>Chicken Kheema<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(94, 'Chicken Drumsticks ( With Skin )', 1, 1, 1, 1, 245, 218, '615ab61521156.jpg', '', 'Chicken Drumsticks With Skin', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"218\",\"fake_price\":\"245\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Chicken Drumsticks&nbsp; With Skin&nbsp;</span><br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(95, 'Chicken Lollipop', 1, 1, 1, 1, 245, 219, '615ab73de595b.jpg', '', 'Chicken Lollipop', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"219\",\"fake_price\":\"245\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Chicken Lollipop</span><br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(96, 'Chicken Wings ( with skin )', 1, 1, 1, 1, 246, 219, '615ab81ebd989.jpg', '', 'Chicken Wings  with skin', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"219\",\"fake_price\":\"246\"}]', '<p>Chicken Wings&nbsp; with skin<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(97, 'Chicken Breast Skinless Boneless ( Without Cutting )', 1, 1, 1, 1, 245, 217, '615ab96730eb7.jpg', '', 'Chicken Breast Skinless Boneless  Without Cutting', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"217\",\"fake_price\":\"245\"}]', '<p>Chicken Breast Skinless Boneless&nbsp; Without Cutting&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(98, 'Chicken Liver & Gizzard', 1, 1, 1, 1, 95, 85, '615aba326ec4b.jpg', '', 'Chicken Liver & Gizzard', 'chicken', NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"85\",\"fake_price\":\"95\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Chicken Liver &amp; Gizzard&nbsp;</span><br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(99, 'Chicken Skinless Whole Leg ( Without Cutting )', 1, 1, 1, 1, 215, 199, '615abb0b740b2.jpg', '', 'Chicken Skinless Whole Leg  Without Cutting', 'Chicken', NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"199\",\"fake_price\":\"215\"}]', '<p>Chicken Skinless Whole Leg&nbsp; Without Cutting&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(100, 'Chicken with skin ( Curry Cut )', 1, 1, 1, 1, 167, 151, '615abbb9d1eb5.jpg', '', 'Chicken with skin  Curry Cut', 'chicken', NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"151\",\"fake_price\":\"167\"}]', '<p>Chicken with skin&nbsp; Curry Cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(101, 'Chicken Whole thigh leg with skin ( Without Cut )', 1, 1, 1, 1, 168, 155, '615ad158e2f8b.jpg', '', 'Chicken Whole thigh leg with skin  Without Cut', NULL, NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"155\",\"fake_price\":\"168\"}]', '<p>Chicken Whole thigh leg with skin&nbsp; Without Cut&nbsp;</p><p><br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(102, 'Chicken Breast With skin ( Without Cut )', 1, 1, 1, 1, 244, 218, '615ad1edb8be9.jpg', '', 'Chicken Breast With skin  Without Cut', NULL, NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"218\",\"fake_price\":\"244\"}]', '<p>Chicken Breast With skin&nbsp; Without Cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(103, 'Chicken Drumsticks Skinless', 1, 1, 1, 1, 244, 219, '615ad2a7785b1.jpg', '', 'Chicken Drumsticks Skinless', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"219\",\"fake_price\":\"244\"}]', '<p>Chicken Drumsticks Skinless&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(104, 'Chicken Skinless Whole Bird  ( Without Cut )', 1, 1, 1, 1, 552, 449, '615ad51b16fd6.jpeg', '', 'Chicken Skinless Whole Bird  Without Cut', NULL, NULL, 0, 200, 'kg', 0, '[{\"qty\":\"1\",\"unit\":\"kg\",\"price\":\"449\",\"fake_price\":\"552\"}]', '<p>Chicken Skinless Whole Bird&nbsp; Without Cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(105, 'Chicken With Skin Whole Bird - ( Without Cut )', 1, 1, 1, 1, 455, 422, '615ad5d5e35e4.png', '', 'Chicken With Skin Whole Bird  Without Cut', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"1\",\"unit\":\"kg\",\"price\":\"422\",\"fake_price\":\"455\"}]', '<p>Chicken With Skin Whole Bird&nbsp; Without Cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(106, 'Chicken Skinless ( Biryani Cut )', 1, 1, 1, 1, 177, 155, '615ad736e1663.jpg', '', 'Chicken Skinless Biryani Cut', NULL, NULL, 0, 200, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"155\",\"fake_price\":\"177\"}]', '<p>Chicken Skinless Biryani Cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(107, 'Chicken With Skin ( Biryani Cut )', 1, 1, 1, 1, 159, 148, '615ad9e0782d2.png', '', 'Chicken With Skin Biryani Cut', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"148\",\"fake_price\":\"159\"}]', '<p>Chicken With Skin Biryani Cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(108, 'Mutton Curry Cut ( Goat )', 1, 1, 2, 2, 467, 425, '615bc9c629fc9.jpg', '', 'Mutton Curry Cut ( Goat )', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"425\",\"fake_price\":\"467\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Mutton Curry Cut Goat&nbsp;</span><br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(109, 'Mutton Boneless Curry Cut ( Goat )', 1, 1, 2, 2, 670, 535, '615bcb0bd141d.jpg', '', 'Mutton Boneless Curry Cut Goat', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"535\",\"fake_price\":\"670\"}]', '<p>Mutton Boneless Curry Cut ( Goat )<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(110, 'Mutton  Liver', 1, 1, 2, 2, 450, 399, '615bcbdde4e44.jpg', '', 'Mutton  Liver', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"399\",\"fake_price\":\"450\"}]', '<p>Mutton&nbsp; Liver<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(111, 'Mutton Kheema', 1, 1, 2, 2, 590, 525, '615bce5eb32cd.png', '', 'Mutton Kheema', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"525\",\"fake_price\":\"590\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Mutton Kheema</span><br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(112, 'Mutton chops', 1, 1, 2, 2, 590, 444, '615bcf0567548.jpg', '', 'Mutton chops', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"444\",\"fake_price\":\"590\"}]', '<p>Mutton chops<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(113, 'Beef with Bone ( Curry Cut )', 1, 1, 4, 3, 270, 225, '615bd64bf1eca.jpg', '', 'Beef with Bone Curry Cut', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"225\",\"fake_price\":\"270\"}]', '<p>Beef with Bone Curry Cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(114, 'Beef Boneless ( Curry Cut )', 1, 1, 4, 3, 289, 249, '615bd6f5df1c7.jpg', '', 'Beef Boneless Curry Cut', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"249\",\"fake_price\":\"289\"}]', '<p>Beef Boneless Curry Cut&nbsp;<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(115, 'Beef Kheema', 1, 1, 4, 3, 299, 255, '615bd7da6904c.jpg', '', 'Beef Kheema', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"255\",\"fake_price\":\"299\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Beef Kheema</span><br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(116, 'Beef Boneless  Chops', 1, 1, 4, 3, 290, 265, '615bda0a9f492.jpg', '', 'Beef Boneless  Chops', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"265\",\"fake_price\":\"290\"}]', '<p>Beef Boneless&nbsp; Chops<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(117, 'Beef Slice Cut (Boneless)', 1, 1, 4, 3, 295, 265, '615bdc2698eef.jpg', '615bdc269908b.jpg', 'Beef Slice Cut Boneless', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"265\",\"fake_price\":\"295\"}]', '<p>Beef Slice Cut Boneless<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(118, 'Beef Rib chops', 1, 1, 4, 3, 270, 220, '615bdefbacf91.jpg', '', 'Beef Rib chops', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"220\",\"fake_price\":\"270\"}]', '<p>Beef Rib chops<br></p>', '2021-10-09 16:07:26', '2021-10-09 16:07:26'),
(120, 'Pork with Bone (Skinless)', 3, 1, 3, 4, 330, 279, '61680cfaa5870.jpg', '', 'Pork with Bone Skinless', NULL, NULL, 0, 500, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"279\",\"fake_price\":\"330\"}]', '<p>Pork with Bone Skinless<br></p>', '2021-10-14 10:56:58', '2021-10-14 10:56:58'),
(121, 'Pork Boneless (Skinless)', 1, 1, 3, 4, 379, 315, '615be21648f67.jpg', '', 'Pork Boneless Skinless', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"315\",\"fake_price\":\"379\"}]', '<p>Pork Boneless Skinless<br></p>', '2021-10-14 11:06:05', '2021-10-14 11:06:05'),
(122, 'Pork with Bone (Skinless)', 1, 1, 3, 4, 330, 279, '61680cfaa5870.jpg', '', 'Pork with Bone Skinless', NULL, NULL, 0, 500, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"279\",\"fake_price\":\"330\"}]', '<p>Pork with Bone Skinless<br></p>', '2021-10-14 11:06:05', '2021-10-14 11:06:05'),
(151, 'Pork Boneless (Skinless)', 3, 1, 3, 4, 379, 315, '618a595c8ffcc.png', '', 'Pork Boneless Skinless', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"315\",\"fake_price\":\"379\"}]', '<p>Pork Boneless Skinless<br></p>', '2021-10-14 11:07:09', '2021-11-09 11:19:56'),
(153, 'Rabbit curry cut', 3, 1, 8, 6, 1350, 1150, '61815c214491d.jpg', '61815c2144d31.jpg', 'Rabbit curry cut', 'Rabbit curry cut', NULL, 0, 100, 'gm', 1, '[{\"qty\":\"1500\",\"unit\":\"gm\",\"price\":\"1150\",\"fake_price\":\"1350\"}]', '<p>Rabbit curry cut&nbsp;<br></p>', '2021-11-02 15:41:21', '2021-11-02 15:41:21'),
(154, 'Rabbit curry cut', 1, 1, 8, 6, 1350, 1150, '61815c214491d.jpg', '61815c2144d31.jpg', 'Rabbit curry cut', 'Rabbit curry cut', NULL, 0, 100, 'gm', 1, '[{\"qty\":\"1500\",\"unit\":\"gm\",\"price\":\"1150\",\"fake_price\":\"1350\"}]', '<p>Rabbit curry cut&nbsp;<br></p>', '2021-11-02 16:12:32', '2021-11-02 16:12:32'),
(155, 'Quail skinless', 3, 1, 10, 8, 330, 295, '618a46ce7a48c.jpg', '6181643abea89.jpg', 'Quail', 'Quail', NULL, 0, 100, 'unit', 0, '[{\"qty\":\"3\",\"unit\":\"unit\",\"price\":\"295\",\"fake_price\":\"330\"}]', '<h2 class=\"cat_name\" style=\"margin: auto 0px; padding: 3px 0px 0px; box-sizing: inherit; font-size: 24px; line-height: 1.28571em; font-family: Roboto, sans-serif; color: rgb(43, 47, 76); background-color: rgb(247, 247, 247);\">Quail</h2>', '2021-11-02 16:15:54', '2021-11-09 10:00:46'),
(156, 'Quail with skin', 3, 1, 10, 8, 320, 289, '618a4769eb5dc.jpg', '618a4769ebccf.jpg', 'Quail with skin', NULL, NULL, 0, 100, 'unit', 0, '[{\"qty\":\"3\",\"unit\":\"unit\",\"price\":\"289\",\"fake_price\":\"320\"}]', '<p>Quail with skin&nbsp;<br></p>', '2021-11-09 10:03:21', '2021-11-09 10:03:21'),
(157, 'Pork with Bone (With Skin)', 3, 1, 3, 4, 250, 225, '618a4ca0387cb.jpg', '618a4ca038a3c.jpg', 'Pork with Bone (With Skin)', NULL, NULL, 0, 100, 'kg', 1, '[{\"qty\":\"500\",\"unit\":\"kg\",\"price\":\"225\",\"fake_price\":\"250\"}]', '<p>Pork with Bone (With Skin)<br></p>', '2021-11-09 10:25:36', '2021-11-09 10:25:36'),
(162, 'Quail skinless', 1, 1, 10, 8, 330, 295, '618a46ce7a48c.jpg', '6181643abea89.jpg', 'Quail', 'Quail', NULL, 0, 100, 'unit', 0, '[{\"qty\":\"3\",\"unit\":\"unit\",\"price\":\"295\",\"fake_price\":\"330\"}]', '<h2 class=\"cat_name\" style=\"margin: auto 0px; padding: 3px 0px 0px; box-sizing: inherit; font-size: 24px; line-height: 1.28571em; font-family: Roboto, sans-serif; color: rgb(43, 47, 76); background-color: rgb(247, 247, 247);\">Quail</h2>', '2021-11-09 10:46:33', '2021-11-09 10:46:33'),
(163, 'Quail with skin', 1, 1, 10, 8, 320, 289, '618a4769eb5dc.jpg', '618a4769ebccf.jpg', 'Quail with skin', NULL, NULL, 0, 100, 'unit', 0, '[{\"qty\":\"3\",\"unit\":\"unit\",\"price\":\"289\",\"fake_price\":\"320\"}]', '<p>Quail with skin&nbsp;<br></p>', '2021-11-09 10:46:33', '2021-11-09 10:46:33'),
(164, 'Pork with Bone (With Skin)', 1, 1, 3, 4, 250, 225, '618a4ca0387cb.jpg', '618a4ca038a3c.jpg', 'Pork with Bone (With Skin)', NULL, NULL, 0, 100, 'kg', 1, '[{\"qty\":\"500\",\"unit\":\"kg\",\"price\":\"225\",\"fake_price\":\"250\"}]', '<p>Pork with Bone (With Skin)<br></p>', '2021-11-09 10:46:33', '2021-11-09 10:46:33'),
(165, 'Pork Boneless ( With Skin )', 3, 1, 3, 4, 330, 299, '618a5e2e40521.jpg', '618a5e2e40ba4.jpg', 'Pork Boneless With Skin', NULL, NULL, 0, 100, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"299\",\"fake_price\":\"330\"}]', '<p>Pork Boneless With Skin&nbsp;<br></p>', '2021-11-09 11:40:30', '2021-11-09 11:45:59'),
(166, 'Pork Bacon', 3, 1, 3, 4, 509, 475, '618a60f89d81d.jpg', '618a60f89d9b1.jpg', 'Pork Bacon Skinless', NULL, NULL, 0, 100, 'gm', 1, '[{\"qty\":\"400\",\"unit\":\"gm\",\"price\":\"475\",\"fake_price\":\"509\"}]', '<p>Pork Bacon Skinless&nbsp;<br></p>', '2021-11-09 11:52:24', '2021-11-09 11:52:24'),
(167, 'Pork Ribs ( Skinless )', 3, 1, 3, 4, 325, 289, '618a627e03cb6.jpg', '618a627e03e63.jpg', 'Pork Ribs ( Skinless )', NULL, NULL, 0, 100, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"289\",\"fake_price\":\"325\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Pork Ribs ( Skinless )</span><br></p>', '2021-11-09 11:58:54', '2021-11-09 11:58:54'),
(168, 'Pork Ribs  With Skin', 3, 1, 3, 4, 330, 290, '618a65e3e99c4.jpg', '618a65e3e9d7e.jpg', 'Pork Ribs  With Skin', NULL, NULL, 0, 100, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"290\",\"fake_price\":\"330\"}]', '<p>Pork Ribs&nbsp; With Skin&nbsp;<br></p>', '2021-11-09 12:13:23', '2021-11-09 12:13:23'),
(169, 'Pork Sausage', 3, 1, 3, 4, 429, 395, '618a66c249ae8.jpg', '618a66c249c5b.jpg', 'Pork Sausage', 'Pork Sausage', NULL, 0, 100, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"395\",\"fake_price\":\"429\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Pork Sausage</span><br></p>', '2021-11-09 12:17:06', '2021-11-09 12:17:06'),
(170, 'Pork Belly', 3, 1, 3, 4, 345, 315, '618a68ba57e6d.jpg', '618a68ba58011.jpg', 'Pork Belly', 'Pork Belly', NULL, 0, 1000, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"315\",\"fake_price\":\"345\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Pork Belly</span><br></p>', '2021-11-09 12:25:30', '2021-11-09 12:25:30'),
(171, 'Pork Kheema (Mince)', 3, 1, 3, 4, 450, 415, '618a69647c0df.jpg', '618a69647c2f3.jpg', 'Pork Kheema Mince', NULL, NULL, 0, 1000, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"415\",\"fake_price\":\"450\"}]', '<p>Pork Kheema Mince<br></p>', '2021-11-09 12:28:20', '2021-11-09 12:28:20'),
(172, 'Beef Boneless Without Cut', 3, 1, 4, 3, 269, 245, '618a6e3e7922f.jpg', '618a6e3e797d0.jpg', 'Beef Boneless Without Cut', NULL, NULL, 0, 1000, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"245\",\"fake_price\":\"269\"}]', '<p>Beef Boneless Without Cut<br></p>', '2021-11-09 12:49:02', '2021-11-09 12:49:02'),
(173, 'Prawns Medium (Without Tail and Head)', 3, 1, 5, 10, 610, 570, '618a72a64f529.jpg', '', 'Prawns Medium (Without Tail and Head)', NULL, NULL, 0, 1000, 'gm', 1, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"570\",\"fake_price\":\"610\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Prawns Medium (Without Tail and Head)</span><br></p>', '2021-11-09 13:07:50', '2021-11-09 13:07:50'),
(174, 'Prawns Medium ( With Tail & Head )', 3, 1, 5, 10, 430, 389, '618a73ffcec4e.jpg', '', 'Prawns Medium ( With Tail & Head )', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"389\",\"fake_price\":\"430\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Prawns Medium ( With Tail &amp; Head )</span><br></p>', '2021-11-09 13:13:35', '2021-11-09 13:13:35'),
(175, 'Prawns Small ( With Tail & Head )', 3, 1, 5, 10, 410, 385, '618a762634ba4.jpg', '', 'Prawns Small ( With Tail & Head )', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"385\",\"fake_price\":\"410\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Prawns Small ( With Tail &amp; Head )</span><br></p>', '2021-11-09 13:20:21', '2021-11-09 13:22:46'),
(176, 'Prawns Small ( Without Tail & Head )', 3, 1, 5, 10, 590, 550, '618a76cfe1fc6.jpg', '', 'Prawns Small ( Without Tail & Head )', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"550\",\"fake_price\":\"590\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Prawns Small ( Without Tail &amp; Head )</span><br></p>', '2021-11-09 13:25:35', '2021-11-09 13:25:35'),
(177, 'Mackeral Fish ( Bangda )  Cleaned', 3, 1, 6, 11, 355, 310, '618a7a079e901.jpg', '618a7a079ebc7.jpg', 'Mackeral Fish ( Bangda )  Cleaned', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"310\",\"fake_price\":\"355\"}]', '<p>Mackeral Fish ( Bangda )&nbsp; Cleaned<br></p>', '2021-11-09 13:39:19', '2021-11-09 13:39:19'),
(178, 'Mackeral / Bangda Fish Curry Cut ( Without Head )', 3, 1, 6, 11, 380, 335, '618a7b1ca6d70.jpg', '', 'Mackeral / Bangda Fish Curry Cut ( Without Head )', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"335\",\"fake_price\":\"380\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px; font-weight: 700;\">Mackeral / Bangda Fish Curry Cut ( Without Head )</span><br></p>', '2021-11-09 13:43:56', '2021-11-09 13:43:56'),
(179, 'Catla Fish Whole ( Without Cut )', 3, 1, 6, 11, 395, 345, '618a7eba79b37.jpg', '', 'Catla Fish Whole ( Without Cut )', NULL, NULL, 0, 1000, 'gm', 0, '[{\"qty\":\"500\",\"unit\":\"gm\",\"price\":\"345\",\"fake_price\":\"395\"}]', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Be Vietnam&quot;, sans-serif; font-size: 14px;\"><a href=\"https://www.meatdeliverys.com/category/6/fish\" target=\"_blank\">Catla Fish Whole ( Without Cut )</a></span><br></p>', '2021-11-09 13:59:22', '2021-11-09 13:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_order`
--

CREATE TABLE `grocery_order` (
  `id` int(11) NOT NULL,
  `order_no` varchar(50) NOT NULL,
  `location_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `deliveryBoy_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `payment` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `delivery_charge` int(11) NOT NULL,
  `delivery_type` varchar(50) DEFAULT NULL,
  `coupon_price` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `order_status` varchar(50) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `payment_token` varchar(50) DEFAULT NULL,
  `order_otp` int(11) DEFAULT NULL,
  `reject_by` varchar(255) DEFAULT NULL,
  `review_status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grocery_order`
--

INSERT INTO `grocery_order` (`id`, `order_no`, `location_id`, `customer_id`, `deliveryBoy_id`, `coupon_id`, `address_id`, `payment`, `date`, `time`, `delivery_charge`, `delivery_type`, `coupon_price`, `discount`, `order_status`, `payment_status`, `payment_type`, `payment_token`, `order_otp`, `reject_by`, `review_status`, `created_at`, `updated_at`) VALUES
(1, '#544335', 2, 5, NULL, NULL, 1, 1781, '2021-10-05', '10:44 PM', 50, 'delivery', 0, 0, 'OrderReady', 1, 'WHATSAPP', NULL, 5963, NULL, 0, '2021-10-05 17:14:33', '2021-10-08 13:11:58'),
(2, '#851082', 2, 5, NULL, NULL, 1, 50, '2021-10-05', '10:44 PM', 50, 'delivery', 0, 0, 'OrderReady', 0, 'COD', NULL, 2451, NULL, 0, '2021-10-05 17:14:56', '2021-10-08 13:12:02'),
(3, '#638333', 2, 12, NULL, NULL, 2, 365, '2021-10-08', '06:24 PM', 50, 'delivery', 0, 0, 'OrderReady', 0, 'COD', NULL, 2140, NULL, 0, '2021-10-08 12:54:11', '2021-10-08 13:12:10'),
(4, '#683440', 2, 12, NULL, NULL, 2, 270, '2021-10-08', '06:34 PM', 50, 'delivery', 0, 0, 'OrderReady', 0, 'COD', NULL, 8126, NULL, 0, '2021-10-08 13:04:27', '2021-10-08 13:12:17'),
(5, '#412302', 2, 12, NULL, NULL, 2, 270, '2021-10-08', '06:37 PM', 50, 'delivery', 0, 0, 'OrderReady', 0, 'COD', NULL, 2143, NULL, 0, '2021-10-08 13:07:15', '2021-10-08 13:12:20'),
(6, '#779012', 2, 12, NULL, NULL, 2, 205, '2021-10-08', '07:03 PM', 50, 'delivery', 0, 0, 'OrderReady', 0, 'COD', NULL, 2037, NULL, 0, '2021-10-08 13:33:31', '2021-10-14 09:38:57'),
(7, '#150649', 4, 12, NULL, NULL, 2, 560, '2021-10-14', '02:53 PM', 30, 'delivery', 0, 0, 'DriverReach', 1, 'WHATSAPP', NULL, 7861, NULL, 0, '2021-10-14 09:23:48', '2021-11-21 18:59:54'),
(8, '#393416', 4, 12, NULL, NULL, 2, 181, '2021-10-14', '02:57 PM', 30, 'delivery', 0, 0, 'Delivered', 1, 'WHATSAPP', NULL, 2108, NULL, 0, '2021-10-14 09:27:19', '2021-11-21 18:59:27'),
(9, '#579415', 4, 12, NULL, NULL, 2, 30, '2021-10-14', '02:57 PM', 30, 'delivery', 0, 0, 'Cancel', 1, 'WHATSAPP', NULL, 4195, NULL, 0, '2021-10-14 09:27:42', '2021-10-14 09:35:07'),
(10, '#148150', 4, 12, NULL, NULL, 2, 30, '2021-10-14', '02:57 PM', 30, 'delivery', 0, 0, 'Cancel', 1, 'WHATSAPP', NULL, 6605, NULL, 0, '2021-10-14 09:27:44', '2021-10-14 09:35:09'),
(11, '#620821', 4, 12, NULL, NULL, 2, 30, '2021-10-14', '02:57 PM', 30, 'delivery', 0, 0, 'Cancel', 1, 'WHATSAPP', NULL, 2259, NULL, 0, '2021-10-14 09:27:46', '2021-10-14 09:35:34'),
(12, '#100800', 4, 12, NULL, NULL, 2, 30, '2021-10-14', '03:11 PM', 30, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 6864, NULL, 0, '2021-10-14 09:41:52', '2021-10-14 10:14:33'),
(13, '#578923', 4, 12, NULL, NULL, 2, 345, '2021-10-14', '03:13 PM', 30, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 6861, NULL, 0, '2021-10-14 09:43:29', '2021-10-14 10:14:33'),
(14, '#441280', 4, 12, NULL, NULL, 2, 345, '2021-10-14', '03:13 PM', 30, 'delivery', 0, 0, 'Cancel', 0, 'COD', NULL, 1959, NULL, 0, '2021-10-14 09:43:30', '2021-11-17 17:05:31'),
(15, '#584183', 4, 6, NULL, NULL, 3, 326, '2021-10-14', '03:32 PM', 30, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 7775, NULL, 0, '2021-10-14 10:02:43', '2021-10-14 10:14:25'),
(16, '#319712', 4, 6, NULL, NULL, 3, 1035, '2021-10-14', '03:36 PM', 30, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 5170, NULL, 0, '2021-10-14 10:06:41', '2021-10-14 10:14:26'),
(17, '#885339', 4, 6, NULL, NULL, 3, 309, '2021-10-23', '09:48 AM', 30, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 8872, NULL, 0, '2021-10-23 04:18:21', '2021-10-30 03:53:01'),
(18, '#250942', 4, 6, NULL, NULL, 3, 309, '2021-10-24', '07:00 PM', 30, 'delivery', 0, 0, 'Approved', 1, 'WHATSAPP', NULL, 8373, NULL, 0, '2021-10-24 13:30:20', '2021-10-30 03:52:54'),
(19, '#807750', 4, 6, NULL, NULL, 3, 30, '2021-10-24', '07:00 PM', 30, 'delivery', 0, 0, 'Approved', 1, 'WHATSAPP', NULL, 4897, NULL, 0, '2021-10-24 13:30:47', '2021-10-30 03:52:58'),
(20, '#253958', 4, 6, NULL, NULL, 3, 30, '2021-10-24', '07:01 PM', 30, 'delivery', 0, 0, 'OrderReady', 0, 'COD', NULL, 6613, NULL, 0, '2021-10-24 13:31:07', '2021-11-09 14:12:47'),
(21, '#729515', 4, 6, NULL, NULL, 3, 1, '2021-11-02', '09:52 PM', 0, 'delivery', 0, 0, 'Cancel', 1, 'RAZOR', 'pay_IGnbt4ySi92sgz', 1866, NULL, 0, '2021-11-02 16:22:53', '2021-11-06 15:59:17'),
(22, '#779575', 4, 6, NULL, NULL, 3, 570, '2021-11-09', '09:12 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9231, NULL, 0, '2021-11-09 15:42:16', '2021-11-09 15:42:16'),
(23, '#514862', 4, 18, NULL, NULL, 4, 155, '2021-11-10', '09:51 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3741, NULL, 0, '2021-11-10 04:21:18', '2021-11-10 04:21:18'),
(24, '#658522', 4, 22, NULL, NULL, 5, 1650, '2021-11-17', '10:07 PM', 0, 'delivery', 0, 0, 'Cancel', 0, 'COD', NULL, 6268, NULL, 0, '2021-11-17 16:37:51', '2021-11-17 17:04:36'),
(25, '#621577', 4, 22, NULL, NULL, 5, 3353, '2021-11-21', '10:28 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4027, NULL, 0, '2021-11-21 04:58:28', '2021-11-21 04:58:28'),
(26, '#203554', 4, 22, NULL, NULL, 5, 3353, '2021-11-21', '10:33 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3965, NULL, 0, '2021-11-21 05:03:04', '2021-11-21 05:03:04'),
(27, '#629699', 4, 22, NULL, NULL, 5, 3353, '2021-11-21', '10:34 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 5614, NULL, 0, '2021-11-21 05:04:07', '2021-11-21 05:04:07'),
(28, '#969935', 4, 22, NULL, NULL, 5, 2865, '2021-11-21', '12:57 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 8569, NULL, 0, '2021-11-21 07:27:00', '2021-11-21 07:27:00'),
(29, '#905819', 4, 22, NULL, NULL, 5, 1603, '2021-11-21', '01:00 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9624, NULL, 0, '2021-11-21 07:30:49', '2021-11-21 07:30:49'),
(30, '#751141', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:03 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 6501, NULL, 0, '2021-11-21 07:33:02', '2021-11-21 07:33:02'),
(31, '#369375', 4, 22, NULL, NULL, 5, 577, '2021-11-21', '01:04 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9690, NULL, 0, '2021-11-21 07:34:21', '2021-11-21 07:34:21'),
(32, '#444453', 4, 22, NULL, NULL, 5, 422, '2021-11-21', '01:09 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4161, NULL, 0, '2021-11-21 07:39:23', '2021-11-21 07:39:23'),
(33, '#393169', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:33 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9269, NULL, 0, '2021-11-21 08:03:40', '2021-11-21 08:03:40'),
(34, '#210118', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:35 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9517, NULL, 0, '2021-11-21 08:05:45', '2021-11-21 08:05:45'),
(35, '#793380', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:37 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 5336, NULL, 0, '2021-11-21 08:07:31', '2021-11-21 08:07:31'),
(36, '#893663', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:41 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 1090, NULL, 0, '2021-11-21 08:11:57', '2021-11-21 08:11:57'),
(37, '#644569', 4, 22, NULL, NULL, 5, 148, '2021-11-21', '01:43 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 2922, NULL, 0, '2021-11-21 08:13:32', '2021-11-21 08:13:32'),
(38, '#240408', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:44 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 7281, NULL, 0, '2021-11-21 08:14:57', '2021-11-21 08:14:57'),
(39, '#707965', 4, 22, NULL, NULL, 5, 148, '2021-11-21', '01:46 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 2783, NULL, 0, '2021-11-21 08:16:42', '2021-11-21 08:16:42'),
(40, '#380309', 4, 22, NULL, NULL, 5, 148, '2021-11-21', '01:50 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4225, NULL, 0, '2021-11-21 08:20:58', '2021-11-21 08:20:58'),
(41, '#729208', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:55 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 7470, NULL, 0, '2021-11-21 08:25:10', '2021-11-21 08:25:10'),
(42, '#381710', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:55 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 8351, NULL, 0, '2021-11-21 08:25:16', '2021-11-21 08:25:16'),
(43, '#995627', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '01:57 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 7694, NULL, 0, '2021-11-21 08:27:31', '2021-11-21 08:27:31'),
(44, '#175454', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:01 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 6129, NULL, 0, '2021-11-21 08:31:53', '2021-11-21 08:31:53'),
(45, '#785415', 4, 22, NULL, NULL, 5, 422, '2021-11-21', '02:04 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 1631, NULL, 0, '2021-11-21 08:34:43', '2021-11-21 08:34:43'),
(46, '#612702', 4, 22, NULL, NULL, 5, 148, '2021-11-21', '02:08 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9845, NULL, 0, '2021-11-21 08:38:42', '2021-11-21 08:38:42'),
(47, '#712192', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:11 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3031, NULL, 0, '2021-11-21 08:41:54', '2021-11-21 08:41:54'),
(48, '#978058', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:14 PM', 0, 'delivery', 0, 0, 'Pending', 1, 'WHATSAPP', NULL, 7681, NULL, 0, '2021-11-21 08:44:47', '2021-11-21 08:44:47'),
(49, '#146753', 4, 22, NULL, NULL, 5, 0, '2021-11-21', '02:21 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 8920, NULL, 0, '2021-11-21 08:51:49', '2021-11-21 08:51:49'),
(50, '#497607', 4, 22, NULL, NULL, 5, 422, '2021-11-21', '02:22 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9937, NULL, 0, '2021-11-21 08:52:27', '2021-11-21 08:52:27'),
(51, '#664422', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:23 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 2249, NULL, 0, '2021-11-21 08:53:03', '2021-11-21 08:53:03'),
(52, '#875303', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:24 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 6125, NULL, 0, '2021-11-21 08:54:18', '2021-11-21 08:54:18'),
(53, '#224680', 4, 22, NULL, NULL, 5, 148, '2021-11-21', '02:26 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9271, NULL, 0, '2021-11-21 08:56:29', '2021-11-21 08:56:29'),
(54, '#251726', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:28 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9024, NULL, 0, '2021-11-21 08:58:23', '2021-11-21 08:58:23'),
(55, '#669591', 4, 22, NULL, NULL, 5, 245, '2021-11-21', '02:35 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9186, NULL, 0, '2021-11-21 09:05:51', '2021-11-21 09:05:51'),
(56, '#193968', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:39 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3767, NULL, 0, '2021-11-21 09:09:26', '2021-11-21 09:09:26'),
(57, '#584338', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:40 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9851, NULL, 0, '2021-11-21 09:10:13', '2021-11-21 09:10:13'),
(58, '#415223', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:42 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4165, NULL, 0, '2021-11-21 09:12:01', '2021-11-21 09:12:01'),
(59, '#593490', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '02:55 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9782, NULL, 0, '2021-11-21 09:25:56', '2021-11-21 09:25:56'),
(60, '#358935', 4, 22, NULL, NULL, 5, 871, '2021-11-21', '02:59 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4166, NULL, 0, '2021-11-21 09:29:23', '2021-11-21 09:29:23'),
(61, '#816851', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '03:32 PM', 0, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 4338, NULL, 0, '2021-11-21 10:02:32', '2021-11-21 12:10:02'),
(62, '#370350', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '03:33 PM', 0, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 3399, NULL, 0, '2021-11-21 10:03:49', '2021-11-21 12:10:01'),
(63, '#334191', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '03:34 PM', 0, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 1608, NULL, 0, '2021-11-21 10:04:37', '2021-11-21 12:09:59'),
(64, '#855764', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '03:40 PM', 0, 'delivery', 0, 0, 'Approved', 0, 'COD', NULL, 7023, NULL, 0, '2021-11-21 10:10:20', '2021-11-21 12:09:56'),
(65, '#614275', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '03:46 PM', 0, 'delivery', 0, 0, 'OutOfDelivery', 0, 'COD', NULL, 1685, NULL, 0, '2021-11-21 10:16:07', '2021-11-22 12:28:03'),
(66, '#350251', 4, 6, NULL, NULL, 3, 3222, '2021-11-21', '04:24 PM', 0, 'delivery', 0, 0, 'Cancel', 0, 'COD', NULL, 3801, NULL, 0, '2021-11-21 10:54:16', '2021-11-21 12:09:52'),
(67, '#553330', 4, 22, NULL, NULL, 5, 155, '2021-11-21', '04:27 PM', 0, 'delivery', 0, 0, 'Cancel', 0, 'COD', NULL, 1724, NULL, 0, '2021-11-21 10:57:27', '2021-11-21 12:09:49'),
(68, '#131535', 4, 22, NULL, NULL, 5, 3700, '2021-11-21', '04:32 PM', 0, 'delivery', 0, 0, 'Cancel', 0, 'COD', NULL, 4837, NULL, 0, '2021-11-21 11:02:05', '2021-11-21 12:09:46'),
(69, '#655077', 4, 22, NULL, NULL, 5, 449, '2021-11-21', '04:34 PM', 0, 'delivery', 0, 0, 'DriverApproved', 0, 'COD', NULL, 3183, NULL, 0, '2021-11-21 11:04:07', '2021-11-21 18:51:41'),
(70, '#829513', 4, 6, NULL, NULL, 3, 1150, '2021-11-22', '06:04 PM', 0, 'delivery', 0, 0, 'OutOfDelivery', 0, 'COD', NULL, 7438, NULL, 0, '2021-11-22 12:34:14', '2021-11-22 12:46:04'),
(71, '#724906', 4, 22, NULL, NULL, 5, 1140, '2021-11-22', '10:37 PM', 0, 'delivery', 0, 0, 'Pending', 1, 'WHATSAPP', NULL, 5246, NULL, 0, '2021-11-22 17:07:56', '2021-11-22 17:07:56'),
(72, '#387409', 4, 6, NULL, NULL, 3, 570, '2021-11-22', '10:43 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 1308, NULL, 0, '2021-11-22 17:13:37', '2021-11-22 17:13:37'),
(73, '#606454', 4, 22, NULL, NULL, 5, 570, '2021-11-22', '10:44 PM', 0, 'delivery', 0, 0, 'Pending', 1, 'WHATSAPP', NULL, 5641, NULL, 0, '2021-11-22 17:14:18', '2021-11-22 17:14:18'),
(74, '#610048', 4, 6, NULL, NULL, 3, 730, '2021-11-27', '04:18 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 2533, NULL, 0, '2021-11-27 10:48:15', '2021-11-27 10:48:15'),
(75, '#174272', 4, 6, NULL, NULL, 3, 148, '2021-12-09', '12:20 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 7555, NULL, 0, '2021-12-09 06:50:40', '2021-12-09 06:50:40'),
(76, '#651916', 4, 6, NULL, NULL, 3, 590, '2021-12-15', '09:13 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9579, NULL, 0, '2021-12-15 03:43:14', '2021-12-15 03:43:14'),
(77, '#656202', 4, 6, NULL, NULL, 3, 444, '2021-12-15', '09:34 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9364, NULL, 0, '2021-12-15 04:04:09', '2021-12-15 04:04:09'),
(78, '#183132', 2, 6, NULL, NULL, 3, 1875, '2021-12-15', '08:28 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 8909, NULL, 0, '2021-12-15 14:58:52', '2021-12-15 14:58:52'),
(79, '#243360', 4, 24, NULL, NULL, 6, 451, '2021-12-15', '01:30 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 1377, NULL, 0, '2021-12-15 20:00:10', '2021-12-15 20:00:10'),
(80, '#728550', 4, 24, NULL, NULL, 6, 1245, '2021-12-15', '01:44 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4987, NULL, 0, '2021-12-15 20:14:39', '2021-12-15 20:14:39'),
(81, '#266271', 4, 24, NULL, NULL, 6, 1245, '2021-12-15', '01:44 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4687, NULL, 0, '2021-12-15 20:14:49', '2021-12-15 20:14:49'),
(82, '#649887', 4, 24, NULL, NULL, 6, 0, '2021-12-15', '01:44 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4628, NULL, 0, '2021-12-15 20:14:52', '2021-12-15 20:14:52'),
(83, '#518431', 4, 24, NULL, NULL, 6, 490, '2021-12-15', '01:49 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4630, NULL, 0, '2021-12-15 20:19:55', '2021-12-15 20:19:55'),
(84, '#514381', 4, 24, NULL, NULL, 6, 415, '2021-12-15', '01:50 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4440, NULL, 0, '2021-12-15 20:20:58', '2021-12-15 20:20:58'),
(85, '#788756', 4, 24, NULL, NULL, 6, 444, '2021-12-15', '01:55 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 2422, NULL, 0, '2021-12-15 20:25:36', '2021-12-15 20:25:36'),
(86, '#879418', 4, 24, NULL, NULL, 6, 592, '2021-12-16', '09:40 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 1186, NULL, 0, '2021-12-16 04:10:33', '2021-12-16 04:10:33'),
(87, '#227357', 4, 24, NULL, NULL, 6, 1575, '2021-12-16', '09:44 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 6809, NULL, 0, '2021-12-16 04:14:57', '2021-12-16 04:14:57'),
(88, '#833322', 4, 24, NULL, NULL, 6, 1575, '2021-12-16', '09:45 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3664, NULL, 0, '2021-12-16 04:15:01', '2021-12-16 04:15:01'),
(89, '#563983', 2, 22, NULL, NULL, 5, 302, '2021-12-16', '08:50 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 6072, NULL, 0, '2021-12-16 15:20:28', '2021-12-16 15:20:28'),
(90, '#784228', 2, 22, NULL, NULL, 5, 867, '2021-12-16', '08:54 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9126, NULL, 0, '2021-12-16 15:24:41', '2021-12-16 15:24:41'),
(91, '#360065', 2, 22, NULL, NULL, 5, 151, '2021-12-16', '09:02 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 8476, NULL, 0, '2021-12-16 15:32:44', '2021-12-16 15:32:44'),
(92, '#993837', 2, 22, NULL, NULL, 5, 1031, '2021-12-16', '10:54 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 9868, NULL, 0, '2021-12-16 17:24:04', '2021-12-16 17:24:04'),
(93, '#408809', 2, 22, NULL, NULL, 5, 2451, '2021-12-16', '10:59 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 4264, NULL, 0, '2021-12-16 17:29:27', '2021-12-16 17:29:27'),
(94, '#874627', 2, 22, NULL, NULL, 5, 1301, '2021-12-16', '11:19 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3631, NULL, 0, '2021-12-16 17:49:54', '2021-12-16 17:49:54'),
(95, '#643704', 2, 22, NULL, NULL, 5, 279, '2021-12-16', '11:21 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3234, NULL, 0, '2021-12-16 17:51:38', '2021-12-16 17:51:38'),
(96, '#850187', 2, 22, NULL, NULL, 5, 1301, '2021-12-16', '11:24 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3231, NULL, 0, '2021-12-16 17:54:24', '2021-12-16 17:54:24'),
(97, '#655308', 2, 22, NULL, NULL, 5, 1301, '2021-12-16', '11:33 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 1060, NULL, 0, '2021-12-16 18:03:31', '2021-12-16 18:03:31'),
(98, '#737570', 2, 22, NULL, NULL, 5, 1301, '2021-12-16', '11:42 PM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 7080, NULL, 0, '2021-12-16 18:12:05', '2021-12-16 18:12:05'),
(99, '#170101', 2, 22, NULL, NULL, 5, 1301, '2021-12-16', '12:11 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 6459, NULL, 0, '2021-12-16 18:41:46', '2021-12-16 18:41:46'),
(100, '#200145', 4, 24, NULL, NULL, 6, 2695, '2021-12-16', '12:22 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3106, NULL, 0, '2021-12-16 18:52:26', '2021-12-16 18:52:26'),
(101, '#214815', 4, 24, NULL, NULL, 6, 1611, '2021-12-16', '01:36 AM', 0, 'delivery', 0, 0, 'Pending', 0, 'COD', NULL, 3897, NULL, 0, '2021-12-16 20:06:49', '2021-12-16 20:06:49'),
(102, '#581196', 4, 24, NULL, NULL, 6, 592, '2021-12-16', '01:51 AM', 0, 'delivery', 0, 0, 'Pending', 1, 'WHATSAPP', NULL, 1729, NULL, 0, '2021-12-16 20:21:56', '2021-12-16 20:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_order_child`
--

CREATE TABLE `grocery_order_child` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `unit_qty` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grocery_order_child`
--

INSERT INTO `grocery_order_child` (`id`, `order_id`, `item_id`, `shop_id`, `price`, `quantity`, `unit`, `unit_qty`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 1, 465, 3, 'gm', '500', '2021-10-05 17:14:33', '2021-10-05 17:14:33'),
(2, 1, 16, 1, 1266, 3, 'kg', '1', '2021-10-05 17:14:33', '2021-10-05 17:14:33'),
(3, 3, 30, 1, 315, 1, 'gm', '500', '2021-10-08 12:54:11', '2021-10-08 12:54:11'),
(4, 4, 29, 1, 220, 1, 'gm', '500', '2021-10-08 13:04:27', '2021-10-08 13:04:27'),
(5, 5, 29, 1, 220, 1, 'gm', '500', '2021-10-08 13:07:15', '2021-10-08 13:07:15'),
(6, 6, 17, 1, 155, 1, 'gm', '500', '2021-10-08 13:33:31', '2021-10-08 13:33:31'),
(7, 7, 88, 3, 530, 2, 'gm', '500', '2021-10-14 09:23:48', '2021-10-14 09:23:48'),
(8, 8, 61, 3, 151, 1, 'gm', '500', '2021-10-14 09:27:19', '2021-10-14 09:27:19'),
(9, 13, 90, 3, 315, 1, 'gm', '500', '2021-10-14 09:43:29', '2021-10-14 09:43:29'),
(10, 14, 90, 3, 315, 1, 'gm', '500', '2021-10-14 09:43:30', '2021-10-14 09:43:30'),
(11, 15, 78, 3, 296, 2, 'gm', '500', '2021-10-14 10:02:43', '2021-10-14 10:02:43'),
(12, 16, 89, 3, 220, 1, 'gm', '500', '2021-10-14 10:06:41', '2021-10-14 10:06:41'),
(13, 16, 88, 3, 265, 1, 'gm', '500', '2021-10-14 10:06:41', '2021-10-14 10:06:41'),
(14, 16, 87, 3, 265, 1, 'gm', '500', '2021-10-14 10:06:41', '2021-10-14 10:06:41'),
(15, 16, 86, 3, 255, 1, 'gm', '500', '2021-10-14 10:06:41', '2021-10-14 10:06:41'),
(16, 17, 120, 3, 279, 1, 'gm', '500', '2021-10-23 04:18:21', '2021-10-23 04:18:21'),
(17, 18, 120, 3, 279, 1, 'gm', '500', '2021-10-24 13:30:20', '2021-10-24 13:30:20'),
(18, 21, 155, 3, 1, 1, 'kg', '1', '2021-11-02 16:22:53', '2021-11-02 16:22:53'),
(19, 22, 173, 3, 570, 1, 'gm', '500', '2021-11-09 15:42:16', '2021-11-09 15:42:16'),
(20, 23, 77, 3, 155, 1, 'gm', '500', '2021-11-10 04:21:18', '2021-11-10 04:21:18'),
(21, 24, 176, 3, 1650, 3, 'gm', '500', '2021-11-17 16:37:51', '2021-11-17 16:37:51'),
(22, 25, 153, 3, 2300, 2, 'gm', '1500', '2021-11-21 04:58:28', '2021-11-21 04:58:28'),
(23, 25, 75, 3, 898, 2, 'kg', '1', '2021-11-21 04:58:28', '2021-11-21 04:58:28'),
(24, 25, 77, 3, 155, 1, 'gm', '500', '2021-11-21 04:58:28', '2021-11-21 04:58:28'),
(25, 26, 153, 3, 2300, 2, 'gm', '1500', '2021-11-21 05:03:04', '2021-11-21 05:03:04'),
(26, 26, 75, 3, 898, 2, 'kg', '1', '2021-11-21 05:03:04', '2021-11-21 05:03:04'),
(27, 26, 77, 3, 155, 1, 'gm', '500', '2021-11-21 05:03:04', '2021-11-21 05:03:04'),
(28, 27, 153, 3, 2300, 2, 'gm', '1500', '2021-11-21 05:04:07', '2021-11-21 05:04:07'),
(29, 27, 75, 3, 898, 2, 'kg', '1', '2021-11-21 05:04:07', '2021-11-21 05:04:07'),
(30, 27, 77, 3, 155, 1, 'gm', '500', '2021-11-21 05:04:07', '2021-11-21 05:04:07'),
(31, 28, 153, 3, 1150, 1, 'gm', '1500', '2021-11-21 07:27:00', '2021-11-21 07:27:00'),
(32, 28, 76, 3, 1266, 3, 'kg', '1', '2021-11-21 07:27:00', '2021-11-21 07:27:00'),
(33, 28, 75, 3, 449, 1, 'kg', '1', '2021-11-21 07:27:00', '2021-11-21 07:27:00'),
(34, 29, 76, 3, 844, 2, 'kg', '1', '2021-11-21 07:30:49', '2021-11-21 07:30:49'),
(35, 29, 77, 3, 310, 2, 'gm', '500', '2021-11-21 07:30:49', '2021-11-21 07:30:49'),
(36, 29, 75, 3, 449, 1, 'kg', '1', '2021-11-21 07:30:49', '2021-11-21 07:30:49'),
(37, 30, 77, 3, 155, 1, 'gm', '500', '2021-11-21 07:33:02', '2021-11-21 07:33:02'),
(38, 31, 77, 3, 155, 1, 'gm', '500', '2021-11-21 07:34:21', '2021-11-21 07:34:21'),
(39, 31, 76, 3, 422, 1, 'kg', '1', '2021-11-21 07:34:21', '2021-11-21 07:34:21'),
(40, 32, 76, 3, 422, 1, 'kg', '1', '2021-11-21 07:39:23', '2021-11-21 07:39:23'),
(41, 33, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:03:40', '2021-11-21 08:03:40'),
(42, 34, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:05:45', '2021-11-21 08:05:45'),
(43, 35, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:07:31', '2021-11-21 08:07:31'),
(44, 36, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:11:57', '2021-11-21 08:11:57'),
(45, 37, 78, 3, 148, 1, 'gm', '500', '2021-11-21 08:13:32', '2021-11-21 08:13:32'),
(46, 38, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:14:57', '2021-11-21 08:14:57'),
(47, 39, 78, 3, 148, 1, 'gm', '500', '2021-11-21 08:16:42', '2021-11-21 08:16:42'),
(48, 40, 78, 3, 148, 1, 'gm', '500', '2021-11-21 08:20:58', '2021-11-21 08:20:58'),
(49, 41, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:25:10', '2021-11-21 08:25:10'),
(50, 42, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:25:16', '2021-11-21 08:25:16'),
(51, 43, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:27:32', '2021-11-21 08:27:32'),
(52, 44, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:31:53', '2021-11-21 08:31:53'),
(53, 45, 76, 3, 422, 1, 'kg', '1', '2021-11-21 08:34:43', '2021-11-21 08:34:43'),
(54, 46, 78, 3, 148, 1, 'gm', '500', '2021-11-21 08:38:42', '2021-11-21 08:38:42'),
(55, 47, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:41:54', '2021-11-21 08:41:54'),
(56, 48, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:44:47', '2021-11-21 08:44:47'),
(57, 50, 76, 3, 422, 1, 'kg', '1', '2021-11-21 08:52:27', '2021-11-21 08:52:27'),
(58, 51, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:53:03', '2021-11-21 08:53:03'),
(59, 52, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:54:18', '2021-11-21 08:54:18'),
(60, 53, 78, 3, 148, 1, 'gm', '500', '2021-11-21 08:56:29', '2021-11-21 08:56:29'),
(61, 54, 77, 3, 155, 1, 'gm', '500', '2021-11-21 08:58:23', '2021-11-21 08:58:23'),
(62, 55, 172, 3, 245, 1, 'gm', '500', '2021-11-21 09:05:51', '2021-11-21 09:05:51'),
(63, 56, 77, 3, 155, 1, 'gm', '500', '2021-11-21 09:09:26', '2021-11-21 09:09:26'),
(64, 57, 77, 3, 155, 1, 'gm', '500', '2021-11-21 09:10:13', '2021-11-21 09:10:13'),
(65, 58, 77, 3, 155, 1, 'gm', '500', '2021-11-21 09:12:01', '2021-11-21 09:12:01'),
(66, 59, 77, 3, 155, 1, 'gm', '500', '2021-11-21 09:25:56', '2021-11-21 09:25:56'),
(67, 60, 76, 3, 422, 1, 'kg', '1', '2021-11-21 09:29:23', '2021-11-21 09:29:23'),
(68, 60, 75, 3, 449, 1, 'kg', '1', '2021-11-21 09:29:23', '2021-11-21 09:29:23'),
(69, 61, 77, 3, 155, 1, 'gm', '500', '2021-11-21 10:02:32', '2021-11-21 10:02:32'),
(70, 62, 77, 3, 155, 1, 'gm', '500', '2021-11-21 10:03:49', '2021-11-21 10:03:49'),
(71, 63, 77, 3, 155, 1, 'gm', '500', '2021-11-21 10:04:37', '2021-11-21 10:04:37'),
(72, 64, 77, 3, 155, 1, 'gm', '500', '2021-11-21 10:10:20', '2021-11-21 10:10:20'),
(73, 65, 77, 3, 155, 1, 'gm', '500', '2021-11-21 10:16:07', '2021-11-21 10:16:07'),
(74, 66, 78, 3, 296, 2, 'gm', '500', '2021-11-21 10:54:16', '2021-11-21 10:54:16'),
(75, 66, 77, 3, 310, 2, 'gm', '500', '2021-11-21 10:54:16', '2021-11-21 10:54:16'),
(76, 66, 76, 3, 844, 2, 'kg', '1', '2021-11-21 10:54:16', '2021-11-21 10:54:16'),
(77, 66, 75, 3, 898, 2, 'kg', '1', '2021-11-21 10:54:16', '2021-11-21 10:54:16'),
(78, 66, 74, 3, 438, 2, 'gm', '500', '2021-11-21 10:54:16', '2021-11-21 10:54:16'),
(79, 66, 73, 3, 436, 2, 'gm', '500', '2021-11-21 10:54:16', '2021-11-21 10:54:16'),
(80, 67, 77, 3, 155, 1, 'gm', '500', '2021-11-21 10:57:27', '2021-11-21 10:57:27'),
(81, 68, 171, 3, 830, 2, 'gm', '500', '2021-11-21 11:02:05', '2021-11-21 11:02:05'),
(82, 68, 170, 3, 315, 1, 'gm', '500', '2021-11-21 11:02:05', '2021-11-21 11:02:05'),
(83, 68, 169, 3, 395, 1, 'gm', '500', '2021-11-21 11:02:05', '2021-11-21 11:02:05'),
(84, 68, 173, 3, 570, 1, 'gm', '500', '2021-11-21 11:02:05', '2021-11-21 11:02:05'),
(85, 68, 179, 3, 345, 1, 'gm', '500', '2021-11-21 11:02:05', '2021-11-21 11:02:05'),
(86, 68, 176, 3, 550, 1, 'gm', '500', '2021-11-21 11:02:05', '2021-11-21 11:02:05'),
(87, 68, 177, 3, 310, 1, 'gm', '500', '2021-11-21 11:02:05', '2021-11-21 11:02:05'),
(88, 68, 175, 3, 385, 1, 'gm', '500', '2021-11-21 11:02:05', '2021-11-21 11:02:05'),
(89, 69, 75, 3, 449, 1, 'kg', '1', '2021-11-21 11:04:07', '2021-11-21 11:04:07'),
(90, 70, 153, 3, 1150, 1, 'gm', '1500', '2021-11-22 12:34:14', '2021-11-22 12:34:14'),
(91, 71, 173, 3, 1140, 2, 'gm', '500', '2021-11-22 17:07:56', '2021-11-22 17:07:56'),
(92, 72, 173, 3, 570, 1, 'gm', '500', '2021-11-22 17:13:37', '2021-11-22 17:13:37'),
(93, 73, 173, 3, 570, 1, 'gm', '500', '2021-11-22 17:14:18', '2021-11-22 17:14:18'),
(94, 74, 171, 3, 415, 1, 'gm', '500', '2021-11-27 10:48:15', '2021-11-27 10:48:15'),
(95, 74, 170, 3, 315, 1, 'gm', '500', '2021-11-27 10:48:15', '2021-11-27 10:48:15'),
(96, 75, 78, 3, 148, 1, 'gm', '500', '2021-12-09 06:50:40', '2021-12-09 06:50:40'),
(97, 76, 155, 3, 590, 2, 'unit', '3', '2021-12-15 03:43:15', '2021-12-15 03:43:15'),
(98, 77, 78, 3, 444, 3, 'gm', '500', '2021-12-15 04:04:09', '2021-12-15 04:04:09'),
(99, 78, 154, 1, 1150, 1, 'gm', '1500', '2021-12-15 14:58:52', '2021-12-15 14:58:52'),
(100, 78, 122, 1, 279, 1, 'gm', '500', '2021-12-15 14:58:52', '2021-12-15 14:58:52'),
(101, 78, 91, 1, 151, 1, 'gm', '500', '2021-12-15 14:58:52', '2021-12-15 14:58:52'),
(102, 78, 162, 1, 295, 1, 'unit', '3', '2021-12-15 14:58:52', '2021-12-15 14:58:52'),
(103, 79, 78, 3, 296, 2, 'gm', '500', '2021-12-15 20:00:10', '2021-12-15 20:00:10'),
(104, 79, 77, 3, 155, 1, 'gm', '500', '2021-12-15 20:00:10', '2021-12-15 20:00:10'),
(105, 80, 171, 3, 1245, 3, 'gm', '500', '2021-12-15 20:14:39', '2021-12-15 20:14:39'),
(106, 81, 171, 3, 1245, 3, 'gm', '500', '2021-12-15 20:14:49', '2021-12-15 20:14:49'),
(107, 83, 172, 3, 490, 2, 'gm', '500', '2021-12-15 20:19:55', '2021-12-15 20:19:55'),
(108, 84, 171, 3, 415, 1, 'gm', '500', '2021-12-15 20:20:58', '2021-12-15 20:20:58'),
(109, 85, 83, 3, 444, 1, 'gm', '500', '2021-12-15 20:25:36', '2021-12-15 20:25:36'),
(110, 86, 78, 3, 592, 4, 'gm', '500', '2021-12-16 04:10:33', '2021-12-16 04:10:33'),
(111, 87, 170, 3, 1575, 5, 'gm', '500', '2021-12-16 04:14:57', '2021-12-16 04:14:57'),
(112, 88, 170, 3, 1575, 5, 'gm', '500', '2021-12-16 04:15:01', '2021-12-16 04:15:01'),
(113, 89, 91, 1, 302, 2, 'gm', '500', '2021-12-16 15:20:28', '2021-12-16 15:20:28'),
(114, 90, 163, 1, 867, 3, 'unit', '3', '2021-12-16 15:24:41', '2021-12-16 15:24:41'),
(115, 91, 91, 1, 151, 1, 'gm', '500', '2021-12-16 15:32:44', '2021-12-16 15:32:44'),
(116, 92, 91, 1, 453, 3, 'gm', '500', '2021-12-16 17:24:04', '2021-12-16 17:24:04'),
(117, 92, 163, 1, 578, 2, 'unit', '3', '2021-12-16 17:24:04', '2021-12-16 17:24:04'),
(118, 93, 91, 1, 151, 1, 'gm', '500', '2021-12-16 17:29:27', '2021-12-16 17:29:27'),
(119, 93, 154, 1, 2300, 2, 'gm', '1500', '2021-12-16 17:29:27', '2021-12-16 17:29:27'),
(120, 94, 91, 1, 151, 1, 'gm', '500', '2021-12-16 17:49:54', '2021-12-16 17:49:54'),
(121, 94, 154, 1, 1150, 1, 'gm', '1500', '2021-12-16 17:49:54', '2021-12-16 17:49:54'),
(122, 95, 122, 1, 279, 1, 'gm', '500', '2021-12-16 17:51:38', '2021-12-16 17:51:38'),
(123, 96, 154, 1, 1150, 1, 'gm', '1500', '2021-12-16 17:54:24', '2021-12-16 17:54:24'),
(124, 96, 91, 1, 151, 1, 'gm', '500', '2021-12-16 17:54:24', '2021-12-16 17:54:24'),
(125, 97, 154, 1, 1150, 1, 'gm', '1500', '2021-12-16 18:03:31', '2021-12-16 18:03:31'),
(126, 97, 91, 1, 151, 1, 'gm', '500', '2021-12-16 18:03:31', '2021-12-16 18:03:31'),
(127, 98, 91, 1, 151, 1, 'gm', '500', '2021-12-16 18:12:05', '2021-12-16 18:12:05'),
(128, 98, 154, 1, 1150, 1, 'gm', '1500', '2021-12-16 18:12:05', '2021-12-16 18:12:05'),
(129, 99, 91, 1, 151, 1, 'gm', '500', '2021-12-16 18:41:46', '2021-12-16 18:41:46'),
(130, 99, 154, 1, 1150, 1, 'gm', '1500', '2021-12-16 18:41:46', '2021-12-16 18:41:46'),
(131, 100, 78, 3, 296, 2, 'gm', '500', '2021-12-16 18:52:26', '2021-12-16 18:52:26'),
(132, 100, 77, 3, 465, 3, 'gm', '500', '2021-12-16 18:52:26', '2021-12-16 18:52:26'),
(133, 100, 76, 3, 1266, 3, 'kg', '1', '2021-12-16 18:52:26', '2021-12-16 18:52:26'),
(134, 100, 75, 3, 449, 1, 'kg', '1', '2021-12-16 18:52:26', '2021-12-16 18:52:26'),
(135, 100, 74, 3, 219, 1, 'gm', '500', '2021-12-16 18:52:26', '2021-12-16 18:52:26'),
(136, 101, 61, 3, 151, 1, 'gm', '500', '2021-12-16 20:06:49', '2021-12-16 20:06:49'),
(137, 101, 171, 3, 830, 2, 'gm', '500', '2021-12-16 20:06:49', '2021-12-16 20:06:49'),
(138, 101, 170, 3, 630, 2, 'gm', '500', '2021-12-16 20:06:49', '2021-12-16 20:06:49'),
(139, 102, 78, 3, 592, 4, 'gm', '500', '2021-12-16 20:21:56', '2021-12-16 20:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_review`
--

CREATE TABLE `grocery_review` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `deliveryBoy_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `rate` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grocery_shop`
--

CREATE TABLE `grocery_shop` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `radius` int(11) NOT NULL,
  `open_time` varchar(255) NOT NULL,
  `close_time` varchar(255) NOT NULL,
  `delivery_type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_shop`
--

INSERT INTO `grocery_shop` (`id`, `name`, `user_id`, `location`, `category_id`, `image`, `cover_image`, `description`, `address`, `latitude`, `longitude`, `website`, `phone`, `radius`, `open_time`, `close_time`, `delivery_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chennai', 1, 2, '11,10,9,8,7,6,5,4,3,2,1', '6161a73b39a3a.jpeg', '6161a73b39bd5.jpeg', 'chennai all areas delivery\'s available', 'Chennai', '13.0827', '80.2707', 'https://meatdeliverys.com/', '9731603602', 50, '12:00 AM', '11:59 PM', 'Home', 0, '2021-09-08 15:21:50', '2021-11-02 16:11:06'),
(2, 'Hyderabad', 1, 1, '6,5,4,3,2,1', '6161bd420675a.jpeg', '6161bd4206927.jpeg', 'delivery\'s available', 'Hyderabad', '17.3850', '78.4867', 'https://meatdeliverys.com/', '9916443606', 70, '12:00 AM', '11:59 PM', 'Home', 1, '2021-10-05 16:32:01', '2021-10-09 16:04:05'),
(3, 'Bangalore', 1, 4, '11,10,9,8,7,6,5,4,3,2,1', '61619f6f665b9.jpeg', '61619f6f6674f.jpeg', 'Bangalore all areas delivery\'s available', 'bangalore', '12.9716', '77.5946', 'https://meatdeliverys.com/', '9731603602', 50, '12:00 AM', '11:59 PM', 'Home', 0, '2021-10-09 13:55:59', '2021-11-02 15:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_sub_category`
--

CREATE TABLE `grocery_sub_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_sub_category`
--

INSERT INTO `grocery_sub_category` (`id`, `name`, `category_id`, `owner_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chicken', 1, 1, '1633790451.png', 0, '2021-10-02 16:29:02', '2021-10-09 14:40:51'),
(2, 'Mutton', 2, 1, '1633344203.jpg', 0, '2021-10-04 10:43:23', '2021-10-04 10:43:23'),
(3, 'Beef', 4, 1, '1633407155.jpg', 0, '2021-10-05 04:12:35', '2021-10-05 04:12:35'),
(4, 'Pork', 3, 1, '1633411166.jpg', 0, '2021-10-05 05:19:26', '2021-10-05 05:19:26'),
(5, 'Country Chicken', 7, 1, '1635866044.jpg', 0, '2021-11-02 15:14:04', '2021-11-02 15:14:04'),
(6, 'Rabbit', 8, 1, '1635866117.png', 0, '2021-11-02 15:15:17', '2021-11-02 15:15:17'),
(7, 'Duck', 9, 1, '1635866167.png', 0, '2021-11-02 15:16:07', '2021-11-02 15:16:07'),
(8, 'Quail', 10, 1, '1635866212.jpg', 0, '2021-11-02 15:16:52', '2021-11-02 15:16:52'),
(9, 'Turkey', 11, 1, '1635866261.jpg', 0, '2021-11-02 15:17:41', '2021-11-02 15:17:41'),
(10, 'Prawns', 5, 1, '1636463146.png', 0, '2021-11-09 13:05:46', '2021-11-09 13:05:46'),
(11, 'Fish', 6, 1, '1636465049.png', 0, '2021-11-09 13:37:29', '2021-11-09 13:37:29');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `file`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'english', 'english.json', '1627706646.png', 1, '2020-02-05 11:14:40', '2021-05-15 21:34:31'),
(2, 'arabic', 'arabic.json', '1627706690.png', 0, '2020-02-05 11:17:15', '2021-09-07 18:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `description` text DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `radius` int(11) DEFAULT NULL,
  `popular` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`, `address`, `description`, `phone`, `latitude`, `longitude`, `radius`, `popular`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hyderabad', 'Hyderabad', 'all areas delivery\'s available', '9916443605', '17.3850', '17.3850', 50, 0, 1, '2021-09-07 18:17:30', '2021-10-14 11:13:41', NULL),
(2, 'Chennai', 'Chennai', 'Chennai all areas delivery\'s available', '9916443605', '13.0827', '80.2707', 50, 1, 0, '2021-09-08 13:15:20', '2021-10-09 15:47:56', NULL),
(4, 'Bangalore', 'Bangalore', 'Bangalore all areas delivery\'s   available', '9916443605', '12.9716', '77.5946', 50, 1, 0, '2021-10-09 13:37:03', '2021-10-09 15:48:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(7, '2016_06_01_000004_create_oauth_clients_table', 2),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `notification_type` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `driver_id`, `order_id`, `title`, `message`, `image`, `notification_type`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, 1, 'Order Created', 'Dear Bala, Your Order is successfully created in JP Nagar. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-05 17:14:33', '2021-10-05 17:14:33'),
(2, 5, NULL, 2, 'Order Created', 'Dear Bala, Your Order is successfully created in JP Nagar. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-05 17:14:57', '2021-10-05 17:14:57'),
(3, 12, NULL, 3, 'Order Created', 'Dear Naga, Your Order is successfully created in JP Nagar. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-08 12:54:11', '2021-10-08 12:54:11'),
(4, 12, NULL, 4, 'Order Created', 'Dear Naga, Your Order is successfully created in JP Nagar. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-08 13:04:27', '2021-10-08 13:04:27'),
(5, 12, NULL, 5, 'Order Created', 'Dear Naga, Your Order is successfully created in JP Nagar. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-08 13:07:15', '2021-10-08 13:07:15'),
(6, 12, NULL, 6, 'Order Created', 'Dear Naga, Your Order is successfully created in JP Nagar. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-08 13:33:31', '2021-10-08 13:33:31'),
(7, 12, NULL, 7, 'Order Created', 'Dear Naga, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 09:23:55', '2021-10-14 09:23:55'),
(8, 12, NULL, 8, 'Order Created', 'Dear Naga, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 09:27:24', '2021-10-14 09:27:24'),
(9, 12, NULL, 9, 'Order Created', 'Dear Naga, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 09:27:46', '2021-10-14 09:27:46'),
(10, 12, NULL, 10, 'Order Created', 'Dear Naga, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 09:27:48', '2021-10-14 09:27:48'),
(11, 12, NULL, 11, 'Order Created', 'Dear Naga, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 09:27:50', '2021-10-14 09:27:50'),
(12, 12, NULL, 9, 'Grocery Order Cancled', 'Dear Naga, Your Order #579415 on Bangalore is Rejected by Restaurant. From MeatDeliverys', '1574861383.png', 'Grocery', '2021-10-14 09:35:07', '2021-10-14 09:35:07'),
(13, 12, NULL, 10, 'Grocery Order Cancled', 'Dear Naga, Your Order #148150 on Bangalore is Rejected by Restaurant. From MeatDeliverys', '1574861383.png', 'Grocery', '2021-10-14 09:35:09', '2021-10-14 09:35:09'),
(14, 12, NULL, 11, 'Order Cancel', 'Dear Naga, Your Order #620821 on Bangalore is successfully Cancel. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-10-14 09:35:39', '2021-10-14 09:35:39'),
(15, 12, NULL, 8, 'Order OrderReady', 'Dear Naga, Your Order #393416 on Bangalore is successfully OrderReady. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-10-14 09:38:24', '2021-10-14 09:38:24'),
(16, 12, NULL, 7, 'Order OrderReady', 'Dear Naga, Your Order #150649 on Bangalore is successfully OrderReady. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-10-14 09:38:45', '2021-10-14 09:38:45'),
(17, 12, NULL, 6, 'Order OrderReady', 'Dear Naga, Your Order #779012 on Chennai is successfully OrderReady. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-10-14 09:39:02', '2021-10-14 09:39:02'),
(18, 12, NULL, 12, 'Order Created', 'Dear Naga, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 09:41:56', '2021-10-14 09:41:56'),
(19, 12, NULL, 13, 'Order Created', 'Dear Naga, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 09:43:33', '2021-10-14 09:43:33'),
(20, 12, NULL, 14, 'Order Created', 'Dear Naga, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 09:43:34', '2021-10-14 09:43:34'),
(21, 6, NULL, 15, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 10:02:47', '2021-10-14 10:02:47'),
(22, 6, NULL, 16, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-14 10:06:45', '2021-10-14 10:06:45'),
(23, 6, NULL, 17, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-23 04:18:25', '2021-10-23 04:18:25'),
(24, 6, NULL, 18, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-24 13:30:24', '2021-10-24 13:30:24'),
(25, 6, NULL, 19, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-24 13:30:51', '2021-10-24 13:30:51'),
(26, 6, NULL, 20, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-10-24 13:31:11', '2021-10-24 13:31:11'),
(27, 6, NULL, 21, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-02 16:23:01', '2021-11-02 16:23:01'),
(28, 6, NULL, 22, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-09 15:42:20', '2021-11-09 15:42:20'),
(29, 18, NULL, 23, 'Order Created', 'Dear Haroon Rasheed, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-10 04:21:22', '2021-11-10 04:21:22'),
(30, 22, NULL, 24, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-17 16:37:56', '2021-11-17 16:37:56'),
(31, 22, NULL, 24, 'Order Approved', 'Dear ak, Your Order #658522 on Bangalore is successfully Approved. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-17 17:04:17', '2021-11-17 17:04:17'),
(32, 22, NULL, 24, 'Order Cancel', 'Dear ak, Your Order #658522 on Bangalore is successfully Cancel. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-17 17:04:41', '2021-11-17 17:04:41'),
(33, 12, NULL, 14, 'Order Cancel', 'Dear Naga, Your Order #441280 on Bangalore is successfully Cancel. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-17 17:05:35', '2021-11-17 17:05:35'),
(34, 22, NULL, 27, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 05:04:16', '2021-11-21 05:04:16'),
(35, 22, NULL, 28, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 07:27:05', '2021-11-21 07:27:05'),
(36, 22, NULL, 29, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 07:30:54', '2021-11-21 07:30:54'),
(37, 22, NULL, 30, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 07:33:17', '2021-11-21 07:33:17'),
(38, 22, NULL, 31, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 07:34:39', '2021-11-21 07:34:39'),
(39, 22, NULL, 32, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 07:39:39', '2021-11-21 07:39:39'),
(40, 22, NULL, 33, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:03:58', '2021-11-21 08:03:58'),
(41, 22, NULL, 34, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:06:01', '2021-11-21 08:06:01'),
(42, 22, NULL, 35, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:07:46', '2021-11-21 08:07:46'),
(43, 22, NULL, 36, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:12:13', '2021-11-21 08:12:13'),
(44, 22, NULL, 37, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:13:47', '2021-11-21 08:13:47'),
(45, 22, NULL, 38, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:15:12', '2021-11-21 08:15:12'),
(46, 22, NULL, 39, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:16:58', '2021-11-21 08:16:58'),
(47, 22, NULL, 40, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:21:14', '2021-11-21 08:21:14'),
(48, 22, NULL, 41, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:25:26', '2021-11-21 08:25:26'),
(49, 22, NULL, 42, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:25:31', '2021-11-21 08:25:31'),
(50, 22, NULL, 43, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:27:48', '2021-11-21 08:27:48'),
(51, 22, NULL, 44, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:32:11', '2021-11-21 08:32:11'),
(52, 22, NULL, 45, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:34:58', '2021-11-21 08:34:58'),
(53, 22, NULL, 46, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:38:57', '2021-11-21 08:38:57'),
(54, 22, NULL, 47, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:42:09', '2021-11-21 08:42:09'),
(55, 22, NULL, 48, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:45:03', '2021-11-21 08:45:03'),
(56, 22, NULL, 49, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:52:03', '2021-11-21 08:52:03'),
(57, 22, NULL, 50, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:52:40', '2021-11-21 08:52:40'),
(58, 22, NULL, 51, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:53:15', '2021-11-21 08:53:15'),
(59, 22, NULL, 52, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:54:31', '2021-11-21 08:54:31'),
(60, 22, NULL, 53, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:56:45', '2021-11-21 08:56:45'),
(61, 22, NULL, 54, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 08:58:38', '2021-11-21 08:58:38'),
(62, 22, NULL, 55, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 09:06:04', '2021-11-21 09:06:04'),
(63, 22, NULL, 56, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 09:09:41', '2021-11-21 09:09:41'),
(64, 22, NULL, 57, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 09:10:29', '2021-11-21 09:10:29'),
(65, 22, NULL, 58, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 09:12:17', '2021-11-21 09:12:17'),
(66, 22, NULL, 59, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 09:26:10', '2021-11-21 09:26:10'),
(67, 22, NULL, 60, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 09:29:27', '2021-11-21 09:29:27'),
(68, 22, NULL, 61, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 10:02:36', '2021-11-21 10:02:36'),
(69, 22, NULL, 62, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 10:03:53', '2021-11-21 10:03:53'),
(70, 22, NULL, 63, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 10:04:42', '2021-11-21 10:04:42'),
(71, 22, NULL, 64, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 10:10:30', '2021-11-21 10:10:30'),
(72, 22, NULL, 65, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 10:16:17', '2021-11-21 10:16:17'),
(73, 6, NULL, 66, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 10:54:20', '2021-11-21 10:54:20'),
(74, 22, NULL, 67, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 10:57:37', '2021-11-21 10:57:37'),
(75, 22, NULL, 68, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 11:02:09', '2021-11-21 11:02:09'),
(76, 22, NULL, 69, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-21 11:04:25', '2021-11-21 11:04:25'),
(77, 22, NULL, 69, 'Order Approved', 'Dear ak, Your Order #655077 on Bangalore is successfully Approved. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-21 12:08:28', '2021-11-21 12:08:28'),
(78, 22, NULL, 69, 'Order OrderReady', 'Dear ak, Your Order #655077 on Bangalore is successfully OrderReady. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-21 12:08:32', '2021-11-21 12:08:32'),
(79, 22, NULL, 68, 'Grocery Order Cancled', 'Dear ak, Your Order #131535 on Bangalore is Rejected by Restaurant. From MeatDeliverys', '1574861383.png', 'Grocery', '2021-11-21 12:09:46', '2021-11-21 12:09:46'),
(80, 22, NULL, 67, 'Grocery Order Cancled', 'Dear ak, Your Order #553330 on Bangalore is Rejected by Restaurant. From MeatDeliverys', '1574861383.png', 'Grocery', '2021-11-21 12:09:49', '2021-11-21 12:09:49'),
(81, 6, NULL, 66, 'Grocery Order Cancled', 'Dear Policherla Nagesh, Your Order #350251 on Bangalore is Rejected by Restaurant. From MeatDeliverys', '1574861383.png', 'Grocery', '2021-11-21 12:09:52', '2021-11-21 12:09:52'),
(82, 12, NULL, 8, 'Order Delivered', 'Dear Naga, Your Order #393416 on Bangalore is successfully Delivered. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-21 18:51:57', '2021-11-21 18:51:57'),
(83, 12, NULL, 8, 'Order Delivered', 'Dear Naga, Your Order #393416 on Bangalore is successfully Delivered. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-21 18:59:32', '2021-11-21 18:59:32'),
(84, 12, NULL, 7, 'Order Delivered', 'Dear Naga, Your Order #150649 on Bangalore is successfully Delivered. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-21 18:59:48', '2021-11-21 18:59:48'),
(85, 6, NULL, 70, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-22 12:34:24', '2021-11-22 12:34:24'),
(86, 6, NULL, 70, 'Order Approved', 'Dear Policherla Nagesh, Your Order #829513 on Bangalore is successfully Approved. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-22 12:35:53', '2021-11-22 12:35:53'),
(87, 6, NULL, 70, 'Order OrderReady', 'Dear Policherla Nagesh, Your Order #829513 on Bangalore is successfully OrderReady. From MeatDeliverys', '1600767832.png', 'Grocery', '2021-11-22 12:41:00', '2021-11-22 12:41:00'),
(88, 22, NULL, 71, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-22 17:08:06', '2021-11-22 17:08:06'),
(89, 6, NULL, 72, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-22 17:13:49', '2021-11-22 17:13:49'),
(90, 22, NULL, 73, 'Order Created', 'Dear ak, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-22 17:14:28', '2021-11-22 17:14:28'),
(91, 6, NULL, 74, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-11-27 10:48:19', '2021-11-27 10:48:19'),
(92, 6, NULL, 75, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-09 06:50:50', '2021-12-09 06:50:50'),
(93, 6, NULL, 76, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 03:43:24', '2021-12-15 03:43:24'),
(94, 6, NULL, 77, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 04:04:19', '2021-12-15 04:04:19'),
(95, 6, NULL, 78, 'Order Created', 'Dear Policherla Nagesh, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 14:58:57', '2021-12-15 14:58:57'),
(96, 24, NULL, 79, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 20:00:15', '2021-12-15 20:00:15'),
(97, 24, NULL, 80, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 20:14:49', '2021-12-15 20:14:49'),
(98, 24, NULL, 81, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 20:14:59', '2021-12-15 20:14:59'),
(99, 24, NULL, 82, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 20:15:02', '2021-12-15 20:15:02'),
(100, 24, NULL, 83, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 20:20:05', '2021-12-15 20:20:05'),
(101, 24, NULL, 84, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 20:21:08', '2021-12-15 20:21:08'),
(102, 24, NULL, 85, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-15 20:25:46', '2021-12-15 20:25:46'),
(103, 24, NULL, 86, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 04:10:43', '2021-12-16 04:10:43'),
(104, 24, NULL, 87, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 04:15:07', '2021-12-16 04:15:07'),
(105, 24, NULL, 88, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 04:15:11', '2021-12-16 04:15:11'),
(106, 22, NULL, 89, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 15:20:38', '2021-12-16 15:20:38'),
(107, 22, NULL, 90, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 15:24:50', '2021-12-16 15:24:50'),
(108, 22, NULL, 91, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 15:32:53', '2021-12-16 15:32:53'),
(109, 22, NULL, 92, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 17:24:08', '2021-12-16 17:24:08'),
(110, 22, NULL, 93, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 17:29:31', '2021-12-16 17:29:31'),
(111, 22, NULL, 94, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 17:49:58', '2021-12-16 17:49:58'),
(112, 22, NULL, 95, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 17:51:48', '2021-12-16 17:51:48'),
(113, 22, NULL, 96, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 17:54:29', '2021-12-16 17:54:29'),
(114, 22, NULL, 97, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 18:03:36', '2021-12-16 18:03:36'),
(115, 22, NULL, 98, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 18:12:09', '2021-12-16 18:12:09'),
(116, 22, NULL, 99, 'Order Created', 'Dear ak, Your Order is successfully created in Chennai. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 18:41:53', '2021-12-16 18:41:53'),
(117, 24, NULL, 100, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 18:52:32', '2021-12-16 18:52:32'),
(118, 24, NULL, 101, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 20:06:53', '2021-12-16 20:06:53'),
(119, 24, NULL, 102, 'Order Created', 'Dear Van, Your Order is successfully created in Bangalore. From MeatDeliverys', '1581055777.png', 'Grocery', '2021-12-16 20:22:06', '2021-12-16 20:22:06');

-- --------------------------------------------------------

--
-- Table structure for table `notification_template`
--

CREATE TABLE `notification_template` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `mail_content` text NOT NULL,
  `message_content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_template`
--

INSERT INTO `notification_template` (`id`, `title`, `subject`, `mail_content`, `message_content`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'User Verification', 'User Verification', 'Dear {{name}},<br>&nbsp; &nbsp;<br>&nbsp; &nbsp; Your registration is completed successfully.<br><br>&nbsp; &nbsp; Your Verification code is <b>{{otp}}</b>.<br><br>From {{shop_name}}', 'Dear {{name}}, Your Verification code is {{otp}}. From {{shop_name}}', '1574854450.png', '2019-11-27 11:34:10', '2019-11-27 13:13:54', '0000-00-00 00:00:00'),
(2, 'Forget Password', 'Forget Password', 'Dear {{name}},<br>&nbsp; &nbsp; &nbsp;&nbsp;<br>&nbsp; &nbsp; Your new passowrd is <b>{{password}}</b>.<br><br>From {{shop_name}}<br><br>', 'Dear {{name}},  Your new passowrd is {{password}}. From {{shop_name}}', '1574860457.jpg', '2019-11-27 11:42:00', '2019-11-27 13:14:17', '0000-00-00 00:00:00'),
(3, 'Create Order', 'Create Order', 'Dear {{name}},<br><br>&nbsp; &nbsp;Your Order is successfully created in {{shop}}.<br>&nbsp; &nbsp;<br>&nbsp; &nbsp;Thank you for using our application.<br><br>From {{shop_name}}', 'Dear {{name}}, Your Order is successfully created in {{shop}}. From {{shop_name}}', '1581055777.png', '2019-11-27 13:17:14', '2020-02-07 06:09:37', '0000-00-00 00:00:00'),
(4, 'Cancel Order', 'Cancel Order', 'Dear {{name}},<br><br>&nbsp; &nbsp;Your Order {{order_no}} on {{shop}} is Rejected by Restaurant.<br><br>From {{shop_name}}', 'Dear {{name}}, Your Order {{order_no}} on {{shop}} is Rejected by Restaurant. From {{shop_name}}', '1574861383.png', '2019-11-27 13:27:27', '2020-02-07 10:41:59', '0000-00-00 00:00:00'),
(6, 'Order Arrive', 'Order Arrive', 'Dear {{name}},<br>&nbsp; &nbsp; &nbsp;&nbsp;<br>&nbsp; &nbsp;You have new order {{order_no}} in {{shop}} from {{customer_name}}.<br><br>From {{shop_name}}', 'Dear {{name}}, You have new order {{order_no}} in {{shop}} from {{customer_name}}. From {{shop_name}}', '1574940643.png', '2019-11-28 11:30:43', '2019-12-24 07:42:41', '0000-00-00 00:00:00'),
(7, 'Order Status', 'Order Status', 'Dear {{name}},<br><br>&nbsp; &nbsp;Your Order {{order_no}} on {{shop}} is successfully {{status}}.<br><br>From {{shop_name}}', 'Dear {{name}}, Your Order {{order_no}} on {{shop}} is successfully {{status}}. From {{shop_name}}', '1600767832.png', '2019-12-24 07:38:55', '2020-09-22 09:43:52', '0000-00-00 00:00:00'),
(8, 'Payment Status', 'Payment Status', 'Dear {{name}},<br><br>&nbsp; &nbsp;Your Payment for order {{order_no}} is successfully {{payment_status}}.<br><br>From {{shop_name}}', 'Dear {{name}}, Your Payment for order {{order_no}} is successfully {{payment_status}}. From {{shop_name}}', '1577267855.png', '2019-12-25 09:57:35', '2019-12-25 10:20:56', '0000-00-00 00:00:00'),
(9, 'Order Request', 'Order Request', 'Dear {{name}},<br><br>&nbsp; &nbsp; &nbsp; You have new request for order {{order_no}}&nbsp;at {{user_address}} by {{shop}}.<br><br>from {{shop_name}}<br><br>', 'Dear {{name}}, You have new request for order {{order_no}} at {{user_address}} by {{shop}}. from {{shop_name}}', '1579160492.png', '2020-01-16 07:41:32', '2020-01-16 07:45:37', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'B89nQIIEsLiCebp7k1CuW0WpRQzAMDX64kA60gSW', 'http://localhost', 1, 0, 0, '2019-11-17 23:02:47', '2019-11-17 23:02:47'),
(2, NULL, 'Laravel Password Grant Client', '0xQbOjfOLo0R6YA8v86jnWdm2OVQArLHpWs5JlTr', 'http://localhost', 0, 1, 0, '2019-11-17 23:02:47', '2019-11-17 23:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-17 23:02:47', '2019-11-17 23:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owner_setting`
--

CREATE TABLE `owner_setting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `web_notification` int(11) DEFAULT 0,
  `play_sound` int(11) NOT NULL DEFAULT 0,
  `sound` varchar(255) DEFAULT NULL,
  `coupon` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `default_food_order_status` varchar(50) DEFAULT 'Pending',
  `default_grocery_order_status` varchar(50) DEFAULT 'Pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner_setting`
--

INSERT INTO `owner_setting` (`id`, `user_id`, `web_notification`, `play_sound`, `sound`, `coupon`, `status`, `default_food_order_status`, `default_grocery_order_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 0, NULL, 0, 0, 'Pending', 'Pending', '2020-06-06 04:43:17', '2020-06-06 08:38:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_setting`
--

CREATE TABLE `payment_setting` (
  `id` int(11) NOT NULL,
  `cod` int(11) NOT NULL,
  `whatsapp` tinyint(1) NOT NULL,
  `stripe` int(11) NOT NULL,
  `paypal` int(11) NOT NULL,
  `razor` int(11) NOT NULL,
  `flutterwave` tinyint(1) NOT NULL DEFAULT 0,
  `paystack` tinyint(1) NOT NULL,
  `paytabs` int(11) NOT NULL DEFAULT 0,
  `stripePublicKey` varchar(255) DEFAULT NULL,
  `stripeSecretKey` varchar(255) DEFAULT NULL,
  `paypalSendbox` varchar(255) DEFAULT NULL,
  `paypalProduction` varchar(255) DEFAULT NULL,
  `razorPublishKey` varchar(255) DEFAULT NULL,
  `razorSecretKey` varchar(255) DEFAULT NULL,
  `flutterwave_public_key` varchar(255) DEFAULT NULL,
  `paystack_public_key` varchar(255) DEFAULT NULL,
  `paytab_email` varchar(255) DEFAULT NULL,
  `paytab_secret_key` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_setting`
--

INSERT INTO `payment_setting` (`id`, `cod`, `whatsapp`, `stripe`, `paypal`, `razor`, `flutterwave`, `paystack`, `paytabs`, `stripePublicKey`, `stripeSecretKey`, `paypalSendbox`, `paypalProduction`, `razorPublishKey`, `razorSecretKey`, `flutterwave_public_key`, `paystack_public_key`, `paytab_email`, `paytab_secret_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 0, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 'rzp_live_jbn6B6wbk9Va19', 'ctTsAR9FqUUDrvYgE4W8ZpQq', NULL, NULL, NULL, NULL, '2019-11-15 00:00:00', '2021-10-05 17:50:20', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'order.show', 0, '2020-01-03 12:39:45', '2020-01-03 12:39:45'),
(2, 'order.delete', 0, '2020-01-03 12:56:16', '2020-01-03 12:56:16'),
(3, 'user.create', 0, '2020-01-03 12:56:55', '2020-01-03 12:56:55'),
(4, 'user.edit', 0, '2020-01-03 12:57:13', '2020-01-03 12:57:13'),
(5, 'user.show', 0, '2020-01-03 12:57:22', '2020-01-03 12:57:22'),
(6, 'user.delete', 0, '2020-01-03 12:57:32', '2020-01-03 12:57:32'),
(7, 'user.profile', 0, '2020-01-03 12:58:02', '2020-01-03 12:58:02'),
(8, 'category.show', 0, '2020-01-03 13:16:16', '2020-01-03 13:16:16'),
(10, 'category.create', 0, '2020-01-03 13:18:24', '2020-01-03 13:18:24'),
(11, 'category.edit', 0, '2020-01-03 13:19:50', '2020-01-03 13:19:50'),
(12, 'category.delete', 0, '2020-01-03 13:20:03', '2020-01-03 13:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `point_setting`
--

CREATE TABLE `point_setting` (
  `id` int(11) NOT NULL,
  `enable_point` int(11) DEFAULT NULL,
  `point_per_order` int(11) DEFAULT NULL,
  `value_per_point` int(11) DEFAULT NULL,
  `max_order_for_point` int(11) DEFAULT NULL,
  `min_cart_value_for_point` int(11) DEFAULT NULL,
  `max_redeem_amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `point_setting`
--

INSERT INTO `point_setting` (`id`, `enable_point`, `point_per_order`, `value_per_point`, `max_order_for_point`, `min_cart_value_for_point`, `max_redeem_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 5, 5, 500, 400, '2020-06-15 00:00:00', '2020-06-15 12:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateOfBirth` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'user.png',
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favourite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friend_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_user` int(11) NOT NULL DEFAULT 0,
  `free_order` int(11) NOT NULL DEFAULT 0,
  `verify` int(11) NOT NULL DEFAULT 0,
  `provider` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LOCAL',
  `provider_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `lat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver_radius` int(11) DEFAULT NULL,
  `driver_available` int(11) DEFAULT NULL,
  `enable_notification` int(11) NOT NULL DEFAULT 0,
  `enable_location` int(11) NOT NULL DEFAULT 0,
  `enable_call` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_code`, `phone`, `dateOfBirth`, `location`, `address`, `address_id`, `email_verified_at`, `password`, `image`, `cover_image`, `favourite`, `remember_token`, `otp`, `referral_code`, `friend_code`, `referral_user`, `free_order`, `verify`, `provider`, `provider_token`, `device_token`, `role`, `status`, `lat`, `lang`, `driver_radius`, `driver_available`, `enable_notification`, `enable_location`, `enable_call`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'goalin365@gmail.com', '+91', '1234567890', '03-12-1999', NULL, NULL, NULL, NULL, '$2y$10$SD7UbFQhJo/v4vNihcSfrOulPiSZL8aHA0l7QI9s8.lmtQ.cmHTNu', 'user.png', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '2021-09-07 16:11:54', NULL),
(2, 'user', 'user@gmail.com', '+12', '1234567890', NULL, NULL, NULL, NULL, NULL, '$2y$10$aIEc8XECdDzCeXm9wPJmzuk2/vK0Ra0TrIOJ7U6KrL99L0BCilDr.', 'user.png', NULL, NULL, NULL, '251319', '5390900', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-06-21 08:00:52', '2021-06-21 08:00:52', NULL),
(3, 'naga', 'meatmaharaja999@gmail.com', '9731603602', '9731603602', NULL, NULL, NULL, NULL, NULL, '$2y$10$FmN.39pmMP.GM5IO/0mxQuHam3l26iGohDp0cJYCl2t.XAniQYHAW', 'user.png', NULL, NULL, NULL, '135795', '3341689', NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-09-08 09:49:46', '2021-09-08 09:49:46', NULL),
(5, 'Bala', 'lifeatclick@gmail.com', '+91', '8722733117', NULL, NULL, NULL, 1, NULL, '$2y$10$2lUaaSeZ9tlxnCmbgZudIOodoUKr2BHB55dPNcLGNAWvVDpBkN/1.', 'user.png', NULL, NULL, NULL, '815915', '4594937', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, '12.9063', '77.5857', NULL, NULL, 0, 0, 0, '2021-09-08 14:06:02', '2021-10-09 15:12:46', NULL),
(6, 'Policherla Nagesh', 'delightnagesh@gmail.com', '09731603602', '09731603602', '2021-10-14', NULL, NULL, 3, NULL, '$2y$10$94kyVP3GDWzpVDlb6/6YqOUv8HYr2h0PlOw3zFnLxTbRE6BhGZFo2', '1634205543.jpg', NULL, NULL, NULL, '656367', '8272846', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, '12.9063', '77.5857', NULL, NULL, 0, 0, 0, '2021-09-10 13:17:36', '2021-12-15 08:40:46', NULL),
(7, 'Samanta Keeling', 'Merl.Brakus20@yahoo.com', '16014291485', '16014291485', NULL, NULL, NULL, NULL, NULL, '$2y$10$qMFEGhEjpkyo08x2OP5Y4OZ0HQ7x.plKDC1e18Eh/P4matxxYUzcu', 'user.png', NULL, NULL, NULL, '122492', '7910169', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-09-11 03:11:56', '2021-09-11 03:11:56', NULL),
(8, 'Pedro Dickens', 'elcaminoss1991@gmail.com', '17700490209', '17700490209', NULL, NULL, NULL, NULL, NULL, '$2y$10$1r5zHJKbUErDKMc6j2oq7eBI.cinW0gsx0X1mnTyTeZ7v2oBXzcS2', 'user.png', NULL, NULL, NULL, '202016', '6096870', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-09-26 13:29:51', '2021-09-26 13:29:51', NULL),
(9, 'Darryl Jast', 'jguilmette@videotron.ca', '12999245261', '12999245261', NULL, NULL, NULL, NULL, NULL, '$2y$10$xNUfMk0A2K13aieQOe.Tt.wEMkC5I1n/qquN5oHweIp4fkwVV5e8u', 'user.png', NULL, NULL, NULL, '683820', '8045864', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-09-30 04:03:38', '2021-09-30 04:03:38', NULL),
(10, 'Gerald Veum', 'kitchenkingz@tutanota.com', '17158938951', '17158938951', NULL, NULL, NULL, NULL, NULL, '$2y$10$0FtJSptxE4UsLdtAmhtaduKuZMAh9FjfS3TyfueBleoxVP2Nikk4O', 'user.png', NULL, NULL, NULL, '136803', '5149539', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-10-04 17:43:35', '2021-10-04 17:43:35', NULL),
(11, 'Elnora Kunde', 'robertj.miller@sympatico.ca', '11929541035', '11929541035', NULL, NULL, NULL, NULL, NULL, '$2y$10$bj0rtuKhzU3dhSKoKqyO2.jm9WByRvVwH.V1I/oS2pPdGfGkgk8LK', 'user.png', NULL, NULL, NULL, '185325', '6041921', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-10-06 03:54:07', '2021-10-06 03:54:07', NULL),
(12, 'Naga', 'meatdeliverys@gmail.com', '0991644360', '0991644360', '2021-10-08', NULL, NULL, 2, NULL, '$2y$10$VBPUBUftUxcJqbWZb91K9ujYMbpm3BNHbCbuAvh.3YlE6VCCIVWea', 'user.png', NULL, NULL, NULL, '958567', '8841498', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, '12.9063', '77.5857', NULL, NULL, 0, 0, 0, '2021-10-08 16:51:40', '2021-10-08 17:05:43', NULL),
(13, 'Ruby Streich', 'kastromarcel@gmail.com', '13122078138', '13122078138', NULL, NULL, NULL, NULL, NULL, '$2y$10$ZCZa.39xxe2C8F/pF5xHvulSbk2ncLatDjlUbf48P63f0MQD/Bzsy', 'user.png', NULL, NULL, NULL, '641346', '9312890', NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-10-13 06:33:08', '2021-10-13 06:33:08', NULL),
(14, 'Dhaya', 'meatucgh@gmail.com', '973160360', '973160360', NULL, NULL, NULL, NULL, NULL, '$2y$10$RmH8tbDSVw29htqJX/CzvOEsiyC8bjbnUN73Ec/nBRFs.UubT.eja', 'user.png', NULL, NULL, NULL, '285460', '5000000', NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-02 22:07:58', '2021-11-02 22:07:58', NULL),
(15, 'Dhaya', 'nageshdhaya@gmail.com', '9731603602', '9731603602', NULL, NULL, NULL, NULL, NULL, '$2y$10$P.vhYEmMK5PRlAptUZwBmOvuys.IpvbDnVzGNWVoTE5FHQGiw/g7y', 'user.png', NULL, NULL, NULL, '741966', '6192811', NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-02 22:09:51', '2021-11-02 22:15:55', NULL),
(16, 'Ms. Felicia Fisher', 'brupaizen@yahoo.com', '17271083374', '17271083374', NULL, NULL, NULL, NULL, NULL, '$2y$10$ioFiDfWx9d0FFasTum2d0.JifBP8GLsfMpnzYlnKPEvXhC.CbIO3C', 'user.png', NULL, NULL, NULL, '187758', '4671750', NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-07 02:49:43', '2021-11-07 02:49:43', NULL),
(17, 'Ollie Harvey', 'hans@kresice.onexmail.com', '13458347260', '13458347260', NULL, NULL, NULL, NULL, NULL, '$2y$10$AZhL3p4p11MRZhA3gPi2sOuRYoWvyJIkB7bzUy1z5oLN0bdtMD8BS', 'user.png', NULL, NULL, NULL, '980421', '9591000', NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-08 22:11:01', '2021-11-08 22:11:01', NULL),
(18, 'Haroon Rasheed', 'rasheed@desinelabs.com', '7899124463', '7899124463', NULL, NULL, NULL, 4, NULL, '$2y$10$SJi31BVgOWmse6e/pMfO7.Lno/6/RIHa4MxRXQHeX4Z7D0t4F6Cw2', 'user.png', NULL, NULL, NULL, '195764', '1742336', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, '12.9063', '77.5857', NULL, NULL, 0, 0, 0, '2021-11-10 09:14:06', '2021-11-10 09:20:35', NULL),
(19, 'Ms. Esmeralda Jast', 'mdw.finishstrong@gmail.com', '14385838124', '14385838124', NULL, NULL, NULL, NULL, NULL, '$2y$10$AZ83eDh/HG5diPFKjf//Getytq6SS4nIfRF1JxPKPPRQqpUwTscKC', 'user.png', NULL, NULL, NULL, '117831', '5584618', NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-10 22:48:06', '2021-11-10 22:48:06', NULL),
(20, 'Naga', 'nageshpharm9@gmail.com', '9916443605', '9916443605', NULL, NULL, NULL, NULL, NULL, '$2y$10$N3vtA3fhX2KtOv/MX3odh.LSmQAOyKqQyDM9HjKQcFIkVKO6XlRH2', 'user.png', NULL, NULL, NULL, '241473', '7822355', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-12 15:18:22', '2021-11-12 15:21:31', NULL),
(22, 'ak', 'indscope.php@gmail.com', '91', '9931762370', NULL, NULL, NULL, 5, NULL, '$2y$10$HAMg5vvuLNrKlrvL/vYd1.byk3jTldbgG3d5UZGOjx4SU.805eipm', 'user.png', NULL, NULL, NULL, '286472', '8140253', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, '12.9063', '77.5857', NULL, NULL, 0, 0, 0, '2021-11-13 18:10:18', '2021-11-21 22:21:35', NULL),
(23, 'Kellie Deckow', 'cowanmccormick@comcast.net', '15896335885', '15896335885', NULL, NULL, NULL, NULL, NULL, '$2y$10$nuD8J.TCy1f90/ZAbB5QceouAaO7K4ADYHpysuu4.Aomp/nckD5hm', 'user.png', NULL, NULL, NULL, '550685', '2591961', NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-14 00:15:03', '2021-11-14 00:15:03', NULL),
(24, 'Van', 'maharajapharma999@gmail.com', '9731603702', '9731603702', NULL, NULL, NULL, 6, NULL, '$2y$10$Hf6TO2Xqmi7I2dOSYhpV/OkKI.8c5Q5B1gy1ULPXXa3tixMblXMSu', 'user.png', NULL, NULL, NULL, '261226', '1390532', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, '12.9063', '77.5857', NULL, NULL, 0, 0, 0, '2021-11-15 18:03:48', '2021-12-16 23:48:46', NULL),
(25, 'Delivery', 'Deliveryboy@gmail.com', NULL, '9931762370', '2021-11-02', '2', NULL, NULL, NULL, '$2y$10$9pSK3heSd1nHUOGCvlQRp.v6vJive.WDIfF544jfhSg15ir58GCXm', '1637519506.png', NULL, NULL, NULL, '731970', NULL, NULL, 0, 0, 0, 'LOCAL', NULL, NULL, 2, 0, NULL, NULL, 50, 1, 0, 0, 0, '2021-11-21 23:31:46', '2021-11-21 23:31:46', NULL),
(26, 'Rajs', 'meatmaharaja5@gmail.com', '9731603602', '9731603602', NULL, NULL, NULL, NULL, NULL, '$2y$10$AkK9.N7QCC.dgmq7chHOAOEUPbWAgcaOBTnlPVS5ERa59QGJciFkW', 'user.png', NULL, NULL, NULL, '326690', '3821886', NULL, 0, 0, 1, 'LOCAL', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-27 16:07:57', '2021-11-27 16:08:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_type` varchar(255) NOT NULL,
  `soc_name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `user_id`, `address_type`, `soc_name`, `street`, `city`, `zipcode`, `lat`, `lang`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 'Home', 'klnflk', 'Jayanagar 6th block', 'Bangalore', '560041', '12.9063', '77.5857', '2021-10-05 17:04:50', '2021-10-05 17:04:50', NULL),
(2, 12, 'Home', '77', 'kumaraswamy layout police station', 'bangalore', '560078', '12.9063', '77.5857', '2021-10-08 12:52:28', '2021-10-14 09:45:35', NULL),
(3, 6, 'Home', '205205', 'kumaraswamy layout police station', 'Bengaluru', '560078', '12.9063', '77.5857', '2021-10-14 10:01:42', '2021-11-09 15:40:04', NULL),
(4, 18, 'Home', '#13', '4th Main', 'Bangalore', '560029', '12.9063', '77.5857', '2021-11-10 04:20:35', '2021-11-10 04:20:35', NULL),
(5, 22, 'Home', 'banglore', '143 ccc', 'banglore', '452001', '12.9063', '77.5857', '2021-11-17 16:37:41', '2021-11-17 16:37:41', NULL),
(6, 24, 'Home', 'Kumara Swamy layout no 10', 'Bangalore', 'Bangalore', '560078', '12.9063', '77.5857', '2021-12-15 19:58:19', '2021-12-15 19:58:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_gallery`
--

CREATE TABLE `user_gallery` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_request`
--

CREATE TABLE `user_request` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_request`
--

INSERT INTO `user_request` (`id`, `user_id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Eric', 'eric.jones.z.mail@gmail.com', 'instead, congrats', 'Good day, \r\n\r\nMy name is Eric and unlike a lot of emails you might get, I wanted to instead provide you with a word of encouragement – Congratulations\r\n\r\nWhat for?  \r\n\r\nPart of my job is to check out websites and the work you’ve done with groceryatclick.xyz definitely stands out. \r\n\r\nIt’s clear you took building a website seriously and made a real investment of time and resources into making it top quality.\r\n\r\nThere is, however, a catch… more accurately, a question…\r\n\r\nSo when someone like me happens to find your site – maybe at the top of the search results (nice job BTW) or just through a random link, how do you know? \r\n\r\nMore importantly, how do you make a connection with that person?\r\n\r\nStudies show that 7 out of 10 visitors don’t stick around – they’re there one second and then gone with the wind.\r\n\r\nHere’s a way to create INSTANT engagement that you may not have known about… \r\n\r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know INSTANTLY that they’re interested – so that you can talk to that lead while they’re literally checking out groceryatclick.xyz.\r\n\r\nCLICK HERE http://talkwithcustomer.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nIt could be a game-changer for your business – and it gets even better… once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation – immediately (and there’s literally a 100X difference between contacting someone within 5 minutes versus 30 minutes.)\r\n\r\nPlus then, even if you don’t close a deal right away, you can connect later on with text messages for new offers, content links, even just follow up notes to build a relationship.\r\n\r\nEverything I’ve just described is simple, easy, and effective. \r\n\r\nCLICK HERE http://talkwithcustomer.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://talkwithcustomer.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithcustomer.com/unsubscribe.aspx?d=groceryatclick.xyz', '2021-09-08 20:46:06', '2021-09-08 20:46:06'),
(2, NULL, 'Ishaan', 'ishaandeveloper.web@gmail.com', 'Re: Want more clients and customers?', 'Hi,\r\n\r\nHope you are doing well & staying safe.\r\n\r\nAs I see you have a new launched website, not showing on top search engines like Google. If you are on page #1 you will get so many new customers every day. \r\nIf you want to avail this opportunity.\r\n\r\nPlease share your phone number/skype and suitable time (Meeting) to talk to you, So we can explain our plan and strategy.\r\n\r\nThanks in advance,\r\nIshaan SEO/Web Specialist', '2021-09-10 22:25:42', '2021-09-10 22:25:42'),
(3, NULL, 'Dave Brown', 'davebrown11.tech@gmail.com', 'Question about your website', 'Hey,\r\n\r\nYour website\'s design is absolutely brilliant. The visuals really enhance your message and the content compels action. I\'ve forwarded it to a few of my contacts who I think could benefit from your services.\r\n\r\nWhen I was looking at your site, though, I noticed some mistakes that you\'ve made re: search engine optimization (SEO) which may be leading to a decline in your organic SEO results. Would you like to fix it so that you can get maximum exposure/presence on Google, Bing, Yahoo and web traffic to your website?\r\n\r\nIt\'s a relatively simple fix. If this is a priority, I can also get on a call.\r\n\r\nPlease share your “Phone Number\" and a suitable time to talk, so I can help you in that.\r\n\r\nRegards,\r\nDave Brown\r\nDigital Marketing Expert\r\nCall : (614) 927-1021', '2021-09-13 17:26:53', '2021-09-13 17:26:53'),
(4, NULL, 'Bryon', 'bryon.faircloth@msn.com', '40 easy ways to make money quickly', 'On this page you\'ll find all the best ways to make money in your spare time whilst at university based on our own experience.\r\nWe\'ll keep adding new ways to this page so go ahead and bookmark it.\r\n\r\nSo, let’s get started.\r\n\r\n=>> https://40stepsmakemoneyquickly.blogspot.com/', '2021-09-27 12:32:39', '2021-09-27 12:32:39'),
(5, NULL, 'Tami', 'tami.brubaker@gmail.com', '40 easy ways to make money quickly', 'On this page you\'ll find all the best ways to make money in your spare time whilst at university based on our own experience.\r\nWe\'ll keep adding new ways to this page so go ahead and bookmark it.\r\n\r\nSo, let’s get started.\r\n\r\n=>> https://40stepsmakemoneyquickly.blogspot.com/', '2021-10-02 02:47:56', '2021-10-02 02:47:56'),
(6, NULL, 'NataDig', 'woodthighgire1988@gmail.com', 'Hello Admin!', 'I am looking for sex, but do you want? Come in here https://best-sex-here1.com/?u=41nkd08&o=8dhpkzk', '2021-10-05 08:21:43', '2021-10-05 08:21:43'),
(7, NULL, 'Jude', 'jude.caudle2@gmail.com', 'LIFETIME web hosting (no monthly fee)', 'Get LIFETIME web hosting (no monthly fee)\r\n\r\nthis is a revolution in web hosting that gives you:\r\n[+] Faster loading websites than ever before\r\n[+] 100% uptime with free SSL encryption built-in\r\n[+] Unlimited sites, email accounts & more\r\n[+] Next-Generation Control Panel\r\n[+] Free one-click Wordpress installer\r\n[+] 24/7 support from marketing gurus\r\n\r\n==> https://hostzpresso.blogspot.com/', '2021-10-05 16:21:26', '2021-10-05 16:21:26'),
(8, 12, 'naga', 'meatmaharaja999@gmail.com', 'testing', 'testing', '2021-10-09 15:45:16', '2021-10-09 15:45:16'),
(9, NULL, 'Jamesvog', 'no-replyinwamma@gmail.com', 'Delivery of your email messages.', 'Good day!  meatdeliverys.com \r\n \r\nWe suggesting \r\n \r\nSending your commercial proposal through the feedback form which can be found on the sites in the Communication section. Feedback forms are filled in by our software and the captcha is solved. The advantage of this method is that messages sent through feedback forms are whitelisted. This method raise the chances that your message will be read. \r\n \r\nOur database contains more than 27 million sites around the world to which we can send your message. \r\n \r\nThe cost of one million messages 49 USD \r\n \r\nFREE TEST mailing Up to 50,000 messages. \r\n \r\n \r\nThis message is created automatically.  Use our contacts for communication. \r\n \r\nContact us. \r\nTelegram - @FeedbackMessages \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWe only use chat.', '2021-10-10 23:31:29', '2021-10-10 23:31:29'),
(10, NULL, 'Mike Dunce', 'no-replynocky@gmail.com', 'Increase sales for meatdeliverys.com', 'Hi there \r\n \r\nDo you want a quick boost in ranks and sales for your meatdeliverys.com website? \r\nHaving a high DA score, always helps \r\n \r\nGet your meatdeliverys.com to have a DA between 50 to 60 points in Moz with us today and reap the benefits of such a great feat. \r\n \r\nSee our offers here: \r\nhttps://www.monkeydigital.co/product/moz-da50-seo-plan/ \r\n \r\nNEW: \r\nhttps://www.monkeydigital.co/product/ahrefs-dr60/ \r\n \r\n \r\nthank you \r\nMike Dunce\r\n \r\nsupport@monkeydigital.co', '2021-10-20 02:24:08', '2021-10-20 02:24:08'),
(11, NULL, 'Mohammed Koofee', 'noormohammedali966@gmail.com', 'Help is Needed', 'Hello Dear, \r\nAs-salamu alaykum \r\nFirst let me introduce myself, My name is Noor Mohammed Ali Al-Koofee from Iraq. \r\n \r\nI am married in Saudi Arabia. My Husband has been domestically abusive lately, the rate of abuse has attracted public attention since 2019 after a popular television presenter, Rania al-Baz, was severely beaten by her own husband too, I am interested in investing in your country through your personal guidelines. Before the Covid-19 Pandemic started, I saved a total of $20 Million currently deposited in the bank ready to be wire transferred to your country for possible investment & migration opportunities. \r\n \r\nIf interested, kindly contact me to send all proof of funds for your consideration. I cannot say everything here but I can be reached directly on WhatsApp only: +966592291747, or mailto:contact@noormohammedali.com or Email: noormohammedali966@gmail.com \r\n \r\nSincerely yours, \r\nNoor Mohammed Ali Al-Koofee \r\nSaudi Arabia', '2021-10-20 03:12:04', '2021-10-20 03:12:04'),
(12, NULL, 'Andrew Goldenberge', 'martinbr@consultant.com', 'Please feel free to contact us at anytime if you need loan or partnership from us.', 'Hello, \r\nWe provide funding through our venture capital company to both start-up and existing companies either looking for funding for expansion or to accelerate growth in their company. \r\n \r\nWe have a structured joint venture investment plan in which we are interested in an annual return on investment not more than 10% ROI. \r\n \r\nWe are also currently structuring a convertible debt and loan financing of 3% interest repayable annually with no early repayment penalties. \r\n \r\nIf you have a business plan or executive summary I can review to understand a much better idea of your business and what you are looking to do, this will assist in determining the best possible investment structure we can pursue and discuss more extensively. \r\n \r\nIf you are interested in any of the above, kindly respond to us via this email andrew.goldenberg@castleprojectservicesltd.com \r\n \r\nI wait to hear from you. \r\n \r\nSincerely, \r\n \r\nAndrew Goldenberge \r\n \r\nInvestment/Wealth Manager \r\nCastle Project Services Ltd. \r\nE-Mail: andrew.goldenberg@castleprojectservicesltd.com', '2021-10-20 16:31:02', '2021-10-20 16:31:02'),
(13, NULL, 'Nishant', 'nishant.developer22@gmail.com', 'Re : Website Design & Development service provider', 'Hi \r\n\r\nI am Nishant, \r\n\r\nWe collaborate with startups, SMBs, and new domain owners to provide Website design - re-design and development services at modest rate.\r\n\r\nWe have a dedicated team of 45 professional designers and developers with over 8 plus years of experience and we thrive on the idea that design makes a difference. \r\n\r\nOur services at a glance: - \r\n\r\nWebsite Designing/Re-Designing \r\n\r\n#E-commerce development (Magento, Shopify, Woo Commerce etc.)\r\n\r\n#Graphic Designing\r\n\r\n#WordPress Theme Design & Customization\r\n\r\n#Custom themes, Plugins & Widget Development\r\n\r\n#Custom Templates, Modules, Plugins Design & Development\r\n\r\nDo let me know if you are interested in our services the please share your REQUIREMENT with us so that we can analyze your requirements and provide you the best solution accordingly. \r\n\r\nI’m waiting for your reply. \r\n\r\nKinds Regards,\r\nNishant (Web Solution Manager)', '2021-10-21 07:18:44', '2021-10-21 07:18:44'),
(14, NULL, 'Elias', 'elias.stines@msn.com', 'Receive $49 Payments Over n\' Over! For Simply Searching On Google', 'Activate GooglyPay & Receive $49 Payments Over n\' Over!\r\n\r\nNo Skills Or Experience Needed... \r\nNo Waiting To Get Paid... \r\nNo Extra Fees... No BS...\r\n\r\nGet Started In 1-2 Minutes…\r\n\r\n=>> https://googlypay-mmo.ahhmovies.win/', '2021-10-22 03:26:12', '2021-10-22 03:26:12'),
(15, NULL, 'Donald Cole', 'lanj7962@gmail.com', 'Partnership', 'Good day \r\n \r\nI contacted you some days back seeking your cooperation in a matter regarding funds worth $24 Million, I urge you to  get back to me through this email coledd11@cloedcolela.com if you\'re still interested. \r\n \r\nI await your response. \r\n \r\nThanks, \r\n \r\nDonald Cole', '2021-10-22 22:34:00', '2021-10-22 22:34:00'),
(16, NULL, 'Mike Baldwin', 'no-replynocky@gmail.com', 'Local SEO for more business', 'Hi \r\n \r\nWe will increase your Local Ranks organically and safely, using only whitehat methods, while providing Google maps and website offsite work at the same time. \r\n \r\nPlease check our services below, we offer Local SEO at cheap rates. \r\nhttps://speed-seo.net/product/local-seo-package/ \r\n \r\nNEW: \r\nhttps://www.speed-seo.net/product/zip-codes-gmaps-citations/ \r\n \r\nregards \r\nMike Baldwin\r\n \r\nSpeed SEO Digital Agency', '2021-10-28 05:19:40', '2021-10-28 05:19:40'),
(17, NULL, 'Chau Cheung', 'noreply@googlemail.com', 'TREAT AS CONFIDENTIAL', 'Hello, \r\nI am contacting you regarding a transaction of mutual benefit, I am an attorney who managed a client\'s account that passed away many years ago, he passed away without any known relative. \r\nWe can work together mutually to process and receive the funds, let me know if you wish to know more about my proposal and I shall provide you with more information. \r\n \r\nRegards, \r\nMr Chau Shiu Cheung \r\nchaushuicheung@hongkongsolicitors.org', '2021-10-28 08:47:12', '2021-10-28 08:47:12'),
(18, NULL, 'Mike Campbell', 'no-replynocky@gmail.com', 'whitehat monthly SEO plans', 'Howdy \r\n \r\nI have just took a look on your SEO for  meatdeliverys.com for its SEO Trend and saw that your website could use a push. \r\n \r\nWe will enhance your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our services below, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart improving your sales and leads with us, today! \r\n \r\nregards \r\nMike Campbell\r\n \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', '2021-11-02 09:14:07', '2021-11-02 09:14:07'),
(19, NULL, 'Gerardacics', 'dimafokin199506780tx+z271@inbox.ru', 'Good site', 'meatdeliverys.com tyrueoswkdhfbjksdhbdvsddnajkmkxdbfsdjdfadladabfhghgdhsjkd', '2021-11-05 08:15:51', '2021-11-05 08:15:51'),
(20, NULL, 'Mike Galbraith', 'no-replynocky@gmail.com', 'Get more dofollow backlinks for meatdeliverys.com', 'Hello \r\n \r\nWe all know the importance that dofollow link have on any website`s ranks. \r\nHaving most of your linkbase filled with nofollow ones is of no good for your ranks and SEO metrics. \r\n \r\nBuy quality dofollow links from us, that will impact your ranks in a positive way \r\nhttps://www.digital-x-press.com/product/150-dofollow-backlinks/ \r\n \r\nBest regards \r\nMike Galbraith\r\n \r\nsupport@digital-x-press.com', '2021-11-09 01:39:07', '2021-11-09 01:39:07'),
(21, NULL, 'David Holman', 'davidholman200@gmail.com', 'Express Documents Services', 'We are a Team of IT Experts specialized in the production of Real and Novelty Documents such as Passport, Driving License , IELTS Certificate,  NCLEX Certificate, ID Cards, Diplomas, SS Cards, University Certificates, Green Cards, Death Certificate, Working Permits, Visa\'s etc. Contact us on WhatsApp for more information +49 1590 2969018. or Email us at... documentsservicesexperts@gmail.com', '2021-11-11 08:58:09', '2021-11-11 08:58:09'),
(22, NULL, 'Mike Ryder', 'no-replynocky@gmail.com', 'Strengthen your Domain Authority', 'Hi there \r\n \r\nDo you want a quick boost in ranks and sales for your website? \r\nHaving a high DA score, always helps \r\n \r\nGet your meatdeliverys.com to have a DA between 50 to 60 points in Moz with us today and reap the benefits of such a great feat. \r\n \r\nSee our offers here: \r\nhttps://www.strictlydigital.net/product/moz-da50-seo-plan/ \r\n \r\nOn SALE: \r\nhttps://www.strictlydigital.net/product/ahrefs-dr60/ \r\n \r\n \r\nThank you \r\nMike Ryder', '2021-11-18 09:26:23', '2021-11-18 09:26:23'),
(23, NULL, 'Roberts Zuluf', 'rfzuluf@gmail.com', 'Trying to Reach you', 'Hi \r\nHow are you? I wanted to reach out to you and verify that email was a good way to reach you or We can discuss this via the telephone,WhatsApp only. +90 555 140 8097 or contact@frzuluf.com \r\nI count in your honor for a quick response for a good deal. \r\nRegards, \r\nRoberts Zuluf', '2021-11-20 15:18:47', '2021-11-20 15:18:47'),
(24, NULL, 'Eric', 'eric.jones.z.mail@gmail.com', 'Cool website!', 'Cool website!\r\n\r\nMy name’s Eric, and I just found your site - meatdeliverys.com - while surfing the net. You showed up at the top of the search results, so I checked you out. Looks like what you’re doing is pretty cool.\r\n \r\nBut if you don’t mind me asking – after someone like me stumbles across meatdeliverys.com, what usually happens?\r\n\r\nIs your site generating leads for your business? \r\n \r\nI’m guessing some, but I also bet you’d like more… studies show that 7 out 10 who land on a site wind up leaving without a trace.\r\n\r\nNot good.\r\n\r\nHere’s a thought – what if there was an easy way for every visitor to “raise their hand” to get a phone call from you INSTANTLY… the second they hit your site and said, “call me now.”\r\n\r\nYou can –\r\n  \r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re literally looking over your site.\r\n\r\nCLICK HERE https://talkwithwebvisitors.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nTime is money when it comes to connecting with leads – the difference between contacting someone within 5 minutes versus 30 minutes later can be huge – like 100 times better!\r\n\r\nThat’s why we built out our new SMS Text With Lead feature… because once you’ve captured the visitor’s phone number, you can automatically start a text message (SMS) conversation.\r\n  \r\nThink about the possibilities – even if you don’t close a deal then and there, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nWouldn’t that be cool?\r\n\r\nCLICK HERE https://talkwithwebvisitors.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\nEric\r\n\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE https://talkwithwebvisitors.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitors.com/unsubscribe.aspx?d=meatdeliverys.com', '2021-11-22 15:19:25', '2021-11-22 15:19:25'),
(25, NULL, 'Mike Lawman', 'no-replynocky@gmail.com', 'Local SEO for more business', 'Howdy \r\n \r\nWe will improve your Local Ranks organically and safely, using only whitehat methods, while providing Google maps and website offsite work at the same time. \r\n \r\nPlease check our plans here, we offer Local SEO at cheap rates. \r\nhttps://speed-seo.net/product/local-seo-package/ \r\n \r\nNEW: \r\nhttps://www.speed-seo.net/product/zip-codes-gmaps-citations/ \r\n \r\nregards \r\nMike Lawman\r\n \r\nSpeed SEO Digital Agency', '2021-11-23 08:43:07', '2021-11-23 08:43:07'),
(26, NULL, 'Klaus Becker', 'tbformleads@gmail.com', 'Hope your open to this', 'Hello \r\n \r\nMy main objective here, is to help increase revenue for you by producing an animated video that will generate leads and sales for your business 24/7, for just $97. \r\n \r\nBut this offer is only good this week, so get your video before the deadline. \r\n \r\nWatch Our Video Now! (https://bit.ly/Xpress97offer) \r\n \r\nFor less than you spend on coffee each month you get an American Owned Video company that can write your script, create your story board, lay-in a good soundtrack and produce an awesome video that brings home the bacon. \r\n \r\nAgain, this $97 promotion is for this week only. Don’t miss out!!! \r\n \r\nNOTE:  If you DON’T want to watch a video and feel you are ready now, you can get started ASAP and ORDER NOW (https://buy.stripe.com/14kbMJa9U55r3Bu5kZ)', '2021-11-24 17:46:11', '2021-11-24 17:46:11'),
(27, NULL, 'RichardExasp', 'larisa.fomin@freenet.de', '%$%) Binance: The Best Trading Robot in the World *&:^', 'According to Binance, this is the best trading robot in the world *$;@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=52&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nBecause he is able to make 200% profit every day !):- \r\nFor example, you replenished your brokerage account with $ 500 (EUR, GBP, etc.) and he earned you from $ 1000 in net income within a day :&№@ \r\nBinance recommends using this particular trading robot for automated trading *^*% \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=14&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-11-29 00:18:07', '2021-11-29 00:18:07'),
(28, NULL, 'RichardExasp', 'larisa.fomin@freenet.de', '%$%) Binance: The Best Trading Robot in the World *&:^', 'According to Binance, this is the best trading robot in the world *$;@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=52&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nBecause he is able to make 200% profit every day !):- \r\nFor example, you replenished your brokerage account with $ 500 (EUR, GBP, etc.) and he earned you from $ 1000 in net income within a day :&№@ \r\nBinance recommends using this particular trading robot for automated trading *^*% \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=14&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-11-29 00:18:09', '2021-11-29 00:18:09'),
(29, NULL, 'RichardExasp', 'larisa.fomin@freenet.de', '%$%) Binance: The Best Trading Robot in the World *&:^', 'According to Binance, this is the best trading robot in the world *$;@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=52&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nBecause he is able to make 200% profit every day !):- \r\nFor example, you replenished your brokerage account with $ 500 (EUR, GBP, etc.) and he earned you from $ 1000 in net income within a day :&№@ \r\nBinance recommends using this particular trading robot for automated trading *^*% \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=14&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-11-29 00:18:10', '2021-11-29 00:18:10'),
(30, NULL, 'RichardExasp', 'larisa.fomin@freenet.de', '%$%) Binance: The Best Trading Robot in the World *&:^', 'According to Binance, this is the best trading robot in the world *$;@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=52&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nBecause he is able to make 200% profit every day !):- \r\nFor example, you replenished your brokerage account with $ 500 (EUR, GBP, etc.) and he earned you from $ 1000 in net income within a day :&№@ \r\nBinance recommends using this particular trading robot for automated trading *^*% \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=14&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-11-29 00:18:12', '2021-11-29 00:18:12'),
(31, NULL, 'RichardExasp', 'larisa.fomin@freenet.de', '%$%) Binance: The Best Trading Robot in the World *&:^', 'According to Binance, this is the best trading robot in the world *$;@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=52&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nBecause he is able to make 200% profit every day !):- \r\nFor example, you replenished your brokerage account with $ 500 (EUR, GBP, etc.) and he earned you from $ 1000 in net income within a day :&№@ \r\nBinance recommends using this particular trading robot for automated trading *^*% \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&31=14&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-11-29 00:18:14', '2021-11-29 00:18:14'),
(32, NULL, 'Josephexhib', 'mixmax_thorsten@web.de', 'Blockchain: The most profitable trading robot or income from $ 5000 per day (%:%', 'Blockchain recommends to all people who are interested in additional permanent passive income of $ 5000 per day with a cryptocurrency trading robot. \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&73=88&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nA trading robot is capable of making from 750% to 15000% profit per day ())= \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&63=33&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nThis success was achieved thanks to the advanced developments in the field of artificial intelligence \"(:( \r\nTens of thousands of people around the world are already using this trading robot, so start you ?^%@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&96=08&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nTo start, you need to do just three things: \r\n1. Make a deposit to your brokerage account from $ 500 :%?@ \r\n2. Launch the trading robot \"&%= \r\n3. Receive passive income from $ 5000 per day №+:# \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&68=44&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-12-01 11:38:59', '2021-12-01 11:38:59'),
(33, NULL, 'Josephexhib', 'mixmax_thorsten@web.de', 'Blockchain: The most profitable trading robot or income from $ 5000 per day (%:%', 'Blockchain recommends to all people who are interested in additional permanent passive income of $ 5000 per day with a cryptocurrency trading robot. \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&73=88&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nA trading robot is capable of making from 750% to 15000% profit per day ())= \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&63=33&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nThis success was achieved thanks to the advanced developments in the field of artificial intelligence \"(:( \r\nTens of thousands of people around the world are already using this trading robot, so start you ?^%@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&96=08&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nTo start, you need to do just three things: \r\n1. Make a deposit to your brokerage account from $ 500 :%?@ \r\n2. Launch the trading robot \"&%= \r\n3. Receive passive income from $ 5000 per day №+:# \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&68=44&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-12-01 11:39:03', '2021-12-01 11:39:03'),
(34, NULL, 'Josephexhib', 'mixmax_thorsten@web.de', 'Blockchain: The most profitable trading robot or income from $ 5000 per day (%:%', 'Blockchain recommends to all people who are interested in additional permanent passive income of $ 5000 per day with a cryptocurrency trading robot. \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&73=88&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nA trading robot is capable of making from 750% to 15000% profit per day ())= \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&63=33&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nThis success was achieved thanks to the advanced developments in the field of artificial intelligence \"(:( \r\nTens of thousands of people around the world are already using this trading robot, so start you ?^%@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&96=08&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nTo start, you need to do just three things: \r\n1. Make a deposit to your brokerage account from $ 500 :%?@ \r\n2. Launch the trading robot \"&%= \r\n3. Receive passive income from $ 5000 per day №+:# \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&68=44&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-12-01 11:39:05', '2021-12-01 11:39:05'),
(35, NULL, 'Josephexhib', 'mixmax_thorsten@web.de', 'Blockchain: The most profitable trading robot or income from $ 5000 per day (%:%', 'Blockchain recommends to all people who are interested in additional permanent passive income of $ 5000 per day with a cryptocurrency trading robot. \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&73=88&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nA trading robot is capable of making from 750% to 15000% profit per day ())= \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&63=33&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nThis success was achieved thanks to the advanced developments in the field of artificial intelligence \"(:( \r\nTens of thousands of people around the world are already using this trading robot, so start you ?^%@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&96=08&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nTo start, you need to do just three things: \r\n1. Make a deposit to your brokerage account from $ 500 :%?@ \r\n2. Launch the trading robot \"&%= \r\n3. Receive passive income from $ 5000 per day №+:# \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&68=44&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-12-01 11:39:07', '2021-12-01 11:39:07'),
(36, NULL, 'Josephexhib', 'mixmax_thorsten@web.de', 'Blockchain: The most profitable trading robot or income from $ 5000 per day (%:%', 'Blockchain recommends to all people who are interested in additional permanent passive income of $ 5000 per day with a cryptocurrency trading robot. \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&73=88&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nA trading robot is capable of making from 750% to 15000% profit per day ())= \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&63=33&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nThis success was achieved thanks to the advanced developments in the field of artificial intelligence \"(:( \r\nTens of thousands of people around the world are already using this trading robot, so start you ?^%@ \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&96=08&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ \r\nTo start, you need to do just three things: \r\n1. Make a deposit to your brokerage account from $ 500 :%?@ \r\n2. Launch the trading robot \"&%= \r\n3. Receive passive income from $ 5000 per day №+:# \r\nhttps://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8qvzi&sa=D&68=44&usg=AFQjCNH2QAwQV6sbS1u0SgHiVXKZSKhcKQ', '2021-12-01 11:39:10', '2021-12-01 11:39:10'),
(37, NULL, 'Richard Andersen', 'donotreply.betrave@gmail.com', 'START TRADING  Online RIGHT NOW: With only 1 USD!', 'Dear, \r\nDo you know that you could also achieve an additional profit of more than 10% in just a few days trading on stock markets worldwide with minimum risk? \r\nWould you like to start trading or investing in the stock market more easily and quickly, with more confidence, effectiveness & efficiency? ONLINE? \r\n> TRY IT RIGHT NOW FOR FREE \r\nYou can start by opening a 100% free account, with a small amount like 1 USD for trial. To get started, please register here with our 100% accredited worldclass broker  CAPITAL, then we will guide you forward. \r\nLink for free registration RIGHT NOW: https://capital.com/?c=37799_3743058&pid=cellxpert \r\nHow to trade?: You just purchase an asset at a lower cost, then you resell it after a few moments (few hours or few days) at a higher cost; then you gain from the price increase. \r\n \r\nOn behalf of BETRAVE Team Worldwide: For more infos please  contact us by email contact@betrave.org or whatsapp +237620171905 or visit: http://www.betrave.org/', '2021-12-02 19:15:00', '2021-12-02 19:15:00'),
(38, NULL, 'Mike Richards', 'no-replynocky@gmail.com', 'affordable monthly SEO plans', 'Hello \r\n \r\nI have just analyzed  meatdeliverys.com for the ranking keywords and saw that your website could use an upgrade. \r\n \r\nWe will increase your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our plans here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart improving your sales and leads with us, today! \r\n \r\n \r\nregards \r\nMike Richards\r\n \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', '2021-12-03 07:54:24', '2021-12-03 07:54:24'),
(39, NULL, 'StevenCom', 'callofduty_567@yahoo.com', 'Launch Artificial Intelligence with one button and earn more $ 5698 per day', 'Bitcoin Miiliarder told how he makes money more $ 5585 in a day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&28=17&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-05 03:43:10', '2021-12-05 03:43:10'),
(40, NULL, 'StevenCom', 'callofduty_567@yahoo.com', 'Launch Artificial Intelligence with one button and earn more $ 5698 per day', 'Bitcoin Miiliarder told how he makes money more $ 5585 in a day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&28=17&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-05 03:43:12', '2021-12-05 03:43:12'),
(41, NULL, 'StevenCom', 'callofduty_567@yahoo.com', 'Launch Artificial Intelligence with one button and earn more $ 5698 per day', 'Bitcoin Miiliarder told how he makes money more $ 5585 in a day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&28=17&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-05 03:43:14', '2021-12-05 03:43:14'),
(42, NULL, 'StevenCom', 'callofduty_567@yahoo.com', 'Launch Artificial Intelligence with one button and earn more $ 5698 per day', 'Bitcoin Miiliarder told how he makes money more $ 5585 in a day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&28=17&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-05 03:43:18', '2021-12-05 03:43:18'),
(43, NULL, 'StevenCom', 'callofduty_567@yahoo.com', 'Launch Artificial Intelligence with one button and earn more $ 5698 per day', 'Bitcoin Miiliarder told how he makes money more $ 5585 in a day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&28=17&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-05 03:43:20', '2021-12-05 03:43:20'),
(44, NULL, 'StevenCom', 'totol13@mail.ru', 'REGISTER NOW and get more $ 9885 in a day', 'Make Artificial Intelligence bring you from $ 7779 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&16=81&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-07 07:15:44', '2021-12-07 07:15:44'),
(45, NULL, 'StevenCom', 'totol13@mail.ru', 'REGISTER NOW and get more $ 9885 in a day', 'Make Artificial Intelligence bring you from $ 7779 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&16=81&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-07 07:15:47', '2021-12-07 07:15:47'),
(46, NULL, 'StevenCom', 'totol13@mail.ru', 'REGISTER NOW and get more $ 9885 in a day', 'Make Artificial Intelligence bring you from $ 7779 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&16=81&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-07 07:15:50', '2021-12-07 07:15:50'),
(47, NULL, 'StevenCom', 'totol13@mail.ru', 'REGISTER NOW and get more $ 9885 in a day', 'Make Artificial Intelligence bring you from $ 7779 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&16=81&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-07 07:15:54', '2021-12-07 07:15:54'),
(48, NULL, 'StevenCom', 'totol13@mail.ru', 'REGISTER NOW and get more $ 9885 in a day', 'Make Artificial Intelligence bring you from $ 7779 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8ED7K&sa=D&16=81&usg=AFQjCNEY3K5BsQ-mUq_FMcp6hGUAytb7Og <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-07 07:15:56', '2021-12-07 07:15:56'),
(49, NULL, 'Mike Blomfield', 'no-replynocky@gmail.com', 'Get more dofollow backlinks for meatdeliverys.com', 'Hello \r\n \r\nWe all know the importance that dofollow link have on any website`s ranks. \r\nHaving most of your linkbase filled with nofollow ones is of no good for your ranks and SEO metrics. \r\n \r\nBuy quality dofollow links from us, that will impact your ranks in a positive way \r\nhttps://www.digital-x-press.com/product/150-dofollow-backlinks/ \r\n \r\nBest regards \r\nMike Blomfield\r\n \r\nsupport@digital-x-press.com', '2021-12-11 01:31:37', '2021-12-11 01:31:37'),
(50, NULL, 'StevenCom', 'kkoens@zeelandnet.nl', 'Change your life and get passive income more $ 9769 per day', 'Register, press one button and get passive income more $ 9666 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8Prmu&sa=D&20=84&usg=AFQjCNH_EGwAiiB8MpWHxZlE1C27oj3Rvw <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-12 18:11:38', '2021-12-12 18:11:38'),
(51, NULL, 'StevenCom', 'kkoens@zeelandnet.nl', 'Change your life and get passive income more $ 9769 per day', 'Register, press one button and get passive income more $ 9666 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8Prmu&sa=D&20=84&usg=AFQjCNH_EGwAiiB8MpWHxZlE1C27oj3Rvw <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-12 18:11:39', '2021-12-12 18:11:39'),
(52, NULL, 'StevenCom', 'kkoens@zeelandnet.nl', 'Change your life and get passive income more $ 9769 per day', 'Register, press one button and get passive income more $ 9666 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8Prmu&sa=D&20=84&usg=AFQjCNH_EGwAiiB8MpWHxZlE1C27oj3Rvw <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-12 18:11:42', '2021-12-12 18:11:42'),
(53, NULL, 'StevenCom', 'kkoens@zeelandnet.nl', 'Change your life and get passive income more $ 9769 per day', 'Register, press one button and get passive income more $ 9666 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8Prmu&sa=D&20=84&usg=AFQjCNH_EGwAiiB8MpWHxZlE1C27oj3Rvw <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-12 18:11:46', '2021-12-12 18:11:46'),
(54, NULL, 'StevenCom', 'kkoens@zeelandnet.nl', 'Change your life and get passive income more $ 9769 per day', 'Register, press one button and get passive income more $ 9666 per day >>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.google.com/url?q=https%3A%2F%2Fvk.cc%2Fc8Prmu&sa=D&20=84&usg=AFQjCNH_EGwAiiB8MpWHxZlE1C27oj3Rvw <<<<<<<<<<<<<<<<<<<<<<<<', '2021-12-12 18:11:51', '2021-12-12 18:11:51'),
(55, NULL, 'Mike Williams', 'no-replynocky@gmail.com', 'DA60+ for meatdeliverys.com with -35%', 'Good Day \r\n \r\nDo you want a quick boost in ranks and sales for your website? \r\nHaving a high DA score, always helps \r\n \r\nApply this -35% code ( MEGAPROMOTER ) while getting your meatdeliverys.com to have a DA above 60 points in Moz with us today and reap the benefits of such a great feat at an affordable rate. \r\n \r\n \r\n \r\nSee our offers here: \r\nhttps://www.strictlydigital.net/product/moz-da50-seo-plan/ \r\nhttps://www.strictlydigital.net/product/moz-da60-seo-plan/ \r\n \r\nNEW: ahrefs DR70 is now possible: \r\nhttps://www.strictlydigital.net/product/ahrefs-seo-plan/ \r\n \r\n \r\nThank you \r\nMike Williams\r\n \r\nmike@strictlydigital.net', '2021-12-14 12:49:47', '2021-12-14 12:49:47'),
(56, NULL, 'Zane Josephson', 'josephson.zane@gmail.com', 'A secret weapon for anyone who needs content.', 'Hi , \r\n\r\nI don’t need to tell you how important it is to optimize every step in your SEO pipeline. \r\n\r\nBut unfortunately, it’s nearly impossible to cut out time or money when it comes to getting good content.\r\n\r\nAt least that’s what I thought until I came across Article Forge...\r\n\r\nBuilt by a team of AI researchers from MIT, Carnegie Mellon, Harvard, Article Forge is an artificial intelligence (AI) powered content writer that uses deep learning models to write entire articles about any topic in less than 60 seconds.\r\n\r\nTheir team trained AI models on millions of articles to teach Article Forge how to draw connections between topics so that each article it writes is relevant, interesting and useful.\r\n\r\nAll their hard work means you just enter a few keywords and Article Forge will write a complete article from scratch making sure every thought flows naturally into the next, resulting in readable, high quality, and unique content.\r\n\r\nPut simply, this is a secret weapon for anyone who needs content.\r\n\r\nI get how impossible that sounds so you need to see how Article Forge writes a complete article in less than 60 seconds! =>> https://myarticleforge.blogspot.com/\r\n\r\nI had to share this with you because I know this will be a game changer for your business.\r\n\r\nIf you’re writing your own content, Article Forge can take a long and difficult process and turn it into a single button click. \r\n\r\nIf you’re buying content, Article Forge’s flat fee, unlimited articles, and 60 second turnaround will be cheaper and faster than any other content provider. \r\n\r\nEither way, Article Forge will help you take your content creation process to the next level.\r\n\r\nMore importantly, Article Forge offers a free 5-day trial so you can see for yourself how this technology will revolutionize your content pipeline for your niche and your use case. \r\n\r\nSo what are you waiting for? Click here to get your 5-day Free Trial and start generating unlimited unique content =>> https://myarticleforge.blogspot.com/\r\n\r\nAnd make sure to thank me later when this tool has changed the way you create content :)\r\n\r\nBrahma.', '2021-12-17 01:17:54', '2021-12-17 01:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_wishlist`
--

CREATE TABLE `user_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_notification`
--
ALTER TABLE `admin_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_setting`
--
ALTER TABLE `company_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_setting`
--
ALTER TABLE `general_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grocery_category`
--
ALTER TABLE `grocery_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grocery_item`
--
ALTER TABLE `grocery_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`category_id`);

--
-- Indexes for table `grocery_order`
--
ALTER TABLE `grocery_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`location_id`,`customer_id`,`deliveryBoy_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `deliveryBoy_id` (`deliveryBoy_id`);

--
-- Indexes for table `grocery_order_child`
--
ALTER TABLE `grocery_order_child`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grocery_review`
--
ALTER TABLE `grocery_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grocery_shop`
--
ALTER TABLE `grocery_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `grocery_sub_category`
--
ALTER TABLE `grocery_sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_template`
--
ALTER TABLE `notification_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `owner_setting`
--
ALTER TABLE `owner_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_setting`
--
ALTER TABLE `payment_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `point_setting`
--
ALTER TABLE `point_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_gallery`
--
ALTER TABLE `user_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request`
--
ALTER TABLE `user_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_notification`
--
ALTER TABLE `admin_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_setting`
--
ALTER TABLE `company_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_setting`
--
ALTER TABLE `general_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grocery_category`
--
ALTER TABLE `grocery_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `grocery_item`
--
ALTER TABLE `grocery_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `grocery_order`
--
ALTER TABLE `grocery_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `grocery_order_child`
--
ALTER TABLE `grocery_order_child`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `grocery_review`
--
ALTER TABLE `grocery_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grocery_shop`
--
ALTER TABLE `grocery_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grocery_sub_category`
--
ALTER TABLE `grocery_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `notification_template`
--
ALTER TABLE `notification_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `owner_setting`
--
ALTER TABLE `owner_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_setting`
--
ALTER TABLE `payment_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `point_setting`
--
ALTER TABLE `point_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_gallery`
--
ALTER TABLE `user_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_request`
--
ALTER TABLE `user_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grocery_order`
--
ALTER TABLE `grocery_order`
  ADD CONSTRAINT `grocery_order_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `grocery_order_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `grocery_order_ibfk_3` FOREIGN KEY (`deliveryBoy_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `grocery_shop`
--
ALTER TABLE `grocery_shop`
  ADD CONSTRAINT `grocery_shop_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `grocery_shop_ibfk_2` FOREIGN KEY (`location`) REFERENCES `location` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
