-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-02-23 17:51:33
-- 服务器版本： 5.5.40-log
-- PHP Version: 5.5.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crsql`
--

-- --------------------------------------------------------

--
-- 表的结构 `area_stats`
--

CREATE TABLE IF NOT EXISTS `area_stats` (
`Id` int(11) NOT NULL,
  `YEAR` date DEFAULT NULL,
  `KPI1` double(16,2) DEFAULT NULL,
  `KPI2` double(16,2) DEFAULT NULL,
  `KPI3` double(16,2) DEFAULT NULL,
  `KPI4` double(16,2) DEFAULT NULL,
  `DataCategory_DC_id` int(11) DEFAULT NULL,
  `DataCategory_KindName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `DataCategory`
--

CREATE TABLE IF NOT EXISTS `DataCategory` (
`DC_id` int(11) NOT NULL,
  `KindName` varchar(255) NOT NULL,
  `Level` varchar(255) DEFAULT NULL,
  `SubLevel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `DataCategory`
--

INSERT INTO `DataCategory` (`DC_id`, `KindName`, `Level`, `SubLevel`) VALUES
(3, '金融统计', '金融市场统计', NULL),
(4, '金融统计', '信贷收支统计', NULL),
(5, '经济统计', '投资', NULL),
(6, '经济统计', '国内贸易', NULL),
(7, '国内统计', '内蒙古', NULL),
(8, '国内统计', '四川省', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `eco_stats`
--

CREATE TABLE IF NOT EXISTS `eco_stats` (
`Id` int(11) NOT NULL,
  `YEAR` date DEFAULT NULL,
  `KPI1` double(16,2) DEFAULT NULL,
  `KPI2` double(16,2) DEFAULT NULL,
  `KPI3` double(16,2) DEFAULT NULL,
  `KPI4` double(16,2) DEFAULT NULL,
  `DataCategory_DC_id` int(11) DEFAULT NULL,
  `DataCategory_KindName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `eco_stats`
--

INSERT INTO `eco_stats` (`Id`, `YEAR`, `KPI1`, `KPI2`, `KPI3`, `KPI4`, `DataCategory_DC_id`, `DataCategory_KindName`) VALUES
(1, '2015-02-23', 51.00, 0.07, 0.01, 107.00, NULL, '四川省');

-- --------------------------------------------------------

--
-- 表的结构 `fin_stats`
--

CREATE TABLE IF NOT EXISTS `fin_stats` (
`Id` int(11) NOT NULL,
  `YEAR` date DEFAULT NULL,
  `KPI1` double(16,2) DEFAULT NULL,
  `KPI2` double(16,2) DEFAULT NULL,
  `KPI3` double(16,2) DEFAULT NULL,
  `KPI4` double(16,2) DEFAULT NULL,
  `DataCategory_DC_id` int(11) DEFAULT NULL,
  `DataCategory_KindName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fin_stats`
--

INSERT INTO `fin_stats` (`Id`, `YEAR`, `KPI1`, `KPI2`, `KPI3`, `KPI4`, `DataCategory_DC_id`, `DataCategory_KindName`) VALUES
(2, '2009-01-05', 999.99, 999.99, 999.99, 999.99, NULL, '信贷收支统计'),
(3, '2009-01-08', 999.99, 999.99, 999.99, 999.99, NULL, '信贷收支统计');

-- --------------------------------------------------------

--
-- 表的结构 `PaperCategory`
--

CREATE TABLE IF NOT EXISTS `PaperCategory` (
`PC_Id` int(11) NOT NULL,
  `KindName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `PaperData`
--

CREATE TABLE IF NOT EXISTS `PaperData` (
`PD_Id` int(11) NOT NULL,
  `PressDate` varchar(50) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Author_Source` varchar(255) DEFAULT NULL,
  `Press` varchar(255) DEFAULT NULL,
  `Keywords` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `PC_PD`
--

CREATE TABLE IF NOT EXISTS `PC_PD` (
  `PaperCategory_PC_Id` int(11) NOT NULL,
  `PaperCategory_KindName` varchar(255) NOT NULL,
  `PaperData_PD_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area_stats`
--
ALTER TABLE `area_stats`
 ADD PRIMARY KEY (`Id`), ADD KEY `Data3_DataCategory_FK` (`DataCategory_DC_id`,`DataCategory_KindName`);

--
-- Indexes for table `DataCategory`
--
ALTER TABLE `DataCategory`
 ADD PRIMARY KEY (`DC_id`,`KindName`);

--
-- Indexes for table `eco_stats`
--
ALTER TABLE `eco_stats`
 ADD PRIMARY KEY (`Id`), ADD KEY `Data2_DataCategory_FK` (`DataCategory_DC_id`,`DataCategory_KindName`);

--
-- Indexes for table `fin_stats`
--
ALTER TABLE `fin_stats`
 ADD PRIMARY KEY (`Id`), ADD KEY `Data1_DataCategory_FK` (`DataCategory_DC_id`,`DataCategory_KindName`);

--
-- Indexes for table `PaperCategory`
--
ALTER TABLE `PaperCategory`
 ADD PRIMARY KEY (`PC_Id`,`KindName`);

--
-- Indexes for table `PaperData`
--
ALTER TABLE `PaperData`
 ADD PRIMARY KEY (`PD_Id`);

--
-- Indexes for table `PC_PD`
--
ALTER TABLE `PC_PD`
 ADD PRIMARY KEY (`PaperCategory_PC_Id`,`PaperCategory_KindName`,`PaperData_PD_Id`), ADD KEY `FK_ASS_5` (`PaperData_PD_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area_stats`
--
ALTER TABLE `area_stats`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `DataCategory`
--
ALTER TABLE `DataCategory`
MODIFY `DC_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `eco_stats`
--
ALTER TABLE `eco_stats`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fin_stats`
--
ALTER TABLE `fin_stats`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `PaperCategory`
--
ALTER TABLE `PaperCategory`
MODIFY `PC_Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PaperData`
--
ALTER TABLE `PaperData`
MODIFY `PD_Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `area_stats`
--
ALTER TABLE `area_stats`
ADD CONSTRAINT `Data3_DataCategory_FK` FOREIGN KEY (`DataCategory_DC_id`, `DataCategory_KindName`) REFERENCES `DataCategory` (`DC_id`, `KindName`);

--
-- 限制表 `eco_stats`
--
ALTER TABLE `eco_stats`
ADD CONSTRAINT `Data2_DataCategory_FK` FOREIGN KEY (`DataCategory_DC_id`, `DataCategory_KindName`) REFERENCES `DataCategory` (`DC_id`, `KindName`);

--
-- 限制表 `fin_stats`
--
ALTER TABLE `fin_stats`
ADD CONSTRAINT `Data1_DataCategory_FK` FOREIGN KEY (`DataCategory_DC_id`, `DataCategory_KindName`) REFERENCES `DataCategory` (`DC_id`, `KindName`);

--
-- 限制表 `PC_PD`
--
ALTER TABLE `PC_PD`
ADD CONSTRAINT `FK_ASS_5` FOREIGN KEY (`PaperData_PD_Id`) REFERENCES `PaperData` (`PD_Id`),
ADD CONSTRAINT `FK_ASS_4` FOREIGN KEY (`PaperCategory_PC_Id`, `PaperCategory_KindName`) REFERENCES `PaperCategory` (`PC_Id`, `KindName`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
