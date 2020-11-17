-- //有一些地方有些問題schedule及itinerary的SID部分
CREATE TABLE `guest` (
  `GID` int(3) NOT NULL PRIMARY KEY,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `guest` (`GID`, `firstname`, `lastname`, `create_time`) VALUES
(1, 'fu', 'fu_lastname', '2020-03-24 20:00:42'),
(2, 'ab', 'ab_lastname', '2020-03-24 20:00:51'),
(3, 'cd', 'cd_lastname', '2020-07-10 23:35:24');

ALTER TABLE `guest`
  MODIFY `GID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- ALTER TABLE `guest`
--   ADD PRIMARY KEY (`GID`);
-- --------------------------------------------------------
CREATE TABLE `sectors` (
  `SID` varchar(3) NOT NULL PRIMARY KEY,
  `Sector` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sectors` (`SID`, `Sector`) VALUES 
('A1', 'China'),
('A2', 'Taiwan'),
('A3', 'Singapore');

ALTER TABLE `sectors`
  MODIFY `SID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
-- COMMIT;
-- --------------------------------------------------------
CREATE TABLE `flights` (
  `FID` int(3) NOT NULL PRIMARY KEY,
  `Fname` varchar(3) NOT NULL,
  `sourceSID` varchar(3) NOT NULL,
  `DestSID` varchar(3) NOT NULL
  -- CONSTRAINT fk_sourceSID FOREIGN KEY (sourceSID) REFERENCES sectors(SID) ,
  -- CONSTRAINT fk_DestSID FOREIGN KEY (DestSID) REFERENCES sectors(SID) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `flights` (`FID`, `Fname`, `sourceSID`, `DestSID`) VALUES
(1, 'A01', 'A1', 'A2'),
(2, 'A02', 'A2', 'A3');

ALTER TABLE `flights`
  MODIFY `FID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
-- --------------------------------------------------------
CREATE TABLE `schedule` (
  `SID` varchar(3) NOT NULL PRIMARY KEY,
  `GID` int(3) NOT NULL,
  `FID` int(3) NOT NULL,
  `date` timestamp NOT NULL,
  CONSTRAINT fk_sc_GID FOREIGN KEY (GID) REFERENCES guest(GID) ,
  CONSTRAINT fk_sc_FID FOREIGN KEY (FID) REFERENCES flights(FID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `schedule`
  MODIFY `IID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
-- COMMIT;

INSERT INTO `schedule` (`SID`, `GID`, `FID`, `date`) VALUES
('A2', '1', '1', '2020-03-25 04:00:00'),
('A3', '1', '2', '2020-03-25 12:00:00');
-- --------------------------------------------------------
CREATE TABLE `itinerary` (
  `IID` int(3) NOT NULL PRIMARY KEY,
  `GID` int(3) NOT NULL,
  `FID` int(3) NOT NULL,
  `SID` varchar(3) NOT NULL,
  CONSTRAINT fk_GID FOREIGN KEY (GID) REFERENCES guest(GID) ,
  CONSTRAINT fk_SID FOREIGN KEY (SID) REFERENCES schedule(SID) ,
  CONSTRAINT fk_FID FOREIGN KEY (FID) REFERENCES flights(FID) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `itinerary` (`IID`, `GID`, `FID`, `SID`) VALUES
(1, '1', '1', 'A2'),
(2, '1', '2', 'A3');

ALTER TABLE `itinerary`
  MODIFY `IID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
-- COMMIT;

-- --------------------------------------------------------
-- --------------------------------------------------------
