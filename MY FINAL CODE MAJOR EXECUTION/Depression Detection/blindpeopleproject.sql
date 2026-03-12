-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 19, 2024 at 11:27 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blindpeopleproject`
--
CREATE DATABASE IF NOT EXISTS `blindpeopleproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blindpeopleproject`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add user feedback', 8, 'add_userfeedback'),
(30, 'Can change user feedback', 8, 'change_userfeedback'),
(31, 'Can delete user feedback', 8, 'delete_userfeedback'),
(32, 'Can view user feedback', 8, 'view_userfeedback'),
(33, 'Can add dataset', 9, 'add_dataset'),
(34, 'Can change dataset', 9, 'change_dataset'),
(35, 'Can delete dataset', 9, 'delete_dataset'),
(36, 'Can view dataset', 9, 'view_dataset'),
(37, 'Can add densenet_model', 10, 'add_densenet_model'),
(38, 'Can change densenet_model', 10, 'change_densenet_model'),
(39, 'Can delete densenet_model', 10, 'delete_densenet_model'),
(40, 'Can view densenet_model', 10, 'view_densenet_model'),
(41, 'Can add mobile net_model', 11, 'add_mobilenet_model'),
(42, 'Can change mobile net_model', 11, 'change_mobilenet_model'),
(43, 'Can delete mobile net_model', 11, 'delete_mobilenet_model'),
(44, 'Can view mobile net_model', 11, 'view_mobilenet_model');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dataset_table`
--

DROP TABLE IF EXISTS `dataset_table`;
CREATE TABLE IF NOT EXISTS `dataset_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `densenet_model`
--

DROP TABLE IF EXISTS `densenet_model`;
CREATE TABLE IF NOT EXISTS `densenet_model` (
  `S_No` int NOT NULL AUTO_INCREMENT,
  `model_accuracy` varchar(10) NOT NULL,
  PRIMARY KEY (`S_No`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `densenet_model`
--

INSERT INTO `densenet_model` (`S_No`, `model_accuracy`) VALUES
(3, '93.8');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'userapp', 'user'),
(8, 'userapp', 'userfeedback'),
(9, 'adminapp', 'dataset'),
(10, 'adminapp', 'densenet_model'),
(11, 'adminapp', 'mobilenet_model');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-16 11:51:46.062126'),
(2, 'auth', '0001_initial', '2024-12-16 11:51:46.578932'),
(3, 'admin', '0001_initial', '2024-12-16 11:51:46.750421'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-12-16 11:51:46.756983'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-16 11:51:46.763812'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-12-16 11:51:46.837929'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-12-16 11:51:46.874069'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-12-16 11:51:46.913784'),
(9, 'auth', '0004_alter_user_username_opts', '2024-12-16 11:51:46.919403'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-12-16 11:51:46.955825'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-12-16 11:51:46.957826'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-12-16 11:51:46.965190'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-12-16 11:51:46.997368'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-12-16 11:51:47.030093'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-12-16 11:51:47.062688'),
(16, 'auth', '0011_update_proxy_permissions', '2024-12-16 11:51:47.067384'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-12-16 11:51:47.097850'),
(18, 'sessions', '0001_initial', '2024-12-16 11:51:47.132645'),
(19, 'userapp', '0001_initial', '2024-12-16 11:51:47.205552'),
(20, 'adminapp', '0001_initial', '2024-12-19 11:03:49.371868');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4fb78dihqyu6mojhdeelz1pimtx51wsc', 'eyJ1c2VyX2lkX2FmdGVyX2xvZ2luIjoxfQ:1tNAwe:1kPArjStN-nI-1DinEzjb-_kCj2x2ZAUmMUoWiWzTT8', '2024-12-30 13:15:32.258100'),
('o9c6lvnzkzlm8whto2qg50ncq2h9zknb', 'eyJ1c2VyX2lkX2FmdGVyX2xvZ2luIjoxfQ:1tNUKu:7lBbHu4g13BhEdXoa1poOeOn0kyWAGlkb1E2mBNrBjo', '2024-12-31 09:57:52.543516');

-- --------------------------------------------------------

--
-- Table structure for table `mobilenet_model`
--

DROP TABLE IF EXISTS `mobilenet_model`;
CREATE TABLE IF NOT EXISTS `mobilenet_model` (
  `S_No` int NOT NULL AUTO_INCREMENT,
  `model_accuracy` varchar(10) NOT NULL,
  PRIMARY KEY (`S_No`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobilenet_model`
--

INSERT INTO `mobilenet_model` (`S_No`, `model_accuracy`) VALUES
(3, '70.0');

-- --------------------------------------------------------

--
-- Table structure for table `userapp_user`
--

DROP TABLE IF EXISTS `userapp_user`;
CREATE TABLE IF NOT EXISTS `userapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `age` varchar(15) NOT NULL,
  `address` longtext NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `otp` varchar(6) NOT NULL,
  `otp_status` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userapp_user`
--

INSERT INTO `userapp_user` (`id`, `full_name`, `email`, `password`, `phone_number`, `age`, `address`, `photo`, `otp`, `otp_status`, `status`) VALUES
(2, 'codebook', 'codebooklbnagar@gmail.com', 'Codebook@123', '9666473716', '22', 'lbnagar', 'profiles/cb_NlWpUJF.jpeg', '0799', 'Verified', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE IF NOT EXISTS `user_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `additional_comments` longtext NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_feedback_user_id_5b987fa1` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
