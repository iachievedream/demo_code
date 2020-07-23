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
-- 資料庫： `air_ok`
--

-- --------------------------------------------------------

--
-- 資料表結構 `flights`
--

CREATE TABLE `flights` (
  `FID` int(3) NOT NULL,
  `Fname` varchar(3) NOT NULL,
  `sourceSID` varchar(3) NOT NULL,
  `DestSID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `flights`
--

INSERT INTO `flights` (`FID`, `Fname`, `sourceSID`, `DestSID`) VALUES
(1, 'A01', 'A1', 'A2'),
(2, 'A02', 'A2', 'A3');

-- --------------------------------------------------------

--
-- 資料表結構 `guest`
--

CREATE TABLE `guest` (
  `GID` int(3) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `guest`
--

INSERT INTO `guest` (`GID`, `firstname`, `lastname`, `create_time`) VALUES
(1, 'fu', 'fu_lastname', '2020-03-24 12:00:42'),
(2, 'ab', 'ab_lastname', '2020-03-24 12:00:51'),
(3, 'cd', 'cd_lastname', '2020-07-10 15:35:24');

-- --------------------------------------------------------

--
-- 資料表結構 `itinerary`
--

CREATE TABLE `itinerary` (
  `IID` int(3) NOT NULL,
  `GID` int(3) NOT NULL,
  `FID` int(3) NOT NULL,
  `SID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `itinerary`
--

INSERT INTO `itinerary` (`IID`, `GID`, `FID`, `SID`) VALUES
(1, 1, 1, 'A2'),
(2, 1, 2, 'A3');

-- --------------------------------------------------------

--
-- 資料表結構 `schedule`
--

CREATE TABLE `schedule` (
  `SID` varchar(3) NOT NULL,
  `GID` int(3) NOT NULL,
  `FID` int(3) NOT NULL,
  `date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `sectors`
--

CREATE TABLE `sectors` (
  `SID` varchar(3) NOT NULL,
  `Sector` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `sectors`
--

INSERT INTO `sectors` (`SID`, `Sector`) VALUES
('A1', 'China'),
('A2', 'Taiwan'),
('A3', 'Singapore');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`FID`),
  ADD KEY `fk_sourceSID` (`sourceSID`),
  ADD KEY `fk_DestSID` (`DestSID`);

--
-- 資料表索引 `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`GID`);

--
-- 資料表索引 `itinerary`
--
ALTER TABLE `itinerary`
  ADD PRIMARY KEY (`IID`),
  ADD KEY `fk_GID` (`GID`),
  ADD KEY `fk_FID` (`FID`),
  ADD KEY `fk_SID` (`SID`);

--
-- 資料表索引 `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`SID`),
  ADD KEY `fk_sc_GID` (`GID`),
  ADD KEY `fk_sc_FID` (`FID`);

--
-- 資料表索引 `sectors`
--
ALTER TABLE `sectors`
  ADD PRIMARY KEY (`SID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `flights`
--
ALTER TABLE `flights`
  MODIFY `FID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `guest`
--
ALTER TABLE `guest`
  MODIFY `GID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `fk_DestSID` FOREIGN KEY (`DestSID`) REFERENCES `sectors` (`SID`),
  ADD CONSTRAINT `fk_sourceSID` FOREIGN KEY (`sourceSID`) REFERENCES `sectors` (`SID`);

--
-- 資料表的限制式 `itinerary`
--
ALTER TABLE `itinerary`
  ADD CONSTRAINT `fk_FID` FOREIGN KEY (`FID`) REFERENCES `flights` (`FID`),
  ADD CONSTRAINT `fk_GID` FOREIGN KEY (`GID`) REFERENCES `guest` (`GID`),
  ADD CONSTRAINT `fk_SID` FOREIGN KEY (`SID`) REFERENCES `sectors` (`SID`);

--
-- 資料表的限制式 `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `fk_sc_FID` FOREIGN KEY (`FID`) REFERENCES `flights` (`FID`),
  ADD CONSTRAINT `fk_sc_GID` FOREIGN KEY (`GID`) REFERENCES `guest` (`GID`),
  ADD CONSTRAINT `fk_sc_SID` FOREIGN KEY (`SID`) REFERENCES `sectors` (`SID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
