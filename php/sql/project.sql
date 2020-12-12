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
-- 資料庫： `project`
--

-- --------------------------------------------------------

--
-- 資料表結構 `blocked_ip`
--

CREATE TABLE `blocked_ip` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `login_limit` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `check`
--

CREATE TABLE `check` (
  `id` int(10) UNSIGNED NOT NULL,
  `account` varchar(4) NOT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `in_status` int(11) DEFAULT '1',
  `out_time` time DEFAULT NULL,
  `out_status` int(11) DEFAULT '1',
  `memo` varchar(50) DEFAULT NULL,
  `timestamp` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `check`
--

INSERT INTO `check` (`id`, `account`, `date`, `in_time`, `in_status`, `out_time`, `out_status`, `memo`, `timestamp`) VALUES
(1, 'fu', '2020-10-01', '08:55:30', 3, '17:55:17', 3, NULL, 0.765089),
(2, 'test', '2020-10-01', '09:10:13', 3, '18:25:17', 3, NULL, 0.760491),
(3, 'fu', '2020-10-02', '08:30:59', 3, '18:35:43', 3, NULL, 0.666938),
(4, 'test', '2020-10-02', '09:03:25', 3, '18:05:17', 3, NULL, 0.663294),
(5, 'fu', '2020-10-03', '09:00:01', 3, '17:45:17', 3, NULL, 0.546472),
(6, 'test', '2020-10-03', '09:44:18', 3, '17:35:17', 3, NULL, 0.542643),
(7, 'fu', '2020-12-11', '09:25:00', 3, '11:30:45', 3, NULL, 0.080631),
(8, 'test', '2020-12-11', '08:51:49', 2, '18:39:47', 2, NULL, 0.087502),
(9, 'root', '2020-12-11', '11:33:47', 3, '11:33:49', 3, NULL, 0.094029);

-- --------------------------------------------------------

--
-- 資料表結構 `check_status`
--

CREATE TABLE `check_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `check_status`
--

INSERT INTO `check_status` (`id`, `status_type`) VALUES
(1, '-'),
(2, '正常'),
(3, '異常');

-- --------------------------------------------------------

--
-- 資料表結構 `check_type`
--

CREATE TABLE `check_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `check_type`
--

INSERT INTO `check_type` (`id`, `type_name`) VALUES
(1, '上班'),
(2, '下班');

-- --------------------------------------------------------

--
-- 資料表結構 `log`
--

CREATE TABLE `log` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `controller_name` varchar(100) NOT NULL,
  `function_name` varchar(100) NOT NULL,
  `log_title` varchar(100) NOT NULL,
  `log_content` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `log`
--

INSERT INTO `log` (`id`, `date_created`, `controller_name`, `function_name`, `log_title`, `log_content`) VALUES
(1, '2020-11-03 14:45:02', 'login', 'sign_in', 'test登入', ''),
(2, '2020-11-03 15:00:18', 'login', 'sign_in', 'fu登入', ''),
(3, '2020-11-03 15:02:48', 'login', 'sign_in', 'test登入', ''),
(4, '2020-11-03 18:13:51', 'login', 'sign_in', 'fu登入', ''),
(5, '2020-11-03 18:35:43', 'Checkin', 'checkeOut', 'fu下班打卡成功', ''),
(6, '2020-11-04 20:02:50', 'login', 'sign_in', 'test登入', ''),
(7, '2020-11-04 20:03:25', 'Checkin', 'checkeIn', 'test上班打卡成功', ''),
(8, '2020-11-05 00:30:17', 'login', 'sign_in', 'test登入', ''),
(9, '2020-11-05 00:30:23', 'Checkin', 'checkeIn', 'test上班打卡成功', ''),
(10, '2020-11-05 00:30:26', 'Checkin', 'checkeOut', 'test下班打卡成功', ''),
(11, '2020-11-05 00:30:31', 'Checkin', 'checkeOut', 'test下班打卡成功', ''),
(12, '2020-11-05 14:38:14', 'login', 'sign_in', 'test登入', ''),
(13, '2020-11-05 14:39:23', 'Checkin', 'checkeOut', 'test下班打卡成功', ''),
(14, '2020-11-18 13:23:07', 'login', 'sign_in', 'fu登入', ''),
(15, '2020-11-18 13:23:14', 'Checkin', 'checkeIn', 'fu上班打卡成功', ''),
(16, '2020-11-18 15:24:44', 'login', 'sign_in', 'fu登入', ''),
(17, '2020-12-10 21:04:52', 'login', 'sign_in', 'fu登入', ''),
(18, '2020-12-10 15:01:27', 'login', 'sign_in', 'fu登入', ''),
(19, '2020-12-11 09:38:23', 'Checkin', 'checkeIn', 'demo上班打卡成功', ''),
(20, '2020-12-11 09:38:32', 'Checkin', 'checkeOut', 'demo下班打卡成功', ''),
(21, '2020-12-11 09:41:25', 'login', 'sign_in', 'root登入', ''),
(22, '2020-12-11 09:41:30', 'Checkin', 'checkeIn', 'root上班打卡成功', ''),
(23, '2020-12-11 09:41:32', 'Checkin', 'checkeOut', 'root下班打卡成功', ''),
(24, '2020-12-11 09:43:50', 'login', 'sign_in', 'fu登入', ''),
(25, '2020-12-11 09:44:00', 'Checkin', 'checkeIn', 'fu上班打卡成功', ''),
(26, '2020-12-11 09:44:03', 'Checkin', 'checkeOut', 'fu下班打卡成功', ''),
(27, '2020-12-11 09:44:13', 'login', 'sign_in', 'test登入', ''),
(28, '2020-12-11 09:44:18', 'Checkin', 'checkeIn', 'test上班打卡成功', ''),
(29, '2020-12-11 09:44:19', 'Checkin', 'checkeOut', 'test下班打卡成功', ''),
(30, '2020-12-11 10:11:49', 'Checkin', 'checkeIn', 'test上班打卡成功', ''),
(31, '2020-12-11 10:39:47', 'Checkin', 'checkeOut', 'test下班打卡成功', ''),
(32, '2020-12-11 18:26:12', 'login', 'sign_in', 'fu登入', ''),
(33, '2020-12-11 18:26:55', 'login', 'sign_in', 'fu登入', ''),
(34, '2020-12-11 18:27:16', 'login', 'sign_in', 'fu登入', ''),
(35, '2020-12-11 11:30:35', 'login', 'sign_in', 'fu登入', ''),
(36, '2020-12-11 11:30:45', 'Checkin', 'checkeOut', 'fu下班打卡成功', ''),
(37, '2020-12-11 11:33:41', 'login', 'sign_in', 'root登入', ''),
(38, '2020-12-11 11:33:47', 'Checkin', 'checkeIn', 'root上班打卡成功', ''),
(39, '2020-12-11 11:33:49', 'Checkin', 'checkeOut', 'root下班打卡成功', '');

-- --------------------------------------------------------

--
-- 資料表結構 `message_board`
--

CREATE TABLE `message_board` (
  `id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `message_board`
--

INSERT INTO `message_board` (`id`, `name`, `msg`, `create_time`, `update_time`) VALUES
(1, '3', '管理人員介紹', '2020-12-11 11:33:02', '2020-12-11 11:33:02');

-- --------------------------------------------------------

--
-- 資料表結構 `permission`
--

CREATE TABLE `permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_type_id` int(11) NOT NULL,
  `permission_value` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `permission_type`
--

CREATE TABLE `permission_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',
  `type_number` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `user_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `permission_type`
--

INSERT INTO `permission_type` (`id`, `type_name`, `sort`, `type_number`, `date_created`, `user_created`) VALUES
(1, '管理權限', 1, 'admin', '0000-00-00 00:00:00', 0),
(2, '出勤系統', 2, 'check', '0000-00-00 00:00:00', 0),
(3, '專案系統', 3, 'project', '0000-00-00 00:00:00', 0),
(4, '薪資系統', 4, 'accounting', '0000-00-00 00:00:00', 0),
(5, '訂單系統', 5, 'ordernum', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `permission_value`
--

CREATE TABLE `permission_value` (
  `id` int(10) UNSIGNED NOT NULL,
  `value_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `permission_value`
--

INSERT INTO `permission_value` (`id`, `value_name`) VALUES
(1, '無'),
(2, '唯讀'),
(3, '讀寫');

-- --------------------------------------------------------

--
-- 資料表結構 `project`
--

CREATE TABLE `project` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_type_id` int(11) NOT NULL,
  `project_value` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `project_type`
--

CREATE TABLE `project_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',
  `type_number` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `user_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `project_type`
--

INSERT INTO `project_type` (`id`, `type_name`, `sort`, `type_number`, `date_created`, `user_created`) VALUES
(1, '公司規章', 1, 'Company_regulations', '0000-00-00 00:00:00', 0),
(2, '專案一', 2, 'project1', '0000-00-00 00:00:00', 0),
(3, '專案二', 3, 'project2', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `project_value`
--

CREATE TABLE `project_value` (
  `id` int(10) UNSIGNED NOT NULL,
  `value_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `project_value`
--

INSERT INTO `project_value` (`id`, `value_name`) VALUES
(1, '待審核'),
(2, '進行中'),
(3, '已結案'),
(4, '其他異動狀態');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `account` varchar(20) DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `work_am_start` time DEFAULT '09:00:00',
  `work_am_end` time DEFAULT '12:00:00',
  `work_pm_start` time DEFAULT '13:30:00',
  `work_pm_end` time DEFAULT '18:00:00',
  `date_created` datetime DEFAULT NULL,
  `date_last` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `account`, `password`, `work_am_start`, `work_am_end`, `work_pm_start`, `work_pm_end`, `date_created`, `date_last`) VALUES
(1, 'test', '098f6bcd4621d373cade4e832627b4f6', '09:00:00', '12:00:00', '13:30:00', '18:00:00', NULL, NULL),
(2, 'fu', 'ca4da36c48be1c0b87a7d575c73f6e42', '09:00:00', '12:00:00', '13:30:00', '18:00:00', NULL, NULL),
(3, 'root', '1c63129ae9db9c60c3e8aa94d3e00495', '09:00:00', '12:00:00', '13:30:00', '18:00:00', NULL, NULL),
(4, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', '09:00:00', '12:00:00', '13:30:00', '18:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `vacation`
--

CREATE TABLE `vacation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `off_date` date NOT NULL,
  `vacation_type_id` int(11) NOT NULL,
  `off_stime` time DEFAULT NULL,
  `off_etime` time DEFAULT NULL,
  `memo` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_created` datetime DEFAULT NULL,
  `user_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `blocked_ip`
--
ALTER TABLE `blocked_ip`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `check`
--
ALTER TABLE `check`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `check_status`
--
ALTER TABLE `check_status`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `check_type`
--
ALTER TABLE `check_type`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `message_board`
--
ALTER TABLE `message_board`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `permission_type`
--
ALTER TABLE `permission_type`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `permission_value`
--
ALTER TABLE `permission_value`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `project_type`
--
ALTER TABLE `project_type`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `project_value`
--
ALTER TABLE `project_value`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `blocked_ip`
--
ALTER TABLE `blocked_ip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `check`
--
ALTER TABLE `check`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `check_status`
--
ALTER TABLE `check_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `check_type`
--
ALTER TABLE `check_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `log`
--
ALTER TABLE `log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message_board`
--
ALTER TABLE `message_board`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permission_type`
--
ALTER TABLE `permission_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permission_value`
--
ALTER TABLE `permission_value`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `project`
--
ALTER TABLE `project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `project_type`
--
ALTER TABLE `project_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `project_value`
--
ALTER TABLE `project_value`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `vacation`
--
ALTER TABLE `vacation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2084;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
