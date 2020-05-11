-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 
-- 伺服器版本： 8.0.17
-- PHP 版本： 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `pure_php`
--

-- --------------------------------------------------------

--
-- 資料表結構 `message`
--

CREATE TABLE `message` (
  `id` tinyint(1) NOT NULL,
  `user` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` tinytext NOT NULL,
  `lastdate` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `message`
--

INSERT INTO `message` (`id`, `user`, `title`, `content`, `lastdate`) VALUES
(8, 'tryerth', 'terherth', 'etrhterhtreh', '2020-03-23 16:32:45'),
(10, '', '', '', '2020-03-23 17:55:59'),
(11, 'fu', 'rdfsddgfad', 'gfadgfdag', '2020-03-24 12:11:56');

-- --------------------------------------------------------

--
-- 資料表結構 `message_board`
--

CREATE TABLE `message_board` (
  `id` int(1) NOT NULL,
  `name` varchar(25) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `update_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `message_board`
--

INSERT INTO `message_board` (`id`, `name`, `msg`, `update_time`) VALUES
(21, 'wbbf', 'wbwfb', '2020-03-25 04:00:42'),
(22, '123', '123', '2020-03-25 04:00:51'),
(24, '123', '123', '2020-03-26 07:30:50'),
(26, '', 'grewg', '2020-03-26 07:59:14'),
(27, '123', '2421', '2020-04-25 11:55:18'),
(28, 'TRETEW', 'RETRE', '2020-04-25 11:55:56'),
(29, '', '', '2020-04-25 17:14:22');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `message_board`
--
ALTER TABLE `message_board`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message`
--
ALTER TABLE `message`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message_board`
--
ALTER TABLE `message_board`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
