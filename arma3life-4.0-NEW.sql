SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `arma3life`
-- Default Schema
--
CREATE DATABASE IF NOT EXISTS `arma3life` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `arma3life`;

DELIMITER $$
--
-- Procedures
-- Edit arma3 and root to match a user in MySQL
--
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE `vehicles` SET `active`= 0;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `alive` TINYINT(1) NOT NULL DEFAULT '0',
  `position` TEXT NULL DEFAULT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `gps` tinyint(4) NOT NULL DEFAULT '0',
  `trunk` tinyint(4) NOT NULL DEFAULT '0',
  `insurance` tinyint(4) NOT NULL DEFAULT '0',
  `hooks` tinyint(4) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wanted`
-- Needed for extDB latest update on git
--

CREATE TABLE `wanted` (
  `wantedID` varchar(50) NOT NULL,
  `wantedName` varchar(52) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `messages` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `fromID` varchar(50) NOT NULL,
  `toID` varchar(50) NOT NULL,
  `message` text,
  `fromName` varchar(32) NOT NULL,
  `toName` varchar(32) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13;

-- --------------------------------------------------------

--
-- Table structure for table `economy`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `economy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `buyprice` int(12) NOT NULL DEFAULT '1',
  `sellprice` int(12) NOT NULL DEFAULT '1',
  `varprice` int(12) NOT NULL DEFAULT '1',
  `minprice` int(12) NOT NULL DEFAULT '1',
  `maxprice` int(12) NOT NULL DEFAULT '1',
  `factor` int(12) NOT NULL DEFAULT '1',
  `shoptype` varchar(50) NOT NULL,
  PRIMARY KEY (`id`, `resource`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
