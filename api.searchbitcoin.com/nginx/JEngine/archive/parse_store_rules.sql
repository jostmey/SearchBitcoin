-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: mysql.api.searchbitcoin.com    Database: searchbitcoin
-- ------------------------------------------------------
-- Server version	5.1.53-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ParseStoreRules`
--

DROP TABLE IF EXISTS `ParseStoreRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParseStoreRules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendor` int(11) NOT NULL,
  `crawl_seed` varchar(256) NOT NULL,
  `crawl_pattern` varchar(256) NOT NULL,
  `crawl_frequency` smallint(6) NOT NULL DEFAULT '1',
  `crawl_page_limit` smallint(6) NOT NULL DEFAULT '10',
  `index_pattern` varchar(256) NOT NULL,
  `title_selector` varchar(256) DEFAULT NULL,
  `title_offset` int(11) NOT NULL DEFAULT '0',
  `description_selector` varchar(256) NOT NULL,
  `description_offset` int(11) NOT NULL DEFAULT '0',
  `image_selector` varchar(256) NOT NULL,
  `image_offset` int(11) NOT NULL DEFAULT '0',
  `price_selector` varchar(256) DEFAULT NULL,
  `price_offset` int(11) NOT NULL DEFAULT '0',
  `category_selector` varchar(256) DEFAULT NULL,
  `category_offset` int(11) NOT NULL DEFAULT '0',
  `expiration_selector` varchar(256) DEFAULT NULL,
  `expiration_offset` int(11) NOT NULL DEFAULT '0',
  `expiration_pattern` varchar(256) DEFAULT NULL,
  `status` varchar(64) NOT NULL DEFAULT 'active',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParseStoreRules`
--

LOCK TABLES `ParseStoreRules` WRITE;
/*!40000 ALTER TABLE `ParseStoreRules` DISABLE KEYS */;
INSERT INTO `ParseStoreRules` VALUES (1,128,'http://bitcoinz.ca/','^http:\\/\\/bitcoinz\\.ca\\/.*$',3,10000,'^http:\\/\\/bitcoinz\\.ca\\/index\\.php\\?main_page=product_info\\&cPath=[0-9\\-\\_]+\\&products_id=[0-9]+$','h1#productName',0,'div#productDescription',0,'div#productMainImage img',0,'h2#productPrices',0,'div#categoryIcon',0,'',0,'','active','2011-08-04 13:12:13');
/*!40000 ALTER TABLE `ParseStoreRules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-08-04 22:13:36
