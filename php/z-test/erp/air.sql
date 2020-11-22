create database Airline_booking_system;
----------------------------------------------------
CREATE TABLE `guest` (
  `GID` int(3) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `guest`
  ADD PRIMARY KEY (`GID`);

ALTER TABLE `guest`
  MODIFY `GID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

-- 備註:插入資料表
----------------------------------------------------
INSERT INTO `guest` (`GID`, `firstname`, `lastname`, `create_time`) VALUES
(1, 'fu', 'fu_lastname', '2020-03-25 04:00:42'),
(2, 'ab', 'ab_lastname', '2020-03-25 04:00:51'),
(3, 'cd', 'cd_lastname', '2020-07-11 07:35:24');
----------------------------------------------------
----------------------------------------------------
CREATE TABLE `sectors` (
  `SID` varchar(3) NOT NULL,
  `Sector` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sectors`
  ADD PRIMARY KEY (`SID`);

ALTER TABLE `sectors`
  MODIFY `SID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

-- 備註:插入資料表
----------------------------------------------------
INSERT INTO `sectors` (`SID`, `Sector`) VALUES
(A1, 'China'),
(A2, 'Taiwan'),
(A3, 'Singapore');
----------------------------------------------------
----------------------------------------------------
CREATE TABLE `flights` (
  `FID` int(3) NOT NULL,
  `Fname` varchar(3) NOT NULL,
  `sourceSID` varchar(3) NOT NULL,
  `DestSID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `flights`
  ADD PRIMARY KEY (`FID`);

ALTER TABLE `flights`
  MODIFY `FID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

-- 備註:插入資料表
----------------------------------------------------
INSERT INTO `flights` (`FID`, `Fname`, `sourceSID`, `DestSID`) VALUES
(1, 'A01', 'China', 'Taiwan'),
(2, 'A02', 'Taiwan', 'Singapore');
----------------------------------------------------
----------------------------------------------------
CREATE TABLE `itinerary` (
  `IID` int(3) NOT NULL,
  `GID` varchar(3) NOT NULL,
  `FID` varchar(3) NOT NULL,
  `SID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `itinerary`
  ADD PRIMARY KEY (`IID`);

ALTER TABLE `itinerary`
  MODIFY `IID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

-- 備註:插入資料表
----------------------------------------------------
INSERT INTO `itinerary` (`IID`, `GID`, `FID`, `SID`) VALUES
(1, 'A01', '1', 'A2'),
(2, 'A02', '2', 'A3');
----------------------------------------------------
----------------------------------------------------
CREATE TABLE `schedule` (
  `SID` int(3) NOT NULL,
  `GID` varchar(3) NOT NULL,
  `FID` varchar(3) NOT NULL,
  `date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `schedule`
  ADD PRIMARY KEY (`IID`);

ALTER TABLE `schedule`
  MODIFY `IID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

-- 備註:插入資料表
----------------------------------------------------
INSERT INTO `schedule` (`SID`, `GID`, `FID`, `date`) VALUES
('A2', '1', '1', '2020-03-25 04:00:00'),
('A3', '1', '2', '2020-03-25 12:00:00');