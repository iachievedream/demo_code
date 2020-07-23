CREATE TABLE IF NOT EXISTS `syndrome` (
  `sID` smallint(9) NOT NULL auto_increment,
  `bID` smallint(9) NOT NULL,
  PRIMARY KEY  (`sID`),
  KEY `bID` (`bID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `bodyparts` (
  `bID` smallint(6) NOT NULL auto_increment,
  `bname` varchar(24) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`bID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=7 ;

ALTER TABLE `syndrome`
  ADD CONSTRAINT `syndrome_ibfk_1` FOREIGN KEY (`bID`) REFERENCES `bodyparts` (`bID`) ON DELETE CASCADE ON UPDATE CASCADE;
---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `guest` (
  `ID` int(3) NOT NULL auto_increment,
  `GID` varchar(3) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `itinerary` (
  `IID` int(3) NOT NULL auto_increment,
  `GID` varchar(3) NOT NULL,
  `FID` varchar(3) NOT NULL,
  `SID` varchar(3) NOT NULL,
  PRIMARY KEY  (`IID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=7 ;

ALTER TABLE `guest`
  ADD CONSTRAINT `guest_ibfk_1` FOREIGN KEY (`GID`) REFERENCES `itinerary` (`GID`) ON DELETE CASCADE ON UPDATE CASCADE;

