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

CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'testuser'@'%' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON `arma3life`.* TO 'arma3'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON `arma3life`.* TO 'arma3'@'%';


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
  `swatlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
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
  `rprank` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `alive` TINYINT(1) NOT NULL DEFAULT '0',
  `position` TEXT NULL DEFAULT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `security` tinyint(4) NOT NULL DEFAULT '0',
  `insurance` tinyint(4) NOT NULL DEFAULT '0',
  `hooks` tinyint(4) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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

CREATE TABLE IF NOT EXISTS `wanted` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

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
  `factor` int(12) NOT NULL DEFAULT '0',
  `shoptype` varchar(50) NOT NULL,
  PRIMARY KEY (`id`, `resource`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `economy` VALUES (1, 'apple', 200, 150, 1, 50, 150, 3, 'market');
INSERT INTO `economy` VALUES (3, 'heroin_processed', 4500, 2798, 2, 1480, 4050, 2, 'drugdealer');
INSERT INTO `economy` VALUES (4, 'salema_grilled', 100, 100, 2, 99, 100, 4, 'fishmarket');
INSERT INTO `economy` VALUES (5, 'ornate_grilled', 100, 100, 2, 53, 100, 4, 'fishmarket');
INSERT INTO `economy` VALUES (6, 'mackerel_grilled', 1000, 1000, 2, 382, 1000, 4, 'fishmarket');
INSERT INTO `economy` VALUES (7, 'tuna_grilled', 2000, 2000, 2, 1014, 2000, 4, 'fishmarket');
INSERT INTO `economy` VALUES (8, 'mullet_fried\r\n', 1000, 1000, 2, 343, 1000, 0, 'fishmarket');
INSERT INTO `economy` VALUES (9, 'catshark_fried', 1000, 1000, 2, 778, 1000, 4, 'fishmarket');
INSERT INTO `economy` VALUES (10, 'rabbit_grilled', 500, 500, 2, 80, 500, 0, 'market');
INSERT INTO `economy` VALUES (12, 'turtle_raw', 17000, 9918, 2, 6390, 15000, 0, 'raw');
INSERT INTO `economy` VALUES (13, 'waterBottle', 10, 10, 2, 5, 10, 0, 'market');
INSERT INTO `economy` VALUES (14, 'coffee', 10, 10, 2, 5, 10, 0, 'coffee');
INSERT INTO `economy` VALUES (15, 'turtle_soup', 2500, 2500, 2, 1000, 2500, 0, 'wongs');
INSERT INTO `economy` VALUES (16, 'donut', 120, 120, 2, 60, 120, 0, 'coffee');
INSERT INTO `economy` VALUES (17, 'marijuana', 4000, 2728, 2, 1480, 3500, 2, 'drugdealer');
INSERT INTO `economy` VALUES (18, 'tbacon', 500, 25, 2, 25, 500, 0, 'market');
INSERT INTO `economy` VALUES (19, 'lockpick', 1500, 1500, 2, 75, 1500, 0, 'rebel');
INSERT INTO `economy` VALUES (20, 'redgull', 1500, 1500, 2, 200, 1500, 0, 'market');
INSERT INTO `economy` VALUES (21, 'peach', 175, 50, 2, 50, 150, 3, 'market');
INSERT INTO `economy` VALUES (29, 'glass', 3000, 3000, 2, 1000, 3000, 3, 'glass');
INSERT INTO `economy` VALUES (30, 'fuelFull', 850, 850, 2, 300, 850, 0, 'market');
INSERT INTO `economy` VALUES (31, 'spikeStrip', 2500, 2500, 2, 1200, 2500, 0, 'cop');
INSERT INTO `economy` VALUES (33, 'goldbar', 100000, 95000, 150, 35000, 95000, 2, 'gold');
INSERT INTO `economy` VALUES (34, 'blastingcharge', 35000, 24996, 2, 15000, 35000, 0, 'rebel');
INSERT INTO `economy` VALUES (35, 'boltcutter', 7500, 7500, 2, 3000, 7500, 0, 'rebel');
INSERT INTO `economy` VALUES (36, 'defusekit', 2500, 2500, 2, 1500, 2500, 0, 'cop');
INSERT INTO `economy` VALUES (37, 'storagesmall', 75000, 70878, 2, 60000, 75000, 0, 'market');
INSERT INTO `economy` VALUES (38, 'storagebig', 150000, 131172, 2, 120000, 150000, 0, 'market');
INSERT INTO `economy` VALUES (39, 'pickaxe', 750, 750, 2, 500, 750, 0, 'market');
INSERT INTO `economy` VALUES (45, 'oil_unprocessed', 3500, 1500, 2, 500, 1500, 0, 'raw');
INSERT INTO `economy` VALUES (46, 'oil_processed', 3500, 3000, 2, 1500, 3000, 3, 'oil');
INSERT INTO `economy` VALUES (47, 'copper_unrefined', 150, 150, 2, 59, 150, 0, 'raw');
INSERT INTO `economy` VALUES (48, 'copper_refined', 3000, 2500, 2, 1000, 2500, 3, 'iron');
INSERT INTO `economy` VALUES (49, 'iron_unrefined', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (50, 'iron_refined', 3000, 2500, 2, 1000, 2500, 3, 'iron');
INSERT INTO `economy` VALUES (51, 'salt_unrefined', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (52, 'salt_refined', 3000, 2200, 2, 1000, 2500, 3, 'salt');
INSERT INTO `economy` VALUES (53, 'sand', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (55, 'diamond_uncut', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (56, 'diamond_cut', 3000, 2500, 2, 1000, 2500, 3, 'diamond');
INSERT INTO `economy` VALUES (57, 'rock', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (58, 'cement', 3000, 2500, 2, 1000, 2500, 3, 'cement');
INSERT INTO `economy` VALUES (59, 'mushroom', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (60, 'heroin_unprocessed', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (62, 'cannabis', 4000, 3500, 2, 2500, 3500, 0, 'raw');
INSERT INTO `economy` VALUES (64, 'cocaine_unprocessed', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (65, 'cocaine_processed', 5000, 4574, 2, 1950, 5000, 2, 'drugdealer');
INSERT INTO `economy` VALUES (66, 'froglsd', 4300, 2136, 2, 1480, 3800, 2, 'drugdealer');
INSERT INTO `economy` VALUES (67, 'Magicm', 1500, 1000, 2, 1000, 2500, 2, 'drugdealer');
INSERT INTO `economy` VALUES (68, 'ziptie', 1500, 900, 0, 1, 1500, 0, 'vigilante');
INSERT INTO `economy` VALUES (69, 'underwatercharge', 20000, 15000, 0, 1, 20000, 0, 'market');
INSERT INTO `economy` VALUES (70, 'goldbarp', 100000, 95000, 150, 70000, 95000, 3, 'market');
INSERT INTO `economy` VALUES (71, 'heliblastcharge', 25000, 20000, 0, 20000, 25000, 0, 'market');
INSERT INTO `economy` VALUES (72, 'lostcargo', 100000, 36090, 30, 5000, 100000, 0, 'market');
INSERT INTO `economy` VALUES (73, 'gpstracker', 15000, 0, 0, 0, 0, 0, 'market');
INSERT INTO `economy` VALUES (74, 'speedbomb', 50000, 0, 0, 0, 0, 0, 'rebel');
INSERT INTO `economy` VALUES (75, 'sheep_grilled', 35000, 25000, 250, 20000, 30000, 4, 'hunting');
INSERT INTO `economy` VALUES (76, 'goat_grilled', 35000, 25000, 250, 20000, 30000, 4, 'hunting');
INSERT INTO `economy` VALUES (77, 'rooster_grilled', 35000, 25000, 250, 20000, 30000, 0, 'hunting');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
