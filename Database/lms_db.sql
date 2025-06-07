-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2025 at 03:52 PM
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
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `id` bigint(20) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`id`, `department`, `user_id`) VALUES
(1, NULL, 1),
(2, NULL, 29);

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` bigint(20) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `graded` bit(1) NOT NULL,
  `score` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total_points` int(11) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`id`, `description`, `due_date`, `graded`, `score`, `title`, `total_points`, `course_id`, `attachment_url`) VALUES
(1, 'Write me a paragraph about yourself.', '2025-05-22 21:00:00.000000', b'0', 0, 'Introduce yourself', 10, 3, NULL),
(3, 'fbvvbfbvf', '2025-05-30 21:00:00.000000', b'0', 0, 'grv', 22, 3, '/files/7fabd5e0-437f-4a5b-b96f-514f0d570237_courses (6).csv');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submission`
--

CREATE TABLE `assignment_submission` (
  `id` bigint(20) NOT NULL,
  `graded` bit(1) NOT NULL,
  `score` int(11) NOT NULL,
  `submission_content` varchar(5000) DEFAULT NULL,
  `submission_date` datetime(6) DEFAULT NULL,
  `assignment_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignment_submission`
--

INSERT INTO `assignment_submission` (`id`, `graded`, `score`, `submission_content`, `submission_date`, `assignment_id`, `student_id`, `file_url`) VALUES
(1, b'0', 0, 'Bonjour, Je m\'apelle Sarah, Je suis 20.', '2025-05-22 12:47:32.000000', 1, 1, NULL),
(2, b'0', 0, 'r', '2025-05-23 13:45:11.000000', 3, 1, '/files/acc02039-6d1f-46ff-a19d-e812af8edfd6_lms_db (3).sql');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `uploaded_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `description`, `file_path`, `file_type`, `title`, `course_id`, `uploaded_by`) VALUES
(1, NULL, 'C:\\my-uploads\\ff698ced-b15c-4438-93d5-1a1bc2e8004e_Numbers in French.jpg', 'image/jpeg', 'Numbers in French', 3, 6),
(2, 'rgbr', 'C:\\my-uploads\\b5b10db0-5b01-4450-9d19-4fbbf214f4dd_lms_db (3).sql', 'application/octet-stream', 'grhgr', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` bigint(20) NOT NULL,
  `course_description` varchar(255) DEFAULT NULL,
  `course_duration` varchar(255) DEFAULT NULL,
  `course_end_date` datetime(6) DEFAULT NULL,
  `course_instructor` varchar(255) DEFAULT NULL,
  `course_level` varchar(255) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_price` double DEFAULT NULL,
  `course_start_date` datetime(6) DEFAULT NULL,
  `instructor_id` bigint(20) DEFAULT NULL,
  `completed` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course_description`, `course_duration`, `course_end_date`, `course_instructor`, `course_level`, `course_name`, `course_price`, `course_start_date`, `instructor_id`, `completed`) VALUES
(1, 'An introduction to basic Spanish vocabulary, grammar, and conversation skills.', '8 weeks', '2025-07-27 12:00:00.000000', 'Carine', 'Beginner', 'Beginner Spanish', 200, '2025-06-01 12:00:00.000000', 3, b'0'),
(2, 'Build on your Spanish foundation with intermediate grammar, reading, and speaking practice.', '8 weeks', '2025-08-26 12:00:00.000000', 'Carine', 'Intermediate', 'Intermediate Spanish', 250, '2025-07-01 12:00:00.000000', 3, b'0'),
(3, 'Learn fundamental French pronunciation, basic grammar, and everyday expressions.', '8 weeks', '2025-07-31 03:00:00.000000', NULL, NULL, 'Beginner French', 220, '2025-06-05 03:00:00.000000', 6, b'0'),
(4, 'Expand your French skills through intermediate-level reading, writing, and conversation.', '8 weeks', '2025-08-30 13:00:00.000000', 'Elora', 'Intermediate', 'Intermediate French', 270, '2025-07-05 13:00:00.000000', 6, b'0'),
(5, 'Focus on business English vocabulary, writing professional emails, and presentations.', '8 weeks', '2025-08-02 14:00:00.000000', 'Ehab', 'Advanced', 'English for Business', 300, '2025-06-10 14:00:00.000000', 5, b'0'),
(6, 'Deep dive into English grammar rules, sentence structure, and usage.', '6 weeks', '2025-07-27 14:00:00.000000', 'Ehab', 'Beginner', 'English Grammar Fundamentals', 180, '2025-06-15 14:00:00.000000', 5, b'0'),
(7, 'Refine your Arabic reading, writing, and speaking skills for heritage learners.', '8 weeks', '2025-08-15 11:00:00.000000', 'Bilal', 'Intermediate', 'Arabic for Heritage Speakers', 240, '2025-06-20 11:00:00.000000', 2, b'0'),
(8, 'Introduction to German alphabet, everyday phrases, and basic grammar.', '8 weeks', '2025-08-26 12:00:00.000000', 'Aisha', 'Beginner', 'German Basics', 230, '2025-07-01 12:00:00.000000', 1, b'0'),
(9, 'Learn essential Korean phrases and cultural tips for travel situations.', '6 weeks', '2025-08-21 11:00:00.000000', 'Diaa', 'Beginner', 'Korean for Travelers', 210, '2025-07-10 11:00:00.000000', 4, b'0'),
(10, 'Master advanced writing techniques for essays, reports, and creative writing.', '8 weeks', '2025-09-26 14:00:00.000000', 'Ehab', 'Advanced', 'Advanced English Writing', 320, '2025-08-01 14:00:00.000000', 5, b'0'),
(11, 'An 8-week immersive workshop covering intermediate French grammar and conversation.', '8 weeks', '2025-06-01 20:00:00.000000', 'Elora', 'Beginner', 'French Intensive Workshop', 300, '2025-04-01 11:00:00.000000', 6, b'0'),
(12, 'A 10-week introductory course in Modern Standard Arabic, focusing on reading and writing.', '10 weeks', '2025-06-24 19:30:00.000000', 'Bilal', 'Beginner', 'Arabic for Beginners', 250, '2025-03-15 10:30:00.000000', 2, b'0'),
(13, 'An 8-week course designed to boost everyday English speaking and listening fluency.', '8 weeks', '2025-07-01 18:00:00.000000', 'Ehab', 'Advanced', 'English Conversation Skills', 200, '2025-05-01 13:00:00.000000', 5, b'0'),
(14, 'A 14-week deep dive into Spanish grammar, from basics to advanced structures.', '14 weeks', '2025-05-17 17:30:00.000000', 'Carine', 'Advanced', 'Spanish Grammar Mastery', 350, '2025-02-10 11:30:00.000000', 3, b'0'),
(15, 'A 12-week course to strengthen German literacy skills in academic and professional contexts.', '12 weeks', '2025-06-15 19:00:00.000000', 'Aisha', 'Advanced', 'German Reading & Writing', 300, '2025-01-20 13:00:00.000000', 1, b'0'),
(16, 'A 6-week targeted course on Korean for business meetings, emails, and presentations.', '6 weeks', '2025-06-21 20:00:00.000000', 'Diaa', 'Advanced', 'Korean Business Language', 220, '2025-05-10 16:00:00.000000', 4, b'0'),
(17, 'A 10-week course to strengthen French literacy skills in academic and professional contexts.', '10 weeks', '2025-06-29 17:00:00.000000', 'Elora', 'Advanced', 'French Reading and Writing', 280, '2025-03-20 12:00:00.000000', 6, b'0'),
(18, 'A 12-week advanced course analyzing classical and modern Arabic texts.', '12 weeks', '2025-07-02 18:00:00.000000', 'Bilal', 'Advanced', 'Arabic Advanced Literature', 320, '2025-04-05 11:00:00.000000', 2, b'0'),
(19, 'A 14-week course on crafting essays, reports, and research papers in English.', '14 weeks', '2025-05-25 15:00:00.000000', 'Ehab', 'Advanced', 'English Academic Writing', 400, '2025-02-15 10:00:00.000000', 5, b'0'),
(20, 'An 8-week interactive course focused on real-life Spanish dialogue skills.', '8 weeks', '2025-07-01 16:00:00.000000', 'Carine', 'Intermediate', 'Spanish Conversation Practice', 230, '2025-05-05 13:00:00.000000', 3, b'0'),
(21, 'An introductory 8-week course in German basics: alphabet, pronunciation, simple sentences.', '8 weeks', '2024-03-05 19:00:00.000000', 'Aisha', 'Beginner', 'German for Beginners', 180, '2024-01-10 11:00:00.000000', 1, b'0'),
(22, 'A 10-week intermediate Korean course focusing on complex grammar and vocabulary.', '10 weeks', '2024-04-25 19:00:00.000000', 'Diaa', 'Intermediate', 'Korean Intermediate', 200, '2024-02-15 12:00:00.000000', 4, b'0'),
(23, 'A 12-week course to develop fluent spoken French through role-plays and discussions.', '12 weeks', '2024-05-20 18:00:00.000000', 'Elora', 'Advanced', 'French Conversational Course', 250, '2024-03-01 13:00:00.000000', 6, b'0'),
(24, 'A 6-week course covering Arabic for negotiations, presentations, and emails.', '6 weeks', '2024-05-22 15:30:00.000000', 'Bilal', 'Advanced', 'Arabic Business Communication', 200, '2024-04-10 10:30:00.000000', 2, b'0'),
(25, 'A 14-week in-depth study of classic and modern English literature.', '14 weeks', '2024-08-07 17:00:00.000000', 'Ehab', 'Advanced', 'English Literature Review', 350, '2024-05-01 12:00:00.000000', 5, b'0'),
(26, 'An 8-week intensive on writing essays, reports, and creative texts in Spanish.', '8 weeks', '2024-08-05 19:00:00.000000', 'Carine', 'Beginner', 'Spanish Writing Skills', 220, '2024-06-10 13:00:00.000000', 3, b'0'),
(27, 'A 10-week advanced speaking course focusing on debates and presentations in German.', '10 weeks', '2024-10-01 18:00:00.000000', 'Aisha', 'Advanced', 'German Advanced Conversation', 270, '2024-07-15 12:00:00.000000', 1, b'0'),
(28, 'A 6-week practical course teaching Korean phrases for travel and hospitality contexts.', '6 weeks', '2024-09-12 20:00:00.000000', 'Diaa', 'Beginner', 'Korean for Travel', 190, '2024-08-01 15:00:00.000000', 4, b'0'),
(29, 'A 4-week intensive workshop to perfect French phonetics and accent reduction.', '4 weeks', '2024-10-03 21:00:00.000000', 'Elora', 'Beginner', 'French Pronunciation Workshop', 150, '2024-09-05 17:00:00.000000', 6, b'0'),
(30, 'A 6-week course exploring classical and modern Arabic poetry, with performance practice.', '6 weeks', '2024-11-21 15:00:00.000000', 'Bilal', 'Advanced', 'Arabic Poetry Recital', 240, '2024-10-10 12:00:00.000000', 2, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollment`
--

CREATE TABLE `course_enrollment` (
  `course_id` bigint(20) NOT NULL,
  `enrollment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` bigint(20) NOT NULL,
  `completed` bit(1) NOT NULL,
  `enrollment_date` datetime(6) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `completed`, `enrollment_date`, `student_id`) VALUES
(1, b'0', '2025-05-02 12:00:00.000000', 1),
(2, b'0', '2025-05-03 13:30:00.000000', 2),
(3, b'0', '2025-05-03 14:45:00.000000', 3),
(4, b'0', '2025-05-05 11:20:00.000000', 4),
(5, b'0', '2025-05-06 17:15:00.000000', 5),
(6, b'0', '2025-05-06 19:50:00.000000', 6),
(7, b'0', '2025-05-06 15:00:00.000000', 7),
(8, b'0', '2025-05-07 12:30:00.000000', 8),
(9, b'0', '2025-05-07 18:00:00.000000', 9),
(10, b'0', '2025-05-08 16:45:00.000000', 10),
(11, b'0', '2025-05-09 13:15:00.000000', 11),
(12, b'0', '2025-05-09 11:40:00.000000', 12),
(13, b'0', '2025-05-10 10:55:00.000000', 13),
(14, b'0', '2025-05-10 12:10:00.000000', 14),
(15, b'0', '2025-05-10 13:20:00.000000', 15),
(16, b'0', '2025-05-10 14:30:00.000000', 16),
(17, b'0', '2025-05-10 15:45:00.000000', 17),
(18, b'0', '2025-05-10 16:05:00.000000', 18),
(19, b'0', '2025-05-11 17:25:00.000000', 19),
(20, b'0', '2025-05-11 18:40:00.000000', 20),
(21, b'0', '2025-05-12 19:55:00.000000', 21),
(22, b'1', '2024-01-10 11:00:00.000000', 1),
(23, b'1', '2024-02-15 12:00:00.000000', 2),
(24, b'1', '2024-03-01 13:00:00.000000', 3),
(25, b'1', '2024-03-01 13:00:00.000000', 3),
(26, b'1', '2024-04-10 10:30:00.000000', 4),
(27, b'1', '2024-05-01 12:00:00.000000', 5),
(28, b'1', '2024-06-10 13:00:00.000000', 6),
(29, b'1', '2024-07-15 12:00:00.000000', 7),
(30, b'1', '2024-08-01 15:00:00.000000', 8),
(31, b'1', '2024-09-05 17:00:00.000000', 9),
(32, b'1', '2024-10-10 12:00:00.000000', 10),
(33, b'1', '2024-01-10 11:00:00.000000', 11),
(34, b'1', '2024-02-15 12:00:00.000000', 12),
(35, b'1', '2024-03-01 13:00:00.000000', 13),
(36, b'1', '2024-04-10 10:30:00.000000', 14),
(37, b'1', '2024-05-01 12:00:00.000000', 15),
(38, b'1', '2024-06-10 13:00:00.000000', 16),
(39, b'1', '2024-07-15 12:00:00.000000', 17),
(40, b'1', '2024-08-01 15:00:00.000000', 18),
(41, b'1', '2024-09-05 17:00:00.000000', 19),
(42, b'1', '2024-10-10 12:00:00.000000', 20),
(43, b'1', '2024-01-10 11:00:00.000000', 21),
(44, b'0', '2025-01-19 13:00:00.000000', 1),
(45, b'0', '2025-03-14 10:30:00.000000', 2),
(46, b'0', '2025-02-09 11:30:00.000000', 3),
(47, b'0', '2025-01-19 13:00:00.000000', 4),
(48, b'0', '2025-03-14 10:30:00.000000', 5),
(49, b'0', '2025-04-30 13:00:00.000000', 6),
(50, b'0', '2025-04-04 11:00:00.000000', 7),
(51, b'0', '2025-02-14 10:00:00.000000', 8),
(52, b'0', '2025-02-14 10:00:00.000000', 9),
(53, b'0', '2025-05-04 13:00:00.000000', 10),
(54, b'0', '2025-03-14 10:30:00.000000', 11),
(55, b'0', '2025-03-19 12:00:00.000000', 12),
(56, b'0', '2025-04-04 11:00:00.000000', 13),
(57, b'0', '2025-01-19 13:00:00.000000', 14),
(58, b'0', '2025-03-31 11:00:00.000000', 15),
(59, b'0', '2025-03-14 10:30:00.000000', 16),
(60, b'0', '2025-05-04 13:00:00.000000', 17),
(61, b'0', '2025-02-14 10:00:00.000000', 18),
(62, b'0', '2025-04-04 11:00:00.000000', 19),
(63, b'0', '2025-01-19 13:00:00.000000', 20),
(64, b'0', '2025-02-09 11:30:00.000000', 21),
(65, b'0', '2025-05-15 03:00:00.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_courses`
--

CREATE TABLE `enrollment_courses` (
  `enrollment_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment_courses`
--

INSERT INTO `enrollment_courses` (`enrollment_id`, `course_id`) VALUES
(1, 1),
(1, 5),
(2, 2),
(3, 1),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 2),
(5, 7),
(6, 3),
(7, 8),
(8, 7),
(8, 9),
(9, 9),
(10, 10),
(11, 1),
(11, 2),
(12, 7),
(13, 8),
(13, 3),
(14, 4),
(14, 5),
(15, 1),
(15, 6),
(16, 2),
(16, 8),
(17, 10),
(18, 3),
(18, 9),
(19, 8),
(20, 10),
(20, 5),
(21, 1),
(21, 4),
(21, 9),
(22, 21),
(22, 27),
(22, 30),
(23, 22),
(23, 24),
(24, 23),
(24, 27),
(25, 23),
(25, 27),
(26, 24),
(26, 25),
(27, 25),
(27, 29),
(28, 26),
(28, 30),
(29, 27),
(29, 29),
(30, 28),
(30, 30),
(31, 29),
(31, 30),
(32, 30),
(33, 21),
(33, 27),
(33, 30),
(34, 22),
(34, 24),
(35, 23),
(35, 27),
(36, 24),
(36, 25),
(37, 25),
(37, 29),
(38, 26),
(38, 30),
(39, 27),
(39, 29),
(40, 28),
(40, 30),
(41, 29),
(41, 30),
(42, 30),
(43, 21),
(43, 27),
(43, 30),
(44, 11),
(44, 15),
(45, 12),
(46, 11),
(46, 13),
(46, 14),
(47, 15),
(47, 16),
(48, 12),
(48, 17),
(49, 13),
(50, 18),
(51, 17),
(51, 19),
(52, 19),
(53, 20),
(54, 11),
(54, 12),
(55, 17),
(56, 18),
(56, 13),
(57, 14),
(57, 15),
(58, 11),
(58, 16),
(59, 12),
(59, 18),
(60, 20),
(61, 13),
(61, 19),
(62, 18),
(63, 20),
(63, 15),
(64, 11),
(64, 14),
(64, 19),
(65, 3),
(1, 1),
(1, 5),
(2, 2),
(3, 1),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 2),
(5, 7),
(6, 3),
(7, 8),
(8, 7),
(8, 9),
(9, 9),
(10, 10),
(11, 1),
(11, 2),
(12, 7),
(13, 8),
(13, 3),
(14, 4),
(14, 5),
(15, 1),
(15, 6),
(16, 2),
(16, 8),
(17, 10),
(18, 3),
(18, 9),
(19, 8),
(20, 10),
(20, 5),
(21, 1),
(21, 4),
(21, 9),
(22, 21),
(22, 27),
(22, 30),
(23, 22),
(23, 24),
(24, 23),
(24, 27),
(25, 23),
(25, 27),
(26, 24),
(26, 25),
(27, 25),
(27, 29),
(28, 26),
(28, 30),
(29, 27),
(29, 29),
(30, 28),
(30, 30),
(31, 29),
(31, 30),
(32, 30),
(33, 21),
(33, 27),
(33, 30),
(34, 22),
(34, 24),
(35, 23),
(35, 27),
(36, 24),
(36, 25),
(37, 25),
(37, 29),
(38, 26),
(38, 30),
(39, 27),
(39, 29),
(40, 28),
(40, 30),
(41, 29),
(41, 30),
(42, 30),
(43, 21),
(43, 27),
(43, 30),
(44, 11),
(44, 15),
(45, 12),
(46, 11),
(46, 13),
(46, 14),
(47, 15),
(47, 16),
(48, 12),
(48, 17),
(49, 13),
(50, 18),
(51, 17),
(51, 19),
(52, 19),
(53, 20),
(54, 11),
(54, 12),
(55, 17),
(56, 18),
(56, 13),
(57, 14),
(57, 15),
(58, 11),
(58, 16),
(59, 12),
(59, 18),
(60, 20),
(61, 13),
(61, 19),
(62, 18),
(63, 20),
(63, 15),
(64, 11),
(64, 14),
(64, 19),
(65, 3);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `id` bigint(20) NOT NULL,
  `expertise` varchar(255) DEFAULT NULL,
  `graduate_degree` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`id`, `expertise`, `graduate_degree`, `name`, `user_id`) VALUES
(1, 'German', 'M.A. in German Linguistics', 'Aisha Al‐Masri', 23),
(2, 'Arabic', 'M.A. in Arabic Linguistics', 'Bilal Khoury', 24),
(3, 'Spanish', 'M.A. in Spanish Literature', 'Carine Youssef', 25),
(4, 'Korean', 'M.A. in Korean Language Education', 'Diaa Suleiman', 26),
(5, 'Business English', 'M.A. in English Linguistics', 'Ehab Haddad', 27),
(6, 'French', 'M.A. in French Studies', 'Elora Leblanc', 28);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `recipient` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `type` enum('EMAIL','PUSH','SMS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `message`, `is_read`, `recipient`, `subject`, `timestamp`, `type`) VALUES
(1, 'User \'Ahmad\' (ID:1) registered with role ADMIN.', 1, 'Ahmad', 'New user: Ahmad', '2025-05-14 00:09:34.000000', 'EMAIL'),
(2, 'User \'Sarah\' (ID:2) registered with role STUDENT.', 1, 'Ahmad', 'New user: Sarah', '2025-05-14 12:43:32.000000', 'EMAIL'),
(3, 'User \'Mohammed\' (ID:3) registered with role STUDENT.', 1, 'Ahmad', 'New user: Mohammed', '2025-05-14 12:51:20.000000', 'EMAIL'),
(4, 'User \'Basma\' (ID:4) registered with role STUDENT.', 1, 'Ahmad', 'New user: Basma', '2025-05-14 12:55:04.000000', 'EMAIL'),
(5, 'User \'Cara\' (ID:5) registered with role STUDENT.', 1, 'Ahmad', 'New user: Cara', '2025-05-14 12:55:35.000000', 'EMAIL'),
(6, 'User \'Dana\' (ID:6) registered with role STUDENT.', 1, 'Ahmad', 'New user: Dana', '2025-05-14 12:56:02.000000', 'EMAIL'),
(7, 'User \'Elie\' (ID:7) registered with role STUDENT.', 1, 'Ahmad', 'New user: Elie', '2025-05-14 12:56:14.000000', 'EMAIL'),
(8, 'User \'Katie\' (ID:8) registered with role STUDENT.', 1, 'Ahmad', 'New user: Katie', '2025-05-14 12:56:26.000000', 'EMAIL'),
(9, 'User \'Ghassan\' (ID:9) registered with role STUDENT.', 1, 'Ahmad', 'New user: Ghassan', '2025-05-14 12:56:38.000000', 'EMAIL'),
(10, 'User \'Hana\' (ID:10) registered with role STUDENT.', 1, 'Ahmad', 'New user: Hana', '2025-05-14 12:56:48.000000', 'EMAIL'),
(11, 'User \'Ibrahim\' (ID:11) registered with role STUDENT.', 1, 'Ahmad', 'New user: Ibrahim', '2025-05-14 12:56:58.000000', 'EMAIL'),
(12, 'User \'Jana\' (ID:12) registered with role STUDENT.', 1, 'Ahmad', 'New user: Jana', '2025-05-14 12:57:13.000000', 'EMAIL'),
(13, 'User \'Khaled\' (ID:13) registered with role STUDENT.', 1, 'Ahmad', 'New user: Khaled', '2025-05-14 12:57:27.000000', 'EMAIL'),
(14, 'User \'Layla\' (ID:14) registered with role STUDENT.', 1, 'Ahmad', 'New user: Layla', '2025-05-14 12:57:37.000000', 'EMAIL'),
(15, 'User \'Martin\' (ID:15) registered with role STUDENT.', 1, 'Ahmad', 'New user: Martin', '2025-05-14 12:57:52.000000', 'EMAIL'),
(16, 'User \'Nawal\' (ID:16) registered with role STUDENT.', 1, 'Ahmad', 'New user: Nawal', '2025-05-14 12:58:03.000000', 'EMAIL'),
(17, 'User \'Omar\' (ID:17) registered with role STUDENT.', 1, 'Ahmad', 'New user: Omar', '2025-05-14 12:58:20.000000', 'EMAIL'),
(18, 'User \'Rania\' (ID:18) registered with role STUDENT.', 1, 'Ahmad', 'New user: Rania', '2025-05-14 12:58:30.000000', 'EMAIL'),
(19, 'User \'Samir\' (ID:19) registered with role STUDENT.', 1, 'Ahmad', 'New user: Samir', '2025-05-14 12:58:40.000000', 'EMAIL'),
(20, 'User \'Hala\' (ID:20) registered with role STUDENT.', 1, 'Ahmad', 'New user: Hala', '2025-05-14 12:58:59.000000', 'EMAIL'),
(21, 'User \'Youssef\' (ID:21) registered with role STUDENT.', 1, 'Ahmad', 'New user: Youssef', '2025-05-14 12:59:08.000000', 'EMAIL'),
(22, 'User \'Zainab\' (ID:22) registered with role STUDENT.', 1, 'Ahmad', 'New user: Zainab', '2025-05-14 12:59:18.000000', 'EMAIL'),
(23, 'User \'Aisha\' (ID:23) registered with role INSTRUCTOR.', 1, 'Ahmad', 'New user: Aisha', '2025-05-14 13:01:48.000000', 'EMAIL'),
(24, 'User \'Bilal\' (ID:24) registered with role INSTRUCTOR.', 1, 'Ahmad', 'New user: Bilal', '2025-05-14 13:01:59.000000', 'EMAIL'),
(25, 'User \'Carine\' (ID:25) registered with role INSTRUCTOR.', 1, 'Ahmad', 'New user: Carine', '2025-05-14 13:02:08.000000', 'EMAIL'),
(26, 'User \'Diaa\' (ID:26) registered with role INSTRUCTOR.', 1, 'Ahmad', 'New user: Diaa', '2025-05-14 13:02:19.000000', 'EMAIL'),
(27, 'User \'Ehab\' (ID:27) registered with role INSTRUCTOR.', 1, 'Ahmad', 'New user: Ehab', '2025-05-14 13:03:19.000000', 'EMAIL'),
(28, 'User (ID: 22) was updated by Ahmad: role \'STUDENT\' → \'INSTRUCTOR\', password changed', 1, 'Ahmad', 'User updated: ID 22', '2025-05-14 13:37:00.000000', 'EMAIL'),
(29, 'User (ID: 1) was updated by Ahmad: password changed', 1, 'Ahmad', 'User updated: ID 1', '2025-05-14 13:38:28.000000', 'EMAIL'),
(30, 'User \'Elora\' (ID:28) registered with role INSTRUCTOR.', 1, 'Ahmad', 'New user: Elora', '2025-05-14 13:41:44.000000', 'EMAIL'),
(31, 'Course \'Beginner Spanish\' (ID: 1) was just created by Ahmad.', 1, 'Ahmad', 'New course: Beginner Spanish', '2025-05-14 14:08:10.000000', 'EMAIL'),
(32, 'Course \'Beginner Spanish\' (ID: 1) was deleted by Ahmad', 1, 'Ahmad', 'Course deleted: Beginner Spanish', '2025-05-14 14:10:14.000000', 'EMAIL'),
(33, 'Course \'Beginner Spanish\' (ID: 2) was just created by Ahmad.', 1, 'Ahmad', 'New course: Beginner Spanish', '2025-05-14 14:11:45.000000', 'EMAIL'),
(34, 'Course \'Intermediate Spanish\' (ID: 3) was just created by Ahmad.', 1, 'Ahmad', 'New course: Intermediate Spanish', '2025-05-14 14:14:04.000000', 'EMAIL'),
(35, 'Course \'Beginner French\' (ID: 4) was just created by Ahmad.', 1, 'Ahmad', 'New course: Beginner French', '2025-05-14 14:17:20.000000', 'EMAIL'),
(36, 'Course \'Intermediate French\' (ID: 5) was just created by Ahmad.', 1, 'Ahmad', 'New course: Intermediate French', '2025-05-14 14:20:08.000000', 'EMAIL'),
(37, 'Course \'English for Business\' (ID: 6) was just created by Ahmad.', 1, 'Ahmad', 'New course: English for Business', '2025-05-14 14:20:59.000000', 'EMAIL'),
(38, 'Course \'English Grammar Fundamentals\' (ID: 7) was just created by Ahmad.', 1, 'Ahmad', 'New course: English Grammar Fundamentals', '2025-05-14 14:22:41.000000', 'EMAIL'),
(39, 'Course \'Arabic for Heritage Speakers\' (ID: 8) was just created by Ahmad.', 1, 'Ahmad', 'New course: Arabic for Heritage Speakers', '2025-05-14 14:23:26.000000', 'EMAIL'),
(40, 'Course \'German Basics\' (ID: 9) was just created by Ahmad.', 1, 'Ahmad', 'New course: German Basics', '2025-05-14 14:24:19.000000', 'EMAIL'),
(41, 'Course \'Korean for Travelers\' (ID: 10) was just created by Ahmad.', 1, 'Ahmad', 'New course: Korean for Travelers', '2025-05-14 14:25:04.000000', 'EMAIL'),
(42, 'Course \'Advanced English Writing\' (ID: 11) was just created by Ahmad.', 1, 'Ahmad', 'New course: Advanced English Writing', '2025-05-14 14:26:00.000000', 'EMAIL'),
(43, 'User (ID: 22) was updated by Ahmad: role \'INSTRUCTOR\' → \'STUDENT\', password changed', 1, 'Ahmad', 'User updated: ID 22', '2025-05-14 14:36:06.000000', 'EMAIL'),
(44, 'Enrollment ID 1 for student \'Sarah\' in course(s) [Beginner Spanish, English for Business] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 1', '2025-05-14 15:27:42.000000', 'EMAIL'),
(45, 'Enrollment ID 2 for student \'Mohammed\' in course(s) [Intermediate Spanish] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 2', '2025-05-14 15:29:54.000000', 'EMAIL'),
(46, 'Enrollment ID 3 for student \'Basma\' in course(s) [Beginner Spanish, Beginner French, Intermediate French] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 3', '2025-05-14 15:30:18.000000', 'EMAIL'),
(47, 'Enrollment ID 4 for student \'Cara\' in course(s) [English for Business, English Grammar Fundamentals] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 4', '2025-05-14 15:30:40.000000', 'EMAIL'),
(48, 'Enrollment ID 5 for student \'Dana\' in course(s) [Intermediate Spanish, Arabic for Heritage Speakers] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 5', '2025-05-14 15:31:25.000000', 'EMAIL'),
(49, 'Enrollment ID 6 for student \'Elie\' in course(s) [Beginner French] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 6', '2025-05-14 15:32:00.000000', 'EMAIL'),
(50, 'Enrollment ID 7 for student \'Katie\' in course(s) [German Basics] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 7', '2025-05-14 15:32:34.000000', 'EMAIL'),
(51, 'Enrollment ID 8 for student \'Ghassan\' in course(s) [Arabic for Heritage Speakers, Korean for Travelers] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 8', '2025-05-14 15:33:02.000000', 'EMAIL'),
(52, 'Enrollment ID 9 for student \'Hana\' in course(s) [Korean for Travelers] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 9', '2025-05-14 15:34:40.000000', 'EMAIL'),
(53, 'Enrollment ID 10 for student \'Ibrahim\' in course(s) [Advanced English Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 10', '2025-05-14 15:35:11.000000', 'EMAIL'),
(54, 'Enrollment ID 11 for student \'Jana\' in course(s) [Beginner Spanish, Intermediate Spanish] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 11', '2025-05-14 15:35:57.000000', 'EMAIL'),
(55, 'Enrollment ID 12 for student \'Khaled\' in course(s) [Arabic for Heritage Speakers] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 12', '2025-05-14 15:36:23.000000', 'EMAIL'),
(56, 'Enrollment ID 13 for student \'Layla\' in course(s) [Beginner French, German Basics] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 13', '2025-05-14 15:37:01.000000', 'EMAIL'),
(57, 'Enrollment ID 14 for student \'Martin\' in course(s) [Intermediate French, English for Business] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 14', '2025-05-14 15:37:29.000000', 'EMAIL'),
(58, 'Enrollment ID 15 for student \'Nawal\' in course(s) [Beginner Spanish, English Grammar Fundamentals] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 15', '2025-05-14 15:38:04.000000', 'EMAIL'),
(59, 'Enrollment ID 16 for student \'Omar\' in course(s) [Intermediate Spanish, German Basics] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 16', '2025-05-14 15:38:34.000000', 'EMAIL'),
(60, 'Enrollment ID 17 for student \'Rania\' in course(s) [Advanced English Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 17', '2025-05-14 15:39:13.000000', 'EMAIL'),
(61, 'Enrollment ID 18 for student \'Samir\' in course(s) [Beginner French, Korean for Travelers] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 18', '2025-05-14 15:39:43.000000', 'EMAIL'),
(62, 'Enrollment ID 19 for student \'Hala\' in course(s) [German Basics] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 19', '2025-05-14 15:40:09.000000', 'EMAIL'),
(63, 'Enrollment ID 20 for student \'Youssef\' in course(s) [English for Business, Advanced English Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 20', '2025-05-14 15:40:31.000000', 'EMAIL'),
(64, 'Enrollment ID 21 for student \'Zainab\' in course(s) [Beginner Spanish, Intermediate French, Korean for Travelers] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 21', '2025-05-14 15:41:02.000000', 'EMAIL'),
(65, 'Enrollment ID 21 was updated by Ahmad: completed false → true', 1, 'Ahmad', 'Enrollment updated: ID 21', '2025-05-14 15:41:47.000000', 'EMAIL'),
(66, 'Enrollment ID 21 was updated by Ahmad: completed true → false', 1, 'Ahmad', 'Enrollment updated: ID 21', '2025-05-14 15:42:29.000000', 'EMAIL'),
(67, 'Course \'French Intensive Workshop\' (ID: 12) was just created by Ahmad.', 1, 'Ahmad', 'New course: French Intensive Workshop', '2025-05-14 16:05:49.000000', 'EMAIL'),
(68, 'Course \'Arabic for Beginners\' (ID: 13) was just created by Ahmad.', 1, 'Ahmad', 'New course: Arabic for Beginners', '2025-05-14 16:06:02.000000', 'EMAIL'),
(69, 'Course \'English Conversation Skills\' (ID: 14) was just created by Ahmad.', 1, 'Ahmad', 'New course: English Conversation Skills', '2025-05-14 16:06:16.000000', 'EMAIL'),
(70, 'Course \'Spanish Grammar Mastery\' (ID: 15) was just created by Ahmad.', 1, 'Ahmad', 'New course: Spanish Grammar Mastery', '2025-05-14 16:06:30.000000', 'EMAIL'),
(71, 'Course \'German Reading & Writing\' (ID: 16) was just created by Ahmad.', 1, 'Ahmad', 'New course: German Reading & Writing', '2025-05-14 16:06:42.000000', 'EMAIL'),
(72, 'Course \'Korean Business Language\' (ID: 17) was just created by Ahmad.', 1, 'Ahmad', 'New course: Korean Business Language', '2025-05-14 16:07:01.000000', 'EMAIL'),
(73, 'Course \'French Culture & Society\' (ID: 18) was just created by Ahmad.', 1, 'Ahmad', 'New course: French Culture & Society', '2025-05-14 16:07:15.000000', 'EMAIL'),
(74, 'Course \'Arabic Advanced Literature\' (ID: 19) was just created by Ahmad.', 1, 'Ahmad', 'New course: Arabic Advanced Literature', '2025-05-14 16:07:26.000000', 'EMAIL'),
(75, 'Course \'English Academic Writing\' (ID: 20) was just created by Ahmad.', 1, 'Ahmad', 'New course: English Academic Writing', '2025-05-14 16:07:43.000000', 'EMAIL'),
(76, 'Course \'Spanish Conversation Practice\' (ID: 21) was just created by Ahmad.', 1, 'Ahmad', 'New course: Spanish Conversation Practice', '2025-05-14 16:07:54.000000', 'EMAIL'),
(77, 'Course \'German for Beginners\' (ID: 22) was just created by Ahmad.', 1, 'Ahmad', 'New course: German for Beginners', '2025-05-14 16:08:07.000000', 'EMAIL'),
(78, 'Course \'Korean Intermediate\' (ID: 23) was just created by Ahmad.', 1, 'Ahmad', 'New course: Korean Intermediate', '2025-05-14 16:08:20.000000', 'EMAIL'),
(79, 'Course \'French Conversational Course\' (ID: 24) was just created by Ahmad.', 1, 'Ahmad', 'New course: French Conversational Course', '2025-05-14 16:08:32.000000', 'EMAIL'),
(80, 'Course \'Arabic Business Communication\' (ID: 25) was just created by Ahmad.', 1, 'Ahmad', 'New course: Arabic Business Communication', '2025-05-14 16:08:48.000000', 'EMAIL'),
(81, 'Course \'English Literature Review\' (ID: 26) was just created by Ahmad.', 1, 'Ahmad', 'New course: English Literature Review', '2025-05-14 16:08:58.000000', 'EMAIL'),
(82, 'Course \'Spanish Writing Skills\' (ID: 27) was just created by Ahmad.', 1, 'Ahmad', 'New course: Spanish Writing Skills', '2025-05-14 16:09:11.000000', 'EMAIL'),
(83, 'Course \'German Advanced Conversation\' (ID: 28) was just created by Ahmad.', 1, 'Ahmad', 'New course: German Advanced Conversation', '2025-05-14 16:09:23.000000', 'EMAIL'),
(84, 'Course \'Korean for Travel\' (ID: 29) was just created by Ahmad.', 1, 'Ahmad', 'New course: Korean for Travel', '2025-05-14 16:09:35.000000', 'EMAIL'),
(85, 'Course \'French Pronunciation Workshop\' (ID: 30) was just created by Ahmad.', 1, 'Ahmad', 'New course: French Pronunciation Workshop', '2025-05-14 16:09:48.000000', 'EMAIL'),
(86, 'Course \'Arabic Poetry Recital\' (ID: 31) was just created by Ahmad.', 1, 'Ahmad', 'New course: Arabic Poetry Recital', '2025-05-14 16:10:01.000000', 'EMAIL'),
(87, 'Enrollment ID 22 for student \'Sarah\' in course(s) [German for Beginners, German Advanced Conversation, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 22', '2025-05-14 16:46:52.000000', 'EMAIL'),
(88, 'Enrollment ID 23 for student \'Mohammed\' in course(s) [Korean Intermediate, Arabic Business Communication] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 23', '2025-05-14 16:47:14.000000', 'EMAIL'),
(89, 'Enrollment ID 24 for student \'Basma\' in course(s) [French Conversational Course, German Advanced Conversation] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 24', '2025-05-14 16:49:54.000000', 'EMAIL'),
(90, 'Enrollment ID 25 for student \'Basma\' in course(s) [French Conversational Course, German Advanced Conversation] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 25', '2025-05-14 16:49:54.000000', 'EMAIL'),
(91, 'Enrollment ID 26 for student \'Cara\' in course(s) [Arabic Business Communication, English Literature Review] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 26', '2025-05-14 16:51:09.000000', 'EMAIL'),
(92, 'Enrollment ID 27 for student \'Dana\' in course(s) [English Literature Review, French Pronunciation Workshop] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 27', '2025-05-14 16:51:23.000000', 'EMAIL'),
(93, 'Enrollment ID 28 for student \'Elie\' in course(s) [Spanish Writing Skills, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 28', '2025-05-14 16:51:39.000000', 'EMAIL'),
(94, 'Enrollment ID 29 for student \'Katie\' in course(s) [German Advanced Conversation, French Pronunciation Workshop] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 29', '2025-05-14 16:51:49.000000', 'EMAIL'),
(95, 'Enrollment ID 30 for student \'Ghassan\' in course(s) [Korean for Travel, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 30', '2025-05-14 16:52:02.000000', 'EMAIL'),
(96, 'Enrollment ID 31 for student \'Hana\' in course(s) [French Pronunciation Workshop, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 31', '2025-05-14 16:52:13.000000', 'EMAIL'),
(97, 'Enrollment ID 32 for student \'Ibrahim\' in course(s) [Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 32', '2025-05-14 16:52:25.000000', 'EMAIL'),
(98, 'Enrollment ID 33 for student \'Jana\' in course(s) [German for Beginners, German Advanced Conversation, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 33', '2025-05-14 16:59:45.000000', 'EMAIL'),
(99, 'Enrollment ID 34 for student \'Khaled\' in course(s) [Korean Intermediate, Arabic Business Communication] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 34', '2025-05-14 17:02:18.000000', 'EMAIL'),
(100, 'Enrollment ID 35 for student \'Layla\' in course(s) [French Conversational Course, German Advanced Conversation] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 35', '2025-05-14 17:02:35.000000', 'EMAIL'),
(101, 'Enrollment ID 36 for student \'Martin\' in course(s) [Arabic Business Communication, English Literature Review] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 36', '2025-05-14 17:02:48.000000', 'EMAIL'),
(102, 'Enrollment ID 37 for student \'Nawal\' in course(s) [English Literature Review, French Pronunciation Workshop] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 37', '2025-05-14 17:03:04.000000', 'EMAIL'),
(103, 'Enrollment ID 38 for student \'Omar\' in course(s) [Spanish Writing Skills, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 38', '2025-05-14 17:03:42.000000', 'EMAIL'),
(104, 'Enrollment ID 39 for student \'Rania\' in course(s) [German Advanced Conversation, French Pronunciation Workshop] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 39', '2025-05-14 17:03:47.000000', 'EMAIL'),
(105, 'Enrollment ID 40 for student \'Samir\' in course(s) [Korean for Travel, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 40', '2025-05-14 17:03:52.000000', 'EMAIL'),
(106, 'Enrollment ID 41 for student \'Hala\' in course(s) [French Pronunciation Workshop, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 41', '2025-05-14 17:03:56.000000', 'EMAIL'),
(107, 'Enrollment ID 42 for student \'Youssef\' in course(s) [Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 42', '2025-05-14 17:04:02.000000', 'EMAIL'),
(108, 'Enrollment ID 43 for student \'Zainab\' in course(s) [German for Beginners, German Advanced Conversation, Arabic Poetry Recital] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 43', '2025-05-14 17:04:06.000000', 'EMAIL'),
(109, 'Enrollment ID 44 for student \'Sarah\' in course(s) [French Intensive Workshop, German Reading & Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 44', '2025-05-14 17:11:10.000000', 'EMAIL'),
(110, 'Enrollment ID 45 for student \'Mohammed\' in course(s) [Arabic for Beginners] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 45', '2025-05-14 17:11:23.000000', 'EMAIL'),
(111, 'Enrollment ID 46 for student \'Basma\' in course(s) [French Intensive Workshop, English Conversation Skills, Spanish Grammar Mastery] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 46', '2025-05-14 17:11:37.000000', 'EMAIL'),
(112, 'Enrollment ID 47 for student \'Cara\' in course(s) [German Reading & Writing, Korean Business Language] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 47', '2025-05-14 17:14:12.000000', 'EMAIL'),
(113, 'Enrollment ID 48 for student \'Dana\' in course(s) [Arabic for Beginners, French Reading and Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 48', '2025-05-14 17:14:19.000000', 'EMAIL'),
(114, 'Enrollment ID 49 for student \'Elie\' in course(s) [English Conversation Skills] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 49', '2025-05-14 17:14:28.000000', 'EMAIL'),
(115, 'Enrollment ID 50 for student \'Katie\' in course(s) [Arabic Advanced Literature] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 50', '2025-05-14 17:14:37.000000', 'EMAIL'),
(116, 'Enrollment ID 51 for student \'Ghassan\' in course(s) [French Reading and Writing, English Academic Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 51', '2025-05-14 17:14:55.000000', 'EMAIL'),
(117, 'Enrollment ID 52 for student \'Hana\' in course(s) [English Academic Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 52', '2025-05-14 17:15:05.000000', 'EMAIL'),
(118, 'Enrollment ID 53 for student \'Ibrahim\' in course(s) [Spanish Conversation Practice] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 53', '2025-05-14 17:15:17.000000', 'EMAIL'),
(119, 'Enrollment ID 54 for student \'Jana\' in course(s) [French Intensive Workshop, Arabic for Beginners] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 54', '2025-05-14 17:15:25.000000', 'EMAIL'),
(120, 'Enrollment ID 55 for student \'Khaled\' in course(s) [French Reading and Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 55', '2025-05-14 17:15:29.000000', 'EMAIL'),
(121, 'Enrollment ID 56 for student \'Layla\' in course(s) [English Conversation Skills, Arabic Advanced Literature] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 56', '2025-05-14 17:15:34.000000', 'EMAIL'),
(122, 'Enrollment ID 57 for student \'Martin\' in course(s) [Spanish Grammar Mastery, German Reading & Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 57', '2025-05-14 17:15:54.000000', 'EMAIL'),
(123, 'Enrollment ID 58 for student \'Nawal\' in course(s) [French Intensive Workshop, Korean Business Language] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 58', '2025-05-14 17:15:59.000000', 'EMAIL'),
(124, 'Enrollment ID 59 for student \'Omar\' in course(s) [Arabic for Beginners, Arabic Advanced Literature] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 59', '2025-05-14 17:16:04.000000', 'EMAIL'),
(125, 'Enrollment ID 60 for student \'Rania\' in course(s) [Spanish Conversation Practice] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 60', '2025-05-14 17:16:08.000000', 'EMAIL'),
(126, 'Enrollment ID 61 for student \'Samir\' in course(s) [English Conversation Skills, English Academic Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 61', '2025-05-14 17:16:14.000000', 'EMAIL'),
(127, 'Enrollment ID 62 for student \'Hala\' in course(s) [Arabic Advanced Literature] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 62', '2025-05-14 17:16:18.000000', 'EMAIL'),
(128, 'Enrollment ID 63 for student \'Youssef\' in course(s) [German Reading & Writing, Spanish Conversation Practice] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 63', '2025-05-14 17:16:23.000000', 'EMAIL'),
(129, 'Enrollment ID 64 for student \'Zainab\' in course(s) [French Intensive Workshop, Spanish Grammar Mastery, English Academic Writing] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 64', '2025-05-14 17:16:28.000000', 'EMAIL'),
(130, 'Enrollment ID 65 for student \'Sarah\' in course(s) [Beginner French] was created by Ahmad', 1, 'Ahmad', 'New enrollment: ID 65', '2025-05-22 12:46:20.000000', 'EMAIL'),
(131, 'User \'Sarah\' (ID: 2) updated their profile.', 1, 'Ahmad', 'Profile updated: Sarah', '2025-05-22 13:00:34.000000', 'EMAIL'),
(132, 'Hello,\n\nNew content titled \'Numbers in French\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Basma', 'New Content Uploaded in Beginner French', '2025-05-22 21:27:07.000000', 'EMAIL'),
(133, 'Hello,\n\nNew content titled \'Numbers in French\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Elie', 'New Content Uploaded in Beginner French', '2025-05-22 21:27:07.000000', 'EMAIL'),
(134, 'Hello,\n\nNew content titled \'Numbers in French\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Layla', 'New Content Uploaded in Beginner French', '2025-05-22 21:27:07.000000', 'EMAIL'),
(135, 'Hello,\n\nNew content titled \'Numbers in French\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Samir', 'New Content Uploaded in Beginner French', '2025-05-22 21:27:07.000000', 'EMAIL'),
(136, 'Hello,\n\nNew content titled \'Numbers in French\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 1, 'Sarah', 'New Content Uploaded in Beginner French', '2025-05-22 21:27:07.000000', 'EMAIL'),
(137, 'User \'Elora\' (ID: 28) updated their profile.', 1, 'Ahmad', 'Profile updated: Elora', '2025-05-23 10:42:19.000000', 'EMAIL'),
(138, 'Course \'Beginner French\' (ID: 3) was updated by Ahmad.', 1, 'Ahmad', 'Course updated: Beginner French', '2025-05-23 12:53:53.000000', 'EMAIL'),
(139, 'User \'Elora\' (ID: 28) updated their profile.', 1, 'Ahmad', 'Profile updated: Elora', '2025-05-23 13:54:55.000000', 'EMAIL'),
(140, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Basma', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(141, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Elie', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(142, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Layla', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(143, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Samir', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(144, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 1, 'Sarah', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(145, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Basma', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(146, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Elie', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(147, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Layla', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(148, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 0, 'Samir', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(149, 'Hello,\n\nNew content titled \'grhgr\' has been uploaded to your course Beginner French. Please log in to the LMS to view it.\n\nBest regards,\nLMS Team', 1, 'Sarah', 'New Content Uploaded in Beginner French', '2025-05-23 13:57:43.000000', 'EMAIL'),
(150, 'User (ID: 23) was updated by Ahmad: role \'INSTRUCTOR\' → \'STUDENT\'', 1, 'Ahmad', 'User updated: ID 23', '2025-05-23 13:58:21.000000', 'EMAIL'),
(151, 'User (ID: 23) was updated by Ahmad: role \'STUDENT\' → \'INSTRUCTOR\'', 1, 'Ahmad', 'User updated: ID 23', '2025-05-23 13:58:24.000000', 'EMAIL'),
(152, 'User \'Elora\' (ID: 28) updated their profile.', 0, 'Ahmad', 'Profile updated: Elora', '2025-05-23 14:04:31.000000', 'EMAIL'),
(153, 'User \'Ahmad\' (ID: 1) updated their profile.', 0, 'Ahmad', 'Profile updated: Ahmad', '2025-05-23 14:12:57.000000', 'EMAIL'),
(154, 'User \'Ahmad\' (ID: 1) updated their profile.', 0, 'Ahmad', 'Profile updated: Ahmad', '2025-05-23 14:13:09.000000', 'EMAIL'),
(155, 'User \'Elora\' (ID: 28) updated their profile.', 0, 'Ahmad', 'Profile updated: Elora', '2025-05-23 14:16:20.000000', 'EMAIL'),
(156, 'User \'Kareem\' (ID:29) registered with role ADMIN.', 0, 'Ahmad', 'New user: Kareem', '2025-05-23 14:57:19.000000', 'EMAIL'),
(157, 'User \'Kareem\' (ID:29) registered with role ADMIN.', 0, 'Kareem', 'New user: Kareem', '2025-05-23 14:57:19.000000', 'EMAIL');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` bigint(20) NOT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `question_type` enum('DRAG_AND_DROP','ESSAY','FILL_IN_THE_BLANK','IMAGE_PATTERN_RECOGNITION','MATCH_THE_PATTERNS','MULTIPLE_CHOICE_MULTIPLE','MULTIPLE_CHOICE_SINGLE','PATTERN_RECOGNITION','TRUE_FALSE') DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `quiz_id` bigint(20) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `correct_answer`, `question_type`, `text`, `quiz_id`, `weight`) VALUES
(1, 'Vingt', 'MULTIPLE_CHOICE_SINGLE', 'How do we spell this number in French \"20\"?', 1, 1),
(2, 'Trente', 'MULTIPLE_CHOICE_SINGLE', 'How do you spell this number in French \"30\"?', 1, 1),
(3, 'True', 'TRUE_FALSE', 'This number \"100\" is Cent?', 1, 1),
(4, 'False', 'TRUE_FALSE', 'This number \"7\" is Vingt?', 1, 1),
(5, 'Deux cent duex', 'ESSAY', 'What is this number 202?', 1, 6),
(7, 'True', 'TRUE_FALSE', 'rghght', 3, 4),
(8, 'True', 'TRUE_FALSE', 'rghgbfv', 4, 4),
(9, '3', 'MULTIPLE_CHOICE_SINGLE', 'dfvbd', 4, 15),
(10, '2,3', 'MULTIPLE_CHOICE_MULTIPLE', 'esdcsvc', 4, 31),
(11, 'N/A - Essay Question', 'ESSAY', 'dfgwescv', 4, 1),
(12, 'True', 'TRUE_FALSE', '1+1=2', 5, 2),
(13, '2', 'MULTIPLE_CHOICE_SINGLE', '1+1=2', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `question_id` bigint(20) NOT NULL,
  `options` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_options`
--

INSERT INTO `question_options` (`question_id`, `options`) VALUES
(1, 'Seize'),
(1, 'Dix'),
(1, 'Vingt'),
(1, 'Trente'),
(2, 'Un'),
(2, 'Cent'),
(2, 'Deux'),
(2, 'Trente'),
(3, 'True'),
(3, 'False'),
(4, 'True'),
(4, 'False'),
(5, 'Deux cent duex'),
(5, 'Cent deux'),
(1, 'Seize'),
(1, 'Dix'),
(1, 'Vingt'),
(1, 'Trente'),
(2, 'Un'),
(2, 'Cent'),
(2, 'Deux'),
(2, 'Trente'),
(3, 'True'),
(3, 'False'),
(4, 'True'),
(4, 'False'),
(5, 'Deux cent duex'),
(5, 'Cent deux'),
(7, 'صح'),
(7, 'خطأ'),
(8, 'True'),
(8, 'False'),
(9, '2'),
(9, '1'),
(9, '3'),
(10, '1'),
(10, '2'),
(10, '3'),
(10, '4'),
(12, 'True'),
(12, 'False'),
(13, '1'),
(13, '2'),
(13, '3'),
(13, '4');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `navigation_mode` enum('FREE','LINEAR') NOT NULL,
  `page_size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `title`, `course_id`, `navigation_mode`, `page_size`) VALUES
(1, 'French Numbers', 3, 'FREE', 2),
(3, '6u5ty5h', 3, 'FREE', 2),
(4, 'ksh', 3, 'FREE', 2),
(5, 'QUIZ 1', 3, 'FREE', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` bigint(20) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `grade`, `hobbies`, `user_id`) VALUES
(1, 'A', 'Reading, Painting', 2),
(2, 'B+', 'Soccer, Gaming', 3),
(3, 'B', 'Cooking, Traveling', 4),
(4, 'A', 'Music, Dancing', 5),
(5, 'C+', 'Photography, Hiking', 6),
(6, 'A', 'Programming, Chess', 7),
(7, 'B', 'Yoga, Writing', 8),
(8, 'C', 'Gaming, Basketball', 9),
(9, 'C', 'Running, Swimming', 10),
(10, 'D+', 'Swimming, Reading', 11),
(11, 'B', 'Traveling, Singing', 12),
(12, 'D', 'Fishing, Gaming', 13),
(13, 'B+', 'Dancing, Yoga', 14),
(14, 'A', 'Cycling, Photography', 15),
(15, 'C+', 'Gardening, Reading', 16),
(16, 'C', 'Soccer, Cooking', 17),
(17, 'A', 'Writing, Music', 18),
(18, 'A', 'Programming, Writing', 19),
(19, 'B', 'Running, Drawing', 20),
(20, 'C+', 'Photography, Traveling', 21),
(21, 'A', 'Painting, Swimming', 22);

-- --------------------------------------------------------

--
-- Table structure for table `student_course`
--

CREATE TABLE `student_course` (
  `student_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_course`
--

INSERT INTO `student_course` (`student_id`, `course_id`) VALUES
(2, 2),
(2, 22),
(2, 24),
(2, 12),
(3, 1),
(3, 3),
(3, 4),
(3, 23),
(3, 27),
(3, 11),
(3, 13),
(3, 14),
(4, 5),
(4, 6),
(4, 24),
(4, 25),
(4, 15),
(4, 16),
(5, 2),
(5, 7),
(5, 25),
(5, 29),
(5, 12),
(5, 17),
(6, 3),
(6, 26),
(6, 30),
(6, 13),
(7, 8),
(7, 27),
(7, 29),
(7, 18),
(8, 7),
(8, 9),
(8, 28),
(8, 30),
(8, 17),
(8, 19),
(9, 9),
(9, 29),
(9, 30),
(9, 19),
(10, 10),
(10, 30),
(10, 20),
(11, 1),
(11, 2),
(11, 21),
(11, 27),
(11, 30),
(11, 11),
(11, 12),
(12, 7),
(12, 22),
(12, 24),
(12, 17),
(13, 8),
(13, 3),
(13, 23),
(13, 27),
(13, 18),
(13, 13),
(14, 4),
(14, 5),
(14, 24),
(14, 25),
(14, 14),
(14, 15),
(15, 1),
(15, 6),
(15, 25),
(15, 29),
(15, 11),
(15, 16),
(16, 2),
(16, 8),
(16, 26),
(16, 30),
(16, 12),
(16, 18),
(17, 10),
(17, 27),
(17, 29),
(17, 20),
(18, 3),
(18, 9),
(18, 28),
(18, 30),
(18, 13),
(18, 19),
(19, 8),
(19, 29),
(19, 30),
(19, 18),
(20, 10),
(20, 5),
(20, 30),
(20, 20),
(20, 15),
(21, 1),
(21, 4),
(21, 9),
(21, 21),
(21, 27),
(21, 30),
(21, 11),
(21, 14),
(21, 19),
(1, 1),
(1, 5),
(1, 21),
(1, 27),
(1, 30),
(1, 11),
(1, 15),
(1, 3),
(2, 2),
(2, 22),
(2, 24),
(2, 12),
(3, 1),
(3, 3),
(3, 4),
(3, 23),
(3, 27),
(3, 11),
(3, 13),
(3, 14),
(4, 5),
(4, 6),
(4, 24),
(4, 25),
(4, 15),
(4, 16),
(5, 2),
(5, 7),
(5, 25),
(5, 29),
(5, 12),
(5, 17),
(6, 3),
(6, 26),
(6, 30),
(6, 13),
(7, 8),
(7, 27),
(7, 29),
(7, 18),
(8, 7),
(8, 9),
(8, 28),
(8, 30),
(8, 17),
(8, 19),
(9, 9),
(9, 29),
(9, 30),
(9, 19),
(10, 10),
(10, 30),
(10, 20),
(11, 1),
(11, 2),
(11, 21),
(11, 27),
(11, 30),
(11, 11),
(11, 12),
(12, 7),
(12, 22),
(12, 24),
(12, 17),
(13, 8),
(13, 3),
(13, 23),
(13, 27),
(13, 18),
(13, 13),
(14, 4),
(14, 5),
(14, 24),
(14, 25),
(14, 14),
(14, 15),
(15, 1),
(15, 6),
(15, 25),
(15, 29),
(15, 11),
(15, 16),
(16, 2),
(16, 8),
(16, 26),
(16, 30),
(16, 12),
(16, 18),
(17, 10),
(17, 27),
(17, 29),
(17, 20),
(18, 3),
(18, 9),
(18, 28),
(18, 30),
(18, 13),
(18, 19),
(19, 8),
(19, 29),
(19, 30),
(19, 18),
(20, 10),
(20, 5),
(20, 30),
(20, 20),
(20, 15),
(21, 1),
(21, 4),
(21, 9),
(21, 21),
(21, 27),
(21, 30),
(21, 11),
(21, 14),
(21, 19),
(1, 1),
(1, 5),
(1, 21),
(1, 27),
(1, 30),
(1, 11),
(1, 15),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `id` bigint(20) NOT NULL,
  `graded` tinyint(1) NOT NULL DEFAULT 0,
  `quiz_id` bigint(20) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `submission_date` datetime(6) NOT NULL,
  `assignment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submission`
--

INSERT INTO `submission` (`id`, `graded`, `quiz_id`, `score`, `student_id`, `submission_date`, `assignment_id`) VALUES
(1, 0, 3, 4, 1, '2025-05-23 13:31:10.000000', NULL),
(2, 0, 4, 35, 1, '2025-05-23 13:37:39.000000', NULL),
(3, 0, 5, 2, 1, '2025-05-23 15:09:12.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `submission_answers`
--

CREATE TABLE `submission_answers` (
  `submission_id` bigint(20) NOT NULL,
  `answers` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submission_answers`
--

INSERT INTO `submission_answers` (`submission_id`, `answers`) VALUES
(1, 'True'),
(2, 'True'),
(2, '1'),
(2, '2,3'),
(2, 'rgf'),
(3, 'True'),
(3, '1');

-- --------------------------------------------------------

--
-- Table structure for table `system_activity`
--

CREATE TABLE `system_activity` (
  `id` bigint(20) NOT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_activity`
--

INSERT INTO `system_activity` (`id`, `message`, `timestamp`, `type`) VALUES
(1, 'User \'Ahmad\' (ID:1) registered with role ADMIN by self-registration', '2025-05-13 21:09:34.000000', 'USER_CREATED'),
(2, 'User \'Sarah\' (ID:2) registered with role STUDENT by self-registration', '2025-05-14 09:43:32.000000', 'USER_CREATED'),
(3, 'User \'Mohammed\' (ID:3) registered with role STUDENT by self-registration', '2025-05-14 09:51:20.000000', 'USER_CREATED'),
(4, 'User \'Basma\' (ID:4) registered with role STUDENT by self-registration', '2025-05-14 09:55:04.000000', 'USER_CREATED'),
(5, 'User \'Cara\' (ID:5) registered with role STUDENT by self-registration', '2025-05-14 09:55:35.000000', 'USER_CREATED'),
(6, 'User \'Dana\' (ID:6) registered with role STUDENT by self-registration', '2025-05-14 09:56:02.000000', 'USER_CREATED'),
(7, 'User \'Elie\' (ID:7) registered with role STUDENT by self-registration', '2025-05-14 09:56:14.000000', 'USER_CREATED'),
(8, 'User \'Katie\' (ID:8) registered with role STUDENT by self-registration', '2025-05-14 09:56:26.000000', 'USER_CREATED'),
(9, 'User \'Ghassan\' (ID:9) registered with role STUDENT by self-registration', '2025-05-14 09:56:38.000000', 'USER_CREATED'),
(10, 'User \'Hana\' (ID:10) registered with role STUDENT by self-registration', '2025-05-14 09:56:48.000000', 'USER_CREATED'),
(11, 'User \'Ibrahim\' (ID:11) registered with role STUDENT by self-registration', '2025-05-14 09:56:58.000000', 'USER_CREATED'),
(12, 'User \'Jana\' (ID:12) registered with role STUDENT by self-registration', '2025-05-14 09:57:13.000000', 'USER_CREATED'),
(13, 'User \'Khaled\' (ID:13) registered with role STUDENT by self-registration', '2025-05-14 09:57:26.000000', 'USER_CREATED'),
(14, 'User \'Layla\' (ID:14) registered with role STUDENT by self-registration', '2025-05-14 09:57:37.000000', 'USER_CREATED'),
(15, 'User \'Martin\' (ID:15) registered with role STUDENT by self-registration', '2025-05-14 09:57:52.000000', 'USER_CREATED'),
(16, 'User \'Nawal\' (ID:16) registered with role STUDENT by self-registration', '2025-05-14 09:58:03.000000', 'USER_CREATED'),
(17, 'User \'Omar\' (ID:17) registered with role STUDENT by self-registration', '2025-05-14 09:58:20.000000', 'USER_CREATED'),
(18, 'User \'Rania\' (ID:18) registered with role STUDENT by self-registration', '2025-05-14 09:58:30.000000', 'USER_CREATED'),
(19, 'User \'Samir\' (ID:19) registered with role STUDENT by self-registration', '2025-05-14 09:58:40.000000', 'USER_CREATED'),
(20, 'User \'Hala\' (ID:20) registered with role STUDENT by self-registration', '2025-05-14 09:58:59.000000', 'USER_CREATED'),
(21, 'User \'Youssef\' (ID:21) registered with role STUDENT by self-registration', '2025-05-14 09:59:08.000000', 'USER_CREATED'),
(22, 'User \'Zainab\' (ID:22) registered with role STUDENT by self-registration', '2025-05-14 09:59:18.000000', 'USER_CREATED'),
(23, 'User \'Aisha\' (ID:23) registered with role INSTRUCTOR by self-registration', '2025-05-14 10:01:48.000000', 'USER_CREATED'),
(24, 'User \'Bilal\' (ID:24) registered with role INSTRUCTOR by self-registration', '2025-05-14 10:01:59.000000', 'USER_CREATED'),
(25, 'User \'Carine\' (ID:25) registered with role INSTRUCTOR by self-registration', '2025-05-14 10:02:08.000000', 'USER_CREATED'),
(26, 'User \'Diaa\' (ID:26) registered with role INSTRUCTOR by self-registration', '2025-05-14 10:02:19.000000', 'USER_CREATED'),
(27, 'User \'Ehab\' (ID:27) registered with role INSTRUCTOR by self-registration', '2025-05-14 10:03:19.000000', 'USER_CREATED'),
(28, 'User (ID: 22) updated by Ahmad: role \'STUDENT\' → \'INSTRUCTOR\', password changed', '2025-05-14 10:37:00.000000', 'USER_UPDATED'),
(29, 'User (ID: 1) updated by Ahmad: password changed', '2025-05-14 10:38:28.000000', 'USER_UPDATED'),
(30, 'User \'Elora\' (ID:28) registered with role INSTRUCTOR by Ahmad', '2025-05-14 10:41:44.000000', 'USER_CREATED'),
(31, 'Course \'Beginner Spanish\' (ID: 1) was created by Ahmad', '2025-05-14 11:08:10.000000', 'COURSE_CREATED'),
(32, 'Course \'Beginner Spanish\' (ID: 1) was deleted by Ahmad', '2025-05-14 11:10:14.000000', 'COURSE_DELETED'),
(33, 'Course \'Beginner Spanish\' (ID: 2) was created by Ahmad', '2025-05-14 11:11:45.000000', 'COURSE_CREATED'),
(34, 'Course \'Intermediate Spanish\' (ID: 3) was created by Ahmad', '2025-05-14 11:14:04.000000', 'COURSE_CREATED'),
(35, 'Course \'Beginner French\' (ID: 4) was created by Ahmad', '2025-05-14 11:17:20.000000', 'COURSE_CREATED'),
(36, 'Course \'Intermediate French\' (ID: 5) was created by Ahmad', '2025-05-14 11:20:08.000000', 'COURSE_CREATED'),
(37, 'Course \'English for Business\' (ID: 6) was created by Ahmad', '2025-05-14 11:20:59.000000', 'COURSE_CREATED'),
(38, 'Course \'English Grammar Fundamentals\' (ID: 7) was created by Ahmad', '2025-05-14 11:22:41.000000', 'COURSE_CREATED'),
(39, 'Course \'Arabic for Heritage Speakers\' (ID: 8) was created by Ahmad', '2025-05-14 11:23:26.000000', 'COURSE_CREATED'),
(40, 'Course \'German Basics\' (ID: 9) was created by Ahmad', '2025-05-14 11:24:19.000000', 'COURSE_CREATED'),
(41, 'Course \'Korean for Travelers\' (ID: 10) was created by Ahmad', '2025-05-14 11:25:04.000000', 'COURSE_CREATED'),
(42, 'Course \'Advanced English Writing\' (ID: 11) was created by Ahmad', '2025-05-14 11:26:00.000000', 'COURSE_CREATED'),
(43, 'User (ID: 22) updated by Ahmad: role \'INSTRUCTOR\' → \'STUDENT\', password changed', '2025-05-14 11:36:06.000000', 'USER_UPDATED'),
(44, 'Enrollment ID 1 created for student \'Sarah\' in course(s) [Beginner Spanish, English for Business] by Ahmad', '2025-05-14 12:27:42.000000', 'ENROLLMENT_CREATED'),
(45, 'Enrollment ID 2 created for student \'Mohammed\' in course(s) [Intermediate Spanish] by Ahmad', '2025-05-14 12:29:54.000000', 'ENROLLMENT_CREATED'),
(46, 'Enrollment ID 3 created for student \'Basma\' in course(s) [Beginner Spanish, Beginner French, Intermediate French] by Ahmad', '2025-05-14 12:30:18.000000', 'ENROLLMENT_CREATED'),
(47, 'Enrollment ID 4 created for student \'Cara\' in course(s) [English for Business, English Grammar Fundamentals] by Ahmad', '2025-05-14 12:30:40.000000', 'ENROLLMENT_CREATED'),
(48, 'Enrollment ID 5 created for student \'Dana\' in course(s) [Intermediate Spanish, Arabic for Heritage Speakers] by Ahmad', '2025-05-14 12:31:25.000000', 'ENROLLMENT_CREATED'),
(49, 'Enrollment ID 6 created for student \'Elie\' in course(s) [Beginner French] by Ahmad', '2025-05-14 12:32:00.000000', 'ENROLLMENT_CREATED'),
(50, 'Enrollment ID 7 created for student \'Katie\' in course(s) [German Basics] by Ahmad', '2025-05-14 12:32:34.000000', 'ENROLLMENT_CREATED'),
(51, 'Enrollment ID 8 created for student \'Ghassan\' in course(s) [Arabic for Heritage Speakers, Korean for Travelers] by Ahmad', '2025-05-14 12:33:02.000000', 'ENROLLMENT_CREATED'),
(52, 'Enrollment ID 9 created for student \'Hana\' in course(s) [Korean for Travelers] by Ahmad', '2025-05-14 12:34:40.000000', 'ENROLLMENT_CREATED'),
(53, 'Enrollment ID 10 created for student \'Ibrahim\' in course(s) [Advanced English Writing] by Ahmad', '2025-05-14 12:35:11.000000', 'ENROLLMENT_CREATED'),
(54, 'Enrollment ID 11 created for student \'Jana\' in course(s) [Beginner Spanish, Intermediate Spanish] by Ahmad', '2025-05-14 12:35:57.000000', 'ENROLLMENT_CREATED'),
(55, 'Enrollment ID 12 created for student \'Khaled\' in course(s) [Arabic for Heritage Speakers] by Ahmad', '2025-05-14 12:36:23.000000', 'ENROLLMENT_CREATED'),
(56, 'Enrollment ID 13 created for student \'Layla\' in course(s) [Beginner French, German Basics] by Ahmad', '2025-05-14 12:37:01.000000', 'ENROLLMENT_CREATED'),
(57, 'Enrollment ID 14 created for student \'Martin\' in course(s) [Intermediate French, English for Business] by Ahmad', '2025-05-14 12:37:29.000000', 'ENROLLMENT_CREATED'),
(58, 'Enrollment ID 15 created for student \'Nawal\' in course(s) [Beginner Spanish, English Grammar Fundamentals] by Ahmad', '2025-05-14 12:38:04.000000', 'ENROLLMENT_CREATED'),
(59, 'Enrollment ID 16 created for student \'Omar\' in course(s) [Intermediate Spanish, German Basics] by Ahmad', '2025-05-14 12:38:34.000000', 'ENROLLMENT_CREATED'),
(60, 'Enrollment ID 17 created for student \'Rania\' in course(s) [Advanced English Writing] by Ahmad', '2025-05-14 12:39:13.000000', 'ENROLLMENT_CREATED'),
(61, 'Enrollment ID 18 created for student \'Samir\' in course(s) [Beginner French, Korean for Travelers] by Ahmad', '2025-05-14 12:39:43.000000', 'ENROLLMENT_CREATED'),
(62, 'Enrollment ID 19 created for student \'Hala\' in course(s) [German Basics] by Ahmad', '2025-05-14 12:40:09.000000', 'ENROLLMENT_CREATED'),
(63, 'Enrollment ID 20 created for student \'Youssef\' in course(s) [English for Business, Advanced English Writing] by Ahmad', '2025-05-14 12:40:30.000000', 'ENROLLMENT_CREATED'),
(64, 'Enrollment ID 21 created for student \'Zainab\' in course(s) [Beginner Spanish, Intermediate French, Korean for Travelers] by Ahmad', '2025-05-14 12:41:02.000000', 'ENROLLMENT_CREATED'),
(65, 'Enrollment (ID: 21) updated by Ahmad: completed false → true', '2025-05-14 12:41:47.000000', 'ENROLLMENT_UPDATED'),
(66, 'Enrollment (ID: 21) updated by Ahmad: completed true → false', '2025-05-14 12:42:29.000000', 'ENROLLMENT_UPDATED'),
(67, 'Course \'French Intensive Workshop\' (ID: 12) was created by Ahmad', '2025-05-14 13:05:49.000000', 'COURSE_CREATED'),
(68, 'Course \'Arabic for Beginners\' (ID: 13) was created by Ahmad', '2025-05-14 13:06:02.000000', 'COURSE_CREATED'),
(69, 'Course \'English Conversation Skills\' (ID: 14) was created by Ahmad', '2025-05-14 13:06:16.000000', 'COURSE_CREATED'),
(70, 'Course \'Spanish Grammar Mastery\' (ID: 15) was created by Ahmad', '2025-05-14 13:06:30.000000', 'COURSE_CREATED'),
(71, 'Course \'German Reading & Writing\' (ID: 16) was created by Ahmad', '2025-05-14 13:06:42.000000', 'COURSE_CREATED'),
(72, 'Course \'Korean Business Language\' (ID: 17) was created by Ahmad', '2025-05-14 13:07:01.000000', 'COURSE_CREATED'),
(73, 'Course \'French Culture & Society\' (ID: 18) was created by Ahmad', '2025-05-14 13:07:15.000000', 'COURSE_CREATED'),
(74, 'Course \'Arabic Advanced Literature\' (ID: 19) was created by Ahmad', '2025-05-14 13:07:26.000000', 'COURSE_CREATED'),
(75, 'Course \'English Academic Writing\' (ID: 20) was created by Ahmad', '2025-05-14 13:07:43.000000', 'COURSE_CREATED'),
(76, 'Course \'Spanish Conversation Practice\' (ID: 21) was created by Ahmad', '2025-05-14 13:07:54.000000', 'COURSE_CREATED'),
(77, 'Course \'German for Beginners\' (ID: 22) was created by Ahmad', '2025-05-14 13:08:07.000000', 'COURSE_CREATED'),
(78, 'Course \'Korean Intermediate\' (ID: 23) was created by Ahmad', '2025-05-14 13:08:20.000000', 'COURSE_CREATED'),
(79, 'Course \'French Conversational Course\' (ID: 24) was created by Ahmad', '2025-05-14 13:08:32.000000', 'COURSE_CREATED'),
(80, 'Course \'Arabic Business Communication\' (ID: 25) was created by Ahmad', '2025-05-14 13:08:48.000000', 'COURSE_CREATED'),
(81, 'Course \'English Literature Review\' (ID: 26) was created by Ahmad', '2025-05-14 13:08:58.000000', 'COURSE_CREATED'),
(82, 'Course \'Spanish Writing Skills\' (ID: 27) was created by Ahmad', '2025-05-14 13:09:11.000000', 'COURSE_CREATED'),
(83, 'Course \'German Advanced Conversation\' (ID: 28) was created by Ahmad', '2025-05-14 13:09:23.000000', 'COURSE_CREATED'),
(84, 'Course \'Korean for Travel\' (ID: 29) was created by Ahmad', '2025-05-14 13:09:35.000000', 'COURSE_CREATED'),
(85, 'Course \'French Pronunciation Workshop\' (ID: 30) was created by Ahmad', '2025-05-14 13:09:48.000000', 'COURSE_CREATED'),
(86, 'Course \'Arabic Poetry Recital\' (ID: 31) was created by Ahmad', '2025-05-14 13:10:01.000000', 'COURSE_CREATED'),
(87, 'Enrollment ID 22 created for student \'Sarah\' in course(s) [German for Beginners, German Advanced Conversation, Arabic Poetry Recital] by Ahmad', '2025-05-14 13:46:52.000000', 'ENROLLMENT_CREATED'),
(88, 'Enrollment ID 23 created for student \'Mohammed\' in course(s) [Korean Intermediate, Arabic Business Communication] by Ahmad', '2025-05-14 13:47:14.000000', 'ENROLLMENT_CREATED'),
(89, 'Enrollment ID 24 created for student \'Basma\' in course(s) [French Conversational Course, German Advanced Conversation] by Ahmad', '2025-05-14 13:49:54.000000', 'ENROLLMENT_CREATED'),
(90, 'Enrollment ID 25 created for student \'Basma\' in course(s) [French Conversational Course, German Advanced Conversation] by Ahmad', '2025-05-14 13:49:54.000000', 'ENROLLMENT_CREATED'),
(91, 'Enrollment ID 26 created for student \'Cara\' in course(s) [Arabic Business Communication, English Literature Review] by Ahmad', '2025-05-14 13:51:09.000000', 'ENROLLMENT_CREATED'),
(92, 'Enrollment ID 27 created for student \'Dana\' in course(s) [English Literature Review, French Pronunciation Workshop] by Ahmad', '2025-05-14 13:51:23.000000', 'ENROLLMENT_CREATED'),
(93, 'Enrollment ID 28 created for student \'Elie\' in course(s) [Spanish Writing Skills, Arabic Poetry Recital] by Ahmad', '2025-05-14 13:51:38.000000', 'ENROLLMENT_CREATED'),
(94, 'Enrollment ID 29 created for student \'Katie\' in course(s) [German Advanced Conversation, French Pronunciation Workshop] by Ahmad', '2025-05-14 13:51:49.000000', 'ENROLLMENT_CREATED'),
(95, 'Enrollment ID 30 created for student \'Ghassan\' in course(s) [Korean for Travel, Arabic Poetry Recital] by Ahmad', '2025-05-14 13:52:02.000000', 'ENROLLMENT_CREATED'),
(96, 'Enrollment ID 31 created for student \'Hana\' in course(s) [French Pronunciation Workshop, Arabic Poetry Recital] by Ahmad', '2025-05-14 13:52:13.000000', 'ENROLLMENT_CREATED'),
(97, 'Enrollment ID 32 created for student \'Ibrahim\' in course(s) [Arabic Poetry Recital] by Ahmad', '2025-05-14 13:52:25.000000', 'ENROLLMENT_CREATED'),
(98, 'Enrollment ID 33 created for student \'Jana\' in course(s) [German for Beginners, German Advanced Conversation, Arabic Poetry Recital] by Ahmad', '2025-05-14 13:59:45.000000', 'ENROLLMENT_CREATED'),
(99, 'Enrollment ID 34 created for student \'Khaled\' in course(s) [Korean Intermediate, Arabic Business Communication] by Ahmad', '2025-05-14 14:02:18.000000', 'ENROLLMENT_CREATED'),
(100, 'Enrollment ID 35 created for student \'Layla\' in course(s) [French Conversational Course, German Advanced Conversation] by Ahmad', '2025-05-14 14:02:34.000000', 'ENROLLMENT_CREATED'),
(101, 'Enrollment ID 36 created for student \'Martin\' in course(s) [Arabic Business Communication, English Literature Review] by Ahmad', '2025-05-14 14:02:48.000000', 'ENROLLMENT_CREATED'),
(102, 'Enrollment ID 37 created for student \'Nawal\' in course(s) [English Literature Review, French Pronunciation Workshop] by Ahmad', '2025-05-14 14:03:04.000000', 'ENROLLMENT_CREATED'),
(103, 'Enrollment ID 38 created for student \'Omar\' in course(s) [Spanish Writing Skills, Arabic Poetry Recital] by Ahmad', '2025-05-14 14:03:42.000000', 'ENROLLMENT_CREATED'),
(104, 'Enrollment ID 39 created for student \'Rania\' in course(s) [German Advanced Conversation, French Pronunciation Workshop] by Ahmad', '2025-05-14 14:03:47.000000', 'ENROLLMENT_CREATED'),
(105, 'Enrollment ID 40 created for student \'Samir\' in course(s) [Korean for Travel, Arabic Poetry Recital] by Ahmad', '2025-05-14 14:03:52.000000', 'ENROLLMENT_CREATED'),
(106, 'Enrollment ID 41 created for student \'Hala\' in course(s) [French Pronunciation Workshop, Arabic Poetry Recital] by Ahmad', '2025-05-14 14:03:56.000000', 'ENROLLMENT_CREATED'),
(107, 'Enrollment ID 42 created for student \'Youssef\' in course(s) [Arabic Poetry Recital] by Ahmad', '2025-05-14 14:04:02.000000', 'ENROLLMENT_CREATED'),
(108, 'Enrollment ID 43 created for student \'Zainab\' in course(s) [German for Beginners, German Advanced Conversation, Arabic Poetry Recital] by Ahmad', '2025-05-14 14:04:06.000000', 'ENROLLMENT_CREATED'),
(109, 'Enrollment ID 44 created for student \'Sarah\' in course(s) [French Intensive Workshop, German Reading & Writing] by Ahmad', '2025-05-14 14:11:10.000000', 'ENROLLMENT_CREATED'),
(110, 'Enrollment ID 45 created for student \'Mohammed\' in course(s) [Arabic for Beginners] by Ahmad', '2025-05-14 14:11:23.000000', 'ENROLLMENT_CREATED'),
(111, 'Enrollment ID 46 created for student \'Basma\' in course(s) [French Intensive Workshop, English Conversation Skills, Spanish Grammar Mastery] by Ahmad', '2025-05-14 14:11:37.000000', 'ENROLLMENT_CREATED'),
(112, 'Enrollment ID 47 created for student \'Cara\' in course(s) [German Reading & Writing, Korean Business Language] by Ahmad', '2025-05-14 14:14:11.000000', 'ENROLLMENT_CREATED'),
(113, 'Enrollment ID 48 created for student \'Dana\' in course(s) [Arabic for Beginners, French Reading and Writing] by Ahmad', '2025-05-14 14:14:19.000000', 'ENROLLMENT_CREATED'),
(114, 'Enrollment ID 49 created for student \'Elie\' in course(s) [English Conversation Skills] by Ahmad', '2025-05-14 14:14:28.000000', 'ENROLLMENT_CREATED'),
(115, 'Enrollment ID 50 created for student \'Katie\' in course(s) [Arabic Advanced Literature] by Ahmad', '2025-05-14 14:14:37.000000', 'ENROLLMENT_CREATED'),
(116, 'Enrollment ID 51 created for student \'Ghassan\' in course(s) [French Reading and Writing, English Academic Writing] by Ahmad', '2025-05-14 14:14:55.000000', 'ENROLLMENT_CREATED'),
(117, 'Enrollment ID 52 created for student \'Hana\' in course(s) [English Academic Writing] by Ahmad', '2025-05-14 14:15:05.000000', 'ENROLLMENT_CREATED'),
(118, 'Enrollment ID 53 created for student \'Ibrahim\' in course(s) [Spanish Conversation Practice] by Ahmad', '2025-05-14 14:15:17.000000', 'ENROLLMENT_CREATED'),
(119, 'Enrollment ID 54 created for student \'Jana\' in course(s) [French Intensive Workshop, Arabic for Beginners] by Ahmad', '2025-05-14 14:15:25.000000', 'ENROLLMENT_CREATED'),
(120, 'Enrollment ID 55 created for student \'Khaled\' in course(s) [French Reading and Writing] by Ahmad', '2025-05-14 14:15:29.000000', 'ENROLLMENT_CREATED'),
(121, 'Enrollment ID 56 created for student \'Layla\' in course(s) [English Conversation Skills, Arabic Advanced Literature] by Ahmad', '2025-05-14 14:15:34.000000', 'ENROLLMENT_CREATED'),
(122, 'Enrollment ID 57 created for student \'Martin\' in course(s) [Spanish Grammar Mastery, German Reading & Writing] by Ahmad', '2025-05-14 14:15:54.000000', 'ENROLLMENT_CREATED'),
(123, 'Enrollment ID 58 created for student \'Nawal\' in course(s) [French Intensive Workshop, Korean Business Language] by Ahmad', '2025-05-14 14:15:59.000000', 'ENROLLMENT_CREATED'),
(124, 'Enrollment ID 59 created for student \'Omar\' in course(s) [Arabic for Beginners, Arabic Advanced Literature] by Ahmad', '2025-05-14 14:16:04.000000', 'ENROLLMENT_CREATED'),
(125, 'Enrollment ID 60 created for student \'Rania\' in course(s) [Spanish Conversation Practice] by Ahmad', '2025-05-14 14:16:08.000000', 'ENROLLMENT_CREATED'),
(126, 'Enrollment ID 61 created for student \'Samir\' in course(s) [English Conversation Skills, English Academic Writing] by Ahmad', '2025-05-14 14:16:14.000000', 'ENROLLMENT_CREATED'),
(127, 'Enrollment ID 62 created for student \'Hala\' in course(s) [Arabic Advanced Literature] by Ahmad', '2025-05-14 14:16:18.000000', 'ENROLLMENT_CREATED'),
(128, 'Enrollment ID 63 created for student \'Youssef\' in course(s) [German Reading & Writing, Spanish Conversation Practice] by Ahmad', '2025-05-14 14:16:23.000000', 'ENROLLMENT_CREATED'),
(129, 'Enrollment ID 64 created for student \'Zainab\' in course(s) [French Intensive Workshop, Spanish Grammar Mastery, English Academic Writing] by Ahmad', '2025-05-14 14:16:28.000000', 'ENROLLMENT_CREATED'),
(130, 'Enrollment ID 65 created for student \'Sarah\' in course(s) [Beginner French] by Ahmad', '2025-05-22 09:46:19.000000', 'ENROLLMENT_CREATED'),
(131, 'User \'Sarah\' (ID: 2) updated own profile (including photo)', '2025-05-22 10:00:34.000000', 'USER_UPDATED'),
(132, 'User \'Elora\' (ID: 28) updated own profile (including photo)', '2025-05-23 07:42:19.000000', 'USER_UPDATED'),
(133, 'Course \'Beginner French\' (ID: 3) updated by Ahmad', '2025-05-23 09:53:53.000000', 'COURSE_UPDATED'),
(134, 'User \'Elora\' (ID: 28) updated own profile (including photo)', '2025-05-23 10:54:54.000000', 'USER_UPDATED'),
(135, 'User (ID: 23) updated by Ahmad: role \'INSTRUCTOR\' → \'STUDENT\'', '2025-05-23 10:58:21.000000', 'USER_UPDATED'),
(136, 'User (ID: 23) updated by Ahmad: role \'STUDENT\' → \'INSTRUCTOR\'', '2025-05-23 10:58:24.000000', 'USER_UPDATED'),
(137, 'User \'Elora\' (ID: 28) updated own profile (including photo)', '2025-05-23 11:04:31.000000', 'USER_UPDATED'),
(138, 'User \'Ahmad\' (ID: 1) updated own profile (including photo)', '2025-05-23 11:12:57.000000', 'USER_UPDATED'),
(139, 'User \'Ahmad\' (ID: 1) updated own profile (including photo)', '2025-05-23 11:13:09.000000', 'USER_UPDATED'),
(140, 'User \'Elora\' (ID: 28) updated own profile (including photo)', '2025-05-23 11:16:20.000000', 'USER_UPDATED'),
(141, 'User \'Kareem\' (ID:29) registered with role ADMIN by self-registration', '2025-05-23 11:57:19.000000', 'USER_CREATED');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `auth_provider` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiry` datetime(6) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `auth_provider`, `email`, `password`, `profile`, `reset_token`, `reset_token_expiry`, `role`, `username`) VALUES
(1, NULL, 'Ahmad@fluento.edu', '$2a$10$JpFfmKQYqI81jU.xBrfMoeK5w.dK/TNt8vsO9I8EySOD.6dLTzp5.', '/uploads/3ba3799c-a262-46fb-a890-9ac162ac6fdb.png', NULL, NULL, 'ADMIN', 'Ahmad'),
(2, NULL, 'Sarah@fluento.edu', '$2a$10$O2QEhRNWEK197yOsj9bRUebY5uDycG1CKYR55Ai2FNgESARfsVac2', '/uploads/81ca2b7c-7507-4568-b7af-c8486c64f1c0.jpeg', NULL, NULL, 'STUDENT', 'Sarah'),
(3, NULL, 'Mohammed@fluento.edu', '$2a$10$/0qoIEcDFTcaXGBTYt1P8OIa2TrrlVocVkeJoNaNabBDM9wt5Vava', ' ', NULL, NULL, 'STUDENT', 'Mohammed'),
(4, NULL, 'Basma@fluento.edu', '$2a$10$8YT0Kh9X0qyQc7.RNxSmxOSPDof9q02LQ0aDrFkHd6nxakFozaLZO', ' ', NULL, NULL, 'STUDENT', 'Basma'),
(5, NULL, 'Cara@fluento.edu', '$2a$10$VdUoDztnEDhqzmojEX97guh/DJL8OKP8reXF1SAso7WJ/DzsBwmfe', ' ', NULL, NULL, 'STUDENT', 'Cara'),
(6, NULL, 'Dana@fluento.edu', '$2a$10$p0Y6cZ7Nh/29oC1ablIu3eBPn6pJhuZwqPmBJ4z8CvgNUk5K1sXSi', ' ', NULL, NULL, 'STUDENT', 'Dana'),
(7, NULL, 'Elie@fluento.edu', '$2a$10$W.pBHpCNnQiyl9hDHSrPoeU2RLKYnGlmpU5q3RMuMyuoB3oT2kVG6', ' ', NULL, NULL, 'STUDENT', 'Elie'),
(8, NULL, 'Katie@fluento.edu', '$2a$10$mOxiUbEdgImRMJQC5S113.A9RiDe9Kv2aoe2qKpCkA.v1PTcdVrCO', ' ', NULL, NULL, 'STUDENT', 'Katie'),
(9, NULL, 'Ghassan@fluento.edu', '$2a$10$3GyV165W5zTXmCkgrhi7Guw4B7.a5DjxJHH2fTEf2mLz2s.k4KFVq', ' ', NULL, NULL, 'STUDENT', 'Ghassan'),
(10, NULL, 'Hana@fluento.edu', '$2a$10$oFstlj6G/LWQCANlbP9vwOJH4XXv0mME0TP5Ao8uevl0sqjsPIuE6', ' ', NULL, NULL, 'STUDENT', 'Hana'),
(11, NULL, 'Ibrahim@fluento.edu', '$2a$10$lcb4/fZE55N/O9BqYYwBSej.dL9GlN2LeDC0JOx8WK65L.9xtYL0S', ' ', NULL, NULL, 'STUDENT', 'Ibrahim'),
(12, NULL, 'Jana@fluento.edu', '$2a$10$Bq9qwAMr7LNUNTKRB22LhetzUbFa7kfmpr8w8Lxc7lWNy/PMMl9TW', ' ', NULL, NULL, 'STUDENT', 'Jana'),
(13, NULL, 'Khaled@fluento.edu', '$2a$10$HklDoKQD7Td3c7VWiKN1wO9VczH9g8AO58FNRw6X2lYcAMVIuEt7O', ' ', NULL, NULL, 'STUDENT', 'Khaled'),
(14, NULL, 'Layla@fluento.edu', '$2a$10$xAx4yFkty10vqkdHZmHLh.w/rOFAoGzGHYhinHh.6x1jjOMMZXj1C', ' ', NULL, NULL, 'STUDENT', 'Layla'),
(15, NULL, 'Martin@fluento.edu', '$2a$10$UZyLJoN2xmgebTMhbcBfYO1PgZvFW/AgQk.c.of/302Nn1SBv43Pu', ' ', NULL, NULL, 'STUDENT', 'Martin'),
(16, NULL, 'Nawal@fluento.edu', '$2a$10$zWXHjLCnWCsbqP30pXykJe..AgNBx2waN8lX95AODQIQnRpmLBfvy', ' ', NULL, NULL, 'STUDENT', 'Nawal'),
(17, NULL, 'Omar@fluento.edu', '$2a$10$GUVEUC6e1ygpEYAw5RMkrex7Q7N1FI7uEd4Db.z7kGF99O9UBmmcu', ' ', NULL, NULL, 'STUDENT', 'Omar'),
(18, NULL, 'Rania@fluento.edu', '$2a$10$ZQ4dXPBcHU/t2DoCQIrlmuHUUGZqAUOp7VX1BpzGWzqVaHHx3hWMe', ' ', NULL, NULL, 'STUDENT', 'Rania'),
(19, NULL, 'Samir@fluento.edu', '$2a$10$tGupx6i/zbU3F36Ze5WxzOJH5d4Csv9ZBOkptGw/ykAYJqdeJpXpC', ' ', NULL, NULL, 'STUDENT', 'Samir'),
(20, NULL, 'Hala@fluento.edu', '$2a$10$G/WjMEz7o7xZQSwnBq1Kz.Nyvm0bIwmXDRWIDN48BozjISUvw.tn2', ' ', NULL, NULL, 'STUDENT', 'Hala'),
(21, NULL, 'Youssef@fluento.edu', '$2a$10$SmwQwzxcVkdlCw4kRUVs1.ceIL9Mv.HyqFG2cs8VVa2OjL7ER29um', ' ', NULL, NULL, 'STUDENT', 'Youssef'),
(22, NULL, 'Zainab@fluento.edu', '$2a$10$IZyDBm/QwI2QRvo3IyzVQ.cRV.jGK3.nX81FWIAtMY5o0/VkH2lJ6', ' ', NULL, NULL, 'STUDENT', 'Zainab'),
(23, NULL, 'Aisha@fluento.edu', '$2a$10$No3zohRwOrYdk2MSNB50eeWRPpDB8sjkkZT6I9TrDNhFwiTDD5FZy', ' ', NULL, NULL, 'INSTRUCTOR', 'Aisha'),
(24, NULL, 'Bilal@fluento.edu', '$2a$10$TCdRcIB2qIHWLbNVheCqrec2QgJLsKdpTroHjLvzV7ro794zomW/W', ' ', NULL, NULL, 'INSTRUCTOR', 'Bilal'),
(25, NULL, 'Carine@fluento.edu', '$2a$10$Bzde5P01dnz23rETsZ.MhecpxXzK/jEg4s2I/OMKTOpFOe7kn1Q1W', ' ', NULL, NULL, 'INSTRUCTOR', 'Carine'),
(26, NULL, 'Diaa@fluento.edu', '$2a$10$YzmOBHmOQA62jGtRZMdVteE0xNzQdN9MF3mzW72RnNbzchOtVQs3S', ' ', NULL, NULL, 'INSTRUCTOR', 'Diaa'),
(27, NULL, 'Ehab@fluento.edu', '$2a$10$JF.oAYxKtAq9j96SC2af9u77bWsYRNVz.Dpp50jlQuE0rZVQPRUAa', ' ', NULL, NULL, 'INSTRUCTOR', 'Ehab'),
(28, NULL, 'Elora@fluento.edu', '$2a$10$SuW6wTY3GGaon3LT9OiZiuls1MqVlsUQ1PpVtYa8aMMus7ak3LFWS', '/uploads/2349c156-32ff-4c6a-93c7-16fb26f43121.png', NULL, NULL, 'INSTRUCTOR', 'Elora'),
(29, NULL, 'k@kk.l', '$2a$10$Ww/imQhgod4Ivsz0g1bWkev5HMHpCxhAWWOIX4yBBHTNu6wJAv.Li', '', NULL, NULL, 'ADMIN', 'Kareem');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKmfht1v2b8m6s3mawhdtm7hr4b` (`user_id`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrop26uwnbkstbtfha3ormxp85` (`course_id`);

--
-- Indexes for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi9tdkyaqlb4j7qm7y2k74jd7o` (`assignment_id`),
  ADD KEY `FKb4ifsk7hs0eflfk1sqj4y3mq` (`student_id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrftaakmtki1c63nd2f8y4spof` (`course_id`),
  ADD KEY `FKlnthsgafrc3i7sarakn6wcj33` (`uploaded_by`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqk2yq2yk124dhlsilomy36qr9` (`instructor_id`);

--
-- Indexes for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  ADD KEY `FKpurd525bwrsn45j4mncmm1bbk` (`enrollment_id`),
  ADD KEY `FKmdu3eh7r8fvaemtwyps4dtqoh` (`course_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `FKio7fsy3vhvfgv7c0gjk15nyk4` (`student_id`);

--
-- Indexes for table `enrollment_courses`
--
ALTER TABLE `enrollment_courses`
  ADD KEY `FKthidpibr5sdje3d6iimb9jklp` (`course_id`),
  ADD KEY `FKc3seoxqdkc1vs6w4twl7m9rtq` (`enrollment_id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKcr0g7gh88hv7sfdx9kqbrbiyw` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKb0yh0c1qaxfwlcnwo9dms2txf` (`quiz_id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD KEY `FKjk4v42xhyfv4ca1yyhorsg5tv` (`question_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKce16mrsgeokucc022mpyev7xk` (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKbkix9btnoi1n917ll7bplkvg5` (`user_id`);

--
-- Indexes for table `student_course`
--
ALTER TABLE `student_course`
  ADD KEY `FKejrkh4gv8iqgmspsanaji90ws` (`course_id`),
  ADD KEY `FKq7yw2wg9wlt2cnj480hcdn6dq` (`student_id`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3q8643roa73llngo64dvpvtxt` (`assignment_id`);

--
-- Indexes for table `submission_answers`
--
ALTER TABLE `submission_answers`
  ADD KEY `FK2eet63chl8p0ll11bs9sp56pg` (`submission_id`);

--
-- Indexes for table `system_activity`
--
ALTER TABLE `system_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  ADD UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `submission`
--
ALTER TABLE `submission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_activity`
--
ALTER TABLE `system_activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD CONSTRAINT `FKspffew5mrttaxfscevhufqu9m` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `FKrop26uwnbkstbtfha3ormxp85` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD CONSTRAINT `FKb4ifsk7hs0eflfk1sqj4y3mq` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `FKi9tdkyaqlb4j7qm7y2k74jd7o` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`);

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `FKlnthsgafrc3i7sarakn6wcj33` FOREIGN KEY (`uploaded_by`) REFERENCES `instructor` (`id`),
  ADD CONSTRAINT `FKrftaakmtki1c63nd2f8y4spof` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FKqk2yq2yk124dhlsilomy36qr9` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`);

--
-- Constraints for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  ADD CONSTRAINT `FKmdu3eh7r8fvaemtwyps4dtqoh` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `FKpurd525bwrsn45j4mncmm1bbk` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`enrollment_id`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `FKio7fsy3vhvfgv7c0gjk15nyk4` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `enrollment_courses`
--
ALTER TABLE `enrollment_courses`
  ADD CONSTRAINT `FKc3seoxqdkc1vs6w4twl7m9rtq` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`enrollment_id`),
  ADD CONSTRAINT `FKthidpibr5sdje3d6iimb9jklp` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `FKpyhf3fgtvlqq630u3697wsmre` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FKb0yh0c1qaxfwlcnwo9dms2txf` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `question_options`
--
ALTER TABLE `question_options`
  ADD CONSTRAINT `FKjk4v42xhyfv4ca1yyhorsg5tv` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `FKce16mrsgeokucc022mpyev7xk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FKk5m148xqefonqw7bgnpm0snwj` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `student_course`
--
ALTER TABLE `student_course`
  ADD CONSTRAINT `FKejrkh4gv8iqgmspsanaji90ws` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `FKq7yw2wg9wlt2cnj480hcdn6dq` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `submission`
--
ALTER TABLE `submission`
  ADD CONSTRAINT `FK3q8643roa73llngo64dvpvtxt` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`);

--
-- Constraints for table `submission_answers`
--
ALTER TABLE `submission_answers`
  ADD CONSTRAINT `FK2eet63chl8p0ll11bs9sp56pg` FOREIGN KEY (`submission_id`) REFERENCES `submission` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
