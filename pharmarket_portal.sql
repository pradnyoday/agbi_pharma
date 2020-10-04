-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2020 at 06:57 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmarket_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(25, 'Can add account', 7, 'add_account'),
(26, 'Can change account', 7, 'change_account'),
(27, 'Can delete account', 7, 'delete_account'),
(28, 'Can view account', 7, 'view_account'),
(29, 'Can add drugs', 8, 'add_drugs'),
(30, 'Can change drugs', 8, 'change_drugs'),
(31, 'Can delete drugs', 8, 'delete_drugs'),
(32, 'Can view drugs', 8, 'view_drugs'),
(33, 'Can add trial', 9, 'add_trial'),
(34, 'Can change trial', 9, 'change_trial'),
(35, 'Can delete trial', 9, 'delete_trial'),
(36, 'Can view trial', 9, 'view_trial'),
(37, 'Can add hospital drugs', 10, 'add_hospitaldrugs'),
(38, 'Can change hospital drugs', 10, 'change_hospitaldrugs'),
(39, 'Can delete hospital drugs', 10, 'delete_hospitaldrugs'),
(40, 'Can view hospital drugs', 10, 'view_hospitaldrugs'),
(41, 'Can add diagnosis', 11, 'add_diagnosis'),
(42, 'Can change diagnosis', 11, 'change_diagnosis'),
(43, 'Can delete diagnosis', 11, 'delete_diagnosis'),
(44, 'Can view diagnosis', 11, 'view_diagnosis'),
(45, 'Can add patients', 12, 'add_patients'),
(46, 'Can change patients', 12, 'change_patients'),
(47, 'Can delete patients', 12, 'delete_patients'),
(48, 'Can view patients', 12, 'view_patients'),
(49, 'Can add save file', 13, 'add_savefile'),
(50, 'Can change save file', 13, 'change_savefile'),
(51, 'Can delete save file', 13, 'delete_savefile'),
(52, 'Can view save file', 13, 'view_savefile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `d_id` int(11) NOT NULL,
  `diagnosis` varchar(2000) NOT NULL,
  `severity` varchar(100) NOT NULL,
  `height` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `bp_sys` int(11) NOT NULL,
  `bp_dys` int(11) NOT NULL,
  `prescribed_drug` varchar(1000) NOT NULL,
  `prescribed_treatment` varchar(1000) NOT NULL,
  `precautions` varchar(2000) NOT NULL,
  `past_medications` varchar(1000) NOT NULL,
  `diagnosis_date` date NOT NULL,
  `admit_date` datetime(6) DEFAULT NULL,
  `discharge_date` datetime(6) DEFAULT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`d_id`, `diagnosis`, `severity`, `height`, `weight`, `bp_sys`, `bp_dys`, `prescribed_drug`, `prescribed_treatment`, `precautions`, `past_medications`, `diagnosis_date`, `admit_date`, `discharge_date`, `p_id`) VALUES
(1, 'throat infection', 'medium', '163 cms', '64 kg', 115, 85, 'azithromycin, ascoril cough syrup, betadine gargle', 'nil', 'avoid cold food or drinks', 'nil', '2020-08-19', NULL, NULL, 1),
(2, 'pneumonia', 'low', '160 cms', '70 kg', 120, 71, 'Sulfatrim', 'nil', 'Eat fruits and vegetables.', 'nil', '2020-08-20', '2020-08-20 00:00:00.000000', NULL, 2),
(3, 'pneumonia', 'low', '160 cms', '70 kg', 119, 72, 'Sulfatrim', 'nil', 'Eat fruits and vegetables.', 'nil', '2021-08-20', NULL, '2021-08-20 00:00:00.000000', 2),
(4, 'Flu', 'Medium', '155 cms', '65 kg', 125, 75, 'Acetaminophen,diphenhydramine', 'nil', 'drink plenty of fluids, eat nutritious food.', 'nil', '2002-02-20', NULL, NULL, 4),
(5, 'throat infection', 'low', '165 cms', '68 kg', 137, 85, 'Dyclonine', 'nil', 'avoid cold food or drinks', 'azithromycin 500 mg, ascoril cough syrup, betadine gargle', '2019-05-20', NULL, NULL, 1),
(6, 'skin cancer', 'medium', '150 cms', '56 kg', 116, 66, 'Aldesleukin,Dabrafenib', 'immunotherapy', 'Wear Sunscreen,Avoid Peak rays', 'nil', '2006-02-18', NULL, NULL, 3),
(7, 'Heart Attack', 'high', '179 cms', '80 kg', 140, 88, 'Apixaban,Dabigatran,Edoxaban,Heparin,Rivaroxaban,Warfarin', 'Angioplasty,Cardiomyoplasty,Bypass surgery', 'smoking_prohibited,rest,exercise', 'Metformin,Sulfonylureas,Thiazolidinediones', '2015-08-19', '2015-08-19 00:00:00.000000', '2017-08-19 00:00:00.000000', 5),
(8, 'skin cancer', 'low', '150 cms', '58 kg', 120, 70, 'Conimetinib', 'nil', 'Wear Sunscreen', 'nil', '2018-05-18', NULL, NULL, 3),
(9, 'Diarrhoea', 'medium', '153 cms', '60 kg', 121, 68, 'simethicone, lactobacillus acidophilus', 'nil', 'Avoid eating raw meats, fish,', 'nil', '2020-08-19', NULL, NULL, 6),
(10, 'asthama', 'High', '162 cms', '75 kg', 115, 70, 'prednisone,montelukast', 'Bronchial thermoplasty', 'Stay away from allergence, Avoid any type of smoke', 'nil', '2017-03-17', NULL, NULL, 8),
(11, 'Chikenpox', 'medium', '164 cms', '70Kg', 120, 74, 'Valtrex,Zovirax', 'nil', 'Avoid Scratching', 'nil', '2010-02-14', '2010-02-14 00:00:00.000000', '2012-02-14 00:00:00.000000', 7),
(12, 'asthama', 'medim', '163 cms', '74 Kg', 132, 75, 'benralizumab', 'nil', 'Avoid smoke', 'prednisone,montelukast', '2029-05-18', NULL, NULL, 8),
(13, 'influenza', 'low', '155 cms', '65 Kg', 110, 75, 'oseltamivir phosphate,zanamivir,baloxavir marboxil', 'antiviral_drugs', 'Clean hands,avoid touching eyes', 'nil', '2021-09-19', NULL, NULL, 9),
(14, 'Headache', 'low', '140 cms', '50kg', 120, 70, 'Acetaminophen, aspirin', 'nil', 'Use an ice pack on your forehead', 'nil', '2025-03-20', NULL, NULL, 10),
(15, 'pneumonia', 'medium', '145 cms', '77 Kg', 130, 78, 'azithromycin,penicillin,doxycycline hyclate', 'antibiotics', 'hydration,rest', 'nil', '2004-08-19', '2004-08-19 00:00:00.000000', '2005-08-19 00:00:00.000000', 11),
(16, 'Colorectal Cancer', 'medium', '161 cms', '100 Kg', 139, 72, 'Capecitabine,Oxaliplatin,Irinotecan', 'chemotherapy', 'nil', 'nil', '2012-06-20', NULL, NULL, 12),
(17, 'throat infection', 'medium', '163 cms', '64 kg', 120, 70, 'azithromycin 500 mg, ascoril cough syrup, betadine gargle', 'nil', 'avoid cold food or drinks', 'nil', '2020-08-20', NULL, NULL, 1),
(18, 'throat infection', 'medium', '163 cms', '64 kg', 120, 70, 'azithromycin 500 mg, ascoril cough syrup, betadine gargle', 'nil', 'avoid cold food or drinks', 'nil', '2020-08-20', NULL, NULL, 1),
(19, 'throat infection', 'medium', '163 cms', '64 kg', 120, 70, 'azithromycin 500 mg, ascoril cough syrup, betadine gargle', 'nil', 'avoid cold food or drinks', 'nil', '2020-08-20', NULL, NULL, 1),
(20, 'throat infection', 'medium', '163 cms', '64 kg', 120, 70, 'azithromycin 500 mg, ascoril cough syrup, betadine gargle', 'nil', 'avoid cold food or drinks', 'nil', '2020-08-20', NULL, NULL, 1),
(21, 'throat infection', 'medium', '163 cms', '64 kg', 120, 70, 'azithromycin 500 mg, ascoril cough syrup, betadine gargle', 'nil', 'avoid cold food or drinks', 'nil', '2020-08-20', NULL, NULL, 1),
(36, 'Psoraisis', 'low', '130 cms', '79 kg', 120, 65, 'Calamine Lotion 100 ml', 'tropical therepy', 'avoid direct sunlight contact', 'nil', '2020-10-04', NULL, NULL, 1),
(40, 'Psoraisis', 'medium', '188 cms', '79 kg', 120, 65, 'Calamine Lotion 100 ml', 'tropical therepy', 'nil', 'nil', '2020-10-04', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(7, '2020-09-25 12:16:55.463198', '2', 'trial object (2)', 1, '[{\"added\": {}}]', 9, 1),
(8, '2020-09-25 12:17:24.475203', '6', 'Drugs object (6)', 1, '[{\"added\": {}}]', 8, 1),
(9, '2020-09-25 12:18:11.508791', '6', 'Drugs object (6)', 2, '[{\"changed\": {\"fields\": [\"Efficacy\"]}}]', 8, 1),
(10, '2020-09-25 12:18:43.559368', '6', 'Drugs object (6)', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(11, '2020-09-25 12:22:12.793289', '7', 'q', 1, '[{\"added\": {}}]', 8, 1),
(12, '2020-09-25 12:24:00.933271', '8', 'a', 1, '[{\"added\": {}}]', 8, 1),
(13, '2020-09-25 12:25:28.210687', '9', 'Pradnyodayc', 1, '[{\"added\": {}}]', 8, 1),
(14, '2020-09-25 12:28:47.896763', '10', 'Pradnyoday z', 1, '[{\"added\": {}}]', 8, 1),
(15, '2020-09-25 12:34:58.901257', '11', 'Pradnyoday Aceloc', 1, '[{\"added\": {}}]', 8, 1),
(16, '2020-09-26 12:20:12.712687', '15', 'xx penicillin', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(17, '2020-09-26 12:20:25.746844', '14', 'Pradnyoday sofra', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(18, '2020-09-26 12:20:39.549059', '13', 'Pradnyoday q', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(19, '2020-09-26 12:20:49.057382', '12', 'Pradnyoday Crocin', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(20, '2020-09-26 12:20:57.075253', '11', 'Pradnyoday Aceloc', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(21, '2020-09-29 16:49:49.517557', '19', 'Pradnyoday Crocin', 2, '[{\"changed\": {\"fields\": [\"Posology\"]}}]', 8, 1),
(22, '2020-10-04 09:22:02.726936', '6', 'Pharma Crocin', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(23, '2020-10-04 09:22:12.190092', '4', 'Pradnyoday Ascoril', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(24, '2020-10-04 09:22:21.459292', '3', 'Pradnyoday Dyclonine', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(25, '2020-10-04 09:22:40.588603', '2', 'Pradnyoday azithromycin', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(26, '2020-10-04 11:04:47.010179', '6', 'Pharma Crocin', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(27, '2020-10-04 11:06:22.486392', '6', 'Pharma Crocin', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1),
(28, '2020-10-04 11:09:11.127185', '2', 'Pradnyoday azithromycin', 2, '[{\"changed\": {\"fields\": [\"Drug image path\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'dashboard', 'diagnosis'),
(8, 'dashboard', 'drugs'),
(10, 'dashboard', 'hospitaldrugs'),
(12, 'dashboard', 'patients'),
(13, 'ocr', 'savefile'),
(6, 'sessions', 'session'),
(9, 'trials', 'trial'),
(7, 'users', 'account');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-09-25 09:36:49.720870'),
(2, 'auth', '0001_initial', '2020-09-25 09:36:51.443147'),
(3, 'admin', '0001_initial', '2020-09-25 09:36:59.515777'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-09-25 09:37:01.368082'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-25 09:37:01.409200'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-09-25 09:37:02.530066'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-09-25 09:37:03.625868'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-09-25 09:37:04.507018'),
(9, 'auth', '0004_alter_user_username_opts', '2020-09-25 09:37:04.576943'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-09-25 09:37:05.492434'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-09-25 09:37:05.557309'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-09-25 09:37:05.612280'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-09-25 09:37:06.396405'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-09-25 09:37:07.275065'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-09-25 09:37:08.421411'),
(16, 'auth', '0011_update_proxy_permissions', '2020-09-25 09:37:08.500206'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-09-25 09:37:09.498842'),
(18, 'users', '0001_initial', '2020-09-25 09:37:09.901929'),
(19, 'dashboard', '0001_initial', '2020-09-25 09:37:10.475675'),
(20, 'sessions', '0001_initial', '2020-09-25 09:37:11.849793'),
(21, 'dashboard', '0002_auto_20200925_1708', '2020-09-25 11:39:00.274576'),
(22, 'trials', '0001_initial', '2020-09-25 12:13:23.900673'),
(23, 'dashboard', '0003_auto_20200925_2046', '2020-09-25 15:16:17.469292'),
(24, 'dashboard', '0004_auto_20200925_2157', '2020-09-25 16:27:55.781910'),
(25, 'dashboard', '0005_diagnosis_hospitaldrugs_patients', '2020-09-29 10:55:33.471366'),
(26, 'ocr', '0001_initial', '2020-09-29 11:34:47.947612'),
(27, 'dashboard', '0006_auto_20200930_1343', '2020-09-30 08:14:22.779378'),
(28, 'dashboard', '0007_auto_20201001_0136', '2020-09-30 20:06:47.509296');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('13fofup5jc22mc6uzp0v99wgah5puzco', '.eJxVjDsOwjAQRO_iGln-EK9NSc8ZrF17jQPIkeKkQtydREoBxTTz3sxbRFyXGtfOcxyzuAgtTr8dYXpy20F-YLtPMk1tmUeSuyIP2uVtyvy6Hu7fQcVet3VyFjk4UsQOCjJnD2dvnQYqwQYcgLxxBY2HMoRs1JakFGiyWlnD4vMF86k3rQ:1kP1oO:GrtcFcILQi_VuA4UZzJ2b7fljj5__PnuMkFpYq7QjTY', '2020-10-18 11:04:16.295265'),
('1q5e5rtnxjzla8edh4aa3fk6tn43mecx', '.eJxVjMsOwiAQRf-FtSE8OkBduvcbyMAMUjUlKe3K-O_apAvd3nPOfYmI21rj1nmJE4mzCOL0uyXMD553QHecb03mNq_LlOSuyIN2eW3Ez8vh_h1U7PVbg_VkANCNoFw2mtE6phGLghyUAqRCgyIwSdviOCCabGn07HEIGoJ4fwDd0jfT:1kP6qe:hatPHVHkbObl6rlCoFtvdTMTfSS-Ts7qjy-38_LDiZY', '2020-10-18 16:26:56.151364'),
('4hknq4oxcntdau458p36v7292fwjb26d', '.eJxVjDsOwjAQRO_iGln-EK9NSc8ZrF17jQPIkeKkQtydREoBxTTz3sxbRFyXGtfOcxyzuAgtTr8dYXpy20F-YLtPMk1tmUeSuyIP2uVtyvy6Hu7fQcVet3VyFjk4UsQOCjJnD2dvnQYqwQYcgLxxBY2HMoRs1JakFGiyWlnD4vMF86k3rQ:1kOShK:LCAyI4gA1ie3tsbiwIrrF4CWmwburfo-1tGvRbKYb_s', '2020-10-16 21:34:38.681136'),
('7onhv1umzobbs6itbtr8ulwpzfqnmrul', '.eJxVjDsOwjAQBe_iGln-xFqLkp4zWLvrNQ4gW4qTCnF3iJQC2jcz76USbmtN25AlzVmdlVen342QH9J2kO_Ybl1zb-syk94VfdChrz3L83K4fwcVR_3WWJDJg4dsyBkCmwEZxUoAw66AJQlTjN4CF4leZBIXgqFiQQAzqPcHCQE4tw:1kNuj2:WP0WF8ZRaheM0IfnKxiwOEqgOTK034sYDY52rjh-Ykc', '2020-10-15 09:18:08.240719'),
('fy7sshnjcbp3eqijmfohthfdxcjyxval', '.eJxVjDsOwjAQBe_iGln-xFqLkp4zWLvrNQ4gW4qTCnF3iJQC2jcz76USbmtN25AlzVmdlVen342QH9J2kO_Ybl1zb-syk94VfdChrz3L83K4fwcVR_3WWJDJg4dsyBkCmwEZxUoAw66AJQlTjN4CF4leZBIXgqFiQQAzqPcHCQE4tw:1kMu1W:nB_UpkXOylNRj7PuZi_Bepr8mg7ImkRTll6zu4Q5DYw', '2020-10-12 14:21:02.005571'),
('qtmtre8uyjtd401qjmdm7g2e7yyl087i', '.eJxVjDsOwjAQRO_iGln-EK9NSc8ZrF17jQPIkeKkQtydREoBxTTz3sxbRFyXGtfOcxyzuAgtTr8dYXpy20F-YLtPMk1tmUeSuyIP2uVtyvy6Hu7fQcVet3VyFjk4UsQOCjJnD2dvnQYqwQYcgLxxBY2HMoRs1JakFGiyWlnD4vMF86k3rQ:1kLkdx:me6d4vuL-qNDbRLjDE4a3o-oC758Wr9Tu5MtSJGk3Gw', '2020-10-09 10:07:57.831523'),
('tfa9epga1ndih3sj82eozi0z4v82lxqj', '.eJxVjDsOwjAQRO_iGln-EK9NSc8ZrF17jQPIkeKkQtydREoBxTTz3sxbRFyXGtfOcxyzuAgtTr8dYXpy20F-YLtPMk1tmUeSuyIP2uVtyvy6Hu7fQcVet3VyFjk4UsQOCjJnD2dvnQYqwQYcgLxxBY2HMoRs1JakFGiyWlnD4vMF86k3rQ:1kLqoL:zJZoUU52U7BzlyURmo32nZsLMvTExhRFbzUOidwjUhQ', '2020-10-09 16:43:05.464290'),
('vglmg29nmz51t98x69mybht4y9sgykjy', '.eJxVjDsOwjAQRO_iGln-EK9NSc8ZrF17jQPIkeKkQtydREoBxTTz3sxbRFyXGtfOcxyzuAgtTr8dYXpy20F-YLtPMk1tmUeSuyIP2uVtyvy6Hu7fQcVet3VyFjk4UsQOCjJnD2dvnQYqwQYcgLxxBY2HMoRs1JakFGiyWlnD4vMF86k3rQ:1kOUNS:dLU8Op1XZHjqlo0z7MHDMrfUuxcLQgXTeG-zGASXHjQ', '2020-10-16 23:22:14.245013');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(1000) NOT NULL,
  `nct_no` varchar(50) NOT NULL,
  `drug_image_path` varchar(100) NOT NULL,
  `min_age` int(11) NOT NULL,
  `max_age` int(11) NOT NULL,
  `other_medications` varchar(2000) NOT NULL COMMENT 'Not advised for',
  `comorbid_conditions` varchar(2000) NOT NULL COMMENT 'Not advised for',
  `blood_pressure_req` varchar(200) NOT NULL,
  `posology` varchar(200) NOT NULL,
  `efficacy` decimal(5,2) NOT NULL,
  `drug_category` varchar(200) NOT NULL,
  `upload_date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `allergies` varchar(1000) NOT NULL COMMENT 'Not advised for',
  `hereditary_diseases` varchar(2000) NOT NULL COMMENT 'Not advised for'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`drug_id`, `drug_name`, `nct_no`, `drug_image_path`, `min_age`, `max_age`, `other_medications`, `comorbid_conditions`, `blood_pressure_req`, `posology`, `efficacy`, `drug_category`, `upload_date`, `user_id`, `allergies`, `hereditary_diseases`) VALUES
(1, 'Acelofenac', 'NCT3310', 'default.jpg', 14, 35, 'nil', 'nil', '0,2', 'tablet', '65.32', 'Analgesic & Antipyretic / Muscle Relaxants', '2020-09-30 21:07:43.056983', 1, 'nil', 'nil'),
(2, 'azithromycin', 'NCT123', 'images/Drugs/Pradnyoday/1588297566_640Pills.jpg', 14, 55, 'nil', 'nil', '0,2', 'tablet', '78.32', 'Analgesic & Antipyretic / Muscle Relaxants', '2020-09-30 21:10:28.667744', 1, 'nil', 'nil'),
(3, 'Dyclonine', 'NCT110', 'images/Drugs/Pradnyoday/drug3.jpg', 11, 90, 'mouth cancer', 'nil', '1', 'tablet', '51.32', 'Respiratory', '2020-09-30 21:12:24.336127', 1, 'nil', 'nil'),
(4, 'Ascoril', 'NCT112', 'images/Drugs/Pradnyoday/drug4.jpg', 11, 70, 'nil', 'nil', '2', 'tablet', '66.30', 'Analgesic & Antipyretic / Muscle Relaxants', '2020-09-30 21:13:39.601911', 1, 'nil', 'nil'),
(6, 'Crocin', 'NCT556', 'images/Drugs/Pharma/pills310px.jpg', 12, 90, 'nil', 'nil', '0,1', 'tablet', '80.30', 'Analgesic & Antipyretic / Muscle Relaxants', '2020-09-30 21:16:22.375935', 4, 'milk', 'diabetes,hypothyroidism'),
(7, 'Tramadol HCl Injection 50mg 1 ml 1 ml', 'NCT115420', 'images/Drugs/Cipla/Tramadol-50mgml-Solution-for-Injection-or-Infusion-Tramataj-2.jpg', 14, 90, 'nil', 'nil', '0,2', 'syringe', '70.15', 'Analgesic & Antipyretic / Muscle Relaxants', '2020-10-04 11:44:16.610504', 6, 'nil', 'nil'),
(8, 'Ibuprofen 500 mg', 'NCT11023', 'images/Drugs/Cipla/pills310px.jpg', 14, 35, 'nil', 'nil', '02', 'tablet', '42.32', 'Analgesic & Antipyretic / Muscle Relaxants', '2020-10-04 12:33:58.814833', 6, 'nil', 'nil'),
(9, 'Paracetamol Tablets IP 500mg', 'NCT465', 'images/Drugs/Cipla/1588297566_640Pills.jpg', 12, 90, 'nil', 'nil', '0,1', 'tablet', '51.32', 'Analgesic & Antipyretic / Muscle Relaxants', '2020-10-04 12:37:35.987556', 6, 'nil', 'nil');

-- --------------------------------------------------------

--
-- Table structure for table `drugs_category`
--

CREATE TABLE `drugs_category` (
  `id` int(11) NOT NULL,
  `drug_id` varchar(3) DEFAULT NULL,
  `generic_name` varchar(113) DEFAULT NULL,
  `category` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drugs_category`
--

INSERT INTO `drugs_category` (`id`, `drug_id`, `generic_name`, `category`) VALUES
(1, '1', 'Aceclofenac 100mg and Paracetamol 325 mg Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(2, '2', 'Aceclofenac Tablets IP 100mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(3, '3', 'Acetaminophen 325 + Tramadol Hydrochloride 37.5 film\n coated Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(4, '4', 'ASPIRIN Tablets IP 150 mg 14\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(5, '5', 'DICLOFENAC 50 mg+ PARACETAMOL 325 mg+\n CHLORZOXAZONE 500 mg Tablets 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(6, '6', 'Diclofenac Sodium 50mg + Serratiopeptidase 10mg Tablet\n 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(7, '7', 'Diclofenac Sodium (SR) 100 mg Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(8, '8', 'Diclofenac Sodium 25mg per ml Inj. IP 3 ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(9, '9', 'Diclofenac Sodium 50 mg Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(10, '10', 'Etoricoxilb Tablets IP 120mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(11, '11', 'Etoricoxilb Tablets IP 90mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(12, '12', 'Ibuprofen 400 mg + Paracetamol 325 mg Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(13, '13', 'Ibuprofen 200 mg film coated Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(14, '14', 'Ibuprofen 400 mg film coated Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(15, '15', 'Nimesulide BP 100 mg Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(16, '16', 'Diclofenac Sodium 50 mg and Paracetamol 325 mg Tablet\n 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(17, '17', 'Paracetamol Syrup IP 125mg/5ml 60 ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(18, '18', 'Paracetamol Tablets IP 500mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(19, '19', 'Pentazocine Injection IP 30mg/ml 1 ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(20, '20', 'Serratiopeptidase 10 mg Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(21, '21', 'Tramadol Hcl 100 mg Inj. 2ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(22, '22', 'Tramadol HCl Injection 50mg 1 ml 1 ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(23, '23', 'Tramadol 50 mg Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(24, '24', 'Allopurinol 100 mg Tablet 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(25, '25', 'DICYCLOMINE 10 mg+ MEFENAMIC ACID 250 mg\n Tablets 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(26, '26', 'HYDROXYCHLOROQUINE Tablets IP 200 mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(27, '27', 'PARACETAMOL 325 mg+ TRAMADOL 37.5 mg Tablets 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(28, '28', 'PARACETAMOL Tablets IP 650 mg 15\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(29, '29', 'Aceclofenac 100 mg + Paracetamol 325 mg + Serratiopeptidase 15 mg Tablets 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(30, '30', 'PIROXICAM Capsules IP 20 mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(31, '31', 'MEFENAMIC ACID SUSPENSION 100 mg/5 ml 60 ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(32, '32', 'ACECLOFENAC Tablets SR/CR 200 mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(33, '33', 'THIOCOLCHICOSIDE 4 mg+ ACECLOFENAC 100 mg\n Tablets 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(34, '34', 'BACLOFEN Tablets IP 10 mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(35, '35', 'Ketorolac Tromethamine Tablets IP 10mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(36, '36', 'MEFENAMIC ACID 500 MG+ PARACETAMOL 325 MG\n TABLETS 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(37, '37', 'TRAMADOL TABLETS SR 100 MG', 'Analgesic & Antipyretic / Muscle Relaxants'),
(38, '38', 'ALFACALCIDOL SOFT GELATIN CAPSULES 0.25 MCG', 'Analgesic & Antipyretic / Muscle Relaxants'),
(39, '39', 'PARACETAMOL 325mg+ PHENYLEPHRINE 10 mg+ CHLORPHENIRAMINE 2 mg Tablets 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(40, '40', 'Cetirizine Dihydrochloride IP 5mg, Phenylephrine HCl IP 10 mg, Paracetamol IP 325mg Tablets 10\'s 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(41, '41', 'Diclofenac Potassium BP 50mg + Paracetamol 325mg + Serratiopeptidase 10mg Tablets 10\'s 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(42, '42', 'Aceclofenac 100 mg + Paracetamol 325 mg + Chorzoxazone 250 mg film coated tab. 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(43, '43', 'Paracetamol 125mg+ CPM 1 mg + Sodium Citrate 60mg in a flavour syrup base 60 ML Bottles', 'Analgesic & Antipyretic / Muscle Relaxants'),
(44, '44', 'Paracetamol IP?125 mg., Mefanamic Acid IP?50 mg., in a flavoured syrupy base?q.s. 60 ML', 'Analgesic & Antipyretic / Muscle Relaxants'),
(45, '45', 'Dicyclomine 10mg + Mefenamic 250mg Tablets 10\'s 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(46, '46', 'Paracetamol I.P. 125mg, Promethazine HCl I.P. 5mg\n Suspension 15 ml 15 ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(47, '47', 'Diacerein 50 mg +Methylsulphonylmethane 250 mg + Glucosamine sulphate 750 mg tab. 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(48, '48', 'Diacerein 50mg + Glucosamine Sulphate 500mg Tablets 10\'s\n 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(49, '49', 'Haloperidol 0.5 mg Tablet. 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(50, '50', 'Piroxicam 20 mg btablets 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(51, '51', 'Piroxicam 20 mg with bezyl alcohol injection 1ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(52, '52', 'Piroxicam 40 mg with bezyl alcohol injection 2ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(53, '53', 'Paracetamol DS syrup /250 mg 60ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(54, '54', 'Etodolac Tablets IP 300mg 10\'s 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(55, '55', 'Diacerein Capsules IP 50mg', 'Analgesic & Antipyretic / Muscle Relaxants'),
(56, '56', 'Dicyclomine HCl (Dicycloverine) Injection IP 10mg/ml', 'Analgesic & Antipyretic / Muscle Relaxants'),
(57, '57', 'Febuxostat Tablets 40mg', 'Analgesic & Antipyretic / Muscle Relaxants'),
(58, '58', 'Febuxostat Tablets 80mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(59, '59', 'Leflunomide Tablets IP 20mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(60, '60', 'Mefenamic Acid 50mg, Paracetamol 125mg/5ml Suspension', 'Analgesic & Antipyretic / Muscle Relaxants'),
(61, '61', 'Tizanidine Tablets I.P 2mg 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(62, '62', 'Diacerein 50 mg + Glucosamine Sulphate 750 mg Tablets 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(63, '63', 'MEFENAMIC ACID 500 MG TABLETS 10\'s', 'Analgesic & Antipyretic / Muscle Relaxants'),
(64, '64', 'Cetirizine (5 mg/ 5 ml) Syrup 60 ml', 'Antiallergic'),
(65, '65', 'Cetrizine 10mg film coated Tablet 10\'s', 'Antiallergic'),
(66, '66', 'Pheniramine Maleate I.P. 22.75mg,Methyl Paraben(as preservative) I.P. 0.135% w/v, Propyl Paraben(as 2 ML', 'Antiallergic'),
(67, '67', 'Ebastine Film Coated Tablets 10mg', 'Antiallergic'),
(68, '68', 'Hydroxyzine HCl Tablets IP 10mg', 'Antiallergic'),
(69, '69', 'Bleomycin Injection IP 15mg Vial', 'Anticancer/Oncology'),
(70, '70', 'Cisplatin Injection IP10 mg Vial', 'Anticancer/Oncology'),
(71, '71', 'Cisplatin Injection BP 50mg/50ml Vial', 'Anticancer/Oncology'),
(72, '72', 'Doxorubicin 10 mg Inj. Vial', 'Anticancer/Oncology'),
(73, '73', 'Doxorubicin Injection IP 50mg Vial', 'Anticancer/Oncology'),
(74, '74', 'Etoposide 100 mg/5ml Inj. Vial', 'Anticancer/Oncology'),
(75, '75', 'Gemcitabine 1000 mg Inj. Vial', 'Anticancer/Oncology'),
(76, '76', 'Gemcitabine Injection IP 200mg Vial', 'Anticancer/Oncology'),
(77, '77', 'Tamoxifen Citrate 10 mg I.P Tablets 10\'s', 'Anticancer/Oncology'),
(78, '78', 'Tamoxifen Citrate 20 mg I.P Tablets 10\'s', 'Anticancer/Oncology'),
(79, '79', 'Megestrol Acetate Tablets IP 40mg 10\'s', 'Anticancer/Oncology'),
(80, '80', 'Anastrozole Tablets IP 1mg', 'Anticancer/Oncology'),
(81, '81', 'Bicalutamide Tab I.P 50mg 10\'s', 'Anticancer/Oncology'),
(82, '82', 'Bortezomib Injection 3.5 mg Vial', 'Anticancer/Oncology'),
(83, '83', 'Capecitabine Tab I.P 500mg', 'Anticancer/Oncology'),
(84, '84', 'Dacarbazine Injection 200mg VIAL', 'Anticancer/Oncology'),
(85, '85', 'Daunorubicin HCl Injection 20mg vial', 'Anticancer/Oncology'),
(86, '86', 'Imatinib mesylate Tablets IP 400mg', 'Anticancer/Oncology'),
(87, '87', 'Lenalidomide Capsules 10mg', 'Anticancer/Oncology'),
(88, '88', 'Letrozole Tablets 2.5mg', 'Anticancer/Oncology'),
(89, '89', 'Leuprolide Acetate Injections 3.75mg 1\'s', 'Anticancer/Oncology'),
(90, '90', 'Oxaliplatin Injections 50mg Vial', 'Anticancer/Oncology'),
(91, '91', 'Paclitaxel Injection IP 100mg (6mg/ml) Vial', 'Anticancer/Oncology'),
(92, '92', 'Vincristine Injection IP 1mg 1 ml', 'Anticancer/Oncology'),
(93, '93', 'Cyclophosphamide 500 mg injection VIAL', 'Anticancer/Oncology'),
(94, '94', 'Hydroxyurea Capsule 500mg 10\'s', 'Anticancer/Oncology'),
(95, '95', 'Glibenclamide 2.5 mg Tablet (Scored Oval) 10\'s', 'Antidiabetic'),
(96, '96', 'Glibenclamide 5 mg Tablet (Scored Oval) 10\'s', 'Antidiabetic'),
(97, '97', 'Gliclazide 40 mg Tablet 10\'s', 'Antidiabetic'),
(98, '98', 'Gliclazide 80 mg Tablet 10\'s', 'Antidiabetic'),
(99, '99', 'Glimeperide Tablets IP 1mg 10\'s', 'Antidiabetic'),
(100, '100', 'Glimeperide Tablets IP 2mg 10\'s', 'Antidiabetic'),
(101, '101', 'Glipizide 5 mg Tablet 10\'s', 'Antidiabetic'),
(102, '102', 'INSULIN INJECTION IP 40 IU/ml (Insulin Human\n Recombinant) 10 ml Vial', 'Antidiabetic'),
(103, '103', 'INSULIN INJECTION (INSULIN HUMAN SOLUBLE 30% & ISOPHANE 70%) 40 IU/ML 10ml Vial', 'Antidiabetic'),
(104, '104', 'Metformin Hydrochloride 1000 mg SR Tablet 10\'s', 'Antidiabetic'),
(105, '105', 'Metformin Hydrochloride Tablets IP 500mg 10\'s', 'Antidiabetic'),
(106, '106', 'Pioglitazone 15 mg Tablet 10\'s', 'Antidiabetic'),
(107, '107', 'Pioglitazone 30 mg Tablet 10\'s', 'Antidiabetic'),
(108, '108', 'Metformin 500mg SR +Pioglitazone 15mg Tablet 10\'s', 'Antidiabetic'),
(109, '109', 'BIPHASIC ISOPHANE INSULIN INJECTION IP 4O IU/ML\n (50:50 )', 'Antidiabetic'),
(110, '110', 'GLARGINE 100 IU / ml INJECTION Cartridge 3 ml', 'Antidiabetic'),
(111, '111', 'GLIMEPIRIDE 2 mg + METFORMIN HYDROCHLORIDE\n 500 mg SR Tablets 10\'s', 'Antidiabetic'),
(112, '112', 'GLICLAZIDE 80 mg + METFORMIN HYDROCHLORIDE\n Tablets 500 mg 15\'s', 'Antidiabetic'),
(113, '113', 'VOGLIBOSE Tablets IP 0.3 mg 10\'s', 'Antidiabetic'),
(114, '114', 'GLICLAZIDE TABS SR 60 MG 10\'s', 'Antidiabetic'),
(115, '115', 'Acarbose Tablets IP 50 MG 10\'s', 'Antidiabetic'),
(116, '116', 'VOGLIBOSE Tablets IP 0.2 mg 10\'s', 'Antidiabetic'),
(117, '117', 'METFORMIN HYDROCHLORIDE TABLETS IP PROLONG RELEASE 500 MG', 'Antidiabetic'),
(118, '118', 'Glibenclamide 5mg + MetforminHcl 500 mg Tablet 10\'s', 'Antidiabetic'),
(119, '119', 'Glimepiride Tablets 3mg 10\'s', 'Antidiabetic'),
(120, '120', 'Glimepiride Tablets 4mg 10\'s', 'Antidiabetic'),
(121, '121', 'Metformin 1000mg SR + Glimipride 2mg Tablet 10\'s', 'Antidiabetic'),
(122, '122', 'Biphasic Isophane Insulin Injection I.P 100 Iu/ml (30:70 ) (30% Soluble Insulin And 70% Isophane Ins 3ml', 'Antidiabetic'),
(123, '123', 'Glimepiride 1mg Metformin SR 500mg Tablets 10\'s', 'Antidiabetic'),
(124, '124', 'Glimepiride 2mg, Metformin Hydrochloride 1g Tablets 10\'s', 'Antidiabetic'),
(125, '125', 'Metformin SR Tablets IP 850mg 10\'s', 'Antidiabetic'),
(126, '126', 'Teneligliptin Film coated tablets 20mg 10\'s', 'Antidiabetic'),
(127, '127', 'Voglibose 0.2mg, Metformin 500mg SR Tablets 10\'s', 'Antidiabetic'),
(128, '128', 'Voglibose 0.3 mg, Metformin 500mg Tablets', 'Antidiabetic'),
(129, '129', 'GLIMEPIRIDE 2 mg + METFORMIN HYDROCHLORIDE\n 500 mg SR Tablets 15\'s', 'Antidiabetic'),
(130, '130', 'GLICLAZIDE 80 mg + METFORMIN HYDROCHLORIDE\n Tablets 500 mg 10\'s', 'Antidiabetic'),
(131, '131', 'Acyclovir 400mg Tablets 10\'s', 'Antiinfective'),
(132, '132', 'Amikacin Injection IP 100mg/2ml, 2ml vial 2ml Vial', 'Antiinfective'),
(133, '133', 'Amikacin Injections IP 250mg 2ml Vial', 'Antiinfective'),
(134, '134', 'Amikacin Injections IP 250mg/ml 2ml 2ml Vial', 'Antiinfective'),
(135, '135', 'Amoxycillin 1000mg+ Clavulanic acid 200 mg Inj. Vial with\n WFI', 'Antiinfective'),
(136, '136', 'Amoxycillin 200 mg, Clavulanic acid 28.5 mg /5ml Oral\n Suspension 30 ml', 'Antiinfective'),
(137, '137', 'Amoxycillin 250mg + Clavulanic acid 50 mg Inj. Vial with WFI', 'Antiinfective'),
(138, '138', 'Amoxycillin 500mg + Clavulanic acid 100mg Inj. Vial with WFI', 'Antiinfective'),
(139, '139', 'Amoxycillin 500mg + Clavulanic acid 125 mg film coated\n Tablet 6\'s', 'Antiinfective'),
(140, '140', 'Amoxycillin 250mg + Cloxacillin 250 mg Caps 10\'s', 'Antiinfective'),
(141, '141', 'Amoxycillin 125 mg Kid Tablet 10\'s', 'Antiinfective'),
(142, '142', 'Amoxycillin 125mg/ 5ml Dry Syrup 60 ml', 'Antiinfective'),
(143, '143', 'Amoxycillin Capsules IP 250mg 10\'s', 'Antiinfective'),
(144, '144', 'Amoxycillin Capsules IP 500mg 10\'s', 'Antiinfective'),
(145, '145', 'Ampicillin 500mg inj. Vial', 'Antiinfective'),
(146, '146', 'Azithromycin (100mg/ 5ml) Suspension 15 ml', 'Antiinfective'),
(147, '147', 'Azithromycin 100 mg DT Tablet 10\'s', 'Antiinfective'),
(148, '148', 'Azithromycin 250 mg film coated Tablet 10\'s', 'Antiinfective'),
(149, '149', 'Azithromycin 500 mg film coated Tablet 10\'s', 'Antiinfective'),
(150, '150', 'Cefadroxil Dispersible Tablets 250mg 10\'s', 'Antiinfective'),
(151, '151', 'Cefadroxil 500mg Film Coated Tablet 10\'s', 'Antiinfective'),
(152, '152', 'Cefixime oral suspension 50mg/5ml 30 ml', 'Antiinfective'),
(153, '153', 'Cefixime film coated Tablets IP 100mg 10\'s', 'Antiinfective'),
(154, '154', 'Cefixime 200 mg film coated Tablet 10\'s', 'Antiinfective'),
(155, '155', 'Cefoperazone 1gm + Sulbactam 1gm Inj. Vial & wfi', 'Antiinfective'),
(156, '156', 'Cefoperazone 500mg+ Sulbactam 500 mg Inj. Vial & wfi', 'Antiinfective'),
(157, '157', 'Cefoperazone Injection IP 1gm Vial', 'Antiinfective'),
(158, '158', 'Cefotaxime Sodium 1 gm+ Sulbactam Sodium 500 mg Inj.\n Vial & wfi', 'Antiinfective'),
(159, '159', 'Cefotaxime Sodium 250mg+ Sulbactam Sodium 125 mg Inj.\n Vial & wfi', 'Antiinfective'),
(160, '160', 'Cefotaxime Sodium 500mg + Sulbactam Sodium ( 250 mg Inj.', 'Antiinfective'),
(162, '161', 'Cefotaxime Sodium 1000mg Inj. Vial & wfi', 'Antiinfective'),
(163, '162', 'Cefotaxime Sodium 250 mg Inj. Vial & wfi', 'Antiinfective'),
(164, '163', 'Cefotaxime Sodium 500 mg Inj. Vial & wfi', 'Antiinfective'),
(165, '164', 'Cefpodoxime Proxetil 100 mg Tablet IP 10\'s', 'Antiinfective'),
(166, '165', 'Cefpodoxime film coated Tablets IP 200mg 10\'s', 'Antiinfective'),
(167, '166', 'Ceftazadime 1000 mg Inj. Vial & wfi', 'Antiinfective'),
(168, '167', 'Ceftazadime 250 mg Inj. Vial & wfi', 'Antiinfective'),
(169, '168', 'Ceftazadime 500 mg Inj. Vial & wfi', 'Antiinfective'),
(170, '169', 'Ceftriaxone 1000mg+ Sulbactam 500 mg Inj. Vial & wfi', 'Antiinfective'),
(171, '170', 'Ceftriaxone 1000mg + Tazobactum 125 mg Inj. Vial & wfi', 'Antiinfective'),
(172, '171', 'Ceftriaxone 250 mg + Sulbactum 125 mg Injection with WFI\n Vial & wfi', 'Antiinfective'),
(173, '172', 'Ceftriaxone 500mg with Sulbactum 250mg Injection Vial with WFI', 'Antiinfective'),
(174, '173', 'Ceftriaxone Injection IP 1g Vial & wfi', 'Antiinfective'),
(175, '174', 'Ceftriaxone 250 mg Inj. Vial & wfi', 'Antiinfective'),
(176, '175', 'Ceftriaxone 500 mg Inj. Vial & wfi', 'Antiinfective'),
(177, '176', 'Cefuroxime Axetil 250 mg film coated Tablet 10\'s', 'Antiinfective'),
(178, '177', 'Cefuroxime Axetil 500mg film coated Tablet 10\'s', 'Antiinfective'),
(179, '178', 'Cephalexin Dispersible Tablets IP 125mg 10\'s', 'Antiinfective'),
(180, '179', 'Cephalexin Capsules IP 250mg 10\'s', 'Antiinfective'),
(181, '180', 'Cephalexin Capsules IP 500mg 10\'s', 'Antiinfective'),
(182, '181', 'Ciprofloxacin 250mg + Tinidazole 300 mg film coated Tablet\n 10\'s', 'Antiinfective'),
(183, '182', 'Ciprofloxacin 500mg + Tinidazole 600 mg) film coated\n Tablet 10\'s', 'Antiinfective'),
(184, '183', 'Ciprofloxacin 250 mg film coated Tablet 10\'s', 'Antiinfective'),
(185, '184', 'Ciprofloxacin 500 mg film coated Tablet 10\'s', 'Antiinfective'),
(186, '185', 'Co-trimoxazole (Sulphamethoxazole 200 mg + Trimethoprim 40mg / 5ml) Susp 50 ml', 'Antiinfective'),
(187, '186', 'Terimethoprim and Sulphamethoxazole Tab IP (80 mg + 400\n mg) 10\'s', 'Antiinfective'),
(188, '187', 'Doxycycline Capsules IP 100mg 10\'s', 'Antiinfective'),
(189, '188', 'Gentamycin Sulphate 80 mg/ 2ml Inj. 2 ml', 'Antiinfective'),
(190, '189', 'Levofloxacin film coated Tablets IP 250mg 10\'s', 'Antiinfective'),
(191, '190', 'Levofloxacin film coated Tablets IP 500mg 10\'s', 'Antiinfective'),
(192, '191', 'Meropenem Injection IP 1gm Vial & wfi', 'Antiinfective'),
(193, '192', 'Norfloxacin 400 mg + Tinidazole 600 mg film coated Tablet\n 10\'s', 'Antiinfective'),
(194, '193', 'Norfloxacin 400 mg film coated Tablet 10\'s', 'Antiinfective'),
(195, '194', 'Ofloxacin 200 mg + Ornidazole 500 mg film coated Tablet 10\'s', 'Antiinfective'),
(196, '195', 'Ofloxacin film coated Tablets IP 200mg 10\'s', 'Antiinfective'),
(197, '196', 'Ofloxacin 400 mg film coated Tablet 10\'s', 'Antiinfective'),
(198, '197', 'Piperacillin 4gm + Tazobactum 0.5 gm Inj. Vial & wfi', 'Antiinfective'),
(199, '198', 'Roxithromycin (50 mg/ 5ml) Susp. 30ml', 'Antiinfective'),
(200, '199', 'Roxithromycin 150 mg film coated Tablet 10\'s', 'Antiinfective'),
(201, '200', 'Roxithromycin 300 mg film coated Tablet 10\'s', 'Antiinfective'),
(202, '201', 'Tinidazole 300 mg film coated Tablet 10\'s', 'Antiinfective'),
(203, '202', 'Tinidazole film coated Tablets IP 500mg 10\'s', 'Antiinfective'),
(204, '203', 'Vancomycin 500 mg Vial & wfi', 'Antiinfective'),
(205, '204', 'Fluconazole Tablets 150 mg Film Coated Capsule 10\'s', 'Antiinfective'),
(206, '205', 'Ciprofloxacin (2mg/ml) Infusion 100 ml', 'Antiinfective'),
(207, '206', 'Metronidazole 5 mg / ml Infusion 100 ml', 'Antiinfective'),
(208, '207', 'Albendazole Suspension IP 200 mg/ 5ml 10 ml', 'Antiinfective'),
(210, '208', 'ALBENDAZOLE 400 mg + IVERMECTIN 6 mg Tablets 1\'s', 'Antiinfective'),
(211, '209', 'Albendazole Tablets IP 400MG 10\'s', 'Antiinfective'),
(212, '210', 'Diethylcarbamazine citrate 100mg film coated Tablets 10\'s', 'Antiinfective'),
(213, '211', 'Metronidazole film coated Tablets IP 200mg 10\'s', 'Antiinfective'),
(214, '212', 'Metronidazole film coated Tablets IP 400mg 10\'s', 'Antiinfective'),
(215, '213', 'Norfloxacin 100mg+ Metronidazole 100mg/5 ml Syrup 30 ml\n bottle', 'Antiinfective'),
(216, '214', 'Arteether 150mg inj 2ml Vial', 'Antiinfective'),
(217, '215', 'Chloroquine Phosphate 250 mg film coated Tablet 10\'s', 'Antiinfective'),
(218, '216', 'PRIMAQUINE TABLETS IP 15 MG 10\'s', 'Antiinfective'),
(219, '217', 'ARTESUNATE INJECTION 60 MG', 'Antiinfective'),
(220, '218', 'ARTEMETHER 80 MG + LUMEFANTRINE 480 MG SR\n TABLETS', 'Antiinfective'),
(221, '219', 'QUININE SULPHATE TABLETS IP 300 MG FILM\n COATED TABLETS', 'Antiinfective'),
(222, '220', 'IMIPENEM AND CILASTATIN INJ IP (500mg+500mg)\n Vial & WFI', 'Antiinfective'),
(223, '221', 'CLINDAMYCIN CAPSULES IP 300 MG', 'Antiinfective'),
(224, '222', 'RIFAMPICIN and ISONIAZIDE TABLETS IP (450 MG+300\n MG)', 'Antiinfective'),
(225, '223', 'CLARITHROMYCIN Tablets IP 500 mg 4\'s', 'Antiinfective'),
(226, '224', 'CEFIXIME 200 mg + OFLOXACIN 200 mg Tablets 10\'s', 'Antiinfective'),
(227, '225', 'LINEZOLID TABLETS IP 600 MG', 'Antiinfective'),
(228, '226', 'CEFPODOXIME 200 mg+ CLAVULANIC ACID 125 mg\n Tablets 6\'s', 'Antiinfective'),
(229, '227', 'ITRACONAZOLE Capsules 100 mg 4\'s', 'Antiinfective'),
(230, '228', 'CEFIXIME 200 mg + CLAVULANIC ACID 125 mg (AS POT.CLAVULANATE )Tablets 10\'s', 'Antiinfective'),
(231, '229', 'Diethylcarbamazine Tablets IP 50 mg 30\'s', 'Antiinfective'),
(232, '230', 'TERBINAFINE 250 MG TABLETS', 'Antiinfective'),
(233, '231', 'ETHAMBUTOL TABLETS IP 800 MG', 'Antiinfective'),
(234, '232', 'MOXIFLOXACIN TABLETS 400 MG', 'Antiinfective'),
(235, '233', 'ACICLOVIR DISPERSIBLE TABLETS IP 800 MG', 'Antiinfective'),
(236, '234', 'PYRANTEL PAMOATE ORAL SUSPENSION IP 250 MG/10 ML', 'Antiinfective'),
(237, '235', 'CEFUROXIME 500 mg+ CLAVULANIC ACID 125 mg (AS POT.CLAVULANATE ) Tablets 6\'s', 'Antiinfective'),
(238, '236', 'OXYTETRACYCLINE CAPSULES IP 250 MG', 'Antiinfective'),
(239, '237', 'Ketoconazole Tablets IP 200 mg 10\'s', 'Antiinfective'),
(240, '238', 'AMOXYCILLIN 250mg WITH POTASSIUM\n CLAVULANATE 125mg Tablets IP 6\'s', 'Antiinfective'),
(241, '239', 'AMOXYCILLIN and POTASSIUM CLAVULANATE\n Tablets IP (875mg+125mg) 6\'s', 'Antiinfective'),
(242, '240', 'CLINDAMYCIN INJ IP 300 MG/2 ML', 'Antiinfective'),
(243, '241', 'LINEZOLID INFUSION 600 MG/300 ML', 'Antiinfective'),
(244, '242', 'OFLOXACIN INFUSION IP 200 mg /100 ml 100 ml', 'Antiinfective'),
(245, '243', 'ACICLOVIR INTRAVENOUS INFUSION IP 500 MG/VIAL\n VIAL', 'Antiinfective'),
(246, '244', 'IVERMECTIN TABLETS 12 MG', 'Antiinfective'),
(247, '245', 'Dusting Powder (Povidone 5% Powder 10gm Container', 'Antiinfective'),
(248, '246', 'Ketoconazole Shampoo 2% W/V 100ml Bottle', 'Antiinfective'),
(249, '247', 'Syrup - Cefuroxime 125mg(asCefuroxime Axetil USP) 30 ML', 'Antiinfective'),
(250, '248', 'Clotrimazole 100 mgVaginal Tab 10\'s', 'Antiinfective'),
(251, '249', 'Cephalexin 125mg/5ml dry syrup 30ml', 'Antiinfective'),
(252, '250', 'Levofloxacin 500 mg INFUSION / IV 100 ML', 'Antiinfective'),
(253, '251', 'Cefpodoxime proxetil 50 mg DS dry syrup 30ml', 'Antiinfective'),
(254, '252', 'Ofloxacin 200mg+Ornidazole500mg infusion 100 ML', 'Antiinfective'),
(255, '253', 'Cefuroxime Tablets IP 125mg 6\'s', 'Antiinfective'),
(256, '254', 'Clarithromycin Tablets 250 mg 10\'s', 'Antiinfective'),
(257, '255', 'Cefpodoxime Proxetil dispersible tablet 50 mg', 'Antiinfective'),
(258, '256', 'Cefuroxime Injection 1500 mg 10 ml', 'Antiinfective'),
(259, '257', 'Cefazolin Sodium Injection IP 500mg Vial&WFI', 'Antiinfective'),
(260, '258', 'Efavirenz Tablets IP 600mg', 'Antiinfective'),
(261, '259', 'Erythromycin Estolate Suspension 125 Mg/5ml 60ml', 'Antiinfective'),
(262, '260', 'Mefloquine HCl Tablets IP 250mg 4\'s', 'Antiinfective'),
(263, '261', 'Pyrazinamide Tablets I.P 1000mg', 'Antiinfective'),
(264, '262', 'Sofosbuvir Tablets 400mg 28\'s in a bottle', 'Antiinfective'),
(265, '263', 'Adenosine 6 mg/ 2ml Amp. 2 ml', 'Cardiovascular System (CVS)'),
(266, '264', 'Amlodipine 5mg and Atenolol 50 mg Tablet 10\'s', 'Cardiovascular System (CVS)'),
(267, '265', 'Amlodipine Tablets IP 5mg 10\'s', 'Cardiovascular System (CVS)'),
(268, '266', 'Atenolol Tablets IP 50 mg 14\'s', 'Cardiovascular System (CVS)'),
(269, '267', 'Atorvastatin 10mg film coated Tablet IP 10\'s', 'Cardiovascular System (CVS)'),
(270, '268', 'Atorvastatin FC TabletS IP 20mg 10\'s', 'Cardiovascular System (CVS)'),
(271, '269', 'Clonidine 0.1 mg Tabs 10\'s', 'Cardiovascular System (CVS)'),
(272, '270', 'Clopidogrel Tablets IP 75mg 10\'s', 'Cardiovascular System (CVS)'),
(273, '271', 'ASPIRIN 75 mg + CLOPIDOGREL 75 mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(274, '272', 'Diltiazem 30 mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(275, '273', 'Diltiazem 60mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(276, '274', 'Dobutamine Injection IP 250mg/20ml Vial', 'Cardiovascular System (CVS)'),
(277, '275', 'Dopamine HCl 200 mg/5ml Inj. 5 ml', 'Cardiovascular System (CVS)'),
(278, '276', 'Enalapril 5 mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(279, '277', 'Enoxaparin 40 mg/0.4 ml Inj. 0.4 ml', 'Cardiovascular System (CVS)'),
(280, '278', 'Enoxaparin 60 mg/0.6 ml Inj. 0.6 ml', 'Cardiovascular System (CVS)'),
(281, '279', 'Frusemide (10 mg/ ml) 2ml', 'Cardiovascular System (CVS)'),
(282, '280', 'Frusemide 40 mg tablets 10\'s', 'Cardiovascular System (CVS)'),
(283, '281', 'Heparin Sodium 1000iu/ ml Inj. 5 ml', 'Cardiovascular System (CVS)'),
(284, '282', 'Heparin Sodium 5000iu/ ml Inj. 5 ml', 'Cardiovascular System (CVS)'),
(285, '283', 'Isosorbide Dinitrate Tablets IP 10mg 50\'s', 'Cardiovascular System (CVS)'),
(286, '284', 'AMLODIPINE 5 MG + LISINOPRIL 5 MG TABLETS 15\'s', 'Cardiovascular System (CVS)'),
(287, '285', 'Lisinopril Tablets IP 5mg 10\'s', 'Cardiovascular System (CVS)'),
(288, '286', 'Losartan 50 mg and HydroChorthaizide 12.5 mg Tablet 10\'s', 'Cardiovascular System (CVS)'),
(289, '287', 'Losartan film coated Tablets IP 25mg 10\'s', 'Cardiovascular System (CVS)'),
(290, '288', 'Losartan Potassium FC Tablets IP 50 mg 10\'s', 'Cardiovascular System (CVS)'),
(291, '289', 'Metoprolol 25 mg Tablet 10\'s', 'Cardiovascular System (CVS)'),
(292, '290', 'Metoprolol extended released Tablets IP 50mg 10\'s', 'Cardiovascular System (CVS)'),
(293, '291', 'Ramipril Tablets IP 2.5mg 10\'s', 'Cardiovascular System (CVS)'),
(294, '292', 'Ramipril Tablets IP 5mg 10\'s', 'Cardiovascular System (CVS)'),
(295, '293', 'Simvastatin Tablets IP 10mg 10\'s', 'Cardiovascular System (CVS)'),
(296, '294', 'Simvastatin 20 mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(297, '295', 'Tamsulosin Hydrochloride 0.4 mg Capsules 10\'s', 'Cardiovascular System (CVS)'),
(298, '296', 'Telmisartan 40mg+ Hydrochlorthiazide 12.5 mg Tablet 10\'s', 'Cardiovascular System (CVS)'),
(299, '297', 'Telmisartan Tablets IP 20mg 10\'s', 'Cardiovascular System (CVS)'),
(300, '298', 'Telmisartan Tablets IP 40mg 10\'s', 'Cardiovascular System (CVS)'),
(301, '299', 'Tranexamic Acid Tablets IP 500 mg 10\'s', 'Cardiovascular System (CVS)'),
(302, '300', 'Tranexamic Acid 500 mg/5ml Inj. 5 ml Amp.', 'Cardiovascular System (CVS)'),
(303, '301', 'Atropine Sulphate Injection IP 0.6mg/ml 1ml', 'Cardiovascular System (CVS)'),
(304, '302', 'TRANEXAMIC ACID 500 mg+ MEFENAMIC ACID 250\n mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(305, '303', 'PRAZOSIN TABLETS IP 5 MG 15\'s', 'Cardiovascular System (CVS)'),
(306, '304', 'TELMISARTAN IP 40 mg+ AMLODIPINE 5 mg Tablets 15\'s', 'Cardiovascular System (CVS)'),
(307, '305', 'ROSUVASTATIN Tablets IP 20 mg 10\'s', 'Cardiovascular System (CVS)'),
(308, '306', 'ATORVASTATIN 10 MG+ CLOPIDOGREL 75 MG\n CAPSULES', 'Cardiovascular System (CVS)'),
(309, '307', 'NEBIVOLOL TABLETS IP 5 MG', 'Cardiovascular System (CVS)'),
(310, '308', 'TORASEMIDE Tablets 10 mg 15\'s', 'Cardiovascular System (CVS)'),
(311, '309', 'BISOPROLOL TABLETS 5 MG', 'Cardiovascular System (CVS)'),
(312, '310', 'CARVEDILOL TABLETS IP 3.125 MG', 'Cardiovascular System (CVS)'),
(313, '311', 'Diltiazem Tablets SR 90mg 10\'s', 'Cardiovascular System (CVS)'),
(314, '312', 'ACENOCOUMAROL TABLETS 2 MG 30\'s', 'Cardiovascular System (CVS)'),
(315, '313', 'S-AMLODIPINE TABLETS IP 2.5 MG', 'Cardiovascular System (CVS)'),
(316, '314', 'DIGOXIN Tablets IP 250 ?g [0.25 mg ] 10\'s', 'Cardiovascular System (CVS)'),
(317, '315', 'ATORVASTATIN 10 mg+ FENOFIBRATES 160 mg\n Tablets 15\'s', 'Cardiovascular System (CVS)'),
(318, '316', 'AMIODARONE Tablets IP 200 mg 10\'s', 'Cardiovascular System (CVS)'),
(319, '317', 'RAMIPRIL and HYDROCLORTHIAZIDE TABLETS IP\n (5MG+12.5 MG)', 'Cardiovascular System (CVS)'),
(320, '318', 'OLMESARTAN Tablets 40 mg 10\'s', 'Cardiovascular System (CVS)'),
(321, '319', 'PROPRANOLOL Tablets IP 40 mg 10\'s', 'Cardiovascular System (CVS)'),
(322, '320', 'ROSUVASTATIN 10 mg + FENOFIBRATES 160 mg\n Tablets 10\'s', 'Cardiovascular System (CVS)'),
(323, '321', 'TELMISARTAN 40 mg+ CHLORTHALIDONE 12.5 mg\n Tablets 10\'s', 'Cardiovascular System (CVS)'),
(324, '322', 'NIFEDIPINE PROLONGED RELEASE Tablets IP 20 mg\n 10\'s', 'Cardiovascular System (CVS)'),
(325, '323', 'INDAPAMIDE TABLETS IP 1.5 MG', 'Cardiovascular System (CVS)'),
(326, '324', 'OLMESARTAN MEDOXOMIL 40 mg + HYDROCLORTHIAZIDE 12.5 mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(327, '325', 'METOPROLOL 50 MG + AMLODIPINE 5 MG TABLETS', 'Cardiovascular System (CVS)'),
(328, '326', 'LOSARTAN 50 MG+ AMLODIPINE 5 MG TABLETS', 'Cardiovascular System (CVS)'),
(329, '327', 'FENOFIBRATE TABLETS 160 MG 10\'s', 'Cardiovascular System (CVS)'),
(330, '328', 'ISOSORBIDE DINITRATE TABLETS IP 5 MG', 'Cardiovascular System (CVS)'),
(331, '329', 'OLMESARTAN 20 mg+ AMLODIPINE 5 mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(332, '330', 'AMLODIPINE 5 MG + HYDROCHLOROTHIAZIDE 12.5\n MG TABLETS', 'Cardiovascular System (CVS)'),
(333, '331', 'SPIRONOLACTONE TABLETS IP 25 MG', 'Cardiovascular System (CVS)'),
(334, '332', 'LABETALOL TABLETS IP 100 MG', 'Cardiovascular System (CVS)'),
(335, '333', 'STREPTOKINASE INJECTION IP 1500000 IU 10 ml & wfi', 'Cardiovascular System (CVS)'),
(336, '334', 'WARFARIN TABLETS IP 5 MG', 'Cardiovascular System (CVS)'),
(337, '335', 'VALSARTAN TABLETS IP 80 MG', 'Cardiovascular System (CVS)'),
(338, '336', 'ATORVASTATIN Tablets IP 40 mg 10\'s', 'Cardiovascular System (CVS)'),
(339, '337', 'TORASEMIDE TABLETS IP. 20 MG 10\'s', 'Cardiovascular System (CVS)'),
(340, '338', 'LABETALOL INJECTION IP 5 mg/ml 4 ml Vial', 'Cardiovascular System (CVS)'),
(341, '339', 'Etamsylate Tablets 500 mg. 10\'s', 'Cardiovascular System (CVS)'),
(342, '340', 'Etamsylate Tablets 250 mg. 10\'s', 'Cardiovascular System (CVS)'),
(343, '341', 'Nitroglycerine Injection 5mg/ ml 10ml Vial', 'Cardiovascular System (CVS)'),
(344, '342', 'Rosuvastatin Tablets 10 mg 15\'s', 'Cardiovascular System (CVS)'),
(345, '343', 'Acetyl Salicylic Acid (Aspirin)Tablet I.P 325mg 14\'s', 'Cardiovascular System (CVS)'),
(346, '344', 'Adenosine Injection 3mg/ml', 'Cardiovascular System (CVS)'),
(347, '345', 'Aspirin enteric coated Tablets I.P. 75mg 14\'s', 'Cardiovascular System (CVS)'),
(348, '346', 'Atenolol 25 mg, Amlodipine 5 mg Tablets 14\'s', 'Cardiovascular System (CVS)'),
(349, '347', 'Atenolol Tablets 25 mg 14\'s', 'Cardiovascular System (CVS)'),
(350, '348', 'Atorvastatin I.P 10mg, Aspirin I.P (EC) 75mg Capsules', 'Cardiovascular System (CVS)'),
(351, '349', 'Carvedilol Tablets IP 6.25mg 10\'s', 'Cardiovascular System (CVS)'),
(352, '350', 'Chlorthalidone Tablets 12.5mg', 'Cardiovascular System (CVS)'),
(353, '351', 'Cilnidipine Tablets 20mg', 'Cardiovascular System (CVS)'),
(354, '352', 'Frusemide (Furosemide) 20mg, Spironolactone 50mg Tablets\n 10\'s', 'Cardiovascular System (CVS)'),
(355, '353', 'Glyceryl Trinitrate Tablets IP 2.6mg (Nitroglycerin Tablets)\n 30\'s', 'Cardiovascular System (CVS)'),
(356, '354', 'Isosorbidemononitrate Tablets IP 20mg 10\'s', 'Cardiovascular System (CVS)'),
(357, '355', 'Isoxsuprine HCl Tablets 10mg 50\'s', 'Cardiovascular System (CVS)'),
(358, '356', 'Nebivolol 5 mg, Hydrochlorothiazide 12.5 mg Tab.', 'Cardiovascular System (CVS)'),
(359, '357', 'Nitrofurantoin Tablets I.P 100mg', 'Cardiovascular System (CVS)'),
(360, '358', 'Olmesartan Film coated Tablets 20mg 10\'s', 'Cardiovascular System (CVS)'),
(361, '359', 'Propranolol Tablets IP 10mg 10\'s', 'Cardiovascular System (CVS)'),
(362, '360', 'Recombinant Human Erythropoietin Inj. 4000 IU', 'Cardiovascular System (CVS)'),
(363, '361', 'Recombinant Human Erythropoietin Injection 2000 IU', 'Cardiovascular System (CVS)'),
(364, '362', 'Rosuvastatin Tablet I.P 5mg', 'Cardiovascular System (CVS)'),
(365, '363', 'Telmisartan 40mg, Metoprolol 25mg Tablets 10\'s', 'Cardiovascular System (CVS)'),
(366, '364', 'Telmisartan 80mg, Hydroclorthiazide 12.5mg Tablets', 'Cardiovascular System (CVS)'),
(367, '365', 'Trimetazidine Tablets 35 mg 10\'s', 'Cardiovascular System (CVS)'),
(368, '366', 'Telmisartan+Metoprolol (50/40 mg) Tablets 10\'s', 'Cardiovascular System (CVS)'),
(369, '367', 'Lisinopril 10mg Tabs 15\'s', 'Cardiovascular System (CVS)'),
(370, '368', 'METOPROLOL 25 MG + AMLODIPINE 5 MG TABLETS\n 7\'s', 'Cardiovascular System (CVS)'),
(371, '369', 'Alprazolam Tablets IP 0.25mg 10\'s', 'Central Nerve System (CNS)'),
(372, '370', 'Alprazolam 0.5 mg Uncoated Tablet 10\'s', 'Central Nerve System (CNS)'),
(373, '371', 'Betahistine Tablets IP 8mg 10\'s', 'Central Nerve System (CNS)'),
(374, '372', 'Carbamazepine 100mg Tablet 10\'s', 'Central Nerve System (CNS)'),
(375, '373', 'Carbamazepine Tablets IP 200mg 10\'s', 'Central Nerve System (CNS)'),
(376, '374', 'Clonazepam Tablets IP 0.5 mg 10\'s', 'Central Nerve System (CNS)'),
(377, '375', 'Diazepam Tablets IP 5mg 10\'s', 'Central Nerve System (CNS)'),
(378, '376', 'Escitalopram 10 mg Tablet 10\'s', 'Central Nerve System (CNS)'),
(379, '377', 'Escitalopram 20 mg Tablet 10\'s', 'Central Nerve System (CNS)'),
(380, '378', 'Flunarizine 10 mg Tabs 10\'s', 'Central Nerve System (CNS)'),
(381, '379', 'Flunarizine 5 mg Tabs 10\'s', 'Central Nerve System (CNS)'),
(382, '380', 'Fluoxetine Hydrochloride Capsules IP 20mg 10\'s', 'Central Nerve System (CNS)'),
(383, '381', 'Methyl Ergometrine Tablets IP 0.125mg 10\'s', 'Central Nerve System (CNS)'),
(384, '382', 'PHENYTOIN Tablets IP 100 mg 100\'s in Bottle', 'Central Nerve System (CNS)'),
(385, '383', 'Prochlorperazine Tablets IP 5mg 10\'s', 'Central Nerve System (CNS)'),
(386, '384', 'LEVETIRACETAM Tablets 500 mg 10\'s', 'Central Nerve System (CNS)'),
(387, '385', 'PREGABALIN 75 mg+ METHYLCOBALAMIN 750 MCG\n Tablets 10\'s', 'Central Nerve System (CNS)'),
(388, '386', 'PREGABALIN TABLETS 75 MG', 'Central Nerve System (CNS)'),
(389, '387', 'FlupentixolTablets IP 0.5mg. 10\'s 10\'s', 'Central Nerve System (CNS)'),
(390, '388', 'Escitalopram 10mg with Clonazepam 0.5mg 10\'s', 'Central Nerve System (CNS)'),
(391, '389', 'Nortriptyline Tablet 25 mg Tablet', 'Central Nerve System (CNS)'),
(392, '390', 'Etizolam 0.5mg Tablets 10\'s', 'Central Nerve System (CNS)'),
(393, '391', 'Alpha Lipoic acid 100mg, Vit. D3 1000 IU, Folic acid 1.5mg, Pyridoxine 3mg, Methylcobalamin 1500mcg 10\'s', 'Central Nerve System (CNS)'),
(394, '392', 'Alprazolam-0.25 mg, Fluoxetine 20 mg Tablets', 'Central Nerve System (CNS)'),
(395, '393', 'Amisulpride Tablets I.P 50mg', 'Central Nerve System (CNS)'),
(396, '394', 'Amitriptyline hydrochloride 10mg Tablets I.P', 'Central Nerve System (CNS)'),
(397, '395', 'Chlordiazepoxide10mg+ Trifluoperazine 1mg Tablets 10\'s', 'Central Nerve System (CNS)'),
(398, '396', 'Citicoline Tablets 500mg', 'Central Nerve System (CNS)'),
(399, '397', 'Clonazepam Tablets IP 1mg', 'Central Nerve System (CNS)'),
(400, '398', 'Diazepam Injection IP 5mg/ml 2 ML', 'Central Nerve System (CNS)'),
(401, '399', 'Donepezil Hydrochloride Tablets IP 10mg 10\'s', 'Central Nerve System (CNS)'),
(402, '400', 'Gabapentin 100mg Methylcobalamine 500mcg Tablets 10\'s', 'Central Nerve System (CNS)'),
(403, '401', 'Gabapentin Capsules USP 300mg 10\'s', 'Central Nerve System (CNS)'),
(404, '402', 'Imipramine HCl Tablets 25mg 10\'s', 'Central Nerve System (CNS)'),
(405, '403', 'Lamotrigine Tablets IP 100mg 10\'s', 'Central Nerve System (CNS)'),
(406, '404', 'Lithium Carboinate PR Tablets IP 450mg 10\'s', 'Central Nerve System (CNS)'),
(407, '405', 'Lorazepam Tablets IP 1mg', 'Central Nerve System (CNS)'),
(408, '406', 'Lorazepam Tablets IP 2mg', 'Central Nerve System (CNS)'),
(409, '407', 'Memantine Hydrochloride 10mg Tablets 10\'s', 'Central Nerve System (CNS)'),
(410, '408', 'Mirtazapine Tablets 15mg 10\'s', 'Central Nerve System (CNS)'),
(411, '409', 'Nitrazepam Tablets I.P 10mg 10\'s', 'Central Nerve System (CNS)'),
(412, '410', 'Olanzapine Tablets I.P 10mg', 'Central Nerve System (CNS)'),
(413, '411', 'Olanzapine Tablets I.P 5mg', 'Central Nerve System (CNS)'),
(414, '412', 'Oxcarbazepine Tablets I.P 300mg', 'Central Nerve System (CNS)'),
(415, '413', 'Paroxetine SR Tablet 37.5mg 10\'s', 'Central Nerve System (CNS)'),
(416, '414', 'Phenobarbitone Tablets I.P 30mg', 'Central Nerve System (CNS)'),
(417, '415', 'Piracetam Syrup 500mg/5ml 100ml', 'Central Nerve System (CNS)'),
(418, '416', 'Piracetam Tablets 400mg 10\'s', 'Central Nerve System (CNS)'),
(419, '417', 'Prochlorperazine Maleate Tablets I.P 5mg 10\'s', 'Central Nerve System (CNS)'),
(420, '418', 'Quetiapine Fumarate Tablets I.P 200mg 10\'s', 'Central Nerve System (CNS)'),
(421, '419', 'Quetiapine Tablets I.P 100mg 10\'s', 'Central Nerve System (CNS)'),
(422, '420', 'Risperidone 4mg, Trihexiphenidyl 2mg Tab. 10\'s', 'Central Nerve System (CNS)'),
(423, '421', 'Risperidone Tablets 4mg', 'Central Nerve System (CNS)'),
(424, '422', 'Sertraline Tablets 50mg', 'Central Nerve System (CNS)'),
(425, '423', 'Sertraline Tablets I.P 25mg 10\'s', 'Central Nerve System (CNS)'),
(426, '424', 'Sodium Valproate EC Tablets I.P 200mg', 'Central Nerve System (CNS)'),
(427, '425', 'Sodium Valproate Tablets 300mg 10\'s', 'Central Nerve System (CNS)'),
(428, '426', 'Trihexyphenidyl Hydrochloride Tablets 2mg (benzhexol HCl Tablets IP 2mg) 10\'s', 'Central Nerve System (CNS)'),
(429, '427', 'Zolpidem Tablets I.P 10mg', 'Central Nerve System (CNS)'),
(430, '428', 'Pregabalin Capsules 75mg 14\'s', 'Central Nerve System (CNS)'),
(431, '429', 'Clobazam Tablet 5mg 10\'s', 'Central Nerve System (CNS)'),
(432, '430', 'Gabapentin+Nortriptyline(400/10mg) Tablets 10\'s', 'Central Nerve System (CNS)'),
(433, '431', 'Cinnarizine Tablets 25mg 10\'s', 'Central Nerve System (CNS)'),
(434, '432', 'Clomipramine Hydrochloride SR Tablets 75mg 10\'s', 'Central Nerve System (CNS)'),
(435, '433', 'Aripiprazole Tablets 5mg 10\'s', 'Central Nerve System (CNS)'),
(436, '434', 'Diclofenac Gel BP (Diclofenac Diethylamine 1.16%w/w) 15 g', 'Dermatology/Topical/External'),
(437, '435', 'Clotrimazole 1% w/w cream 15 g tubes', 'Dermatology/Topical/External'),
(438, '436', 'Adapalene 0.1%w/v Ointment 15 gm tubes', 'Dermatology/Topical/External'),
(439, '437', 'Beclomethasone,Clotrimazole,Gentamycin Cream 15 g tubes', 'Dermatology/Topical/External'),
(440, '438', 'Calamine Lotion 100 ml', 'Dermatology/Topical/External'),
(441, '439', 'CHLORHEXIDINE MOUTHWASH IP 0.2 % w/v 100 ml', 'Dermatology/Topical/External'),
(442, '440', 'Clobetasol Propionate 0.05 % w/w Cream 15 g tubes', 'Dermatology/Topical/External'),
(443, '441', 'Fusidic Acid Cream 2%w/w 5gm tube', 'Dermatology/Topical/External'),
(444, '442', 'Ketoconazole 2% w/w Lotion 100ml Bottle', 'Dermatology/Topical/External'),
(445, '443', 'Povidone Iodine 5% w/w Ointment USP', 'Dermatology/Topical/External'),
(446, '444', 'Povidone Iodine 5%w/w Ointment 15 gm tubes', 'Dermatology/Topical/External'),
(447, '445', 'Povidone Iodine 10 % Solution 500 ml', 'Dermatology/Topical/External'),
(448, '446', 'Povidone Iodine 5 % Solution 100 ml', 'Dermatology/Topical/External'),
(449, '447', 'Povidone Iodine 5% Solution 500 ML 500 ml', 'Dermatology/Topical/External'),
(450, '448', 'Povidone Iodine 7.5% Solution 500 ml', 'Dermatology/Topical/External'),
(451, '449', 'Chlorhexidine Gluconate 1.5% w/v, Cetrimide 3% w/v Solution 100ml Bottle', 'Dermatology/Topical/External'),
(452, '450', 'HYDROQUINONE 2 % + MOMETASONE 0.1% + TRETINOIN 0.025 % cream 20gm', 'Dermatology/Topical/External'),
(453, '451', 'BETAMETHASONE VALERAT 0.1 % w/w + NEOMYCIN SULFATE 0.5 % w/w CREAM 20 GM', 'Dermatology/Topical/External'),
(454, '452', 'MUPIROCIN OINTMENT IP 2 % w/w 5gm', 'Dermatology/Topical/External'),
(455, '453', 'DICLOFENAC 1.16 w/w+ LINCEED OIL3% w/w+ METHYL SALICYLATE 10% w/w+MENTHOL 5% w/w\n GEL 30 GM', 'Dermatology/Topical/External'),
(456, '454', 'Beclamethasone Dipropionate..0.025% w/, Neomycin Sxulphate..0.5% w/w ( 3500 Unit /G) Chlorocresol 0 15gm', 'Dermatology/Topical/External'),
(457, '455', 'Betamethasone 0.05% w/w + Salicylic acid 3% w/w 20gm', 'Dermatology/Topical/External'),
(458, '456', 'Ear Drops (Paradichlorobenzene 2%+Benzocaine 2.7%+Chlorbutol 5%+Turpentine Oil15% 10 ml', 'Dermatology/Topical/External'),
(459, '457', 'Anti-acne Gel Adapalene BP?0.1 % w/w, Clindamycin Phosphate USP equivalent to Clindamycin?1% w/w, M 15\n gm tubes', 'Dermatology/Topical/External'),
(460, '458', 'Nimesulide 1% W/W Gel 20gm Tube', 'Dermatology/Topical/External'),
(461, '459', 'Diclofenac diethylamine BP 1.116% (equivalent to diclofenac sodium 1.0%, Linseed oil BP 3.0% + Methy 30 GM', 'Dermatology/Topical/External'),
(462, '460', 'Diclofenac 1.16%w/w+ Menthol 5%+ Oleum 3% + Methyl Salicylate 10% Gel 20 GM', 'Dermatology/Topical/External'),
(463, '461', 'Diclofenac dethylamine BP1.16%,Linseed Oil BP3% w/w,Methylsalicylate IP10%w/w,Menthol IP5% w/w,Spray\n 35gm', 'Dermatology/Topical/External'),
(464, '462', 'Hydroquinone 2.0% w/w + Tretinoin 0.025% w/w + Mometasone Furoate 0.1% w/w in a cream base q.s 15gm', 'Dermatology/Topical/External'),
(465, '463', 'Chlorhexidine Gluconate 0.3%v/v+Cetrimide 0.6%w/v Antiseptic Liquid 100 ML 100 ML', 'Dermatology/Topical/External'),
(466, '464', 'Chlorhexidine Gluconate 0.3% v/v + Cetrimide 0.6%w/v 200\n ml', 'Dermatology/Topical/External'),
(467, '465', 'Mouth Ulcer Gel (Choline Salicylate sodium 9% w/v, Benzalkonium Chloride 0.01% w/w) 10gm', 'Dermatology/Topical/External'),
(468, '466', 'Mometasone Furoate 0.1%w/w cream 15gm 15gm', 'Dermatology/Topical/External'),
(469, '467', 'Triamcinolone Acetonide 0.1 % Mouth Ulcer gel 10gm', 'Dermatology/Topical/External'),
(470, '468', 'Glycerin ip 98%w/w 50 GM', 'Dermatology/Topical/External'),
(471, '469', 'Urea IP 1 % + Salicylic Acid IP 1% w/w Zinc SO4 0.1 % w/w cream/onit 10 gm', 'Dermatology/Topical/External'),
(472, '470', 'Clotrimazole 1% 100 gm powder 100 gm Powder', 'Dermatology/Topical/External'),
(473, '471', 'Clotrimazole 1% w/w,Beclometasone Dipropionate0.025% w/w 15 ml lotion 15ml', 'Dermatology/Topical/External'),
(474, '472', 'Clotrimazole 1% w/w, Beclometasone Dipropionate 0.025% w/w cream 15gm tube 15gm', 'Dermatology/Topical/External'),
(475, '473', 'Povidone-Iodine 10% Medicated Paint 50 ml', 'Dermatology/Topical/External'),
(476, '474', 'Bacitracin Zinc 250 Iu Neomycin 5 mg, Sulphacetamide Sodium 60 mg Per 1gm Dusting Powder 10gm Powder', 'Dermatology/Topical/External'),
(477, '475', 'Isopropyl Alcohol (70%) (Spirit) 100 ML bottle', 'Dermatology/Topical/External'),
(478, '476', 'Ketoconazole Cream 2%w/w 15gm Tube 15gm Tube', 'Dermatology/Topical/External'),
(479, '477', 'Lignocaine (Lidocaine) Hydrochloride Gel IP 2% w/v', 'Dermatology/Topical/External'),
(480, '478', 'Miconazole 2%w/w Fluocinolone Acetonide-0.01%w/w Ointment 15g 15gm Tube', 'Dermatology/Topical/External'),
(481, '479', 'Permethrin Cream 5% w/w', 'Dermatology/Topical/External'),
(482, '480', 'Calcium Carbonate 1250mg (Calcium 500mg) + Vitamin D3 250 iu film coated Tablet 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(483, '481', 'PYRIDOXINE HCl 10 mg+ DOXYLAMINE 10 mg + FOLIC\n ACID 2.5 mg Tablets 30\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(484, '482', 'Folic Acid Tablets IP 5mg 15\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(485, '483', 'Syrup of Iron and Folic Acid in a flavoured Base 200 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(486, '484', 'Polyvitamin (Prophylactic) NFI 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(487, '485', 'Haematinic syrup of Iron,Folic acid and Vitamin B12 100 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(488, '486', 'B-Complex forte with Vitamin \'C\' & Zinc Caps (Cebexin -Z) 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(489, '487', 'VITAMIN B1 10mg, B2 10mg, B3 45mg, B5 50mg, B6 3mg,\n B12 15mcg Tablets 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(490, '488', 'Vitamin B-Complex Syrup 200 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(491, '489', 'Vitamin-C Chewable 100mg Tablet 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(492, '490', 'FERROUS AMMONIUM CITRATE 160 MG + CYANO COBALAMINE 7.5 MCG + FOLIC ACID 0.5 MG/15ML\n SYRUP', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(493, '491', 'FERROUS ASCORBATE 100MG WITH FOLIC ACID 1.5MG TABLETS', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(494, '492', 'CHYMOTRYPSIN + TRYPSIN (1:6 )ENTERIC COATED TABLETS 100K AU 20\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(495, '493', 'Ginseng, Multivitamin and Multiminerals Capsules 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(496, '494', 'CALCIUM CARBONATE 500MG+CALCITRIOL 0.25\n MCG + ZINC 7.5 MG Capsules 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(497, '495', 'VITAMINS A,C,D,E,AND B COMPLEX AND MINERALS SYRUP', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(498, '496', 'VITAMIN D3 - CHOLECALCIFEROL 60000 IU /1 GM\n Sachet 1 Sachet', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(499, '497', 'APPETITE ENHANCER (PEPTONE, MINERALS, VITAMINS )SYRUP', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(500, '498', 'VITAMIN E SOFTGEL CAPSULES 400 MG', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(501, '499', 'CALCIUM 500 mg+ CALCITRIOL 0.25mg Tablets 15\'s 15\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(502, '500', 'METHYLCOBALAMIN 500 MCG INJECTION', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(503, '501', 'L-LYSINE + MULTIVITAMINS (VIT-B1,B2,B3,B5,B6 ) SYRUP', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(504, '502', 'GLUCOSE POWDER 75GM', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(505, '503', 'ZINC SULPHATE 20 MG/ ML ORAL SOLUTION', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(506, '504', 'PYRIDOXINE TABLETS IP 50 MG 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(507, '505', 'Iron & Zinc (Carbonyl Iron 50 mg+ Zinc Sulphate Monohydrate USP 61.8 mg equivalent to Elemental Zinc 15\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(508, '506', 'Syrup Vitamin D3 200 IU + Vitamin B12 2.5 mcg + Calcium Phosphate eq. to elemental Calcium 82 mg / 5 225ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(509, '507', 'Enyme Syrup Mix Fruit Flavour Pepsin 7.5 mg + Fungal Diastase 12.5 mg / 5 ml 200 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(510, '508', 'Enzyme Drops Pepsin (1:3000) 5 mg + Fungal Diastase (1:1200) 33.33 mg/ml 15 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(511, '509', 'Multivitamin Drop VitA2500 IU,VitE 2.5 IU,Vit D3 200 IU,VitC40mgVitB1VitB2 VitB3VitB6,Botin,Lysine 15ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(512, '510', 'Biotin 10 mg Tablet 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(513, '511', 'Ringer Lactate 500ml IV fluid in FFS technology plastic container 500ml in FFS bottle', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(514, '512', 'Dextrose 5 % IV fluid in plastic container using FFS technology 500ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(515, '513', 'Dextrose 10 % IV fluid in plastic container using FFS technology 500ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(516, '514', 'Dextrose 5% w/v+ sodium chloride 0.9%w/v Injection IP in plastic container using FFS technology 500m 500ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(517, '515', 'Normal Saline ( NS ) 0.9% w/v IV fluid in plastic container using FFS technology 100ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(518, '516', 'L-Methylfolate calcium 7.5mg Tablet 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(519, '517', 'Calcitriol Capsules I.P 0.25mcg', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(520, '518', 'Calcium Acetate Tablets 667mg 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(521, '519', 'Calcium Carbonate 1250 Mg, Vitamin D3 250 Iu, Magnesium Oxide 40 Mg, Manganese Sulphate 1.8 Mg, Zinc 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(522, '520', 'Calcium Gluconate Injection I.P 10 % 10 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(523, '521', 'Cholecalciferol (Vitamin D3) Drops 800 IU per drops 15 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(524, '522', 'Cholecalciferol (Vitamin D3)Drops 400IU/ml 15 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(525, '523', 'Chondroitin 400mg Glucosamine Sulphate 500mg Tablets 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(526, '524', 'Dextrose Injection IP 25%w/v', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(527, '525', 'Levocarnitine Injections 1gm 5ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(528, '526', 'Levocarnitine Tablets 500mg 10\'s', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(529, '527', 'Lycopene 1000 Mcg, Vitamin A Palmitate 2500 Iu, Vitamin E Acetate 10 Iu, Selenium 35 Mcg, Vitamin C 200 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(530, '528', 'VITAMINS A,C,D,E,AND B COMPLEX AND MINERALS SYRUP 100 ml', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(531, '529', 'CARBOXY METHYL CELLULOSE EYE DROPS IP 0.5%\n w/v 10 ml', 'Eye / Ear drops'),
(532, '530', 'Ciprofloxacin 0.3% w/v Eye Drop 5 ml', 'Eye / Ear drops'),
(533, '531', 'Gentamycin 0.3% w/v Eye Drop 10ml', 'Eye / Ear drops'),
(534, '532', 'Xylometazoline Nasal Drop IP 0.1%w/v 10 ml', 'Eye / Ear drops'),
(535, '533', 'Timolol Maeleate 0.5 % Eye Drops 5 ml Vial', 'Eye / Ear drops'),
(536, '534', 'Ofloxacin 0.3%w/v Eye Drops 10ml 10ml', 'Eye / Ear drops'),
(537, '535', 'Olopatadine 0.1% Eye Drops 10ml Vial 10ml Vial', 'Eye / Ear drops'),
(538, '536', 'Tobramycin 0.3%w/v Eye Drops 10ml 10ml Vial', 'Eye / Ear drops'),
(539, '537', 'Sulfacetamide eye drop 10 % 10 ml', 'Eye / Ear drops'),
(540, '538', 'Sulfacetamide eye drop 20 % 20 ML', 'Eye / Ear drops'),
(541, '539', 'Acyclovir 3%W/W Eye Ointment 5gm 5gm', 'Eye / Ear drops'),
(542, '540', 'Bromfenac Sodium Eye Drop 0.09% 5ml', 'Eye / Ear drops'),
(543, '541', 'Latanoprost Eye Drops 0.005%w/v (50mcg/ml) 2.5 ML', 'Eye / Ear drops'),
(544, '542', 'Nepafenac 0.1% w/v Eye Drop 5ml', 'Eye / Ear drops'),
(545, '543', 'Moxifloxacin Hydrochloride Sterile Ophthalmic solution\n 0.5% w/v 5ml', 'Eye / Ear drops'),
(546, '544', 'Bisacodyl Tablets IP 5mg 10\'s', 'Gastrointestinal (GIT)'),
(547, '545', 'TRICHOLINE CITRATE 275 mg+ CYPROHEPTADINE\n HCl 2 mg/5ml SYRUP 200 ml', 'Gastrointestinal (GIT)'),
(548, '546', 'Dicyclomine Tablets IP 10mg 10\'s', 'Gastrointestinal (GIT)'),
(549, '547', 'Paracetamol 325 mg,Dicyclomine HCl 20 mg Tablet 10\'s', 'Gastrointestinal (GIT)'),
(550, '548', 'Domperidone 10 mg Tablet 10\'s', 'Gastrointestinal (GIT)'),
(551, '549', 'Domperidone 5 mg. / 5 ml Susp 30 ml', 'Gastrointestinal (GIT)'),
(552, '550', 'Aluminium Hydroxide +Mg. Hydroxide+ Act. Dimethicone (250mg +250mg+50mg)Tablets 10\'s', 'Gastrointestinal (GIT)'),
(553, '551', 'Famotidine 20 mg Tab 14\'s', 'Gastrointestinal (GIT)'),
(554, '552', 'Famotidine 40 mg Tablets 14\'s', 'Gastrointestinal (GIT)'),
(555, '553', 'Isapgol Psyllium Husk 200 gm', 'Gastrointestinal (GIT)'),
(556, '554', 'LACTOBACILLUS SPOROGENES 60 MILLION SPORES\n TABLETS 10\'s', 'Gastrointestinal (GIT)'),
(557, '555', 'Lactulose 10 g/15 ml Syrup 100 ml', 'Gastrointestinal (GIT)'),
(558, '556', 'Dried Aluminium Hydroxide IP250mg,Magnesium Hydroxide IP 250mg, Activated Methyl Polysiloxane 50/5ml 170 ml', 'Gastrointestinal (GIT)');
INSERT INTO `drugs_category` (`id`, `drug_id`, `generic_name`, `category`) VALUES
(559, '557', 'Metoclopramide 10 mg Tablets 10\'s', 'Gastrointestinal (GIT)'),
(560, '558', 'Metoclopramide Injection IP 5mg/ml 2ml', 'Gastrointestinal (GIT)'),
(561, '559', 'Omeprazole 20mg + Domperidone 10 mg Caps 10\'s', 'Gastrointestinal (GIT)'),
(562, '560', 'Omeprazole 20 mg capsules 10\'s', 'Gastrointestinal (GIT)'),
(563, '561', 'Ondansetron 2 mg/ml Inj. 2 ml', 'Gastrointestinal (GIT)'),
(564, '562', 'Ondansitron Tablets IP 4mg 10\'s', 'Gastrointestinal (GIT)'),
(565, '563', 'Ornidazole film coated Tablets IP 500mg 10\'s', 'Gastrointestinal (GIT)'),
(566, '564', 'Pantoprazole Enteric coated Tablets IP 40mg 10\'s', 'Gastrointestinal (GIT)'),
(567, '565', 'Pantoprazole Injection 40mg Vial', 'Gastrointestinal (GIT)'),
(568, '566', 'Rabeprazole 20 mg and Domperidone SR 30 mg Capsule 10\'s', 'Gastrointestinal (GIT)'),
(569, '567', 'Rabeprazole Gastro-resistant Tablets IP 20mg 10\'s', 'Gastrointestinal (GIT)'),
(570, '568', 'Ranitidine (50 mg/ 2ml) Inj. 2ml', 'Gastrointestinal (GIT)'),
(571, '569', 'Ranitidine HCl. 150 mg film coated Tablet 10\'s', 'Gastrointestinal (GIT)'),
(572, '570', 'Ranitidine HCl film coated Tablets 300mg 10\'s', 'Gastrointestinal (GIT)'),
(573, '571', 'Disodium hydrogen Citrate (Alkalyser) 1.4 gm/5ml Syrup 100 ml', 'Gastrointestinal (GIT)'),
(574, '572', 'Oral Rehydration Salts Citrate IP 21 GM (WHO Formula)\n Sachet 1\'s', 'Gastrointestinal (GIT)'),
(575, '573', 'DOMPERIDONE 30 mg+ PANTOPRAZOLE 40 mg\n Capsules [SR] 10\'s', 'Gastrointestinal (GIT)'),
(576, '574', 'PEPSIN 10 MG+ DIASTASE 50 MG ORAL LIQUID /5 ML', 'Gastrointestinal (GIT)'),
(577, '575', 'OXETACAINE 10 MG+ ALUMINIUM 0.291gm + MAGNESIUM 98 MG /5 ML GEL 200 ML', 'Gastrointestinal (GIT)'),
(578, '576', 'DOMPERIDONE 30 MG+ ESOMEPRAZOLE 40 MG\n CAPSULE', 'Gastrointestinal (GIT)'),
(579, '577', 'LEVOSULPIRIDE 75 MG+ PANTOPRAZOLE 40 MG\n CAPSULE', 'Gastrointestinal (GIT)'),
(580, '578', 'DOXYLAMINE SUCCINATE 10 mg+ PYRIDOXINE HCl\n 10 mg Tablets 30\'s', 'Gastrointestinal (GIT)'),
(581, '579', 'SUCRALFATE SUSPENSION 500 mg/5ml 200 ml', 'Gastrointestinal (GIT)'),
(582, '580', 'LIQUID PARAFFIN 1.25 ML+ MILK OF MAGNESIA 3.75ML+ SODIUM PICOSULPHATE 3.33MG /5ML\n SUSPENSION 170ml 170 ml Bottle', 'Gastrointestinal (GIT)'),
(583, '581', 'CLIDINIUM BROMIDE 2.5 MG+ CHLORDIAZEPOXIDE 5 MG SUGAR COATED TABLETS 10\'s', 'Gastrointestinal (GIT)'),
(584, '582', 'SODIUM PICOSULPHATE 10 mg Tablets 10\'s', 'Gastrointestinal (GIT)'),
(585, '583', 'TRICHOLINE CITRATE 550MG+SORBITOL\n 7.15GM/10ML SYRUP 200 ML', 'Gastrointestinal (GIT)'),
(586, '584', 'LEVOSULPIRIDE 75 MG+ ESOMEPRAZOLE 40 MG CAPSULES 10\'s', 'Gastrointestinal (GIT)'),
(587, '585', 'LEVOSULPIRIDE (SR) 75 mg+ RABEPRAZOLE (EC)20\n mg Capsules 10\'s', 'Gastrointestinal (GIT)'),
(588, '586', 'LOPERAMIDE Capsules IP 2 mg 10\'s', 'Gastrointestinal (GIT)'),
(589, '587', 'ESOMEPRAZOLE Tablets IP 40 mg (ENTERIC COATED)\n 10\'s', 'Gastrointestinal (GIT)'),
(590, '588', 'PROMETHAZINE (FILM COATED) Tablets IP 25 mg 10\'s', 'Gastrointestinal (GIT)'),
(591, '589', 'DICYCLOMINE 10 MG + DIMETHICONE 40 MG /5 ML SUSPENSION 30 ML', 'Gastrointestinal (GIT)'),
(592, '590', 'LANSOPRAZOLE CAPSULES IP 15 MG', 'Gastrointestinal (GIT)'),
(593, '591', 'ITOPRIDE Tablets 50 mg 10\'s', 'Gastrointestinal (GIT)'),
(594, '592', 'SULFASALAZINE TABLETS BP 500 MG ENTERIC\n COATED', 'Gastrointestinal (GIT)'),
(595, '593', 'CYPROHEPTADINE Tablets IP 4 mg 10\'s', 'Gastrointestinal (GIT)'),
(596, '594', 'Cyproheptadine Tablets 4mg 10\'s 10\'s', 'Gastrointestinal (GIT)'),
(597, '595', 'Cyproheptadine, Hydrochloride(anhydrous) IP..2 mg.In a flavoured syrup base ?.q.s. 200 ml', 'Gastrointestinal (GIT)'),
(598, '596', 'Laxative Suspension Liqid Paraffin 3.75ml+Milk of Magnesia 11.25ml) 170 ml Bottle', 'Gastrointestinal (GIT)'),
(599, '597', 'Dicyclomine 10mg + Act. Dimethicone 40mg per ml 10ml\n Bottle', 'Gastrointestinal (GIT)'),
(600, '598', 'Rabeprazole 20mg + Domperidone 10mg Capsule 10\'s', 'Gastrointestinal (GIT)'),
(601, '599', 'Rabeprazole Sodium ip 20mg + Itopiride HCL 150mg 10\'s', 'Gastrointestinal (GIT)'),
(602, '600', 'Pantoprazole 40mg + Itopride 150mg S.R. 10\'s', 'Gastrointestinal (GIT)'),
(603, '601', 'Magaldrate 400 mg + Simethicone 20mg/5ml Oral suspension\n 170 ml 170 ml', 'Gastrointestinal (GIT)'),
(604, '602', 'Lactulose 10 gm/ 15 ml 200 ml', 'Gastrointestinal (GIT)'),
(606, '603', 'Levosulpiride Tablets 25mg', 'Gastrointestinal (GIT)'),
(607, '604', 'Ondansetron Oral Solution I.P 2 mg/5ml', 'Gastrointestinal (GIT)'),
(608, '605', 'Promethazine Injection I.P 25 mg/ml', 'Gastrointestinal (GIT)'),
(609, '606', 'Sucralfate 1gm With Oxetacain 10mg/10ml Suspension', 'Gastrointestinal (GIT)'),
(610, '607', 'DOXYLAMINE SUCCINATE 20 MG+ PYRIDOXINE HCl 20 MG TABLETS 10\'s', 'Gastrointestinal (GIT)'),
(611, '608', 'Misoprostol 200 mcg film coated Tablet 4\'s', 'Gynaecology'),
(612, '609', 'Clomiphene Citrate 50 mg Tablets 10\'s', 'Gynaecology'),
(613, '610', 'MIFEPRISTONE Tablets IP 200 mg 1\'s', 'Gynaecology'),
(614, '611', 'Oxytocin Injection IP 5 IU/ml 1 ml Amp.', 'Gynaecology'),
(615, '612', 'KIT OF MIFEPRISTONE 200 mg (1 TABLET) +\n MISOPROSTOL 200 mcg (4 Tablets ) 1\'s', 'Gynaecology'),
(616, '613', 'NORETHISTERONE Tablets IP 5 mg 10\'s', 'Gynaecology'),
(617, '614', 'Progesterone 200 mg SR Tablets 10\'s', 'Gynaecology'),
(618, '615', 'Dehydroepiandrosterone 25 mg Capsule 10\'s', 'Gynaecology'),
(619, '616', 'Cabergoline Tablets I.P 0.5mg 4\'s', 'Gynaecology'),
(620, '617', 'Carboprost Tromethamine Injection IP 250 mcg/ml', 'Gynaecology'),
(621, '618', 'Drotaverine HCl 80mg, Mefenamic Acid 250mg Tablets', 'Gynaecology'),
(622, '619', 'Drotaverine HCl Tablets IP 40mg', 'Gynaecology'),
(623, '620', 'Ethinylestradiol 0.05mg, Levonorgestrel-0.25mg Tablets 21\'s', 'Gynaecology'),
(624, '621', 'Human Chorionic Gonadotrophin 5000 IU Powder For Inj. With solvent Vial and solvent', 'Gynaecology'),
(625, '622', 'Human Menopausal Gonadotrophin Injection 75 IU with solvent(Menotropin for Inj IP.75 IU Vial and solvent', 'Gynaecology'),
(626, '623', 'DEFLAZACORT Tablets 6 mg 6\'s', 'Immunosuppresant'),
(627, '624', 'Mycophenolate Mofetil Tablets 500mg 10\'s', 'Immunosuppresant'),
(628, '625', 'Lignocaine Injection IP 2%w/v 30 ml Vial', 'Local/ General Anaesthetics'),
(629, '626', 'Lignocaine 1% + Adrenaline 2%w/v Inj. 30 ml Vial', 'Local/ General Anaesthetics'),
(630, '627', 'Propofol 10 mg/ml Inj. 10ml Vial', 'Local/ General Anaesthetics'),
(631, '628', 'Atracurium Besilate Injection I.P 25mg/2.5ml 2.5 ML', 'Local/ General Anaesthetics'),
(632, '629', 'Vecuronium Bromide Injection I.P 4mg', 'Local/ General Anaesthetics'),
(633, '630', 'ACETYLCYSTEINE Tablets 600 mg 10\'s', 'Miscellaneous'),
(634, '631', 'Disulfiram Tablets IP 500 mg 4\'s 4\'s', 'Miscellaneous'),
(635, '632', 'Water for Injection amp polypack 10 ml', 'Miscellaneous'),
(636, '633', 'Zoledronic Acid Injections I.P 4mg/ml 5 ml', 'Miscellaneous'),
(637, '634', 'ACETYLCYSTEINE Injection 200 mg/ml 2ml Ampoules', 'Miscellaneous'),
(638, '635', 'BUDESONIDE RESPULES 0.5 MG/ml 2ml', 'Respiratory'),
(639, '636', 'Budesonide 200 mcg/dose Inhaler 200 md', 'Respiratory'),
(640, '637', 'Cough Syrup Diphen.14 mg. + A.Chl.135 mg. + Sod.Cit.57 mg. + Menthol IP 0.9 mg. 110 ml', 'Respiratory'),
(641, '638', 'Etophyllin and Theophylline Inj. (84.7mg+25.3 mg) mg/2ml 2\n ml', 'Respiratory'),
(642, '639', 'Etophyllin and Theophylline Tablets 10\'s', 'Respiratory'),
(643, '640', 'Fexofenadine 120 mg film coated Tablet 10\'s', 'Respiratory'),
(644, '641', 'Fexofenadine 180 mg film coated Tablet 10\'s', 'Respiratory'),
(645, '642', 'Levocetrizine film coated Tablets IP 5mg 10\'s', 'Respiratory'),
(646, '643', 'Montelukast Sodium Tablets IP 5mg 10\'s', 'Respiratory'),
(647, '644', 'Montelukast Sodium Tablets IP 10mg 10\'s', 'Respiratory'),
(648, '645', 'Levocetrizine 5mg and Montelukast Sodium 10mg film coated\n Tablet 10\'s', 'Respiratory'),
(649, '646', 'Pheniramine Maleate 25 mg 15\'s', 'Respiratory'),
(650, '647', 'Promethazine (5mg/5ml) syrup 100 ml', 'Respiratory'),
(651, '648', 'Salbutamol 100 mcg/puff Inhaler 200 md', 'Respiratory'),
(652, '649', 'Salbutamol Tablets IP 2mg 10\'s', 'Respiratory'),
(653, '650', 'Salbutamol 2mg /5ml Syrup 100 ml', 'Respiratory'),
(654, '651', 'Salbutamol 4 mg tablets 10\'s', 'Respiratory'),
(655, '652', 'GUAIFENESIN 100 mg+ TERBUTALINE 2.5 mg+ BROMHEXINE 8 mg /10 ml SYRUP 100 ml', 'Respiratory'),
(656, '653', 'TERBUTALINE 2.5 MG + BROMHEXINE 8 MG /10 ML\n SYRUP', 'Respiratory'),
(657, '654', 'Acebrophylline Capsules 100 mg 10\'s', 'Respiratory'),
(658, '655', 'SODIUM CHLORIDE 0.65% w/v NASAL DROPS 20 ml', 'Respiratory'),
(659, '656', 'FLUTICASONE PROPIONATE RESPULE 0.5 MG/2ML 2\n ML', 'Respiratory'),
(660, '657', 'DOXOFYLLINE TABLETS IP 400 MG 10\'s', 'Respiratory'),
(661, '658', 'MONTELUKAST 10 MG + FEXOFENADINE HCl 120 MG\n TABLETS', 'Respiratory'),
(662, '659', 'FLUTICASONE PROPIONATE 50 MCG PER PUFF\n NASAL SPRAY', 'Respiratory'),
(663, '660', 'LORATIDINE Tablets BP 10 mg 10\'s', 'Respiratory'),
(664, '661', 'OXYMETAZOLINE 0.5 MG /ML NASAL DROPS 10 ML', 'Respiratory'),
(665, '662', 'SALBUTAMOL 100 MCG + IPRATROPIUM 20 MCG\n /PUFF INHALER 200 MDI', 'Respiratory'),
(666, '663', 'Etophylline IP 115mg + Theophylline 35mg Prolonged\n Release Tablet 10\'s', 'Respiratory'),
(667, '664', 'Etophylline IP 231mg. + Theophylline 69mg Tablet 10\'s', 'Respiratory'),
(668, '665', 'Mucodilator Expectorant Terbutaline Sulphate 1.25 mg, Bromhexine 4 mg, Guaiphenesin 50 mg, Menthol 2 100 ML', 'Respiratory'),
(669, '666', 'Phenylephrine Hydrochloride 5.00mg Chlorpheniranmine Maleate 2.00mg Drops 15 ml Bottle', 'Respiratory'),
(670, '667', 'Dextromethorphan HBr Syrup IP 13.5mg/5ml', 'Respiratory'),
(671, '668', 'Formoterol Fumerate 6mcg, Fluticasone Propionate 250mcg\n Inhaler 120 MDI', 'Respiratory'),
(672, '669', 'Levosalbutamol HCl (Levalbuterol) Inhalation solution 50 mcg/MDI 200 Mdi', 'Respiratory'),
(673, '670', 'Prednisolone Tablets IP 5 MG 15\'s', 'Steroids & Hormones'),
(674, '671', 'Prednisolone 10 mg Tablet 10\'s', 'Steroids & Hormones'),
(675, '672', 'THYROXINE SODIUM TABLETS IP 50 ?g 10\'s', 'Steroids & Hormones'),
(676, '673', 'Dexamethasone 0.5 mg Tablets 10\'s', 'Steroids & Hormones'),
(677, '674', 'Dexamethasone 4mg Inj. 2 ml', 'Steroids & Hormones'),
(678, '675', 'LEVO-THYROXINE SODIUM TABLETS IP 100 MCG', 'Steroids & Hormones'),
(679, '676', 'BETAMETHASONE SODIUM PHOSPHATE TABLETS IP\n 0.5 MG', 'Steroids & Hormones'),
(680, '677', 'METHYLPREDNISOLONE SODIUM SUCCINATE INJECTION 1000 MG PER VIAL VIAL & WFI', 'Steroids & Hormones'),
(681, '678', 'NANDROLONE DECANOATE INJECTION IP 25MG/ML', 'Steroids & Hormones'),
(682, '679', 'LEVO-THYROXINE TABLETS IP 50 MCG', 'Steroids & Hormones'),
(683, '680', 'CARBIMAZOLE TABLETS IP 5 MG', 'Steroids & Hormones'),
(684, '681', 'Betamethasone Inj. I.P 4 mg/ml 1 ml', 'Steroids & Hormones'),
(685, '682', 'Hydrocortisone Sodium Succinate Injection IP 100mg', 'Steroids & Hormones'),
(686, '683', 'Medroxy Progesterone Acetate Tablets IP 10mg 10\'s', 'Steroids & Hormones'),
(687, '684', 'Natural Micronised Progesterone Capsules 100mg 10\'s', 'Steroids & Hormones'),
(688, '685', 'Natural Micronised Progesterone Capsules 200mg 10\'s', 'Steroids & Hormones'),
(689, '686', 'NANDROLONE DECANOATE INJECTION IP 50 mg/ml 2\n ml', 'Steroids & Hormones'),
(690, '687', 'Mannitol Injections IP 20%w/v 100 ml', 'Urology'),
(691, '688', 'Mannitol 20% Infusion IP 350 ml', 'Urology'),
(692, '689', 'URSODEOXYCHOLIC ACID Tablets IP 300 mg 10\'s', 'Urology'),
(693, '690', 'SILDENAFIL Tablets IP 50 mg 4\'s', 'Urology'),
(694, '691', 'TADALAFIL Tablets 20 mg 4\'s', 'Urology'),
(695, '692', 'Tamsulosin 0.4 mg + Dutasteride 0.5 mg Tablets 15\'s', 'Urology'),
(696, '693', 'Finaestride Tablets IP 5mg 10\'s 10\'s', 'Urology'),
(697, '694', 'Acetazolamide Tablets I.P 250mg 10\'s', 'Urology'),
(698, '695', 'Filgrastim 300mcg/1ml Prefilled Syringe', 'Urology'),
(699, '696', 'Hydroclorthiazide Tablets 12.5mg 10\'s', 'Urology'),
(700, '697', 'Tamsulosin Modified-Release Capsules 0.4 mg', 'Urology'),
(701, '698', 'Sildenafil Tablets 100 mg 4\'s', 'Urology'),
(702, '699', 'VACCINE RABIES INJECTION 2.5 IU 1 ml', 'Vaccines / Toxoids'),
(703, '710', 'azithromycin', 'Analgesic & Antipyretic / Muscle Relaxants'),
(704, '704', 'ascoril cough syrup', 'Analgesic & Antipyretic / Muscle Relaxants'),
(705, '705', 'betadine gargle', 'Analgesic & Antipyretic / Muscle Relaxants'),
(706, '706', 'Sulfatrim', 'Analgesic & Antipyretic / Muscle Relaxants'),
(707, '707', 'Acetaminophen', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(708, '708', 'diphenhydramine', 'Electrolytes/ Supplements/ Vitamins & Minerals'),
(709, '709', 'Dyclonine', 'Analgesic & Antipyretic / Muscle Relaxants'),
(710, '710', 'Aldesleukin', 'Anticancer/Oncology'),
(711, '711', 'Dabrafenib', 'Anticancer/Oncology'),
(712, '712', 'Apixaban', 'Cardiovascular System (CVS)'),
(713, '713', 'Dabrafenib', 'Cardiovascular System (CVS)'),
(714, '714', 'Edoxaban', 'Cardiovascular System (CVS)'),
(715, '715', 'Heparin', 'Cardiovascular System (CVS)'),
(716, '716', 'Rivaroxaban', 'Cardiovascular System (CVS)'),
(717, '717', 'Warfarin', 'Cardiovascular System (CVS)'),
(718, '718', 'Conimetinib', 'Anticancer/Oncology'),
(719, '719', 'simethicone', 'Gastrointestinal (GIT)'),
(720, '720', 'lactobacillus', 'Gastrointestinal (GIT)'),
(721, '721', 'acidophilus', 'Gastrointestinal (GIT)'),
(722, '722', 'prednisone', 'Respiratory'),
(723, '723', 'montelukast', 'Respiratory'),
(724, '724', 'lactobacillus', 'Gastrointestinal (GIT)'),
(725, '725', 'Valtrex', 'Vaccines / Toxoids'),
(726, '726', 'Zovirax', 'Vaccines / Toxoids'),
(727, '727', 'benralizumab', 'Respiratory'),
(728, '728', 'oseltamivir', 'Immunosuppresant'),
(729, '729', 'phosphate', 'Immunosuppresant'),
(730, '730', 'zanamivir', 'Immunosuppresant'),
(731, '731', 'baloxavir marboxil', 'Immunosuppresant'),
(732, '732', 'aspirin', 'Analgesic & Antipyretic / Muscle Relaxants'),
(733, '733', 'penicillin', 'Analgesic & Antipyretic / Muscle Relaxants'),
(734, '734', 'doxycycline hyclate', 'Analgesic & Antipyretic / Muscle Relaxants'),
(735, '735', 'Capecitabine', 'Anticancer/Oncology'),
(736, '736', 'Oxaliplatin', 'Anticancer/Oncology'),
(737, '737', 'Irinotecan', 'Anticancer/Oncology');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_drugs`
--

CREATE TABLE `hospital_drugs` (
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(1000) NOT NULL,
  `min_age` int(11) NOT NULL,
  `max_age` int(11) NOT NULL,
  `other_medications` varchar(2000) NOT NULL,
  `comorbid_conditions` varchar(2000) NOT NULL,
  `blood_pressure_req` varchar(50) NOT NULL,
  `drug_category` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_drugs`
--

INSERT INTO `hospital_drugs` (`drug_id`, `drug_name`, `min_age`, `max_age`, `other_medications`, `comorbid_conditions`, `blood_pressure_req`, `drug_category`) VALUES
(6, 'azithromycin', 30, 50, 'nil', 'Liver Disease,Hypothyroidism, Pulmo', '2,1', 'Analgesic & Antipyretic / Muscle Relaxants');

-- --------------------------------------------------------

--
-- Table structure for table `ocr_savefile`
--

CREATE TABLE `ocr_savefile` (
  `id` int(11) NOT NULL,
  `report` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ocr_savefile`
--

INSERT INTO `ocr_savefile` (`id`, `report`) VALUES
(1, 'reports/patient_report.pdf'),
(2, 'reports/patient_report_HHPJlOl.pdf'),
(3, 'reports/patient_report_Bc3hvzD.pdf'),
(4, 'reports/patient_report_2KM2wOg.pdf'),
(5, 'reports/patient_report_cuTQouK.pdf'),
(6, 'reports/patient_report_kiAW2gg.pdf'),
(7, 'reports/patient_report_ENyMePJ.pdf'),
(8, 'reports/patient_report_Dc6N75h.pdf'),
(9, 'reports/patient_report_OGSX1Bw.pdf'),
(10, 'reports/patient_report_6sH4HgU.pdf'),
(11, 'reports/patient_report_NfhTHsW.pdf'),
(12, 'reports/patient_report_OXHzkzI.pdf'),
(13, 'reports/patient_report_5rS9Nph.pdf'),
(14, 'reports/patient_report_myai1Qo.pdf'),
(15, 'reports/patient_report_6MVEV8K.pdf'),
(16, 'reports/patient_report_FS0NzNd.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `p_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `city` varchar(100) NOT NULL,
  `blood_group` varchar(20) NOT NULL,
  `birthdate` date NOT NULL,
  `contact_info` varchar(13) NOT NULL,
  `comorbid_conditions` varchar(2000) NOT NULL,
  `hereditary_diseases` varchar(2000) NOT NULL,
  `allergies` varchar(2000) NOT NULL,
  `entry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`p_id`, `name`, `gender`, `address`, `city`, `blood_group`, `birthdate`, `contact_info`, `comorbid_conditions`, `hereditary_diseases`, `allergies`, `entry_date`) VALUES
(1, 'Jon Snow', 'm', 'House Stark, Near the Wall', 'Winterfell', 'O rh positive', '1972-12-03', '919999112233', 'Liver Disease', 'blood pressure, diabetes', 'milk, aceclofenac', '2020-08-19'),
(2, 'john doe', 'm', 'po. 1, bharat tvc, andheri east, mumbai-99', 'mumbai', 'B rh positive', '1989-10-10', '9822673523', 'nil', 'diabetes', 'nil', '2020-08-20'),
(3, 'mayank agarwal', 'm', 'At.Post. Ogalewadi, Karad', 'Karad', 'O rh negative', '2011-06-06', '8956254586', 'hypertension,Drug Abuse', 'arthritis,', 'Azelastine', '1990-02-18'),
(4, 'Sheela Jeet', 'f', 'Flat no.105, Vasant Vihar,delhi', 'Delhi', 'AB rh positive', '2018-08-30', '9656234547', 'Disorders of lipid metabolism', 'nil', 'Oxymetazoline', '2002-02-20'),
(5, 'Rajesh Roy', 'm', 'Hira society, Bhaykhala , mumbai', 'mumbai', 'O rh positive', '2016-02-29', '9856241563', 'Alcohol Abuse,Liver Disease', 'Colon Cancer', 'nil', '2015-08-19'),
(6, 'Heema Das', 'f', 'Tushar residency,Warje,pune', 'Pune', 'A rh positive', '2015-02-03', '9725163542', 'nil', 'Holoprosencephaly', 'Animal fur', '2020-08-19'),
(7, 'priya roy', 'f', 'Flat no.205, A wing, Silverwood, Nerul', 'Navi Mumabi', 'B rh negative', '1869-10-02', '8484562374', 'Depression', 'Breast Cancer', 'nil', '2010-02-14'),
(8, 'Rohan Maske', 'm', 'House no.67,Gokhale nagar,beed', 'Beed', 'A rh negative', '1949-08-15', '7035458952', 'Solid Tumor without Metastasis', 'nil', 'Cromolyn,seafood', '2017-03-17'),
(9, 'Vijay Patil', 'm', 'Link Rd, Yogi Nagar,Boriwali', 'mumbai', 'AB rh negative', '2015-09-01', '8956245548', 'Hypertension,Peripheral Vascular Disease', 'Colon Cancer', 'nil', '2021-09-19'),
(10, 'Riya jain', 'f', 'Paddy nagar,Deshpande colony,Chembur', 'Navi Mumbai', 'O rh negative', '1950-01-26', '7245893510', 'nil', 'nil', 'Dust mites', '2025-03-20'),
(11, 'Mohan G.', 'm', 'House no.209,Shastri nagar,Goregoan', 'mumbai', 'B rh positive', '1997-05-03', '8525654512', 'Hypothyroidism, Pulmo', 'nil', 'Insect stings', '2004-08-19'),
(12, 'Yusuf Malik', 'm', 'Neera society, shamrao nagar,colaba,mumbai', 'mumbai', 'O rh negative', '1996-12-01', '7325457896', 'Diabetes with Chronic Complications', 'Obesity', 'nil', '2012-06-20'),
(13, 'john doe ', 'm ', 'po. 1, bharat tvc, andheri east, mumbai-99 ', 'mumbai ', 'b rh positive ', '1970-01-01', '9822673523 ', 'high blood_pressure', 'diabetes', 'aceclofenac', '2020-08-20'),
(14, 'sandesh t.', 'm ', 'po. 1, bharat tvc, andheri east, mumbai-99 ', 'mumbai ', 'b rh positive ', '1970-01-01', '9822673523 ', 'high blood_pressure', 'diabetes', 'aceclofenac', '1997-08-20'),
(16, 'john doe ', 'm ', 'po. 1, bharat tvc, andheri east, mumbai-99 ', 'mumbai ', 'b rh positive ', '1970-01-01', '9822673523 ', 'high blood_pressure', 'diabetes', 'aceclofenac', '2020-08-20'),
(17, 'Sanat', 'm', '\'Anugraha\',Malkapur', 'Karad', 'a rh positive', '2020-10-23', '9866235874', 'nil', 'nil', 'nil', '2020-10-02'),
(18, 'Sandesh Todkari', 'm', 'uplai', 'Barshi', 'o rh positive', '1997-11-21', '963258741', 'nil', 'nil', 'nil', '2020-10-03'),
(19, 'Pradnyoday Mirajkar', 'm', 'SUNRISE 483/3AA,', 'SHAMRAO NAGAR', 'a rh positive', '1998-04-26', '9866235874', 'nil', 'nil', 'nil', '2020-10-04'),
(20, 'john doe ', 'm ', 'po. 1, bharat tvc, andheri east, mumbai-99 ', 'mumbai ', 'b rh positive ', '1970-01-01', '9822673523 ', 'high blood_pressure', 'diabetes', 'aceclofenac', '2020-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `trial`
--

CREATE TABLE `trial` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trial`
--

INSERT INTO `trial` (`id`, `name`, `user_id`) VALUES
(2, 'pradnyoday', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_account`
--

CREATE TABLE `users_account` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(100) NOT NULL,
  `reg_name` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `role` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_account`
--

INSERT INTO `users_account` (`id`, `password`, `email`, `reg_name`, `date_joined`, `last_login`, `is_admin`, `is_staff`, `is_superuser`, `is_active`, `is_verified`, `role`, `city`, `state`, `country`, `phone`) VALUES
(1, 'pbkdf2_sha256$216000$afMbdaKpwEVg$Q+xBm63rF89AXHDNZA1XcCl7ZoqCjkz7pg8yxDLhoA4=', 'pradnyoday@gmail.com', 'Pradnyoday', '2020-09-25 09:42:01.157463', '2020-10-04 15:57:39.279587', 1, 1, 1, 1, 1, 1, 'Sangli', 'Maharashtra', 'India', '9822673523'),
(2, 'pbkdf2_sha256$216000$CebZcTpaCCtm$ONGOd6GvzD0+WNJxJ+PFh8Sg5WPu2bFI/QNwzm257vU=', 'pradnyoday@gmail.com1', 'Pradnyoday1', '2020-09-25 09:48:26.553186', '2020-09-25 09:48:26.553186', 0, 0, 0, 1, 1, 1, 'SHAMRAO NAGAR', 'Maharashtra', 'India', '9822673523'),
(3, 'pbkdf2_sha256$216000$tzjLcHZVMXRk$A4TaNkk6Tb0ldpn3GKs6A7LV3mXedZYdlVKk/SH2Hl8=', 'shilotejmirajkar@gmail.com', 'Shilotej', '2020-09-25 09:58:08.117725', '2020-10-04 16:16:28.685600', 0, 0, 0, 1, 1, 0, 'Pune', 'Maharashtra', 'India', '9822673523'),
(4, 'pbkdf2_sha256$216000$P0IbLJ7q6eoH$Z2VVtyE/Ii3bPDTvMB9DOhEazdjxoKo83OW7iXatg68=', 'x@gmail.com', 'Pharma', '2020-09-25 09:59:29.565305', '2020-09-30 21:15:52.447613', 0, 0, 0, 1, 1, 1, 'Pune', 'Maharashtra', 'India', '7896541232'),
(6, 'pbkdf2_sha256$216000$mijeHsYsMT3R$UheHVMG57IqCEYjoUP3FXpyvjXo5fJxdGpx5tJ4FTR8=', 'cipla@cipla.com', 'Cipla', '2020-10-04 11:35:08.050036', '2020-10-04 12:30:39.573799', 0, 0, 0, 1, 1, 1, 'Pune', 'Maharashtra', 'India', '7418529632'),
(8, 'pbkdf2_sha256$216000$DkYKvKzudgn2$1obDvJVMgE7EcmuBlX7uZEaVsfByxCiJVYmiMqykXv8=', 'demo.hospital@mail.com', 'Mehta Hospitals', '2020-10-04 16:25:20.332624', '2020-10-04 16:26:56.096524', 0, 0, 0, 1, 1, 0, 'Pune', 'Maharashtra', 'India', '945617412');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `diagnosis_p_id_7026be47_fk_patients_p_id` (`p_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`),
  ADD UNIQUE KEY `nct_no` (`nct_no`),
  ADD KEY `drugs_user_id_6ee95c7a_fk_users_account_id` (`user_id`);

--
-- Indexes for table `drugs_category`
--
ALTER TABLE `drugs_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital_drugs`
--
ALTER TABLE `hospital_drugs`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `ocr_savefile`
--
ALTER TABLE `ocr_savefile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `trial`
--
ALTER TABLE `trial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trial_user_id_3cea0532_fk_users_account_id` (`user_id`);

--
-- Indexes for table `users_account`
--
ALTER TABLE `users_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `reg_name` (`reg_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `drugs_category`
--
ALTER TABLE `drugs_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=738;

--
-- AUTO_INCREMENT for table `hospital_drugs`
--
ALTER TABLE `hospital_drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ocr_savefile`
--
ALTER TABLE `ocr_savefile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `trial`
--
ALTER TABLE `trial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_account`
--
ALTER TABLE `users_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `diagnosis_p_id_7026be47_fk_patients_p_id` FOREIGN KEY (`p_id`) REFERENCES `patients` (`p_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_user_id_6ee95c7a_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `trial`
--
ALTER TABLE `trial`
  ADD CONSTRAINT `trial_user_id_3cea0532_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
