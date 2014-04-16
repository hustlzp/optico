-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2014-04-16 01:45:29
-- 服务器版本： 5.6.15
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `optico`
--

-- --------------------------------------------------------

--
-- 表的结构 `carousel`
--

CREATE TABLE IF NOT EXISTS `carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `image` varchar(100) DEFAULT NULL,
  `link_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10021 ;

--
-- 转存表中的数据 `carousel`
--

INSERT INTO `carousel` (`id`, `title`, `content`, `image`, `link_url`) VALUES
(10018, '', '', 'c10018.jpg', ''),
(10019, '', '', 'c10019.jpg', ''),
(10020, '', '', 'c10020_2.jpg', '');

-- --------------------------------------------------------

--
-- 表的结构 `mtype`
--

CREATE TABLE IF NOT EXISTS `mtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `show_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10010 ;

--
-- 转存表中的数据 `mtype`
--

INSERT INTO `mtype` (`id`, `name`, `image`, `show_order`) VALUES
(10000, 'Copper Series', 'm10000.png', 3),
(10001, 'Data Center Cabling', 'm10001_1.jpg', 0),
(10008, 'Passive Components', 'm10008_1.jpg', 1),
(10009, 'Active Components', 'm10009_1.jpg', 2);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `desc` text,
  `show_order` int(11) DEFAULT NULL,
  `stype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stype_id` (`stype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10116 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `desc`, `show_order`, `stype_id`) VALUES
(10000, 'FTP Cat.5e', 'p10000.jpg', '', 1, 10015),
(10005, 'UTP Cat.5e ', 'p10005.jpg', '', 0, 10015),
(10006, 'SFTP Cat.5e', 'p10006.jpg', '', 3, 10015),
(10011, 'MPO-MT Fiber Patch Cord', 'p10011.jpg', '', 6, 10000),
(10012, ' MPO mini Fanout Fiber Patch Cord', 'p10012_1.jpg', '', 4, 10000),
(10013, 'MPO/PC/APC Fiber Optical Patch cord', 'p10013.jpg', '', 7, 10000),
(10014, 'MPO 12/24/48/72Cores', 'p10014.jpg', '', 8, 10000),
(10015, 'MPO OM3 Fiber Patch Cord', 'p10015.jpg', '', 8, 10000),
(10016, 'MPO-LC Roundness Fanout Fiber Patch Cord', 'p10016.jpg', '', 0, 10000),
(10017, ' MPO-SC Ribbon fanout Fiber Patch Cord', 'p10017.jpg', '', 0, 10000),
(10018, 'MPO Module fanout Fiber Patch Cord', 'p10018.jpg', '', 0, 10000),
(10019, 'MTP 72Cores Ribbon Bare Fiber', 'p10019.jpg', '', 7, 10010),
(10020, 'MTP-MTP Patchcord', 'p10020.jpg', '', 8, 10010),
(10021, 'MTP SM 72Cores Fanout Patchcord', 'p10021_3.jpg', '', 7, 10010),
(10022, 'MTP OM4 Fiber Patch Cord', 'p10022.jpg', '', 0, 10010),
(10023, 'MTP loopback patch cord', 'p10023.jpg', '', 0, 10010),
(10024, 'MTP OM3/OM4 Ribbon Bare Fiber Patch Cord', 'p10024.jpg', '', 0, 10010),
(10025, 'MTP LOW Ribbon Fiber Patch Cord', 'p10025.jpg', '', 0, 10010),
(10026, 'MTP OM4 Fanout Patchcord', 'p10026.jpg', '', 0, 10010),
(10027, 'SC-FC Fiber Optical Patch Cord', 'p10027.jpg', '', 0, 10011),
(10028, ' FC-ST Fiber Optical Patch cord', 'p10028.jpg', '', 0, 10011),
(10030, 'LC-SC Fiber Optical Patch Cord', 'p10030.jpg', '', 0, 10011),
(10031, 'ST-SC Fiber Optical Patch Cord', 'p10031.jpg', '', 0, 10011),
(10032, 'MTRJ-FC Fiber Optical Patch cord', 'p10032.jpg', '', 0, 10011),
(10033, 'Waterproof Pigtail', 'p10033.jpg', '', 7, 10011),
(10034, 'PLC Splitter Device', 'p10034.jpg', '', 0, 10012),
(10035, 'PLC Splitter Mini Module', 'p10035.jpg', '', 0, 10012),
(10036, '1x32 & 2x32 Mini Module', 'p10036.jpg', '', 0, 10012),
(10037, 'PLC Splitter Module', 'p10037.jpg', '', 0, 10012),
(10038, 'LGX PLC Splitter', 'p10038.jpg', '', 0, 10012),
(10039, 'PLC Splitter Rack Mount', 'p10039.jpg', '', 0, 10012),
(10040, 'PLC Splitter with Tray', 'p10040.jpg', '', 0, 10012),
(10041, 'CWDM Mux/Demux Module', 'p10041.jpg', '', 1, 10013),
(10042, 'CWDM Devices', 'p10042.jpg', '', 0, 10013),
(10043, 'CWDM Optical Add/Drop Module', 'p10043.jpg', '', 2, 10013),
(10044, 'DWDM Mux/Demux Module', 'p10044.jpg', '', 0, 10014),
(10045, 'DWDM Optical Add/Drop Module', 'p10045.jpg', '', 0, 10014),
(10048, 'FTP Cat6', 'p10048.jpg', '', 5, 10015),
(10049, 'UTP Cat6', 'p10049.jpg', '', 4, 10015),
(10052, 'UTP Cat6A', 'p10052.jpg', '', 7, 10015),
(10053, 'SFTP Cat6A', 'p10053.jpg', 'Ideal Cable for 10GBase-T application\r\nComplies fully with new standards for Category 6A and Class EA\r\nSmall diameter\r\nGuaranteed performance up to 500MHz\r\nFully screened for alien crosstalk immunity\r\n', 8, 10015),
(10054, 'SSTP Cat6A', 'p10054.jpg', 'Ideal Cable for 10GBase-T application\r\nComplies fully with new standards for Category 6A and Class EA\r\nSmall diameter\r\nGuaranteed performance up to 500MHz\r\nFully screened for alien crosstalk immunity\r\n', 9, 10015),
(10055, 'Cat5e patch cord', 'p10055.jpg', '', 0, 10016),
(10057, 'Cat6 patch cord', 'p10057.jpg', '', 1, 10016),
(10058, 'Cat6a patch cord', 'p10058.jpg', '', 2, 10016),
(10062, 'Cat7 patch cord', 'p10062.jpg', '', 3, 10016),
(10063, 'DWDM Devices', 'p10063.jpg', '', 0, 10014),
(10064, 'SC/LC/ST pigtail', 'p10064.jpg', '', 5, 10011),
(10065, 'Athermal AWG DWDM Module', 'p10065.jpg', '', 0, 10027),
(10066, 'SC Fiber Optic Attenuator', 'p10066.jpg', 'The SC fiber optic attenuator is equipped with male-to-female type plug.It can provide a stable attenuation from 1 to 20db at both 1310nm and 1550nm transmission windows.This attenuator is compliant with IEC 60869-1 and fully compatible with all SC connectors an adaptors.', 0, 10029),
(10067, 'FC Fiber Optic Attenuator', 'p10067.jpg', 'The FC series fiber optic attenuator can provide a stable attenuation from 1 to 20dB at both 1310nm and 1550nm transmission windows.The plug type of this attenuator is male-to-female.It is compliant with IEC 60869-1 and fully compatible with all FC connector and adaptors.', 0, 10029),
(10068, 'ST Fiber Optic Attenuator', 'p10068.jpg', 'The ST fiber optic attenuator can provide a stable attenuation from 1 to 20dB at both 1310nm and 1550nm transmisssion windows.The plug type of this attenuator is male-to-female.Our ST fiber optic attenuator features excellent performance and is compliant with IEC 60869-1 and fully compatible with all ST connector and adaptors.', 0, 10029),
(10069, 'LC Fiber Optic Attenuator', 'p10069.jpg', 'The LC fiber optic attenuator can provide a stable attenuation from 1 to 20dB at both 1310nm and 1550nm transmission windows.The plug type of this attenuator is male-to-female.Our LC fiber optic attenuator features excellent penrfomance and is compliant with IEC 60869-1 and fully compatible with all LC connector an adaptors.', 0, 10029),
(10071, 'SC Series', 'p10071.jpg', '', 0, 10020),
(10072, 'FC Series', 'p10072.jpg', '', 0, 10020),
(10073, 'ST Series', 'p10073.jpg', '', 0, 10020),
(10074, 'LC Series', 'p10074.jpg', '', 0, 10020),
(10075, 'SC To LC Fiber Optic Adaptor', 'p10075.jpg', '', 0, 10020),
(10076, 'SC Male to LC Fiber Optic Adaptor', 'p10076.jpg', '', 0, 10020),
(10077, 'SC/UPC Fast Assembly Optical Connector ', 'p10077.jpg', '', 0, 10030),
(10080, 'SC/APC Fast Connectors ', 'p10080.jpg', '', 0, 10030),
(10081, '1310 DFB Coaxial Pigtail 2.5G Laser Diode 1-4mW', 'p10081.jpg', '', 0, 10031),
(10082, '1310 DFB Coaxial Pigtail 2.5G Laser Diode 4-8mW', 'p10082.jpg', '', 0, 10031),
(10083, '1310 FP Coaxial Pigtail Laser Diode', 'p10083.jpg', '', 0, 10031),
(10084, '1310 DFB Coaxial Butterfly Laser Diode', 'p10084.jpg', '', 0, 10031),
(10085, '1550 DFB Coaxial Butterfrly Laser Diode ', 'p10085.jpg', '', 0, 10031),
(10086, 'SFTP Cat.6', 'p10086.jpg', '', 6, 10015),
(10087, 'SSTP Cat.7', 'p10087.jpg', '', 11, 10015),
(10088, 'Flat patch cord', 'p10088.jpg', '', 5, 10016),
(10089, 'Cat5e patch panel', 'p10089.jpg', '', 0, 10017),
(10090, 'Cat6 patch panel', 'p10090.jpg', '', 2, 10017),
(10091, 'Cat6a patch panel', 'p10091.jpg', 'Compatible with 10G Keystone jack', 3, 10017),
(10092, 'Cat5e keystone jack', 'p10092.jpg', '', 0, 10018),
(10093, 'Cat6 keystone jack', 'p10093.jpg', '', 2, 10018),
(10094, 'Cat6a keystone jack', 'p10094.jpg', '', 3, 10018),
(10095, 'Single Mode Wavelength Independent Tree Splitters ', 'p10095.jpg', '', 0, 10021),
(10096, 'Single Mode Three Windows Wavelength Independent C', 'p10096.jpg', '', 0, 10021),
(10097, 'CATV wireless transmitter with receiver', 'p10097.jpg', '', 60, 10022),
(10098, 'CATV-EDFA', 'p10098.jpg', '', 70, 10022),
(10100, 'GEPON OLT Transceiver', 'p10100.jpg', '', 5, 10034),
(10101, '10/100M ONU', 'p10101.jpg', '', 0, 10026),
(10103, '10/100M+10/100/1000M ONU', 'p10103.jpg', '', 2, 10026),
(10104, '10/100M+10/100/1000M ONU', 'p10104.jpg', '', 2, 10026),
(10105, 'GEPON OLT', 'p10105.jpg', '', 0, 10032),
(10106, '10/100M Media Converter', 'p10106.jpg', '10/100M adaptive fast Ethernet optical media converter is a new product used for optical transmission via high-speed Ethernet. It is capable of switching between twisted pair and optical and relaying across 10/100 Base-TX and 100 Base-Fx network segments, meeting long-distance, high-speed and high-broadband fast Ethernet workgroup users’ needs, achieving high-speed remote interconnection for up to 120 km''s relay-free computer data network. ', 0, 10033),
(10107, '1.25Gbps  SFP Transceiver,  550M', 'p10107.jpg', '', 0, 10034),
(10108, '1.25Gbps  SFP Transceiver,  10KM', 'p10108.jpg', '', 1, 10034),
(10109, '10&100&1000M Media Converter', 'p10109.jpg', '10/100/1000M adaptive fast Ethernet optical Media Converter is a new product used for optical transmission via high-speed Ethernet. It is capable of switching between twisted pair and optical and relaying across 10/100 Base-TX/1000 Base-Fx and 1000Base-FX network segments, meeting long-distance, high-speed and high-broadband fast Ethernet workgroup users’ needs, achieving high-speed remote interconnection for up to 100 km''s relay-free computer data network.', 1, 10033),
(10110, '10Gbps  1310nm  SFP+   10KM', 'p10110.jpg', '', 3, 10034),
(10111, '10Gbps  850nm  SFP+ 220M', 'p10111.jpg', '', 4, 10034),
(10112, '1000M Media Converter ', 'p10112.jpg', '1000M adaptive fast Ethernet optical Media Converter is a new product used for optical transmission via high-speed Ethernet. It is capable of switching between twisted pair and optical and relaying across 1000 Base-Tx and 1000Base-FX network segments, meeting long-distance, high-speed and high-broadband fast Ethernet workgroup users’ needs, achieving high-speed remote interconnection for up to 100 km''s relay-free computer data network. ', 3, 10033),
(10113, 'RJ 45 Connector', 'p10113.jpg', '', 0, 10028),
(10114, 'Face Plate', 'p10114.jpg', '', 2, 10028),
(10115, 'Surface Mount Box', 'p10115.jpg', '', 3, 10028);

-- --------------------------------------------------------

--
-- 表的结构 `product_paramter`
--

CREATE TABLE IF NOT EXISTS `product_paramter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `value` text,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10295 ;

--
-- 转存表中的数据 `product_paramter`
--

INSERT INTO `product_paramter` (`id`, `key`, `value`, `product_id`) VALUES
(10013, 'FEATURES', '* TIA/EIA-568B.2-1\r\n* ISO/IEO 11801\r\n* NEC/CEC\r\n* Fire protection – IEC60332-1 (CM)\r\n* Application: Horizontal communication cable\r\n* Cable is used for indoor installation\r\n', 10000),
(10016, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.52mm±0.005mm (24AWG)\r\n* Pair Insulation: Polyethylene\r\n* Shielding: Aluminum-Polyester Foil,110% Coverage\r\n* Outer Cable Diameter: 5.5 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC\r\n* Jacket Color:Grey RAL 9002 or as per request\r\n', 10000),
(10017, 'FEATURES', '* TIA/EIA-568B.2-1\r\n* ISO/IEO 11801\r\n* NEC/CEC\r\n* Fire protection – IEC60332-1 (CM)\r\n* Cable is used for indoor installation\r\n', 10005),
(10018, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.51mm±0.005mm (24AWG)\r\n* Pair Insulation: Polyethylene\r\n* Unshielded\r\n* Outer Cable Diameter: 5.2 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC\r\n* Jacket Color:Grey RAL 9002 or as per request\r\n', 10005),
(10019, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10005),
(10020, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel\r\n', 10005),
(10026, 'Features', '* 8-12 core fiber available     \r\n* Cross Connection : AB/BA \r\n* Paralled Connection : AB/AB  \r\n* Small volume, easy management  \r\n* Insertion Loss : Low  IL & Standard IL available \r\n* Can customize connection method as QSFP requirements', 10011),
(10028, 'Area of application  ', '* Telecom system \r\n* Cabling system \r\n* High Density optical laser \r\n* QSFP devices', 10011),
(10029, 'Specifications', '|item|SM|MIM|\r\n|Insertion|<0.3dB <0.7dB|<0.5dB <0.7dB|\r\n|Return loss| ＞60dB|＞35dB|\r\n|Fiber diameter|9/125um|50/125um、62.5/125um、OM3|\r\n|Insert- pull test|\\2. 500times＜0.5 dB|\r\n|Operation temperature|\\2. -40℃～+80℃|', 10011),
(10031, 'Ordering Information', '* Supply SM,MM, Simplex connector \r\n* Supply 4,8,12,24 cores connector \r\n* MPO male pin available ( SM or MM ) \r\n* Can customize MT-MT Patch Cord as customer requirements \r\n', 10011),
(10032, 'Features', '* 8-12 core fiber available     \r\n* Cross Connection : AB/BA \r\n* Paralled Connection : AB/AB  \r\n* Small volume, easy management  \r\n* Insertion Loss : Low  IL & Standard IL available \r\n* Can customize connection method as QSFP requirements', 10012),
(10033, 'Area of application  ', '* Telecom system \r\n* Cabling system \r\n* High Density optical laser \r\n* QSFP devices\r\n', 10012),
(10034, 'Specifications', '|item|SM|MIM|\r\n|Insertion|<0.3dB <0.7dB|<0.5dB <0.7dB|\r\n|Return loss| ＞60dB|＞35dB|\r\n|Fiber diameter|9/125um|50/125um、62.5/125um、OM3|\r\n|Insert- pull test|\\2. 500times＜0.5 dB|\r\n|Operation temperature|\\2. -40℃～+80℃|', 10012),
(10035, 'Ordering Information', '* Supply SM,MM, Simplex connector \r\n* Supply 4,8,12,24 cores connector \r\n* MPO male pin available ( SM or MM ) \r\n* Can customize MT-MT Patch Cord as customer requirements \r\n', 10012),
(10036, 'Features', '* Single mode and multi mode (flat)APC(catercorner 8 degree angled)available \r\n* High fiber density (maximum 24 fibers for Multimode) \r\n* Fiber in single connector: 4, 8, 12 24 \r\n* Insert/Pull latching connector \r\n* High reflection loss with APC \r\n* Comply with Telcordia GR-1435-CORE specification and RoHS standard \r\n', 10013),
(10037, 'Area of application  ', '* Telecom system \r\n* Cabling system \r\n* High Density optical laser \r\n* QSFP devices\r\n', 10013),
(10038, 'Specifications', '|item|Single mode|Multi mode|\r\n|Fiber diameter|9/125 um|62.5/125um 50/125um|\r\n|Insertion loss| PC＜0.5dB  APC＜0.4dB|PC＜0.4dB|\r\n|Return loss|PC＞45 dB  APC＞55dB|PC＞45 dB  APC＞55dB|\r\n|Insert-pull test|\\2. 1000 times＜0.5 dB|\r\n|Interchange|\\2. ＜0.5 dB|\r\n|Operating temperature|\\2. -40℃ ~ +80℃|\r\n|Anti-tensile force|\\2. 15kgf|', 10013),
(10039, 'Ordering Information', '|MPO Type|MPO/PC/APC to|MPO/PC MPO ST SC FC LC MU MTRJ(Duplex)(PC/UPC/APC)|SM/MM 4,8,12,24Core fiber|', 10013),
(10040, 'Features', '* Small volume\r\n*  12/24/48/72 cores available, high density\r\n* Easy management\r\n*  Facilitate the inside connection of equipment\r\n* Pin fixed position(low loss)\r\n* Low loss (maximum1.0db)\r\n* Comply with Telcordia GR-326-CORE Specification and  RoHS Standard\r\n', 10014),
(10041, 'Area of application  ', '* Telecom system \r\n* Cabling system \r\n* High Density optical laser \r\n* QSFP devices\r\n', 10014),
(10042, 'Specifications', '|Item|Multi mode| \r\n|Fiber diameter|62.5/125um 50/125um&OM3| \r\n|Insertion loss| ＜0.7 dB/1dB |\r\n|Return loss|>30 dB| \r\n|Insert- pull test|500次＜1dB| \r\n|Operation temperature|-40℃～+80℃|\r\n|Tensile Resistance|10N|\r\n', 10014),
(10043, 'Ordering Information', '|MTP Type|MTP、ST SC、FC、LC、MU、MTRJ|MM,12/24/48/72 Cores Patch Cords|', 10014),
(10044, 'Features', '* High fiber density (maximum 24 fibers for Multimode) \r\n* Cross Connection : AB/BA\r\n* Paralled Connection : AB/AB\r\n* Small volume, easy management\r\n* Can customize connection method as QSFP requirements', 10015),
(10045, 'Area of application  ', '* Telecom system \r\n* Cabling system\r\n* High Density optical laser\r\n* QSFP devices\r\n', 10015),
(10046, 'Specifications', '|Item|SM|MM|\r\n|Insertion loss|<0.3dB <0.7 dB|<0.5dB <0.7 dB|\r\n|Return loss|＞60dB|＞35dB| \r\n|Fiber diameter|9/125um|50/125um、62.5/125um、OM3|\r\n|Insert- pull test|\\2. 500times＜0.5 dB| \r\n|Operation temperature|\\2. -40℃～+80℃| \r\n', 10015),
(10047, 'Ordering Information', '* Supply SM,MM, Simplex connector \r\n* Supply 4,8,12,24 cores connector \r\n* MPO male pin available ( SM or MM ) \r\n* Can customize MT-MT Patch Cord as customer requirements\r\n', 10015),
(10048, 'Features', '* 8-12 core fiber available     \r\n* Cross Connection : AB/BA \r\n* Paralled Connection : AB/AB  \r\n* Small volume, easy management  \r\n* Insertion Loss : Low  IL & Standard IL available \r\n* Can customize connection method as QSFP requirements', 10016),
(10049, 'Area of application  ', '* Telecom system \r\n* Cabling system \r\n* High Density optical laser \r\n* QSFP devices\r\n', 10016),
(10051, 'Specifications', '|Item|SM|MM| \r\n|Insertion loss|<0.3dB <0.7 dB|<0.5dB <0.7 dB|\r\n|Return loss|＞60dB|＞35dB|\r\n|Fiber diameter|9/125um|50/125um、62.5/125um、OM3|\r\n|Insert- pull test|\\2. 500times＜0.5 dB|\r\n|Operation temperature|\\2. -40℃～+80℃|\r\n', 10016),
(10052, 'Ordering Information', '* Supply SM,MM, Simplex connector \r\n* Supply 4,8,12,24 cores connector \r\n* MPO male pin available ( SM or MM ) \r\n* Customized fiber sequence and fan-out are avaliable\r\n', 10016),
(10053, 'Features', '* 8-12 core fiber available     \r\n* Cross Connection : AB/BA \r\n* Paralled Connection : AB/AB  \r\n* Small volume, easy management  \r\n* Insertion Loss : Low  IL & Standard IL available \r\n* Can customize connection method as QSFP requirements', 10017),
(10054, 'Area of application', '* Telecom system \r\n* Cabling system \r\n* High Density optical laser \r\n* QSFP devices\r\n', 10017),
(10055, 'Specifications', '|Item|SM|MM| \r\n|Insertion loss|<0.3dB <0.7 dB|<0.5dB <0.7 dB|\r\n|Return loss|＞60dB|＞35dB|\r\n|Fiber diameter|9/125um|50/125um、62.5/125um、OM3|\r\n|Insert- pull test|\\2. 500times＜0.5 dB|\r\n|Operation temperature|\\2. -40℃～+80℃|', 10017),
(10056, 'Ordering Information', '* Supply SM,MM, Simplex connector \r\n* Supply 4,8,12,24 cores connector \r\n* MPO male pin available ( SM or MM ) \r\n* Customized fiber sequence and fan-out are avaliable', 10017),
(10057, 'Features', '* 8-12 core fiber available     \r\n* Cross Connection : AB/BA \r\n* Paralled Connection : AB/AB  \r\n* Small volume, easy management  \r\n* Insertion Loss : Low  IL & Standard IL available \r\n* Can customize connection method as QSFP requirements', 10018),
(10058, 'Area of application  ', '* Telecom system \r\n* Cabling system \r\n* High Density optical laser \r\n* QSFP devices\r\n', 10018),
(10059, 'Specifications', '|Item|SM|MM| \r\n|Insertion loss|<0.3dB <0.7 dB|<0.5dB <0.7 dB|\r\n|Return loss|＞60dB|＞35dB|\r\n|Fiber diameter|9/125um|50/125um、62.5/125um、OM3|\r\n|Insert- pull test|\\2. 500times＜0.5 dB|\r\n|Operation temperature|\\2. -40℃～+80℃|', 10018),
(10060, 'Ordering Information', '* Supply SM,MM, Simplex connector \r\n* Supply 4,8,12,24 cores connector \r\n* MPO male pin available ( SM or MM ) \r\n* Customized fiber sequence and fan-out are avaliable', 10018),
(10061, 'Features', '* Small volume\r\n* 72 cores, high density\r\n* Easy management\r\n* Facilitate the inside connection of equipment\r\n* Pin fixed position(low loss)\r\n* Low loss (maximum1.0db)\r\n* Comply with Telcordia GR-326-CORE Specification and  RoHS Standard', 10019),
(10062, 'Specifications', '|Item|Multi mode| \r\n|Fiber diameter| 62.5/125um 50/125um&OM3| \r\n|Insertion loss| ＜0.7 dB/1dB| \r\n|Return loss|           >30 dB |\r\n|Insert- pull test| 500times＜1dB|   \r\n|Operation temperature| -40℃～+80℃| \r\n|Tensile Resistance| 10N| \r\n', 10019),
(10063, 'Ordering Information', '|MTP Type| MTP/PCTO|MTP、ST SC、FC、LC、MU、MTRJ |MM,,72 Cores Patch Cords|', 10019),
(10066, 'Feature', '* SM or MM available; PC(plane) or APC(8 degree) available \r\n* Different IL index and various color available\r\n* Stable performance index by PIN fiexed position of connecting\r\n* 4，8，12......72Cores for one connecter available\r\n* Maximum can be 288 cores each patchcord\r\n* Plug type connector with locking structure\r\n* High density which convenient for wiring and management system\r\n* Comply with Telcordia GR-1435-CORE  and RoHS standard', 10020),
(10067, 'Performance Index', '|Type |SM| MM |\r\n|Fiber Diameter |9/125um |62.5/125um 50/125um |\r\n|Insertion Loss(dB)| <0.3/<0.5/<0.7dB |<0.5/＜0.7 dB |\r\n|Return Loss(dB) |                  >60dB| >30 dB| \r\n|Insert-pull Test |\\2. 500Times＜0.5 dB |\r\n|Opearting Temperature(℃ |\\2. -40℃～+80℃ |\r\n|Tensile Resistance |\\2. 15kgf |', 10020),
(10068, 'Ordering Information', '|MTP Type |MTP/PC、APC TO| MTP、ST SC、FC、LC、MU、MTRJ(duplex) （PC/UPC/APC）| SM: 4,8,12Cores; MM: 4，8，12......72Cores |', 10020),
(10071, 'Features', '* SM or MM available; PC(plane) or APC(8 degree) available \r\n* Different IL index and various color available\r\n* Stable performance index by PIN fiexed position of connecting\r\n* 4，8，12......72Cores for one connecter available\r\n* Maximum can be 288 cores each patchcord\r\n* Plug type connector with locking structure\r\n* High density which convenient for wiring and management system Comply with * Telcordia GR-1435-CORE  and RoHS standard', 10021),
(10072, 'Performance Index', '|Type |SM| MM |\r\n|Fiber Diameter |9/125um |62.5/125um 50/125um |\r\n|Insertion Loss(dB)| <0.3/<0.5/<0.7dB |<0.5/＜0.7 dB |\r\n|Return Loss(dB) |                  >60dB| >30 dB| \r\n|Insert-pull Test |\\2. 500Times＜0.5 dB |\r\n|Opearting Temperature(℃ |\\2. -40℃～+80℃ |\r\n|Tensile Resistance |\\2. 15kgf |', 10021),
(10073, 'Ordering Information', '|MTP Type| MTP/PC、APC TO |MTP、ST SC、FC、LC、MU、MTRJ(duplex) （PC/UPC/APC） |SM: 4,8,12Cores; MM: 4，8，12......72Cores |', 10021),
(10074, 'Features', '* Multimode（Plane）transmission distance reached 550 meters\r\n* Violet and Aqua color cable available\r\n* Different IL index and various color available \r\n* table performance index by PIN fiexed position of connecting\r\n* 4，8，12......72Cores for one connecter available\r\n* Maximum can be 288 cores each patchcord\r\n* Plug type connector with locking structure\r\n* High density which convenient for wiring and management system Comply with Telcordia GR-1435-CORE  and RoHS standard', 10022),
(10075, 'Performance Index', '|Type |SM| MM |\r\n|Fiber Diameter |9/125um |62.5/125um 50/125um |\r\n|Insertion Loss(dB)| <0.3/<0.5/<0.7dB |<0.5/＜0.7 dB |\r\n|Return Loss(dB) |                  >60dB| >30 dB| \r\n|Insert-pull Test|\\2. 500Times＜0.5 dB |\r\n|Opearting Temperature(℃ |\\2. -40℃～+80℃ |\r\n|Tensile Resistance |\\2. 15kgf |', 10022),
(10076, 'Ordering Information', '|MTP Type| MTP/PC、APC TO |MTP、ST SC、FC、LC、MU、MTRJ(duplex)（PC/UPC/APC） |SM /MM 4，8，12，24,48,72 Cores |', 10022),
(10077, 'Features', '* SM or MM available; PC(plane) or APC(8 degree) available \r\n* Different IL index and various color available\r\n* Stable performance index by PIN fiexed position of connecting\r\n* Standard Fiber arrangement or customized\r\n* Plug type connector with locking structure\r\n* High density which convenient for wiring and management system Comply with Telcordia GR-1435-CORE  and RoHS standard   \r\n', 10023),
(10078, 'Area of applications', '* telecom network \r\n* System cabling\r\n* Precision telecom equipments \r\n* Cable loopback inspection \r\n', 10023),
(10079, 'Performance Index', '|Type |SM| MM |\r\n|Fiber Diameter |9/125um |62.5/125um 50/125um |\r\n|Insertion Loss(dB)| <0.3/<0.5/<0.7dB |<0.5/＜0.7 dB |\r\n|Return Loss(dB) |                  >60dB| >30 dB| \r\n|Insert-pull Test |\\2. 500Times＜0.5 dB |\r\n|Opearting Temperature(℃ |\\2. -40℃～+80℃ |\r\n|Tensile Resistance |\\2. 15kgf |', 10023),
(10080, 'Ordering Information', '|MTP Type| MTP/PC、APC TO |MTP、ST SC、FC、LC、MU、MTRJ(duplex) （PC/UPC/APC） |SM: 4,8,12Cores; MM: 4，8，12......72Cores |', 10023),
(10081, 'Features', '* 8 cores or 12 cores ribbon fiber \r\n* Different IL index and various color available \r\n* Multi cores with small dimension \r\n* Maximum can be 72 cores for one single connector \r\n* Plug type connector with locking structure \r\n* High density which convenient for wiring and management system Comply with Telcordia GR-1435-CORE  and RoHS standard', 10024),
(10082, 'Area of applications', '* telecom network\r\n* System cabling\r\n* Precision telecom equipments \r\n* Precision  optical laser\r\n', 10024),
(10083, 'Performance Index', '|Type |SM| MM |\r\n|Fiber Diameter |9/125um |62.5/125um 50/125um |\r\n|Insertion Loss(dB)| <0.3/<0.5/<0.7dB |<0.5/＜0.7 dB |\r\n|Return Loss(dB) |                  >60dB| >30 dB| \r\n|Insert-pull Test |\\2. 500Times＜0.5 dB |\r\n|Opearting Temperature(℃ |\\2. -40℃～+80℃ |\r\n|Tensile Resistance |\\2. 15kgf |', 10024),
(10084, 'Ordering Information', '|MTP Type| MTP/PC、APC TO |MTP、ST SC、FC、LC、MU、MTRJ(duplex) （PC/UPC/APC）| SM /MM 4，8，12，24,48,72 Cores |', 10024),
(10085, 'Features', '* 8 cores or 12 cores ribbon fiber \r\n* Different IL index and various color available \r\n* Multi cores with small dimension \r\n* Maximum can be 72 cores for one single connector \r\n* Plug type connector with locking structure \r\n* High density which convenient for wiring and management system Comply with Telcordia GR-1435-CORE  and RoHS standard', 10025),
(10086, 'Area of applications', '* telecom network\r\n* System cabling\r\n* Precision telecom equipments \r\n* Precision  optical laser\r\n', 10025),
(10087, 'Performance Index', '|Type |SM| MM |\r\n|Fiber Diameter |9/125um |62.5/125um 50/125um |\r\n|Insertion Loss(dB)| <0.3/<0.5/<0.7dB |<0.5/＜0.7 dB |\r\n|Return Loss(dB) |                  >60dB| >30 dB| \r\n|Insert-pull Test |\\2. 500Times＜0.5 dB |\r\n|Opearting Temperature(℃ |\\2. -40℃～+80℃ |\r\n|Tensile Resistance |\\2. 15kgf |', 10025),
(10088, 'Ordering Information', '|MTP Type| MTP/PC、APC TO |MTP、ST SC、FC、LC、MU、MTRJ(duplex) （PC/UPC/APC）| SM: 4,8,12Cores; MM: 4，8，12......72Cores |', 10025),
(10089, 'Features', '* SM or MM available; PC(plane) or APC(8 degree) available \r\n* Different IL index and various color available\r\n* Stable performance index by PIN fiexed position of connecting\r\n* 4，8，12......72Cores for one connecter available\r\n* Maximum can be 288 cores each patchcord\r\n* Plug type connector with locking structure\r\n* High density which convenient for wiring and management system Comply with Telcordia GR-1435-CORE  and RoHS standard', 10026),
(10090, 'Performance Index', '|Type |SM| MM |\r\n|Fiber Diameter |9/125um |62.5/125um 50/125um |\r\n|Insertion Loss(dB)| <0.3/<0.5/<0.7dB |<0.5/＜0.7 dB |\r\n|Return Loss(dB) |                  >60dB| >30 dB| \r\n|Insert-pull Test |\\2. 500Times＜0.5 dB |\r\n|Opearting Temperature(℃ |\\2. -40℃～+80℃ |\r\n|Tensile Resistance |\\2. 15kgf |', 10026),
(10091, 'Ordering Information', '|MTP Type |MTP/PC TO| MTP、ST SC、FC、LC、MU、MTRJ(duplex) （PC/UPC）| SM: 4,8,12Cores; MM: 4，8，12......72Cores |', 10026),
(10092, 'Features', '* Insert-pull, key-oriented coupling mechanism which allows high repeatable, low-loss connection \r\n* Simplex ,Duplex and Multi-core accessories for standard or customized structure. \r\n* PC/UPC/APC polish \r\n* Comply with Telcordia GR-326-CORE Specification \r\n* The material of plastic plug comply with the request of UL94V-O And Standard of RoHS \r\n', 10027),
(10093, 'Specifications', '|Item| Single mode |Multi mode|\r\n|Fiber diameter |9/125um|62.5/125um 50/125um|\r\n|Insertion loss| PC＜0.3dB APC＜0.2dB |PC＜0.3 dB| \r\n|Return loss| PC＞45 dB APC＞60 dB| PC＞25 dB |\r\n|Insert–pull test|\\2. (1000 times)＜0.3 dB |\r\n|Interchange| ＜0.2 dB |\r\n|Operation temperature|\\2.  -40℃ ~ +80℃ |\r\n|Anti-tensile force|\\2. 15kgf |', 10027),
(10094, 'Ordering Information', '|SC Type |SC/PC/APC TO| SC ST FC LC MU MTRJ (Duplex) MPO(PC/UPC/APC) |SM/MM Patch cords/Simplex/Duplex |0.9 1.8 2.0 3.0mm boot |', 10027),
(10098, 'Features', '* Screw coupling mechanism which allows high repeatable, low-loss connection \r\n* Simplex,Duplex,and Multi-core accessories apply for the standard and customized  structure \r\n* PC or APC polish \r\n* Comply with Telcordia GR-326-CORE specification and RoHS Standard \r\n', 10028),
(10099, 'Specifications', '|Item| Single mode |Multi mode|\r\n|Fiber diameter |9/125um|62.5/125um 50/125um|\r\n|Insertion loss| PC＜0.3dB APC＜0.2dB |PC＜0.3 dB| \r\n|Return loss| PC＞45 dB APC＞60 dB| PC＞25 dB |\r\n|Insert–pull test|\\2. (1000 times)＜0.3 dB |\r\n|Interchange|\\2. ＜0.2 dB |\r\n|Operation temperature|\\2. -40℃ ~ +80℃ |\r\n|Anti-tensile force|\\2. 15kgf |', 10028),
(10100, 'Ordering Information', '|FC Type| FC/PC/APC TO |FC ST SC LC MU MTRJ(Duplex)MPO (PC、UPC、APC) |SM/MM Patch cords/Simplex/Duplex |0.9 1.8 2.0 3.0mm boot |', 10028),
(10102, 'Features', '* Small Form connector- half size of standard connectors(SC ST FC) \r\n* Simplex and duplex assemblies available in standard and customized connector \r\n* PC or APC Polish \r\n* Comply with Telcordia GR-326-CORE specification and RoHS Standard ', 10030),
(10103, 'Specifications', '|Item| Single mode |Multi mode|\r\n|Fiber diameter |9/125um|62.5/125um 50/125um|\r\n|Insertion loss| PC＜0.3dB APC＜0.2dB |PC＜0.3 dB| \r\n|Return loss| PC＞45 dB APC＞60 dB| PC＞25 dB |\r\n|Insert–pull test|\\2. (1000 times)＜0.3 dB |\r\n|Interchange|\\2. ＜0.2 dB |\r\n|Operation temperature|\\2. -40℃ ~ +80℃ |\r\n|Anti-tensile force|\\2. 15kgf |', 10030),
(10104, 'Ordering Information', '|LC Type| LC/PC/UPC/APC to |LC ST SC FC MU MTRJ(Duplex)MPO (PC/UPC/APC) |SM/MM Patch cords/Simplex/Duplex |0.9 2.0 3.0 mm boot |', 10030),
(10113, 'Features', '* Twist-lock bayonet coupling mechanism which ensures quick, highly repeatable, low-loss connection  \r\n* Simplex, duplex, and multi-ply fiber assemblies used for standard and customized shape configuration. \r\n* Single mode & Multi mode PC/UPC Polish \r\n* Comply with Telcordia GR-326-CORE specification and RoHS Standard ', 10031),
(10114, 'Specifications', '|Item| Single mode |Multi mode|\r\n|Fiber diameter |9/125um|62.5/125um 50/125um|\r\n|Insertion loss| PC＜0.3dB|PC＜0.3 dB| \r\n|Return loss|SM PC＞45 dB |SM PC＞25 dB |\r\n|Insert–pull test|\\2. (1000 times)＜0.3 dB |\r\n|Interchange|\\2. ＜0.2 dB |\r\n|Operation temperature|\\2.  -40℃ ~ +80℃ |\r\n|Anti-tensile force|\\2. 15kgf |', 10031),
(10115, 'Features', '* MT style ferrule with RJ-45 style housing with insert-pull coupling mechanism which easy used for insert - pull of coarctation space \r\n* One ferrule accommodates two fibers \r\n* Small form connector - Half size of duplex SC connectors \r\n* Duplex accessories available in standard and customized structure \r\n* Comply with Telcordia GR-326-CORE specification and RoHS Standard \r\n', 10032),
(10116, 'Specifications', '|Item| Single mode |Multi mode|\r\n|Fiber diameter |9/125um|62.5/125um 50/125um|\r\n|Insertion loss| PC＜0.3dB |PC＜0.7 dB| \r\n|Return loss| PC＞40 dB | PC＞25 dB |\r\n|Insert–pull test| \\2. (1000 times)＜0.3 dB |\r\n|Operation temperature|\\2.  -40℃ ~ +80℃ |\r\n|Anti-tensile force|\\2. 15kgf |', 10032),
(10117, 'Ordering Information', '|MTRJ Type| MTRJ/PC TO| MTRJ(Duplex)MU ST SC FC LC MPO(PC/UPC/APC) |SM/MM Patch cords/Duplex |2.0 mm boot|', 10032),
(10118, 'Features', '* Low insertion loss , high return loss \r\n* General use waterproof, adapt for outdoor hard environment \r\n* Easy to install, high reliability \r\n* 2,4,6 cores available ', 10033),
(10119, 'Specifications', '|Item| Single mode |Multi mode|\r\n|Fiber diameter |9/125um|62.5/125um 50/125um|\r\n|Insertion loss| PC＜0.3dB APC＜0.2dB |PC＜0.3 dB| \r\n|Return loss| PC＞45 dB APC＞60 dB| PC＞25 dB |\r\n|Insert–pull test|\\2. (1000 times)＜0.3 dB |\r\n|Interchange|\\2. ＜0.2 dB |\r\n|Operation temperature|\\2. -40℃ ~ +80℃ |\r\n|Anti-tensile force|\\2. 15kgf |', 10033),
(10120, 'Ordering Information ', '|ST Type| ST/PC/UPC TO |ST SC FC LC MU MTRJ(Duplex) MPO|  SM/MM Patch cords/Simplex/Duplex |0.9 1.8 2.0 3.0mm boot |', 10031),
(10121, 'Features', '* Low excess loss \r\n* Excellent directivity  \r\n* Good channel-to-channel uniformity \r\n* Low PDL \r\n* High cost-effectiveness \r\n* High environmental and mechanical stability', 10034),
(10122, 'Application', '* Fiber optical communication system \r\n* Fiber optical sensors \r\n* CATV  System \r\n* LAN WAN System\r\n', 10034),
(10123, 'Performance Index', '|Type| unit| 1 X 4 |1 X 8| 1 X 16| 1 X 32| \r\n|Optical Fiber diameter| um|\\4. 9/125um(SMF28)| \r\n|wavelength| nm|\\4. 1260 ~ 1650 |\r\n|Insertion Loss| dB| ＜7.0 |＜10.6 |＜14.0 |＜17.3 |\r\n|Uniformity |dB| ＜0.6 |＜1.0| ＜1.5| ＜2.3 |\r\n|PDL Loss |dB |＜0.30 |＜0.30 |＜0.30| ＜0.30| \r\n|Directivity |dB |\\4. >55 |\r\n|Return Loss| dB|\\4. >50| \r\n|Operation Temperature|℃|\\4.  -40 ~ +85 |\r\n|Storage Temperature| ℃|\\4.  -40 ~ +85 |\r\n|Device Dimension|mm | 4 0X 4 X 4| 4 0X 4 X 4|5 0X 4 X 4 |5 0X 7 X 4  |\r\n|Mini-Module Dimension|mm|5 0X 7 X 4 |5 0X 7 X 4 | 6 0X 12 X 4| 8 0X20 X 6|  \r\n|Module Dimension|mm|100 X 80 X 10|100 X 80 X 10|120 X 80 X 18|140 X 115 X 18|\r\n ', 10034),
(10124, 'Features', '* Low excess loss \r\n* Excellent directivity  \r\n* Good channel-to-channel uniformity \r\n* Low PDL \r\n* High cost-effectiveness \r\n* High environmental and mechanical stability\r\n', 10035),
(10125, 'Application', '* Fiber optical communication system \r\n* Fiber optical sensors \r\n* CATV  System\r\n* LAN System\r\n* WAN System\r\n\r\n', 10035),
(10126, 'Performance Index', '|Type| unit| 1 X 4 |1 X 8| 1 X 16| 1 X 32| \r\n|Optical Fiber diameter| um|\\4. 9/125um(SMF28)| \r\n|wavelength| nm|\\4. 1260 ~ 1650 |\r\n|Insertion Loss| dB| ＜7.0 |＜10.6 |＜14.0 |＜17.3 |\r\n|Uniformity |dB| ＜0.6 |＜1.0| ＜1.5| ＜2.3 |\r\n|PDL Loss |dB |＜0.30 |＜0.30 |＜0.30| ＜0.30| \r\n|Directivity |dB |\\4. >55 |\r\n|Return Loss| dB|\\4. >50| \r\n|Operation Temperature|℃|\\4.  -40 ~ +85 |\r\n|Storage Temperature| ℃|\\4.  -40 ~ +85 |\r\n|Device Dimension|mm | 4 0X 4 X 4| 4 0X 4 X 4|5 0X 4 X 4 |5 0X 7 X 4  |\r\n|Mini-Module Dimension|mm|5 0X 7 X 4 |5 0X 7 X 4 | 6 0X 12 X 4| 8 0X20 X 6|  \r\n|Module Dimension|mm|100 X 80 X 10|100 X 80 X 10|120 X 80 X 18|140 X 115 X 18|\r\n \r\n', 10035),
(10127, 'Features', '* Low excess loss \r\n* Excellent directivity  \r\n* Good channel-to-channel uniformity \r\n* Low PDL \r\n* High cost-effectiveness \r\n* High environmental and mechanical stability\r\n', 10036),
(10128, 'Application', '* Fiber optical communication system \r\n* Fiber optical sensors \r\n* CATV  System\r\n* LAN System\r\n* WAN System', 10036),
(10129, 'Performance Index', '|Type| unit| 2 X 4 |2 X 8| 2 X 16| 2 X 32| \r\n|Optical Fiber diameter| um|\\4. 9/125um(SMF28)| \r\n|wavelength| nm|\\4. 1260 ~ 1650 |\r\n|Insertion Loss| dB| ＜7.3 |＜10.8 |＜14.5 |＜17.5 |\r\n|Uniformity |dB| ＜0.6 |＜1.0| ＜1.5| ＜2.3 |\r\n|PDL Loss |dB |＜0.30 |＜0.30 |＜0.30| ＜0.30| \r\n|Directivity |dB |\\4. >55 |\r\n|Return Loss| dB|\\4. >50| \r\n|Operation Temperature|℃|\\4.  -40 ~ +85 |\r\n|Storage Temperature| ℃|\\4.  -40 ~ +85 |\r\n|Device Dimension|mm | 4 0X 4 X 4| 4 0X 4 X 4|5 0X 4 X 4 |5 0X 7 X 4  |\r\n|Mini-Module Dimension|mm|5 0X 7 X 4 |5 0X 7 X 4 | 6 0X 12 X 4| 8 0X20 X 6|  \r\n|Module Dimension|mm|100 X 80 X 10|100 X 80 X 10|120 X 80 X 18|140 X 115 X 18|', 10036),
(10130, 'Features', '* Low excess loss \r\n* Excellent directivity  \r\n* Good channel-to-channel uniformity \r\n* Low PDL \r\n* High cost-effectiveness \r\n* High environmental and mechanical stability', 10037),
(10131, 'Application ', '* Fiber optical communication system \r\n* Fiber optical sensors \r\n* CATV  System\r\n* LAN System\r\n* WAN System', 10037),
(10132, 'Performance Index', '|Type| unit| 1 X 4 |1 X 8| 1 X 16| 1 X 32| \r\n|Optical Fiber diameter| um|\\4. 9/125um(SMF28)| \r\n|wavelength| nm|\\4. 1260 ~ 1650 |\r\n|Insertion Loss| dB| ＜7.0 |＜10.6 |＜14.0 |＜17.3 |\r\n|Uniformity |dB| ＜0.6 |＜1.0| ＜1.5| ＜2.3 |\r\n|PDL Loss |dB |＜0.30 |＜0.30 |＜0.30| ＜0.30| \r\n|Directivity |dB |\\4. >55 |\r\n|Return Loss| dB|\\4. >50| \r\n|Operation Temperature|℃|\\4.  -40 ~ +85 |\r\n|Storage Temperature| ℃|\\4.  -40 ~ +85 |\r\n|Device Dimension|mm | 4 0X 4 X 4| 4 0X 4 X 4|5 0X 4 X 4 |5 0X 7 X 4  |\r\n|Mini-Module Dimension|mm|5 0X 7 X 4 |5 0X 7 X 4 | 6 0X 12 X 4| 8 0X20 X 6|  \r\n|Module Dimension|mm|100 X 80 X 10|100 X 80 X 10|120 X 80 X 18|140 X 115 X 18|', 10037),
(10133, 'Feature', '* Splitting ratio can be customized \r\n* Light weight、hightensile \r\n* Easy installation compact body \r\n* Type 1*2～2*32 \r\n', 10038),
(10134, 'Application', '* Fiber optical network system  \r\n* CATV  system \r\n* PON system ', 10038),
(10135, 'Ordering Information', '|Item| Size| Connector Type| \r\n|1x4 LGX |130mm x 100mm x 25mm|  SC&LC&FC |\r\n|1x8 LGX |130mm x 100mm x 25mm |SC&LC&FC| \r\n|1x16 LGX|130mm x 100mm x 50mm|  SC&LC&FC| \r\n|1x32 LGX| 265mm x 100mm x 50mm | SC&LC&FC| \r\n', 10038),
(10136, 'Features', '* Splitting ratio can be customized \r\n* Light weight, strong strength \r\n* Good anti-shocking and dustproof \r\n* Rack dimension can be customized \r\n', 10039),
(10137, 'Application', '* Fiber optical communication system\r\n* CATV system \r\n* LAN system\r\n', 10039),
(10138, 'Ordering Information', '|Description| Specification| Dimension |Model |\r\n|1U 19" distribution frame (Aluminum) |1&2X8| 430mm x 250mm x 43mm|/4. SC/PC/APC<br>C/PC/APC<br>LC/PC/APC|\r\n|1U 19" distribution frame (Aluminum) |1&2X16|  430mm x 250mm x 43mm|\r\n|1U 19" distribution frame (Aluminum) |1&2X32| 430mm x 250mm x 43mm|  \r\n|2U 19" distribution frame (Aluminum) |1&2X64| 430mm x 250mm x 86mm|\r\n', 10039),
(10139, 'Feature', '* Splitting ratio as customized \r\n* Light weight, high strength, dustproof \r\n* FC,SC,LC adapter type avaliable \r\n* Network set up convenient and easy \r\n* Can install in the Module type ODF', 10040),
(10140, 'Application', '* Optoelectronics communication system \r\n* CATV \r\n* LAN\r\n', 10040),
(10141, 'Ordering Information', '|Item |Type| Dimension| Port Type |\r\n|1U PLC Splitter with Tray| 1*16 |310mm x 200mm x 25mm |/4. SC/PC/APC<br>FC/PC/APC<br>LC/PC/APC |\r\n|2U PLC Splitter with Tray |2*32 or 1*32| 310mm x 200mm x 50mm|', 10040),
(10142, 'Features ', '* Low Insertion Loss\r\n* High Isolation\r\n* Low PDL\r\n* Compact Design\r\n* Good channel-to-channel uniformity\r\n* Wide Operating Wavelength: From 1260nm to 1620nm\r\n* Wide Operating Temperature: From -40℃ to 85℃\r\n* High Reliability and Stability\r\n', 10041),
(10143, 'Applications', '* CWDM System\r\n* PON Networks\r\n* CATV Links\r\n', 10041),
(10145, 'Specifications', '|\\2. Parameters|1x2|1x4|1x8|1x16|\r\n|\\2. Center Wavelength (nm)|\\4. ITU, ITU+1|\r\n|\\2.  Passband  (nm)|\\4. ITU±6.5|\r\n|\\2. Operating Wavelength (nm)|\\4. 1460~1620 or 1260~1620|\r\n|\\2. Channel Space (nm)|\\4. 20|\r\n|\\2. Fiber Type|\\4. SMF-28e or customer specified|\r\n|\\2. IL (dB)  (P/A Grade)|0.7/1.0|1.4/1.7|2.0/2.5|3.5/4.0|\r\n|/2. Isolation(dB)|Adjacent Channel|\\4. 30|\r\n|Non-Adjacent Channel|\\4. 50|\r\n|\\2. Ripple (dB)|0.3|0.4|0.5|0.5|\r\n|\\2. PDL (dB)|\\4. 0.2|\r\n|\\2. PMD (ps)|\\4. 0.1|\r\n|\\2. RL (dB)|\\4. 45|\r\n|\\2. Directivity (dB)|\\4. 50|\r\n|\\2. Maximum Optical Power (mw)|\\4. 500|\r\n|\\2. Operating Temperature (℃)|\\4. -40～85|\r\n|\\2. Storage Temperature (℃)|\\4. -40～85|\r\n|\\2. BOX Package (mm)|\\3. 100*80*10|140*115*18|\r\n|\\2. LGX Package|\\4. 1U, 2U|\r\n|\\2. 19’’ Rack mount Package|\\4. 1U|\r\n', 10041),
(10146, 'Features', '* Low Insertion Loss\r\n* High Isolation\r\n* Low PDL\r\n* Compact Design\r\n* Good channel-to-channel uniformity\r\n* Wide Operating Wavelength:From 1260nm to 1620nm\r\n* Wide Operating Temperature: From -40℃ to 85℃\r\n* High Reliability and Stability', 10042),
(10147, 'Applications', '* CWDM System\r\n* PON Networks\r\n* CATV Links', 10042),
(10148, 'Specifications', '|\\2. Parameters||\r\n|\\2. Center wavelength (nm)|ITU, ITU+1|\r\n|\\2. Passband  (nm)|ITU±6.5|\r\n|\\2. Operating wavelength (nm)|1460~1620 or 1260~1620|\r\n|\\2. Channel Space (nm)|20|\r\n|\\2. Fiber Type|SMF-28e or customer specified|\r\n|/2. IL (dB)| Transmission band|0.7|\r\n|Reflection band|0.4|\r\n|/2. Isolation (dB)|Transmission band|30|\r\n|Reflection band|12|\r\n|\\2. Crosstalk (dB)|50|\r\n|\\2. Ripple (dB)|0.3|\r\n|\\2. PDL (dB)|0.1|\r\n|\\2. PMD (ps)|0.1|\r\n|\\2. RL (dB) |45|\r\n|\\2. Directivity (dB)|50|\r\n|\\2. Maximum Optical Power (mw)|500|\r\n|\\2. Operating Temperature (℃)|-40～85|\r\n|\\2. Storage Temperature (℃)|-40～85|\r\n|\\2. Package Dimension (mm)  (Φ×L)|Φ5.5*L34  250um Fiber<br>Φ5.5*L38  900um Fiber|\r\n \r\n', 10042),
(10149, 'Features', '* Low Insertion Loss\r\n* High Isolation\r\n* Low PDL\r\n* Compact Design\r\n* Good channel-to-channel uniformity\r\n* Wide Operating Wavelength: From 1260nm to 1620nm\r\n* Wide Operating Temperature: From -40℃ to 85℃\r\n* High Reliability and Stability\r\n', 10043),
(10150, 'Applications', '* CWDM System\r\n* PON Networks\r\n* CATV Links\r\n', 10043),
(10151, 'Specifications', '|\\2. Parameters|1CH|2CH|4CH|8CH|\r\n|\\2. Center Wavelength (nm)|\\4. ITU, ITU+1|\r\n|\\2. Passband  (nm)|\\4. ITU±6.5|\r\n|\\2. Operating Wavelength (nm)|\\4. 1460~1620 or 1260~1620|\r\n|\\2. Channel Space (nm)|\\4. 20|\r\n|\\2. Fiber Type|\\4. SMF-28e or customer specified|\r\n|/2. IL(dB)<br>（P/AGrade）|Add&Drop Channel|0.5/0.6|0.7/1.0|1.4/1.7|2.0/2.5|\r\n|Express Channel|0.6/0.8|1.2/1.4|1.8/2.0|3.6/3.8|\r\n|/3. Isolation(dB)|Add&Drop     Adjacent<br>Channel|\\4. 30|\r\n|Add&Drop Non-Adjacent<br>Channel|\\4. 50|\r\n|Express Channel|\\4. 25|\r\n|\\2. Ripple(dB)|0.3|0.3|0.4|0.5|\r\n|\\2. PDL(dB)|\\4. 0.1|\r\n|\\2. PMD(ps)|\\4. 0.1|\r\n|\\2. RL(dB)|\\4. 45|\r\n|\\2. Directivity(dB)|\\4. 50|\r\n|\\2. Maximum Optical Power (mw)|\\4. 500|\r\n|\\2. Operating Temperature (℃)|\\4. -40～85|\r\n|\\2. Storage Temperature (℃)|\\4. -40～85|\r\n|\\2. BOX Package(mm)|\\3. 100*80*10|140*115*18|\r\n|\\2. LGX Package|\\4. 1U, 2U|\r\n|\\2. 19’’ Rack mount Package|\\4. 1U |\r\n', 10043),
(10152, 'Features', '* Low Insertion Loss\r\n* High Isolation\r\n* Low PDL\r\n* Compact Design\r\n* Good channel-to-channel uniformity\r\n* Wide Operating Wavelength: From 1460nm to 1620nm\r\n* Wide Operating Temperature: From -40℃ to 85℃\r\n* High Reliability and Stability', 10044),
(10153, 'Applications', '* DWDM System\r\n* PON Networks\r\n* CATV Links\r\n', 10044),
(10154, 'Specifications', '|\\2. Parameters|\\6. |\r\n|\\2. Channel Space (GHz)|\\3. 100|\\3. 200|\r\n|\\2. Channel Number|1*4|1*8|1*16|1*4|1*8|1*16|\r\n|\\2. Center Wavelength (nm)|\\6. ITU Grid.|\r\n|\\2. Center Wavelength Accuracy (nm)|\\3. ± 0.05|\\3. ± 0.1|\r\n|\\2. Channel Passband (@-0.5dB) (nm)|\\3. 0.22|\\3. 0.5|\r\n|\\2. Fiber Type|\\6. SMF-28e with 900um loose tube or customer specified|\r\n|\\2. IL (dB)|1.8|3.0|4.0|1.7|2.9|3.8|\r\n|\\2. Passband Ripple (dB)|0.35|0.4|0.5|0.35|0.4|0.5|\r\n|/2. Isolation (dB)|Adjacent Channel|\\3. 25|\\3. 28|\r\n|Non-Adjacent Channel|\\6. 40|\r\n|\\2. PDL (dB)|\\6. 0.2|\r\n|\\2. PMD (ps)|\\6. 0.1|\r\n|\\2. RL (dB)|\\6. 45|\r\n|\\2. Directivity (dB)|\\6. 50|\r\n|\\2. Maximum Optical Power (mw)|\\6. 300|\r\n|\\2. Operating Temperature (℃)|\\6. -40~85|\r\n|\\2. Storage Temperature (℃)|\\6. -40~85|\r\n|\\2. BOX Package (mm)|\\6. 100*80*10 or 140*115*18|\r\n|\\2. LGX Package|\\6. 1U,2U|\r\n|\\2. 19’’ Rack mount Package|\\6. 1U|', 10044),
(10155, 'Features', '* Low Insertion Loss\r\n* High Isolation\r\n* Low PDL\r\n* Compact Design\r\n* Good channel-to-channel uniformity\r\n* Wide Operating Wavelength:From 1460nm to 1620nm\r\n* Wide Operating Temperature: From -40℃ to 85℃\r\n* High Reliability and Stability', 10045),
(10156, 'Applications', '* DWDM System\r\n* PON Networks\r\n* CATV Links', 10045),
(10157, 'Specifications', '|\\2. Parameters|1CH|2CH|4CH|8CH|\r\n|\\2. Center Wavelength (nm)|\\4. ITU|\r\n|\\2. Passband  (nm)|\\4. ITU±0.11|\r\n|\\2. Operating Wavelength(nm)|\\4. 1520~1620|\r\n|\\2. Channel Space (nm)|\\4. 20|\r\n|\\2. Fiber Type|\\4. SMF-28e or customer specified|\r\n|/2. IL(dB)| Add&Drop Channel|1.0|1.5|1.8|3.0|\r\n|Express Channel|1.2|1.7|2.5|4.0|\r\n|/3. Isolation(dB)|Add&Drop     Adjacent Channel|\\4. 25|\r\n|Add&Drop Non-Adjacent Channel|\\4. 40|\r\n|Express Channel|\\4. 13|\r\n|\\2. Ripple(dB)|0.3|0.3|0.4|0.5|\r\n|\\2. PDL(dB)|\\4. 0.1|\r\n|\\2. PMD(ps)|\\4. 0.1|\r\n|\\2. RL(dB)|\\4. 45|\r\n|\\2. Directivity(dB)|\\4. 50|\r\n|\\2. Maximum Optical Power (mw)|\\4. 500|\r\n|\\2. Operating Temperature (℃)|\\4. -40～85|\r\n|\\2. Storage Temperature (℃)|\\4. -40～85|\r\n|\\2. BOX Package(mm)|\\3. 100*80*10|40*115*18|\r\n|\\2. LGX Package|\\4. 1U, 2U|\r\n|\\2. 19’’ Rack mount Package|1U|\r\n \r\n', 10045),
(10158, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10000),
(10159, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel\r\n', 10000),
(10160, 'FEATURES', '* TIA/EIA-568B.2-1\r\n* ISO/IEO 11801\r\n* NEC/CEC\r\n* Fire protection – IEC60332-1 (CM)\r\n* Application: Horizontal communication cable\r\n* Cable is used for indoor installation\r\n', 10006),
(10161, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.52mm±0.005mm (24AWG)\r\n* Pair Insulation: Polyethylene\r\n* Shielding: Aluminum-Polyester Foil,Mg/Al braid shied\r\n* Outer Cable Diameter: 5.8 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC\r\n* Jacket Color:Grey RAL 9002 or as per request', 10006),
(10162, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|\r\n', 10006),
(10163, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel\r\n', 10006),
(10164, 'Features', '* Low Insertion Loss\r\n* High Isolation\r\n* Low PDL\r\n* Compact Design\r\n* Wide Operating Wavelength: From 1460nm to 1620nm\r\n* Wide Operating Temperature: From -40℃ to 85℃\r\n* High Reliability and Stability\r\n\r\n', 10063),
(10165, 'Applications', '* DWDM System\r\n* PON Networks\r\n* CATV Links\r\n', 10063),
(10166, 'Specifications', '|Parameters|\\2. |\r\n|Channel Space (GHz)|100|200|\r\n|Center Wavelength (nm)|\\2. ITU Grid|\r\n|Center Wavelength Accuracy (nm)|\\2. ± 0.05± 0.1|\r\n|Channel Passband (@-0.5dB) (nm)|0.22|0.5|\r\n|Fiber Type|\\2. SMF-28e|\r\n|Passband IL (dB)|1.0|0.9|\r\n|Reflectionband IL (dB)|0.4|0.4|\r\n|Passband Isolation (dB)|\\2. 25|\r\n|Reflectionband Isolation (dB)|\\2. 10|\r\n|Ripple (dB)|\\2. 0.3|\r\n|PDL (dB)|\\2. 0.1|\r\n|PMD (ps)|\\2. 0.1|\r\n|RL (dB)|\\2. 45|\r\n|Directivity (dB)|\\2. 50|\r\n|Maximum Optical Power (mw)|\\2. 300|\r\n|Operating Temperature (℃)|\\2. -40~85|\r\n|Storage Temperature (℃)|\\2. -40~85|\r\n|Package Dimension (mm)  (Φ×L)|\\2. 5.5*34/5.5*38|\r\n ', 10063),
(10167, 'Application', '*FTTX solution\r\n\r\n\r\n*CATV solution\r\n\r\n\r\n*Optical Signal Transmission\r\n\r\n\r\n*Measurement Instruments', 10064),
(10168, 'Features', '*Insert-pull, key-oriented coupling mechanism which allows high repeatable, low-loss connection \r\n\r\n\r\n*PC/UPC/APC polish \r\n\r\n\r\n*Comply with Telcordia GR-326-CORE Specification \r\n\r\n\r\n*The material of plastic plug comply with the request of UL94V-O And Standard of RoHS ', 10064),
(10169, 'FEATURES', '* TIA/EIA-568B.2-1\r\n* ISO/IEO 11801\r\n* NEC/CEC\r\n* Fire protection – IEC60332-1 (CM)\r\n* Cable is used for indoor installation', 10048),
(10170, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.57mm±0.005mm (23AWG)\r\n* Pair Insulation: Polyethylene\r\n* Shielding: Aluminum-Polyester Foil,Mg/Al braid shied\r\n* Outer Cable Diameter: 6.5 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC & LSZH', 10048),
(10171, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10048),
(10172, 'Features', '* Athermal design operates over operating temperature range\r\n* Large channel number\r\n* Compact size\r\n* High stability and reliability\r\n* Low insertion loss, high isolation increase system margin', 10065),
(10173, 'Applications', '* WDM transmission\r\n* Metro and long haul network', 10065),
(10174, 'Specifications', '|\\2. Parameter| Unit| Value |\r\n|\\2. Channel Spacing| GHz |100|\r\n|\\2. Channel Number ||40|\r\n|\\2. Wavelength Accuracy |nm |±0.05 |\r\n|\\2. 1dB Pass Band |nm |≥0.38| \r\n|\\2. 3dB Pass Band| nm |≥0.58 |\r\n|\\2. Insertion Loss1 |dB |≤5.5 |\r\n|\\2. Ripple |dB| ≤0.5 |\r\n|\\2. Uniformity|dB| ≤1.5|\r\n|\\2. Adjacent Crosstalk|dB|≥23|\r\n|\\2. Non-adjacent Crosstalk|dB| ≥30|\r\n|\\2. Total Crosstalk |dB |≥21|\r\n|\\2. Polarization Dependent Loss(PDL)|dB| ≤0.5|\r\n|\\2. PMD2|ps|≤0.5 |\r\n|\\2. Chromatic Dispersion2 |ps/nm|±20 |\r\n|\\2. Return Loss |dB |≥40 |\r\n|/3. Fiber |Input Port |mm |Φ0.9| \r\n|Output Ribbon|－|－|\r\n|Fan Out|mm| Φ0.9 |\r\n|\\2. Operation Temperature| ℃|-5～+65 |\r\n|\\2. Storage Temperature| ℃|-40～+85 |\r\n|\\2. Package| mm| 120×70×11 |', 10065),
(10175, 'Descriptions', '* All components comply with RoHS;\r\n* Easy and fast to assemble, high success rate;\r\n* Mate with assistant assembling tool to make it easy and fast to assemble, effectively eliminate assembly failure caused by operator, can be assembled in dark environment and other bad work environment(See Patent Specification);\r\n* Design with seal groove to store refractive index (matching) liquids for avoiding to spill off, it can prolong fast connector’s working life and strengthen reusability (See Patent Specification);\r\n* Design with infrared ray visible window to inspect whether the pushed fiber connects with embedded fiber well or bad; \r\n* Only 53 MM length, can apply to different fiber optic equipments and systems;\r\n* No consumable materials, not need to maintain', 10077),
(10176, 'Specifications', '|Item|Technical Parameter|\r\n|Dimension|53*9*7.4 (L* W * H)|\r\n|Cable|2.0 *3.1mm Drop Cable|\r\n|Connector Type|SC/UPC|\r\n|Insertion Loss|＜ 0.3dB |\r\n|Return Loss|＞45dB（UPC）|\r\n \r\n', 10077),
(10182, 'Descriptions', '* No special assembling tool \r\n* Easy for assembling with mechanical splice and no polishing \r\n* Easy for learning technology by a simple assembling method(within 1 and half minutes) \r\n* Minimize the defect rate by features of removal and reusable', 10080),
(10183, 'Specifications', '|Connector Type |SC/APC |\r\n|Fiber Type| Single-mode| \r\n|Insertion Loss |<0.3dB|', 10080),
(10184, 'Specifications', '|Parameter|Value|Unit|\r\n|Operating Wavelength|1310/1550±10|nm|\r\n|Tolerance for 1-5 dB Attenuation|±0.5|dB|\r\n|Tolerance for 6-30 dB Attenuation|±10|%|\r\n|Return Loss|>50|dB|\r\n|Operating Temperature|-40 to +75|C|\r\n|Polarization Dependent Loss| ≤0.1|dB|\r\n|Mating Durabillity|≥1000|cycle|', 10066),
(10185, 'Specifications', '|Parameter|Value|Unit|\r\n|Operating Wavelength|1310/1550±10|nm|\r\n|Tolerance for 1-5 dB Attenuation|±0.5|dB|\r\n|Tolerance for 6-30 dB Attenuation|±10|%|\r\n|Return Loss|>50|dB|\r\n|Operating Temperature|-40 to +75|C|\r\n|Polarization Dependent Loss| ≤0.1|dB|\r\n|Mating Durabillity|≥1000|cycle|', 10067),
(10186, 'Specifications', '|Parameter|Value|Unit|\r\n|Operating Wavelength|1310/1550±10|nm|\r\n|Tolerance for 1-5 dB Attenuation|±0.5|dB|\r\n|Tolerance for 6-30 dB Attenuation|±10|%|\r\n|Return Loss|>50|dB|\r\n|Operating Temperature|-40 to +75|C|\r\n|Polarization Dependent Loss| ≤0.1|dB|\r\n|Mating Durabillity|≥1000|cycle|', 10068),
(10187, 'Specifications', '|Parameter|Value|Unit|\r\n|Operating Wavelength|1310/1550±10|nm|\r\n|Tolerance for 1-5 dB Attenuation|±0.5|dB|\r\n|Tolerance for 6-30 dB Attenuation|±10|%|\r\n|Return Loss|>50|dB|\r\n|Operating Temperature|-40 to +75|C|\r\n|Polarization Dependent Loss| ≤0.1|dB|\r\n|Mating Durabillity|≥1000|cycle|', 10069),
(10188, 'Features', '* It is an SC type adapter.\r\n* Both simplex an duplex versions are available.\r\n* This fiber optic adaptor is available in either metal or plastic body.\r\n* A series of colors can be supplied,including blue,gray green black and aqua.\r\n* The inside sleeve can be made by ZrO2,PhBz or Nickel.\r\n* Long flange and short flange are available.\r\n* Various hybrids are supplied such as SC/ST,SC/FC,SC/LC,etc.', 10071),
(10189, 'Specifications', '|Parameter|Value|Unit|\r\n|Operating Temperature|-40 to +70|C|\r\n|Storage Temperature|-40 to +85|C|\r\n|Mating Durability|≥200|cycle|', 10071),
(10190, 'Packaging', 'Our fiber optic adapter adopts single PE bag for packing and special adaptor tray is used to protect each adaptor.', 10071),
(10191, 'Features', '* It is an FC type adapter.\r\n* Both simplex an duplex versions are available.\r\n* This fiber optic adaptor is available in either metal or plastic body.\r\n* The inside sleeve can be made by ZrO2,PhBz or Nickel.\r\n* It is available in big D type,small D type and square flange type,etc.\r\n* Various hybrids are supplied such as FC/ST,FC/FC,FC/LC,etc.', 10072),
(10192, 'Specifications', '|Parameter|Value|Unit|\r\n|Operating Temperature|-40 to +70|C|\r\n|Storage Temperature|-40 to +85|C|\r\n|Mating Durability|≥200|cycle|', 10072),
(10193, 'Packaging', 'This FC fiber optic adaptor is packed in special adaptor tray with 30 pieces per tray.', 10072),
(10195, 'Features', '* It is an ST type adapter.\r\n* Both simplex an duplex versions are available.\r\n* This fiber optic adaptor is available in either metal or plastic body.\r\n* The inside sleeve can be made by ZrO2,PhBz or Nickel.\r\n* Various hybrids are supplied such as ST/ST,ST/FC,ST/LC,etc.', 10073),
(10196, 'Specifications', '|Parameter|Value|Unit|\r\n|Operating Temperature|-40 to +70|C|\r\n|Storage Temperature|-40 to +85|C|\r\n|Mating Durability|≥200|cycle|', 10073),
(10197, 'Packaging', 'This FC fiber optic adaptor is packed in spcial adaptor tray with 30 pieces per tray.', 10073),
(10198, 'Features', '* Adapter type: LC \r\n* Simplex or duplex or quad versions\r\n* Metal or plastic body\r\n* Different colours available\r\n* Phosphor bronze or Zirconia sleeve (for high-precision alignment)\r\n* Angled versions available\r\n* Hybrids available: LC/ST, LC/FC, LC/LC,LC/MU and others', 10074),
(10199, 'Specifications', '|Parameter|Value|Unit|\r\n|Operating Temperature|-40 to +70|C|\r\n|Storage Temperature|-40 to +85|C|\r\n|Mating Durability|≥200|cycle|', 10074),
(10200, 'Packaging', 'This LC fiber optic adaptor is packed in spcial adaptor tray with 30 pieces per tray.', 10074),
(10201, 'FEATURES', '* TIA/EIA-568B.2-1\r\n* ISO/IEO 11801\r\n* NEC/CEC\r\n* Fire protection – IEC60332-1 (CM)\r\n* Cable is used for indoor installation\r\n', 10049),
(10202, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.57mm±0.005mm (23AWG)\r\n* Pair Insulation: Polyethylene\r\n* Unshielded\r\n* Outer Cable Diameter: 6.2 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC & LSZH', 10049),
(10203, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10049),
(10204, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel\r\n', 10049),
(10205, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel\r\n', 10048),
(10206, 'FEATURES', '* High-Performance Data Communications Cable\r\n*  Suitable for 10GS High Speed Data Applications\r\n* Designed for Indoor Installations (CMR) Riser\r\n*  Category-6A (Augmented) Unshielded Twisted Pair (UTP) Cable\r\n* 4 pair - Easily Identified Color-Striped Pairs\r\n*  23 AWG Solid Bare Copper Conductors\r\n*  Excellent Attenuation and Crosstalk Characteristics\r\n\r\n', 10052),
(10207, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.57mm±0.005mm (23AWG)\r\n* Pair Insulation: Polyethylene\r\n* Unshielded\r\n* Outer Cable Diameter: 6.4 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC & LSZH', 10052),
(10208, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10052),
(10209, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel', 10052),
(10210, 'FEATURES', '*High-Performance Data Communications Cable\r\n\r\n*Suitable for 10GS High Speed Data Applications\r\n\r\n*Designed for Indoor Installations (CMR) Riser\r\n\r\n*4 pair - Easily Identified Color-Striped Pairs\r\n\r\n*23 AWG Solid Bare Copper Conductors\r\n\r\n*Excellent Attenuation and Crosstalk Characteristics\r\n', 10053),
(10211, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.57mm±0.005mm (23AWG)\r\n* Pair Insulation: Polyethylene\r\n* Shielding: Aluminum-Polyester Foil,Mg/Al braid shied\r\n* Outer Cable Diameter: 8.5 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC & LSZH', 10053),
(10212, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10053),
(10213, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel\r\n', 10053),
(10214, 'FEATURES', '*High-Performance Data Communications Cable\r\n\r\n*Suitable for 10GS High Speed Data Applications\r\n\r\n*Designed for Indoor Installations (CMR) Riser\r\n\r\n*4 pair - Easily Identified Color-Striped Pairs\r\n\r\n*23 AWG Solid Bare Copper Conductors\r\n\r\n*Excellent Attenuation and Crosstalk Characteristics', 10054);
INSERT INTO `product_paramter` (`id`, `key`, `value`, `product_id`) VALUES
(10215, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.57mm±0.005mm (23AWG)\r\n* Pair Insulation: Polyethylene\r\n* Shielding: Aluminum-Polyester Foil,Mg/Al braid shied\r\n* Outer Cable Diameter: 8.5 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC & LSZH', 10054),
(10216, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10054),
(10217, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel', 10054),
(10218, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel', 10054),
(10219, 'FEATURES', '* TIA/EIA-568B.2-1\r\n* ISO/IEO 11801\r\n* NEC/CEC\r\n* Fire protection – IEC60332-1 (CM)\r\n* Cable is used for indoor installation', 10086),
(10220, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.57mm±0.005mm (23AWG)\r\n* Pair Insulation: Polyethylene\r\n* Shielding: Aluminum-Polyester Foil,Mg/Al braid shied\r\n* Outer Cable Diameter: 7.5 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC & LSZH', 10086),
(10221, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10086),
(10222, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel', 10086),
(10223, 'FEATURES', '* TIA/EIA-568B.2-1\r\n* ISO/IEO 11801\r\n* NEC/CEC\r\n* Fire protection – IEC60332-1 (CM)\r\n* Cable is used for indoor installation', 10087),
(10224, 'CONSTRUCTION', '* Conductor: Bare Solid Copper\r\n* Conductor Dia: 0.585mm±0.005mm (23AWG)\r\n* Pair Insulation: Polyethylene\r\n* Shielding: Aluminum-Polyester Foil,Mg/Al braid shied\r\n* Outer Cable Diameter: 8.5 ± 0.2 mm\r\n* Pair Identification: Pair1= Blue/White\r\n* Pair2= Orange/White\r\n* Pair3= Green/White\r\n* Pair4= Brown/White\r\n* Outer Jacket:PVC & LSZH', 10087),
(10225, 'TECHNICAL', '|Installation Temperature:|0°C to +60°C|\r\n|Operating temperature|-20°C to +75°C|\r\n|DC Resistance Unbalance|5%|\r\n|Pair-to-Ground Capacitance Unbalance|330 pF/100 m|\r\n|Capacitance|14pF/ft nominal|\r\n|Pulling strength|130 N|\r\n|Minimum bend radius|4 outer cable diameters|\r\n|Velocity of Propagation| PE=65%|\r\n|Maximum Skew|45ns@100 meters|\r\n|Dielectric Breakdown|1000 Volts DC Conductor to Conductor|', 10087),
(10226, 'PACKAGING', '* 305m/1000ft Easy pulling box\r\n* 500m/wooden reel\r\n* 1000m/wooden reel', 10087),
(10227, 'APPLICATION', '* Used between patch panels and consolidation points in network cabinets \r\n* Used to connect consolidation points to network cabling \r\n* Fully supports LAN applications\r\n', 10055),
(10228, 'CONSTRUCTION', '* Cable: Cat.5e UTP/FTP/SFTP\r\n* Jacket: PVC/LSZH\r\n* Conductor: 28/26/24 AWG stranded BC/CCA\r\n* Plug: RJ45 Gold plating from Fu〞 to 50u〞\r\n* Transmission: up to 100 MhZ\r\n', 10055),
(10229, ' STANDARD', '* ISO/IEC 11801\r\n* TIA/EIA-568-8.2\r\n* IEC-60332-1\r\n* UL 444 (CM/CMR/CMP grade)\r\n* Rosh, SGS, Fluke Test\r\n', 10055),
(10230, 'APPLICATION', '* Used between patch panels and consolidation points in network cabinets \r\n* Used to connect consolidation points to network cabling \r\n* Fully supports LAN applications\r\n', 10057),
(10231, 'CONSTRUCTION', '* Cable: Cat.6 UTP/FTP/SFTP\r\n* Jacket: PVC/LSZH\r\n* Conductor:  26/24 AWG stranded BC/CCA\r\n* Plug: RJ45 Gold plating from Fu〞 to 50u〞\r\n* Transmission: up to 250 MhZ\r\n', 10057),
(10232, 'STANDARD', '* ISO/IEC 11801\r\n* TIA/EIA-568-8.2\r\n* IEC-60332-1\r\n* UL 444 (CM/CMR/CMP grade)\r\n* Rosh, SGS, Fluke Test\r\n', 10057),
(10233, 'APPLICATION', '* Used between patch panels and consolidation points in network cabinets \r\n* Used to connect consolidation points to network cabling \r\n* Fully supports LAN applications\r\n', 10058),
(10234, 'CONSTRUCTION', '* Cable: Cat.6a UTP/FTP/SSTP\r\n* Jacket: PVC/LSZH\r\n* Conductor:  26/24 AWG stranded BC\r\n* Plug: RJ45 Gold plating from Fu〞 to 50u〞\r\n* Transmission: up to 500 MhZ\r\n', 10058),
(10235, 'STANDARD', '* ISO/IEC 11801\r\n* TIA/EIA-568-8.2\r\n* IEC-60332-1\r\n* UL 444 (CM/CMR/CMP grade)\r\n* Rosh, SGS, Fluke Test\r\n', 10058),
(10236, 'APPLICATION', '* Used between patch panels and consolidation points in network cabinets \r\n* Used to connect consolidation points to network cabling \r\n* Fully supports LAN applications\r\n', 10062),
(10237, 'CONSTRUCTION', '* Cable: Cat.7 SSTP\r\n* Jacket: PVC/LSZH\r\n* Conductor:  26/24 AWG stranded BC\r\n* Plug: RJ45 Gold plating from Fu〞 to 50u〞\r\n* Transmission: up to 750 MhZ\r\n', 10062),
(10238, 'STANDARD', '* ISO/IEC 11801\r\n* TIA/EIA-568-8.2\r\n* IEC-60332-1\r\n* UL 444 (CM/CMR/CMP grade)\r\n* Rosh, SGS, Fluke Test\r\n', 10062),
(10239, 'APPLICATION', '* Used between patch panels and consolidation points in network cabinets \r\n* Used to connect consolidation points to network cabling \r\n* Fully supports LAN applications\r\n', 10088),
(10240, 'CONSTRUCTION', '* Cable: Cat.5e/6/6a/7 UTP/FTP/SFTP/SSTP\r\n* Jacket: PVC/LSZH\r\n* Conductor: 32/30/28/26 AWG stranded BC/CCA\r\n* Plug: RJ45 Gold plating from Fu〞 to 50u〞\r\n* Transmission: up to 100/250/500/750 MhZ\r\n', 10088),
(10241, 'STANDARD', '* ISO/IEC 11801\r\n* TIA/EIA-568-8.2\r\n* IEC-60332-1\r\n* UL 444 (CM/CMR/CMP grade)\r\n* Rosh, SGS, Fluke Test\r\n', 10088),
(10242, 'FEATURES', '* High performance, exceeds Category 5e requirements\r\n* 110 type and Krone type IDC termination\r\n* 19” 12/24 port patch panel, 1U size & 48 port panel, 2U size\r\n* Accepts 22-26 AWG, stranded or solid wire\r\n* Meets ANSI/TIA 568C & ISO/IEC 11801\r\n* UTP, FTP avalable\r\n* Wiring : T568A/B', 10089),
(10243, 'TECHNICAL', '* Current rating: 1.5 A max  \r\n* Voltage rating: 150 V  \r\n* Contact Resistance: 20 mOhm  \r\n* Insulation Resistance: 500 MOhm\r\n* Dielectric withstand voltage: 1000 V AC RMS, 60Hz/1min\r\n', 10089),
(10245, 'FEATURES', '* High performance, exceeds Category 6 requirements\r\n* 110 type and Krone type IDC termination\r\n* 19” 12/24 port patch panel, 1U size & 48 port panel, 2U size\r\n* Accepts 22-26 AWG, stranded or solid wire\r\n* Meets ANSI/TIA 568C & ISO/IEC 11801\r\n* UTP, FTP avalable\r\n* Wiring : T568A/B', 10090),
(10246, 'TECHNICAL', '* Current rating: 1.5 A max  \r\n* Voltage rating: 150 V  \r\n* Contact Resistance: 20 mOhm  \r\n* Insulation Resistance: 500 MOhm\r\n* Dielectric withstand voltage: 1000 V AC RMS, 60Hz/1min\r\n', 10090),
(10247, 'FEATURES', '* High performance, exceeds Category 6a requirements\r\n* 110 type and Krone type IDC termination\r\n* 19” 12/24 port patch panel, 1U size & 48 port panel, 2U size\r\n* Accepts 22-26 AWG, stranded or solid wire\r\n* Meets ANSI/TIA 568C & ISO/IEC 11801\r\n* UTP, FTP avalable\r\n* Wiring : T568A/B', 10091),
(10248, 'TECHNICAL', '* Current rating: 1.5 A max  \r\n* Voltage rating: 150 V  \r\n* Contact Resistance: 20 mOhm  \r\n* Insulation Resistance: 500 MOhm\r\n* Dielectric withstand voltage: 1000 V AC RMS, 60Hz/1min', 10091),
(10249, 'FEATURES', '* Low loss \r\n* Low polarization dependence\r\n* Wide bandwidth\r\n* Environmentally stable', 10095),
(10250, 'APPLICATIONS', '* Optic communication system\r\n* LAN\r\n* CATV\r\n* Fiber optic sensor\r\n* Fiber to the Home', 10095),
(10251, 'SPECIFICATIONS', '|Configuration |N×4|N×8 |N×16| N×32|\r\n|Paramete|N=1, 2, 4|N=1, 2, 8|N=1, 2, 16|N=1, 2, 32|\r\n|Grade|\\4. A|\r\n|Operating Wavelength (nm)|\\4. 1310 or 1550, others on request|\r\n|Bandwidth (nm)|\\4. ±40|\r\n|Max. Excess Loss (dB)|0.25 |0.4|0.55|0.7|\r\n|Typ. Insertion Loss (dB)| 6.2|9.3|12.4|15.5 |\r\n|Max. Insertion Loss (dB) |6.8|10.2|13.6|17.0|\r\n|Uniformity (dB) |≤1.2|≤1.8|≤2.4|≤3.0|\r\n|Polarization Dependent Loss (dB)|≤0.2| ≤0.3 |≤0.4|≤0.5|\r\n|Thermal Stability (dB)|≤0.2|≤0.3|≤0.4| ≤0.5 |\r\n|Return Loss|\\4. ≥ 50 dB |\r\n|Directivity|\\4. ≥ 60 dB|', 10095),
(10252, 'PACKAGE INFORMATION', '|Lead Length (m)|\\4. 1 meter, others on request|\r\n|Lead Type|\\4. 1: 900um loose tube；     2: 3mm loose cable (or 2mm)|\r\n|Package Dimensions(mm)|C:106X79X10|D:125X96X15|E:145X116X18|E:145X116X18|\r\n|Operating Temperature(℃)|\\4. -20 to +70|\r\n \r\n', 10095),
(10253, 'FEATURES', '* Low loss\r\n* Low polarization dependence\r\n* Environmentally stable', 10096),
(10254, 'APPLICATIONS', '* Optic communication system\r\n* LAN\r\n* CATV\r\n* Fiber optic sensor\r\n* Test instrument\r\n', 10096),
(10255, 'SPECIFICATIONS', '|Grade|/2.  A|\r\n|Parameter|\r\n|Operating Wavelength (nm)|1310±40|1490±20|1550±40|\r\n|Max. Insertion Loss (dB)|3.50|3.65|3.50|\r\n|Wavelength Dependent Loss(dB)|0.4 |0.3|0.4|\r\n|Coupling Ratio (%) |\\3. 50/50|\r\n|Excess Loss(dB)|\\3. ≤ 0.10|\r\n|Polarization Dependent Loss (dB)|\\3. ≤0.10|\r\n|Thermal Stability (dB/℃)|\\3. ≤0.002| \r\n|Return Loss (dB) |\\3. ≥50|\r\n|Directivity (dB)|\\3. ≥50|\r\n \r\n', 10096),
(10256, 'PACKAGE INFORMATION', '|Configuration|\\3. 1×2;2X2|\r\n|Lead Type|0: 250um bare fiber|1: 900um loose tube|2: 3mm loose cable (or 2mm)|\r\n|Package Dimensions(mm)|A:φ3.0×40 |A:φ3.0×56   B: 80×16×9B: 80×16×9|C: 106×79×10|\r\n|Operating Temperature(℃)|-40 to +85|-20 to +70|-20 to +70|\r\n \r\n', 10096),
(10257, 'Product Description', '|28 Channel Digital Display Receiver|\r\n|Volume|115*80*21mm|\r\n|Operation Temperature|-20-60|\r\n|Voltage/Current|9-12V/250mA|\r\n|Frequency|0.9G-1.5G|\r\n|Microwave Video Transmitter||\r\n|Model|QLM-1215-3000B|\r\n|Voltage|12V/220V|\r\n|Current|1200mA|\r\n|Channel|15|\r\n|Power|3000mW  35dBM|\r\n|Frequency|0.9G-1.28G|\r\n|Operating temperature|-20-60|\r\n|Volume|250*160*75mm|\r\n|Barrier-free transmission distance|2-5KM  (with 13DB Antenna|', 10097),
(10258, 'Packaging Details ', '|Unit Type|piece |\r\n|Package Weight|4.500kg (9.921lb.) |\r\n|Package Size|35cm x 25cm x 15cm (13.78in x 9.84in x 5.91in) |', 10097),
(10259, 'Features', '* High output power\r\n* Output power tunable\r\n* Low NF\r\n* RS-485、RS-232 network interface\r\n* Multi power supply (Rack Mount);\r\n* AC：220V-110V；DC：-48V\r\n', 10098),
(10260, 'Application', '* CATV system\r\n* Access network\r\n', 10098),
(10261, 'Specifications', '\r\n\r\nParameter\r\n \r\n\r\n|Unit||Min|Typ|Max|\r\n|Operating Wavelength|nm|1530|1550|1560|\r\n|Input Power|dBm|-3||10|\r\n|Output Power|dBm|||24|\r\n|Noise Figure|dB||5.0||\r\n|Input/Output Isolation|dB|30|||\r\n|Input/Output Return Loss|dB|60|||\r\n|Voltage||\\3. Rack Mount:90~260V AC,-48V DC Module Type: 5V DC|\r\n|Dimension|mm|\\3. Rack Mount:(W x L x H)482.6 x 319 x 43.6Module Type:(W x L x H)150 x 125 x 24|\r\n \r\n', 10098),
(10264, 'Features', '* Bi-Directional SFP Single Mode Transceiver  \r\n* SC Receptacle \r\n* Compliant with IEEE Std 802.3ah™ -2004\r\n* 1490nm continuous-mode 1.25Gbps transmitter with DFB laser/1310nm burst mode 1.25Gbps receiver with APD-TIA\r\n* Digital diagnostic interface compliant with SFF-8472 V9.4  \r\n* LVPECL compatible data input /output /Continued mode received signal strength indication (RSSI) output \r\n* Compliant with RoHS directive\r\n* Compliant with Telcordia (Bellcore) GR-468-CORE\r\n* Maximal reach 20km\r\n* Operating case temperature:standard:0 to to 70°C\r\n ', 10100),
(10265, 'Applications', '* GEPON OLT for P2MP Application \r\n* Access Networks\r\n* Fiber to the Home, Curb, Office (FTTx)', 10100),
(10266, 'FEATURES', '*  Support IEEE802.3ah (EPON), IEEE802.3ah OAM, can contact with different   OLT from different company\r\n*  Support splitter of 1:64 at most\r\n* The transmit distance is 20KM (splitter of 1:32)\r\n* Support data, voice, IPTV, CATV etc\r\n* Support ITU-T G.711 (64Kbps), G.723.1 (5.3Kbps/6.3Kbps), G.729 (8Kbps),A/m\r\n* Support high/low mode transmit, T30, T38 etc fax\r\n* All kinds of signal voice, including dialing tone, busy tone, ring back tone, etc\r\n* Support twice dialling\r\n* Support IEEE802.1Q,QinQ function\r\n* Support IEEE802.1p  QOS priority function\r\n*  Accord with ITU-T K20\r\n* Support Optical Power testing in real time (optional)\r\n* Support one port of CATV receive\r\n* Support PPPoE, DHCP, static IP\r\n* Support Web, CLI and third party management etc three mode\r\n*  Support update on line and automatic update\r\n* 1 SC/PC or SC/APC optical interface (A, SC/PC; B, SC/APC)\r\n* 1 10/100BASE-TX port, accord with IEEE802.3/802.3u, support Layer 2 switch or modem function\r\n* 1 POTS, can connect with phone, fax, modem', 10101),
(10267, 'APPLICATION', '* CATV system\r\n* FTTX network\r\n* G/EPON\r\n', 10101),
(10268, 'FEATURES', '*  Support IEEE802.3ah (EPON), IEEE802.3ah OAM, can contact with different   OLT from different company\r\n*  Support splitter of 1:64 at most\r\n* The transmit distance is 20KM (splitter of 1:32)\r\n* Support data, voice, IPTV, CATV etc\r\n* Support ITU-T G.711 (64Kbps), G.723.1 (5.3Kbps/6.3Kbps), G.729 (8Kbps),A/m\r\n* Support high/low mode transmit, T30, T38 etc fax\r\n* All kinds of signal voice, including dialing tone, busy tone, ring back tone, etc\r\n* Support twice dialling\r\n* Support IEEE802.1Q,QinQ function\r\n* Support IEEE802.1p  QOS priority function\r\n*  Accord with ITU-T K20\r\n* Support Optical Power testing in real time (optional)\r\n* Support one port of CATV receive\r\n* Support PPPoE, DHCP, static IP\r\n* Support Web, CLI and third party management etc three mode\r\n*  Support update on line and automatic update\r\n* 1 SC/PC or SC/APC optical interface (A, SC/PC; B, SC/APC)\r\n* 1 10/100M +10/100/1000M  BASE-TX port, accord with IEEE802.3/802.3u, support Layer 2 switch or modem function\r\n* 2 POTS, can connect with phone, fax, modem', 10104),
(10269, 'FEATURES', '* CATV system\r\n* FTTX network\r\n* G/EPON\r\n', 10104),
(10273, 'FEATURES', '* Support ONUs communicate under the same PON port\r\n* Support 802.3 MPCP protocal\r\n* Support 802.3 OAM and expand protocal(slave port), have abundent OAM function design, offer long-distance management through OLT\r\n* Have double-channal independent OLT\r\n* Support long-distance update for software \r\n* High integration level and integration management, and have the function of double layer exchange\r\n* Support data encrypt service in downlink, secure the data transition security for users\r\n* Support ONU authentication, avert illegal ONU accesss to network \r\n* Support DBA dynamic bandwidth allocation\r\n* Support IGMP Proxy\r\n* Support ACL functions \r\n* Support QOS functions \r\n* Support 4K MAC address with single channal OLT\r\n* Support VLAN divided by LLID \r\n* Offer abundant statistical information\r\n* Support hot plug by the board   \r\n* Offer 2G uplink \r\n* The uplink is SFP, and could be configured as electrical port or optical port\r\n* If configured as electrical port,it should work as the pattern of 1000M\r\n* Support the VLAN division on the basis of port\r\n* Support 4096 entries of VLAN\r\n* The capacity of MAC address is 8K\r\n* Uplink support port trunk, port monitoring and mirroring\r\n* Offers 2 control interface, local and network\r\n* Support 3 types of management CLI, TELNET and SNMP\r\n* The network control supports in-band and out-band \r\n', 10105),
(10274, 'APPLICATION', '* CATV system\r\n* FTTX network\r\n* G/EPON', 10105),
(10275, 'FEATURES', '*  In accordance with Ethernet standards IEEE802.3,  10/100Base-TX and 100Base-FX \r\n*  Supported Ports: SC for optical fiber; RJ45 for twisted pair \r\n*  Auto-adaptation rate and full/half-duplex mode supported at twisted pair port \r\n*  Auto MDI/MDIX supported without need of cable selection  \r\n*  Up to 6 LEDs for status indication of optical power port and UTP port  \r\n*  External and built-in DC power supplies provided  \r\n*  128 K''s data buffer RAM \r\n*  Support for low-delay time pure data transmission and full/half-duplex flow control. \r\n*  Built-in watch-dog timer to monitor any error in internal data exchange \r\n*  In accordance with Ethernet standards IEEE802.3,  10/100Base-TX and 100Base-FX \r\n*  Supported Ports: SC for optical fiber; RJ45 for twisted pair \r\n*  Auto-adaptation rate and full/half-duplex mode supported at twisted pair port \r\n*  Auto MDI/MDIX supported without need of cable selection  \r\n*  Up to 6 LEDs for status indication of optical power port and UTP port  \r\n*  External and built-in DC power supplies provided  \r\n*  128 K''s data buffer RAM \r\n*  Support for low-delay time pure data transmission and full/half-duplex flow control. \r\n*  Built-in watch-dog timer to monitor any error in internal data exchange \r\n*  In accordance with Ethernet standards IEEE802.3,  10/100Base-TX and 100Base-FX \r\n*  Supported Ports: SC for optical fiber; RJ45 for twisted pair \r\n*  Auto-adaptation rate and full/half-duplex mode supported at twisted pair port \r\n*  Auto MDI/MDIX supported without need of cable selection  \r\n*  Up to 6 LEDs for status indication of optical power port and UTP port  \r\n*  External and built-in DC power supplies provided  \r\n*  128 K''s data buffer RAM \r\n*  Support for low-delay time pure data transmission and full/half-duplex flow control. \r\n*  Built-in watch-dog timer to monitor any error in internal data exchange ', 10106),
(10276, 'TECHNICAL', 'Technical Parameters for 10/100M Adaptive Fast Ethernet Optical Media Converter \r\n \r\nNumber of Network Ports   1 channel\r\nNumber of Optical Ports 	1 channel 	 \r\nNIC Transmission Rate 	10/100 Mbit/s	\r\nNIC Transmission Mode  	10/100M adaptive with support for automatic inversion of MDI/MDIX 	\r\nOptical Port Transmission Rate 	100Mbit/s	\r\nOperating Voltage  	AC 220V or DC +5V 	\r\nOverall Power 	<1W	\r\nNetwork Ports  	RJ45 port	\r\nOptical Specifications  	Optical Port:  SC, ST or FC (Optional)   \r\nMulti-Mode: 50/125, 62.5/125um    \r\nSingle-Mode: 8.3/125, 8.7/125um, 8/125,10/125um\r\nWavelength: Single-Mode: 1310/1550nm\r\nData Channel 	IEEE802.3x and collision base backpressure supported \r\nWorking Mode:  Full/half duplex supported     \r\nTransmission Rate: 100Mbit/s                 \r\nwith error rate of zero \r\nSome Product Modes and port Technical Parameters of Optical Port \r\nDesk Type Dual-Optical Single-Mode/Multi-Mode Media Converter \r\nProduct Mode	Wavelength (nm)	Optical Port	Electric Port	Optical Power (dBm)	Receiving Sensitivity (dBm)	Transmission Range (km)\r\n8110MA-05V-8S	850	SC	RJ-45	-8~ -3	≤-19	0.55\r\n8110MA-2F-3S	1,310 	SC	RJ-45	-20~ -15	≤-34	2\r\n8110SA-10F-5S	1,550 	SC	RJ-45	-15~ -8	≤-34	10\r\n8110SA-20F-3S	1,310 	SC	RJ-45	-15~ -3	≤-34	20\r\n8110SA-40F-3S	1,310 	SC	RJ-45	-8~ -3	≤-34	40\r\n8110SA-60F-3S	1,310 	SC	RJ-45	-5~0	≤-34	60\r\n8110SA-80D-5S	1,550 	SC	RJ-45	-5~0	≤-34	80\r\n8110SA-100D-5S	1,550 	SC	RJ-45	-3~3	≤-36	100\r\n8110SA-120D-5S	1,550 	SC	RJ-45	0~5	≤-36	120\r\nDesk Type Single-Optical Two-Way Media Converter\r\nProduct Mode	Wavelength (nm)	Optical Port	Electric Port	Optical Power (dBm)	Receiving Sensitivity (dBm)	Transmission Range (km)\r\n8110MB-2F-3S	1,310	SC	RJ-45	-20~ -15	≤-34	2\r\n8110MB-2F-5S	1550	SC	RJ-45	-20~ -15	≤-34	2\r\n8110SB-10F-3S	1,310	SC	RJ-45	-15~ -8	≤-34	10\r\n8110SB-10F-5S	1,550	SC	RJ-45	-15~ -8	≤-34	10\r\n8110SB-20F-3S	1,310	SC	RJ-45	-15~ -3	≤-34	20\r\n8110SB-20F-5S	1,550	SC	RJ-45	-15~ -3	≤-34	20\r\n8110SB-40F-3S	1,310	SC	RJ-45	-8~ -3	≤-34	40\r\n8110SB-40F-5S	1,550	SC	RJ-45	-8~ -3	≤-34	40\r\n8110SB-60F-3S	1,310	SC	RJ-45	-5~0	≤-34	60\r\n8110SB-60D-5S	1,550	SC	RJ-45	-5~0	≤-34	60\r\n8110SB-80D-3S	1,310	SC	RJ-45	0~5	≤-34	80\r\n8110SB-80D-5S	1,550	SC	RJ-45	-5~0	≤-34	80\r\n8110SB-100D-5S	1,550	SC	RJ-45	-3~3	≤-36	100\r\n8110SB-100D-4S	1,490	SC	RJ-45	-3~3	≤-36	100\r\n8110SB-120D-5S	1,550	SC	RJ-45	0~5	≤-36	120\r\n8110SB-120D-4S	1,490	SC	RJ-45	0~5 	≤-36	120\r\n', 10106),
(10277, 'FEATURES', '* SFP package with LC connector\r\n* 850nm VCSEL Laser and PIN photo detector \r\n* Up to 550m transmission on 50/125 um MMF\r\n* +3.3V single power supply\r\n* LVPECL compatible data input/output interface\r\n* Low EMI and excellent ESD protection\r\n* laser safety standard IEC-60825 compliant\r\n* Compatible with RoHS \r\n', 10107),
(10278, 'APPLICATION', '* Ethernet\r\n* Telecom\r\n* Fiber Channel\r\n', 10107),
(10279, 'ELECTRICAL', '(Ambient Operating Temperature 0C to +70C, Vcc =3.3 V)\r\nParameter	Symbol	Min.	Typ.	Max.	unit\r\nTransmitter Section\r\nInput Differential Impendence\r\n	Zin	90	100	110	Ohm\r\nData Input Swing Differential	Vin	500		2400	mV\r\nTX Disable	Disable		2.0		Vcc	V\r\n	Enable		0		0.8	V\r\nTX Fault	Assert		2.0		Vcc	V\r\n	Deassert		0		0.8	V\r\nReceiver Section\r\nOutput differential impendence	Zout		100		Ohm\r\nData Input Swing Differential	Vout	370		2000	mV\r\nRx_LOS	Assert		2.0		Vcc	V\r\n	Deassert		0		0.8	V\r\n', 10107),
(10280, 'FEATURES', '* SFP package with LC connector\r\n* 1310nm FP laser and PIN photo detector \r\n* Up to 10Km transmission on SMF\r\n* +3.3V single power supply\r\n* LVPECL compatible data input/output interface\r\n* Low EMI and excellent ESD protection\r\n* laser safety standard IEC-60825 compliant\r\n*  Compatible with RoHS \r\n', 10108),
(10281, 'APPLICATION', '* Ethernet\r\n* Telecom\r\n* Fiber Channel\r\n', 10108),
(10282, 'ELECTRICAL', '(Ambient Operating Temperature 0C to +70C, Vcc =3.3 V)\r\nParameter	Symbol	Min.	Typ.	Max.	unit\r\nTransmitter Section\r\nInput Differential Impendence\r\n	Zin	90	100	110	Ohm\r\nData Input Swing Differential	Vin	500		2400	mV\r\nTX Disable	Disable		2.0		Vcc	V\r\n	Enable		0		0.8	V\r\nTX Fault	Assert		2.0		Vcc	V\r\n	Deassert		0		0.8	V\r\nReceiver Section\r\nOutput differential impendence	Zout		100		Ohm\r\nData Input Swing Differential	Vout	370		2000	mV\r\nRx_LOS	Assert		2.0		Vcc	V\r\n	Deassert		0		0.8	V\r\n', 10108),
(10283, 'FEATURES', '* In accordance with IEEE802.3 10Base-T, IEEE802.3u 100Base-T, IEEE802.3ab      1000Base-T and IEEE802.3z 1000Base-FX\r\n* Supported Ports: SC for optical fiber; RJ45 for twisted pair \r\n* Auto-adaptation rate and full/half-duplex mode supported at twisted pair port \r\n* Auto MDI/MDIX supported without need of cable selection  \r\n* Up to 6 LEDs for status indication of optical power port and UTP port  \r\n* External and built-in DC power supplies provided  \r\n* Up to 1024 MAC addresses supported \r\n* 512 kb data storage integrated, and 802.1X original MAC address authentication supported  \r\n* Conflicting frames detection in half-duplex and flow control in full duplex supported  \r\n', 10109),
(10284, 'TECHNICAL', 'Technical Parameters for 10/100/1000M Adaptive Fast Ethernet Optical Media Converter\r\n \r\nNumber of Network Ports 	1 channel \r\nNumber of Optical Ports 	1 channel 	 \r\nNIC Transmission Rate 	10/100/1000Mbit/s	\r\nNIC Transmission Mode  	10/100/1000M adaptive with support for automatic inversion of MDI/MDIX 	\r\nOptical Port Transmission Rate 	1000Mbit/s	\r\nOperating Voltage  	AC 220V or DC +5V 	\r\nOverall Power 	<3W	\r\nNetwork Ports  	RJ45 port	\r\nOptical Specifications  	Optical Port:  SC, FC,ST (Optional)   \r\nMulti-Mode: 50/125, 62.5/125um    Single-Mode: 8.3/125, 8.7/125um, 8/125,10/125um\r\nWavelength: Single-Mode: 1310/1550nm\r\nData Channel 	IEEE802.3x and collision base backpressure supported \r\nWorking Mode:  Full/half duplex supported     Transmission Rate: 1000Mbit/s                 \r\nwith error rate of zero \r\nSome Product Modes and port Technical Parameters of Optical Port \r\nDesk Type Dual-Optical Single-Mode/Multi-Mode Media Converter  \r\nProduct Mode	Wavelength (nm)	Optical Port	Electric Port	Optical Power (dBm)	Receiving Sensitivity (dBm)	Transmission Range (km)\r\n8110GMA-05-8S	850nm	SC	RJ-45	-8～-3	≤-19	0.55km\r\n8110GMA-05F-3S	1310nm	SC	RJ-45	-8～-3	≤-20	0.55km\r\n8110GSA-10F-3S	1310nm	SC	RJ-45	-8～-3	≤-24	10km\r\n8110GSA-20F-3S	1310 nm	SC	RJ-45	-8～-3	≤-24	20km\r\n8110GSA-40F-3S	1310 nm	SC	RJ-45	-5～0	≤-24	40km\r\n8110GSA-60D-3S	1310 nm	SC	RJ-45	-2～+3	≤-24	60km\r\n8110GSA-80D-5S	1550 nm	SC	RJ-45	0～5	≤-24	80km\r\n8110GSA-100D-5S	1550 nm	SC	RJ-45	0～5 	≤-30	100km\r\nDesk Type Single-Optical Two-Way Media Converter \r\nProduct Mode	Wavelength (nm)	Optical Port	Electric Port	Optical Power (dBm)	Receiving Sensitivity (dBm)	Transmission Range (km)\r\n8110GMB-05F-3S	1310nm	SC	RJ-45	-8～-3	≤-24	0.55km\r\n8110GMB-05F-5S	1550nm	SC	RJ-45	-8～-3	≤-24	0.55km\r\n8110GSB-10F-3S	1310 nm	SC	RJ-45	-8～-3	≤-24	10 km\r\n8110GSB-10F-5S	1550 nm	SC	RJ-45	-8～-3	≤-24	10 km\r\n8110GSB-20F-3S	1310 nm	SC	RJ-45	-8～-3	≤-24	20 km\r\n8110GSB-20D-5S	1550 nm	SC	RJ-45	-8～-3	≤-24	20 km\r\n8110GSB-40F-3S	1310 nm	SC	RJ-45	-5～0	≤-24	40 km\r\n8110GSB-40D-5S	1550 nm	SC	RJ-45	-5～0	≤-24	40 km\r\n8110GSB-60D-4S	1490 nm	SC	RJ-45	-5～0	≤-24	60 km\r\n8110GSB-60D-5S	1550 nm	SC	RJ-45	-5～0	≤-24	60 km\r\n8100GSB-80D-4S	1490 nm	SC	RJ-45	0～5	≤-24	80 km\r\n8100GSB-80D-5S	1550 nm	SC	RJ-45	0～5	≤-24	80 km\r\n', 10109),
(10285, 'FEATURES', '* SFP+ package with LC connector\r\n* 1310nm DFB Laser and PIN photo detector \r\n* Up to 10km transmission on SMF\r\n* Power dissipation < 1W\r\n* LVPECL compatible data input/output interface\r\n* Low EMI and excellent ESD protection\r\n* laser safety standard IEC-60825 compliant\r\n* Compatible with RoHS\r\n* Compatible with SFF8472\r\n', 10110),
(10286, 'APPLICATION', '* Ethernet\r\n* Telecom\r\n* Fiber Channel', 10110),
(10287, 'ELECTRICAL', '(Ambient Operating Temperature -5C to +70C, Vcc =3.3 V)\r\nParameter	Symbol	Min.	Typ.	Max.	unit\r\nTransmitter Section\r\nInput Differential Impendence\r\n	Zin	90	100	110	Ohm\r\nData Input Swing Differential	Vin	180		700	mV\r\nTX Disable	Disable		2.0		Vcc	V\r\n	Enable		0		0.8	V\r\nTX Fault	Assert		2.0		Vcc	V\r\n	Deassert		0		0.8	V\r\nReceiver Section\r\nOutput differential impendence	Zout		100		Ohm\r\nData output Swing Differential	Vout	300		800	mV\r\nRx_LOS	Assert		2.0		Vcc	V\r\n	Deassert		0		0.8	V\r\n', 10110),
(10288, 'FEATURES', '* SFP+ package with LC connector\r\n* 850nm VCSEL Laser and PIN photo detector \r\n* Up to 220m transmission on 2000MHz-km MMF\r\n* Power dissipation < 1W\r\n* LVPECL compatible data input/output interface\r\n* Low EMI and excellent ESD protection\r\n* laser safety standard IEC-60825 compliant\r\n* Compatible with RoHS\r\n* Compatible with SFF8472 \r\n', 10111),
(10289, 'APPLICATION', '* Ethernet\r\n* Telecom\r\n* Fiber Channel\r\n', 10111),
(10290, 'ELECTRICAL', '(Ambient Operating Temperature 0C to +70C, Vcc =3.3 V)\r\nParameter	Symbol	Min.	Typ.	Max.	unit\r\nTransmitter Section\r\nInput Differential Impendence\r\n	Zin	90	100	110	Ohm\r\nData Input Swing Differential	Vin	180		700	mV\r\nTX Disable	Disable		2.0		Vcc	V\r\n	Enable		0		0.8	V\r\nTX Fault	Assert		2.0		Vcc	V\r\n	Deassert		0		0.8	V\r\nReceiver Section\r\nOutput differential impendence	Zout		100		Ohm\r\nData output Swing Differential	Vout	300		800	mV\r\nRx_LOS	Assert		2.0		Vcc	V\r\n	Deassert		0		0.8	V\r\n', 10111),
(10291, 'FEATURES', '* In accordance with IEEE802.3ab 1000Base-T and IEEE802.3z 1000Base-FX\r\n* Supported Ports: SC for optical fiber; RJ45 for twisted pair \r\n* Auto-adaptation rate and full/half-duplex mode supported at twisted pair port \r\n* Auto MDI/MDIX supported without need of cable selection  \r\n* Up to 6 LEDs for status indication of optical power port and UTP port  \r\n* External and built-in DC power supplies provided  \r\n* Up to 1024 MAC addresses supported \r\n* 512 kb data storage integrated, and 802.1X original MAC address authentication supported  \r\n* Conflicting frames detection in half-duplex and flow control in full duplex supported  \r\n', 10112),
(10292, 'TECHNICAL', 'Technical Parameters for 1000M Adaptive Fast Ethernet Optical Media Converter\r\n \r\nNumber of Network Ports 	1 channel \r\nNumber of Optical Ports 	1 channel 	 \r\nNIC Transmission Rate 	1000Mbit/s	\r\nNIC Transmission Mode  	1000M adaptive with support for automatic inversion of MDI/MDIX 	\r\nOptical Port Transmission Rate 	1000Mbit/s	\r\nOperating Voltage  	AC 220V or DC +5V 	\r\nOverall Power 	<3W	\r\nNetwork Ports  	RJ45 port	\r\nOptical Specifications  	Optical Port:  SC, FC,ST (Optional)   \r\nMulti-Mode: 50/125, 62.5/125um                                                  Single-Mode: 8.3/125, 8.7/125um, 8/125,10/125um\r\nWavelength: Single-Mode: 1310/1550nm\r\nData Channel 	IEEE802.3x and collision base backpressure supported \r\nWorking Mode:  Full/half duplex supported                              Transmission Rate: 1000Mbit/s                 \r\nwith error rate of zero \r\nSome Product Modes and port Technical Parameters of Optical Port \r\nDesk Type Dual-Optical Single-Mode/Multi-Mode Media Converter r \r\nProduct Mode	Wavelength (nm)	Optical Port	Electric Port	Optical Power (dBm)	Receiving Sensitivity (dBm)	Transmission Range (km)\r\n8010GMA-05-8S	850nm	SC	RJ-45	-8 ～-3	≤-19	0.55km\r\n8010GMA-05F-3S	1310nm	SC	RJ-45	-8～-3	≤-20	0.55km\r\n8010GSA-10F-3S	1310nm	SC	RJ-45	-8～-3	≤-24	10km\r\n8010GSA-20F-3S	1310 nm	SC	RJ-45	-8～-3	≤-24	20km\r\n8010GSA-40F-3S	1310 nm	SC	RJ-45	-5～0	≤-24	40km\r\n8010GSA-60F-3S	1310 nm	SC	RJ-45	-5～0	≤-24	60km\r\n8010GSA-80D-5S	1550 nm	SC	RJ-45	0～5	≤-24	80km\r\n8010GSA-100D-5S	1550 nm	SC	RJ-45	0～5 	≤-30	100km\r\nDesk Type Single-Optical Two-Way Media Converter \r\nProduct Mode	Wavelength (nm)	Optical Port	Electric Port	Optical Power (dBm)	Receiving Sensitivity (dBm)	Transmission Range (km)\r\n8010GMB-05F-3S	1310nm	SC	RJ-45	-8～-3	≤-24	 0.55km\r\n8010GMB-05F-5S	1550nm	SC	RJ-45	-8～-3	≤-24	 0.55km\r\n8010GSB-10F-3S	1310 nm	SC	RJ-45	-8～-3	≤-24	10 km\r\n8010GSB-10F-5S	1550 nm	SC	RJ-45	-8～-3	≤-24	10 km\r\n8010GSB-20F-3S	1310 nm	SC	RJ-45	-8～-3	≤-24	20 km\r\n8010GSB-20D-5S	1550 nm	SC	RJ-45	-8～-3	≤-24	20 km\r\n8010GSB-40F-3S	1310 nm	SC	RJ-45	-5～0	≤-24	40 km\r\n8010GSB-40D-5S	1550 nm	SC	RJ-45	-5～0	≤-24	40 km\r\n8010GSB-60D-4S	1490 nm	SC	RJ-45	-5～0	≤-24	60 km\r\n8010GSB-60D-5S	1550 nm	SC	RJ-45	-5～0	≤-24	60 km\r\n8010GSB-80D-5S	1550 nm	SC	RJ-45	0～5	≤-24	80 km\r\n8010GSB-80D-4S	1490 nm	SC	RJ-45	0～5	≤-24	80 km\r\n', 10112),
(10294, 's', 's', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `stype`
--

CREATE TABLE IF NOT EXISTS `stype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `show_order` int(11) DEFAULT NULL,
  `mtype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtype_id` (`mtype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10035 ;

--
-- 转存表中的数据 `stype`
--

INSERT INTO `stype` (`id`, `name`, `show_order`, `mtype_id`) VALUES
(10000, 'MPO Series', 0, 10001),
(10010, 'MTP Series', 0, 10001),
(10011, 'Fiber Patch cord', 0, 10001),
(10012, 'PLC Splitters', 0, 10008),
(10013, 'CWDM', 3, 10008),
(10014, 'DWDM', 4, 10008),
(10015, 'Ethernet  Cables', 0, 10000),
(10016, 'Patch Cord', 1, 10000),
(10017, 'Patch Panel', 3, 10000),
(10018, 'Keystone Jack', 4, 10000),
(10020, 'Fiber Adaptor', 6, 10001),
(10021, 'Fused Couplers', 1, 10008),
(10022, 'CATV Transceiver/CATV Transmitter', 8, 10009),
(10026, 'ONU Devices', 4, 10009),
(10027, 'AWG ', 4, 10008),
(10028, 'Accessories', 5, 10000),
(10029, 'Fiber Attenuators', 0, 10001),
(10030, 'Fast Connectors', 7, 10001),
(10031, 'Optical Sensors', 8, 10008),
(10032, 'OLT Devices', 4, 10009),
(10033, 'Media Converter', 3, 10009),
(10034, 'SFP/XFP Transceiver', 2, 10009);

--
-- 限制导出的表
--

--
-- 限制表 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`stype_id`) REFERENCES `stype` (`id`);

--
-- 限制表 `product_paramter`
--
ALTER TABLE `product_paramter`
  ADD CONSTRAINT `product_paramter_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- 限制表 `stype`
--
ALTER TABLE `stype`
  ADD CONSTRAINT `stype_ibfk_1` FOREIGN KEY (`mtype_id`) REFERENCES `mtype` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
