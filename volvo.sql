-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 06:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `volvo`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `idNotice` int(11) NOT NULL,
  `comWriter` varchar(20) NOT NULL,
  `comDate` varchar(20) NOT NULL,
  `comContent` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `connection_logs`
--

CREATE TABLE `connection_logs` (
  `id` int(11) NOT NULL,
  `connected_at` text NOT NULL,
  `disconnected_at` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `connection_logs`
--

INSERT INTO `connection_logs` (`id`, `connected_at`, `disconnected_at`) VALUES
(1, '2023-09-11 11:13:46.046', '2023-09-11 11:13:51.484'),
(2, '2023-09-11 11:16:46.119', '2023-09-11 11:16:56.173'),
(3, '2023-09-11 11:16:41.059', '2023-09-11 11:16:56.176'),
(4, '2023-09-11 11:13:35.841', '2023-09-11 11:16:56.188'),
(5, '2023-11-21 09:21:14.828', '2023-11-21 09:26:10.583'),
(6, '2023-11-21 13:25:58.508', '2023-11-21 13:26:00.665'),
(7, '2023-11-21 16:46:25.199', '2023-11-21 16:46:32.174');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `idNotice` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `dateCreate` varchar(20) NOT NULL,
  `writer` varchar(20) DEFAULT NULL,
  `content` text NOT NULL,
  `imgUpload` varchar(50) NOT NULL,
  `fileUpload` varchar(200) NOT NULL,
  `videoUpload` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`idNotice`, `title`, `category`, `dateCreate`, `writer`, `content`, `imgUpload`, `fileUpload`, `videoUpload`) VALUES
(8, 'New title 07-17', 'Announcement', '2023-08-22', 'user19', '<p class=\"ql-align-center\"><strong style=\"font-size: 28px;\">Title</strong></p><p><img src=\"/uploads/1692680807310-Hai.png\" width=\"111\"></p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p>', '', 'user19_Spring+2023+UOU+Graduate+International+student+Application+Guidelines_EN.pdf', ''),
(9, 'New title 07-17', 'Announcement', '2023-08-23', 'user19', '<p>gfgdsgds</p>', '', 'user19_undefined', ''),
(10, 'New title 07-17', 'Suggestion', '2023-08-23', 'user19', '<p>Content</p>', '', 'user19_undefined', ''),
(11, 'New title 07-21', 'Suggestion', '2023-08-23', 'user19', '<p>Content</p>', '', 'user19_user19_Springpro.zip;user19_demo.zip;', ''),
(12, 'New title 07-17', 'Announcement', '2023-08-24', 'user19', '<p>content</p>', '', 'user19_user19_Spring+2023+UOU+Graduate+International+student+Application+Guidelines_EN.pdf;user19_browser_manual.pdf;', ''),
(13, 'New title 07-21', 'Announcement', '2023-08-24', 'user19', '<p>Content</p>', '', 'user19_user19_Spring+2023+UOU+Graduate+International+student+Application+Guidelines_EN.pdf;user19_demo.zip;', ''),
(14, 'New title 07-17', 'Opinion', '2023-08-24', 'user19', '<p>k</p>', '', 'user19_user19_Spring+2023+UOU+Graduate+International+student+Application+Guidelines_EN.pdf;', ''),
(16, 'New title 07-25', 'Reference', '2023-08-24', 'user19', '<p>content</p>', '', 'user19_undefined', ''),
(17, 'New title 07-17', 'Opinion', '2023-08-24', 'user19', '<p>j</p>', '', 'user19_user19_manual (2).pdf;', ''),
(18, 'New title 07-17', 'Announcement', '2023-08-25', 'user19', '<p>kkkk</p>', '', 'user19_1. 다문화가족을 위한 초등학교 용어 풀이집1_베트남어.pdf;', ''),
(19, 'New title 07-25', 'Suggestion', '2023-08-24', 'user25', '<p>ggggg</p>', '', '', ''),
(20, 'New title 07-25', 'Announcement', '2023-08-25', NULL, '<p><strong style=\"font-size: 28px;\">Title</strong><img src=\"/uploads/1692861379233-img2.jpg\" width=\"344\"></p><p><strong style=\"font-size: 16px; background-color: rgb(252, 252, 252); color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"font-size: 16px; background-color: rgb(252, 252, 252); color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', '', '_mobile.png;_[한국어][학부]+2023학년도+후기+학부+입시+외국인특별전형+모집요강 (1).pdf;', ''),
(21, 'New title 07-21', 'Announcement', '2023-08-25', 'user25', '<p>Test</p>', '', 'user25_[한국어][학부]+2023학년도+후기+학부+입시+외국인특별전형+모집요강.pdf;', ''),
(22, 'Hi, I am running into this issue when running an AKS cluster with 1.24 and 1.25 versions. Command us', 'Opinion', '2023-08-25', 'user19', '<p>gfgfgf</p>', '', '', ''),
(23, 'Hi, I am running into this issue when running an AKS cluster with 1.24 and 1.25 versions. Command us', 'Suggestion', '2023-08-25', 'user19', '<p>dfd</p>', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `platform`
--

CREATE TABLE `platform` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `ip` text NOT NULL,
  `platform` text NOT NULL,
  `logintime` text NOT NULL,
  `logouttime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `platform`
--

INSERT INTO `platform` (`id`, `user`, `ip`, `platform`, `logintime`, `logouttime`) VALUES
(185, 'user', '999.0.0.1', 'PC', '2023-07-12 12:03:03', ''),
(186, 'user', '999.0.0.1', 'PC', '2023-07-12 12:04:16', ''),
(187, 'user', '999.0.0.1', 'PC', '2023-07-12 12:06:43', ''),
(188, 'user', '999.0.0.1', 'PC', '2023-07-12 12:11:53', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `username`, `password`) VALUES
(1, 'admin', '123'),
(2, 'member', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idNotice` (`idNotice`);

--
-- Indexes for table `connection_logs`
--
ALTER TABLE `connection_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`idNotice`);

--
-- Indexes for table `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `connection_logs`
--
ALTER TABLE `connection_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `platform`
--
ALTER TABLE `platform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idNotice`) REFERENCES `notice` (`idNotice`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
