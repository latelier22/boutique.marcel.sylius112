-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: sylius_112_dev
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
INSERT INTO `messenger_messages` VALUES
(15,'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:18:\\\"sylius.command_bus\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:82:\\\"Sylius\\\\Bundle\\\\CoreBundle\\\\CatalogPromotion\\\\Command\\\\ApplyCatalogPromotionsOnVariants\\\":1:{s:13:\\\"variantsCodes\\\";a:1:{i:0;s:3:\\\"MUG\\\";}}}','[]','default','2025-02-02 06:58:35','2025-02-02 06:58:35',NULL),
(16,'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:18:\\\"sylius.command_bus\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:82:\\\"Sylius\\\\Bundle\\\\CoreBundle\\\\CatalogPromotion\\\\Command\\\\ApplyCatalogPromotionsOnVariants\\\":1:{s:13:\\\"variantsCodes\\\";a:1:{i:0;s:8:\\\"CAR15x15\\\";}}}','[]','default','2025-02-02 06:59:02','2025-02-02 06:59:02',NULL);
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;

--
-- Table structure for table `sylius_address`
--

DROP TABLE IF EXISTS `sylius_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `country_code` varchar(255) NOT NULL,
  `province_code` varchar(255) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B97FF0589395C3F3` (`customer_id`),
  CONSTRAINT `FK_B97FF0589395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `sylius_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_address`
--

/*!40000 ALTER TABLE `sylius_address` DISABLE KEYS */;
INSERT INTO `sylius_address` VALUES
(1,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 06:15:10','2025-01-30 06:15:10','FR',NULL,'Côtes-d\'Armor'),
(2,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 06:15:10','2025-01-30 06:15:10','FR',NULL,'Côtes-d\'Armor'),
(3,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 06:37:43','2025-01-30 06:37:43','FR',NULL,'Côtes-d\'Armor'),
(4,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 06:37:43','2025-01-30 06:37:43','FR',NULL,'Côtes-d\'Armor'),
(5,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 08:44:59','2025-01-30 08:45:00','FR',NULL,'Côtes-d\'Armor'),
(6,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 08:44:59','2025-01-30 08:45:00','FR',NULL,'Côtes-d\'Armor'),
(7,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 08:52:57','2025-01-30 08:52:57','FR',NULL,'Côtes-d\'Armor'),
(8,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 08:52:57','2025-01-30 08:52:57','FR',NULL,'Côtes-d\'Armor'),
(9,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 09:52:20','2025-01-30 09:52:20','FR',NULL,'Côtes-d\'Armor'),
(10,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 09:52:20','2025-01-30 09:52:20','FR',NULL,'Côtes-d\'Armor'),
(11,NULL,'KOKOE','SITTI LE CORRE','0619649995','21 rue de la Trinité',NULL,'Loudeac','22600','2025-01-30 10:40:22','2025-01-30 10:40:22','FR',NULL,NULL),
(12,NULL,'KOKOE','SITTI LE CORRE','0619649995','21 rue de la Trinité',NULL,'Loudeac','22600','2025-01-30 10:40:22','2025-01-30 10:40:22','FR',NULL,NULL),
(13,2,'KOKOE','SITTI LE CORRE','0619649995','21 rue de la Trinité',NULL,'Loudeac','22600','2025-01-30 10:40:22','2025-01-30 10:40:22','FR',NULL,NULL),
(14,3,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 20:12:42','2025-01-30 20:12:42','FR',NULL,NULL),
(15,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 20:12:42','2025-01-30 20:12:42','FR',NULL,NULL),
(16,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-30 20:12:42','2025-01-30 20:12:42','FR',NULL,NULL),
(17,NULL,'Multimedia','boutique.multimedia-services.fr','0745510816','7 bd de la gare','MULTIMEDIA-SERVICES','LOUDEAC','22600','2025-01-30 20:14:38','2025-01-30 20:14:38','FR',NULL,NULL),
(18,NULL,'Multimedia','boutique.multimedia-services.fr','0745510816','7 bd de la gare','MULTIMEDIA-SERVICES','LOUDEAC','22600','2025-01-30 20:14:38','2025-01-30 20:14:38','FR',NULL,NULL),
(19,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-31 05:35:06','2025-01-31 05:35:06','FR',NULL,NULL),
(20,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-31 05:35:06','2025-01-31 05:35:06','FR',NULL,NULL),
(21,1,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-31 08:57:29','2025-01-31 08:57:29','FR',NULL,NULL),
(22,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-31 08:57:29','2025-01-31 08:57:29','FR',NULL,NULL),
(23,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-31 08:57:29','2025-01-31 08:57:29','FR',NULL,NULL),
(24,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-31 12:29:01','2025-01-31 12:29:01','FR',NULL,'Côtes-d\'Armor'),
(25,NULL,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-31 12:29:01','2025-01-31 12:29:01','FR',NULL,'Côtes-d\'Armor'),
(26,3,'cyrille','le corre','0644197218','7 bd de la gare','L\'Atelier','LOUDEAC','22600','2025-01-31 12:29:01','2025-01-31 12:29:01','FR',NULL,'Côtes-d\'Armor');
/*!40000 ALTER TABLE `sylius_address` ENABLE KEYS */;

--
-- Table structure for table `sylius_address_log_entries`
--

DROP TABLE IF EXISTS `sylius_address_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_address_log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` varchar(64) DEFAULT NULL,
  `object_class` varchar(255) NOT NULL,
  `version` int(11) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:array)',
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_address_log_entries`
--

/*!40000 ALTER TABLE `sylius_address_log_entries` DISABLE KEYS */;
INSERT INTO `sylius_address_log_entries` VALUES
(1,'create','2025-01-30 06:15:10','1','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(2,'create','2025-01-30 06:15:10','2','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(3,'create','2025-01-30 06:37:43','3','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(4,'create','2025-01-30 06:37:43','4','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(5,'create','2025-01-30 08:45:00','5','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(6,'create','2025-01-30 08:45:00','6','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(7,'create','2025-01-30 08:52:57','7','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(8,'create','2025-01-30 08:52:57','8','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(9,'create','2025-01-30 09:52:20','9','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(10,'create','2025-01-30 09:52:20','10','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}',NULL),
(11,'create','2025-01-30 10:40:22','11','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:5:\"KOKOE\";s:8:\"lastName\";s:14:\"SITTI LE CORRE\";s:11:\"phoneNumber\";s:10:\"0619649995\";s:6:\"street\";s:21:\"21 rue de la Trinité\";s:7:\"company\";N;s:4:\"city\";s:7:\"Loudeac\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','artsvisuelsdemayotte@gmail.com'),
(12,'create','2025-01-30 10:40:22','12','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:5:\"KOKOE\";s:8:\"lastName\";s:14:\"SITTI LE CORRE\";s:11:\"phoneNumber\";s:10:\"0619649995\";s:6:\"street\";s:21:\"21 rue de la Trinité\";s:7:\"company\";N;s:4:\"city\";s:7:\"Loudeac\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','artsvisuelsdemayotte@gmail.com'),
(13,'create','2025-01-30 10:40:39','13','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:5:\"KOKOE\";s:8:\"lastName\";s:14:\"SITTI LE CORRE\";s:11:\"phoneNumber\";s:10:\"0619649995\";s:6:\"street\";s:21:\"21 rue de la Trinité\";s:7:\"company\";N;s:4:\"city\";s:7:\"Loudeac\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','artsvisuelsdemayotte@gmail.com'),
(14,'create','2025-01-30 20:12:42','14','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','bigtoon221274'),
(15,'create','2025-01-30 20:12:42','15','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','bigtoon221274'),
(16,'create','2025-01-30 20:12:42','16','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','bigtoon221274'),
(17,'create','2025-01-30 20:14:38','17','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:10:\"Multimedia\";s:8:\"lastName\";s:31:\"boutique.multimedia-services.fr\";s:11:\"phoneNumber\";s:10:\"0745510816\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:19:\"MULTIMEDIA-SERVICES\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','bigtoon221274'),
(18,'create','2025-01-30 20:14:38','18','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:10:\"Multimedia\";s:8:\"lastName\";s:31:\"boutique.multimedia-services.fr\";s:11:\"phoneNumber\";s:10:\"0745510816\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:19:\"MULTIMEDIA-SERVICES\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','bigtoon221274'),
(19,'create','2025-01-31 05:35:06','19','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','bigtoon221274'),
(20,'create','2025-01-31 05:35:06','20','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','bigtoon221274'),
(21,'create','2025-01-31 08:57:29','21','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','latelier22'),
(22,'create','2025-01-31 08:57:29','22','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','latelier22'),
(23,'create','2025-01-31 08:57:29','23','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";N;}','latelier22'),
(24,'create','2025-01-31 12:29:01','24','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}','lecorre@yahoo.com'),
(25,'create','2025-01-31 12:29:01','25','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}','lecorre@yahoo.com'),
(26,'create','2025-01-31 12:32:49','26','App\\Entity\\Addressing\\Address',1,'a:10:{s:9:\"firstName\";s:7:\"cyrille\";s:8:\"lastName\";s:8:\"le corre\";s:11:\"phoneNumber\";s:10:\"0644197218\";s:6:\"street\";s:15:\"7 bd de la gare\";s:7:\"company\";s:9:\"L\'Atelier\";s:4:\"city\";s:7:\"LOUDEAC\";s:8:\"postcode\";s:5:\"22600\";s:11:\"countryCode\";s:2:\"FR\";s:12:\"provinceCode\";N;s:12:\"provinceName\";s:14:\"Côtes-d\'Armor\";}','lecorre@yahoo.com');
/*!40000 ALTER TABLE `sylius_address_log_entries` ENABLE KEYS */;

--
-- Table structure for table `sylius_adjustment`
--

DROP TABLE IF EXISTS `sylius_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `order_item_unit_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `is_neutral` tinyint(1) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `origin_code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`details`)),
  PRIMARY KEY (`id`),
  KEY `IDX_ACA6E0F28D9F6D38` (`order_id`),
  KEY `IDX_ACA6E0F2E415FB15` (`order_item_id`),
  KEY `IDX_ACA6E0F2F720C233` (`order_item_unit_id`),
  KEY `IDX_ACA6E0F27BE036FC` (`shipment_id`),
  CONSTRAINT `FK_ACA6E0F27BE036FC` FOREIGN KEY (`shipment_id`) REFERENCES `sylius_shipment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ACA6E0F28D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ACA6E0F2E415FB15` FOREIGN KEY (`order_item_id`) REFERENCES `sylius_order_item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ACA6E0F2F720C233` FOREIGN KEY (`order_item_unit_id`) REFERENCES `sylius_order_item_unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_adjustment`
--

/*!40000 ALTER TABLE `sylius_adjustment` DISABLE KEYS */;
INSERT INTO `sylius_adjustment` VALUES
(1,7,NULL,NULL,'shipping','Vente sur place',0,0,0,NULL,'2025-01-30 20:12:42','2025-01-30 20:12:42',1,'{\"shippingMethodCode\":\"BOUTIQUE\",\"shippingMethodName\":\"Vente sur place\"}'),
(2,9,NULL,NULL,'shipping','Vente sur place',0,0,0,NULL,'2025-01-31 05:35:06','2025-01-31 05:35:06',2,'{\"shippingMethodCode\":\"BOUTIQUE\",\"shippingMethodName\":\"Vente sur place\"}'),
(3,10,NULL,NULL,'shipping','Vente sur place',0,0,0,NULL,'2025-01-31 08:57:29','2025-01-31 08:57:29',3,'{\"shippingMethodCode\":\"BOUTIQUE\",\"shippingMethodName\":\"Vente sur place\"}'),
(9,11,NULL,NULL,'shipping','Vente sur place',0,0,0,NULL,'2025-01-31 12:32:49','2025-01-31 12:32:49',4,'{\"shippingMethodCode\":\"BOUTIQUE\",\"shippingMethodName\":\"Vente sur place\"}');
/*!40000 ALTER TABLE `sylius_adjustment` ENABLE KEYS */;

--
-- Table structure for table `sylius_admin_user`
--

DROP TABLE IF EXISTS `sylius_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `username_canonical` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `email_verification_token` varchar(255) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `email` varchar(255) DEFAULT NULL,
  `email_canonical` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `locale_code` varchar(12) NOT NULL,
  `encoder_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_admin_user`
--

/*!40000 ALTER TABLE `sylius_admin_user` DISABLE KEYS */;
INSERT INTO `sylius_admin_user` VALUES
(1,'latelier22','latelier22',1,'gip68nvq7dc8ck8c0ko84ssw4ksw00o','$argon2i$v=19$m=65536,t=4,p=1$QjNPc2FvQ2J0T1pWZGt2NA$Ne8EyagXA2qy47FlUEciaPlUyO1E+YW3lxktnBQZ+5A','2025-02-09 17:39:40',NULL,NULL,NULL,NULL,0,NULL,NULL,'a:1:{i:0;s:26:\"ROLE_ADMINISTRATION_ACCESS\";}','latelier.cyrille@gmail.com','latelier.cyrille@gmail.com','2025-01-30 05:53:20','2025-02-09 17:39:40','cyrille','le corre','fr_FR','argon2i');
/*!40000 ALTER TABLE `sylius_admin_user` ENABLE KEYS */;

--
-- Table structure for table `sylius_avatar_image`
--

DROP TABLE IF EXISTS `sylius_avatar_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_avatar_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1068A3A97E3C61F9` (`owner_id`),
  CONSTRAINT `FK_1068A3A97E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `sylius_admin_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_avatar_image`
--

/*!40000 ALTER TABLE `sylius_avatar_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_avatar_image` ENABLE KEYS */;

--
-- Table structure for table `sylius_catalog_promotion`
--

DROP TABLE IF EXISTS `sylius_catalog_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_catalog_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `exclusive` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1055865077153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_catalog_promotion`
--

/*!40000 ALTER TABLE `sylius_catalog_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_catalog_promotion` ENABLE KEYS */;

--
-- Table structure for table `sylius_catalog_promotion_action`
--

DROP TABLE IF EXISTS `sylius_catalog_promotion_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_catalog_promotion_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_promotion_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `configuration` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_F529624722E2CB5A` (`catalog_promotion_id`),
  CONSTRAINT `FK_F529624722E2CB5A` FOREIGN KEY (`catalog_promotion_id`) REFERENCES `sylius_catalog_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_catalog_promotion_action`
--

/*!40000 ALTER TABLE `sylius_catalog_promotion_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_catalog_promotion_action` ENABLE KEYS */;

--
-- Table structure for table `sylius_catalog_promotion_channels`
--

DROP TABLE IF EXISTS `sylius_catalog_promotion_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_catalog_promotion_channels` (
  `catalog_promotion_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`catalog_promotion_id`,`channel_id`),
  KEY `IDX_48E9AE7622E2CB5A` (`catalog_promotion_id`),
  KEY `IDX_48E9AE7672F5A1AA` (`channel_id`),
  CONSTRAINT `FK_48E9AE7622E2CB5A` FOREIGN KEY (`catalog_promotion_id`) REFERENCES `sylius_catalog_promotion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_48E9AE7672F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_catalog_promotion_channels`
--

/*!40000 ALTER TABLE `sylius_catalog_promotion_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_catalog_promotion_channels` ENABLE KEYS */;

--
-- Table structure for table `sylius_catalog_promotion_scope`
--

DROP TABLE IF EXISTS `sylius_catalog_promotion_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_catalog_promotion_scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `configuration` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_584AA86A139DF194` (`promotion_id`),
  CONSTRAINT `FK_584AA86A139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `sylius_catalog_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_catalog_promotion_scope`
--

/*!40000 ALTER TABLE `sylius_catalog_promotion_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_catalog_promotion_scope` ENABLE KEYS */;

--
-- Table structure for table `sylius_catalog_promotion_translation`
--

DROP TABLE IF EXISTS `sylius_catalog_promotion_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_catalog_promotion_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_catalog_promotion_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_BA065D3C2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_BA065D3C2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_catalog_promotion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_catalog_promotion_translation`
--

/*!40000 ALTER TABLE `sylius_catalog_promotion_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_catalog_promotion_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_channel`
--

DROP TABLE IF EXISTS `sylius_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_locale_id` int(11) NOT NULL,
  `base_currency_id` int(11) NOT NULL,
  `default_tax_zone_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `theme_name` varchar(255) DEFAULT NULL,
  `tax_calculation_strategy` varchar(255) NOT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `skipping_shipping_step_allowed` tinyint(1) NOT NULL,
  `account_verification_required` tinyint(1) NOT NULL,
  `skipping_payment_step_allowed` tinyint(1) NOT NULL,
  `shop_billing_data_id` int(11) DEFAULT NULL,
  `menu_taxon_id` int(11) DEFAULT NULL,
  `contact_phone_number` varchar(255) DEFAULT NULL,
  `shipping_address_in_checkout_required` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_16C8119E77153098` (`code`),
  UNIQUE KEY `UNIQ_16C8119EB5282EDF` (`shop_billing_data_id`),
  KEY `IDX_16C8119E743BF776` (`default_locale_id`),
  KEY `IDX_16C8119E3101778E` (`base_currency_id`),
  KEY `IDX_16C8119EA978C17` (`default_tax_zone_id`),
  KEY `IDX_16C8119EE551C011` (`hostname`),
  KEY `IDX_16C8119EF242B1E6` (`menu_taxon_id`),
  CONSTRAINT `FK_16C8119E3101778E` FOREIGN KEY (`base_currency_id`) REFERENCES `sylius_currency` (`id`),
  CONSTRAINT `FK_16C8119E743BF776` FOREIGN KEY (`default_locale_id`) REFERENCES `sylius_locale` (`id`),
  CONSTRAINT `FK_16C8119EA978C17` FOREIGN KEY (`default_tax_zone_id`) REFERENCES `sylius_zone` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_16C8119EB5282EDF` FOREIGN KEY (`shop_billing_data_id`) REFERENCES `sylius_shop_billing_data` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_16C8119EF242B1E6` FOREIGN KEY (`menu_taxon_id`) REFERENCES `sylius_taxon` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_channel`
--

/*!40000 ALTER TABLE `sylius_channel` DISABLE KEYS */;
INSERT INTO `sylius_channel` VALUES
(1,1,1,NULL,'default','site','#000000',NULL,1,'boutique.marcel-de-mayotte.fr','2025-01-30 05:53:20','2025-02-09 17:41:01',NULL,'order_items_based','latelier.cyrille@gmail.com',0,0,0,1,1,'0745510816',0),
(2,1,1,NULL,'BOUTIQUE','Boutique','#db3333',NULL,1,'www.multimedia-services.fr','2025-01-30 14:29:32','2025-01-31 12:50:35',NULL,'order_items_based',NULL,1,0,1,2,1,NULL,0);
/*!40000 ALTER TABLE `sylius_channel` ENABLE KEYS */;

--
-- Table structure for table `sylius_channel_countries`
--

DROP TABLE IF EXISTS `sylius_channel_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_channel_countries` (
  `channel_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`country_id`),
  KEY `IDX_D96E51AE72F5A1AA` (`channel_id`),
  KEY `IDX_D96E51AEF92F3E70` (`country_id`),
  CONSTRAINT `FK_D96E51AE72F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D96E51AEF92F3E70` FOREIGN KEY (`country_id`) REFERENCES `sylius_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_channel_countries`
--

/*!40000 ALTER TABLE `sylius_channel_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_channel_countries` ENABLE KEYS */;

--
-- Table structure for table `sylius_channel_currencies`
--

DROP TABLE IF EXISTS `sylius_channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_channel_currencies` (
  `channel_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `IDX_AE491F9372F5A1AA` (`channel_id`),
  KEY `IDX_AE491F9338248176` (`currency_id`),
  CONSTRAINT `FK_AE491F9338248176` FOREIGN KEY (`currency_id`) REFERENCES `sylius_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AE491F9372F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_channel_currencies`
--

/*!40000 ALTER TABLE `sylius_channel_currencies` DISABLE KEYS */;
INSERT INTO `sylius_channel_currencies` VALUES
(1,1),
(2,1);
/*!40000 ALTER TABLE `sylius_channel_currencies` ENABLE KEYS */;

--
-- Table structure for table `sylius_channel_locales`
--

DROP TABLE IF EXISTS `sylius_channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_channel_locales` (
  `channel_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `IDX_786B7A8472F5A1AA` (`channel_id`),
  KEY `IDX_786B7A84E559DFD1` (`locale_id`),
  CONSTRAINT `FK_786B7A8472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_786B7A84E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `sylius_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_channel_locales`
--

/*!40000 ALTER TABLE `sylius_channel_locales` DISABLE KEYS */;
INSERT INTO `sylius_channel_locales` VALUES
(1,1),
(2,1);
/*!40000 ALTER TABLE `sylius_channel_locales` ENABLE KEYS */;

--
-- Table structure for table `sylius_channel_pricing`
--

DROP TABLE IF EXISTS `sylius_channel_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_channel_pricing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_variant_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `channel_code` varchar(255) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `minimum_price` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variant_channel_idx` (`product_variant_id`,`channel_code`),
  KEY `IDX_7801820CA80EF684` (`product_variant_id`),
  CONSTRAINT `FK_7801820CA80EF684` FOREIGN KEY (`product_variant_id`) REFERENCES `sylius_product_variant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_channel_pricing`
--

/*!40000 ALTER TABLE `sylius_channel_pricing` DISABLE KEYS */;
INSERT INTO `sylius_channel_pricing` VALUES
(1,1,1800,'default',1800,0),
(2,2,2000,'default',2000,0),
(3,3,1500,'default',1500,0),
(4,4,1750,'default',1750,0),
(5,1,2000,'BOUTIQUE',NULL,0),
(6,5,1800,'default',NULL,0),
(7,5,1800,'BOUTIQUE',NULL,0);
/*!40000 ALTER TABLE `sylius_channel_pricing` ENABLE KEYS */;

--
-- Table structure for table `sylius_channel_pricing_catalog_promotions`
--

DROP TABLE IF EXISTS `sylius_channel_pricing_catalog_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_channel_pricing_catalog_promotions` (
  `channel_pricing_id` int(11) NOT NULL,
  `catalog_promotion_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_pricing_id`,`catalog_promotion_id`),
  KEY `IDX_9F52FF513EADFFE5` (`channel_pricing_id`),
  KEY `IDX_9F52FF5122E2CB5A` (`catalog_promotion_id`),
  CONSTRAINT `FK_9F52FF5122E2CB5A` FOREIGN KEY (`catalog_promotion_id`) REFERENCES `sylius_catalog_promotion` (`id`),
  CONSTRAINT `FK_9F52FF513EADFFE5` FOREIGN KEY (`channel_pricing_id`) REFERENCES `sylius_channel_pricing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_channel_pricing_catalog_promotions`
--

/*!40000 ALTER TABLE `sylius_channel_pricing_catalog_promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_channel_pricing_catalog_promotions` ENABLE KEYS */;

--
-- Table structure for table `sylius_country`
--

DROP TABLE IF EXISTS `sylius_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E74256BF77153098` (`code`),
  KEY `IDX_E74256BF77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_country`
--

/*!40000 ALTER TABLE `sylius_country` DISABLE KEYS */;
INSERT INTO `sylius_country` VALUES
(1,'FR',1);
/*!40000 ALTER TABLE `sylius_country` ENABLE KEYS */;

--
-- Table structure for table `sylius_currency`
--

DROP TABLE IF EXISTS `sylius_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_96EDD3D077153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_currency`
--

/*!40000 ALTER TABLE `sylius_currency` DISABLE KEYS */;
INSERT INTO `sylius_currency` VALUES
(1,'EUR','2025-01-30 05:53:14','2025-01-30 05:53:14');
/*!40000 ALTER TABLE `sylius_currency` ENABLE KEYS */;

--
-- Table structure for table `sylius_customer`
--

DROP TABLE IF EXISTS `sylius_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) DEFAULT NULL,
  `default_address_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'u',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `subscribed_to_newsletter` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7E82D5E6E7927C74` (`email`),
  UNIQUE KEY `UNIQ_7E82D5E6A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_7E82D5E6BD94FB16` (`default_address_id`),
  KEY `IDX_7E82D5E6D2919A68` (`customer_group_id`),
  KEY `created_at_index` (`created_at` DESC),
  CONSTRAINT `FK_7E82D5E6BD94FB16` FOREIGN KEY (`default_address_id`) REFERENCES `sylius_address` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7E82D5E6D2919A68` FOREIGN KEY (`customer_group_id`) REFERENCES `sylius_customer_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_customer`
--

/*!40000 ALTER TABLE `sylius_customer` DISABLE KEYS */;
INSERT INTO `sylius_customer` VALUES
(1,NULL,NULL,'latelier.cyrille@gmail.com','latelier.cyrille@gmail.com',NULL,NULL,NULL,'u','2025-01-30 06:15:10','2025-01-30 06:15:10',NULL,0),
(2,NULL,NULL,'artsvisuelsdemayotte@gmail.com','artsvisuelsdemayotte@gmail.com','KOKOE','SITTI LE CORRE',NULL,'u','2025-01-30 10:38:47','2025-01-30 10:38:47','0644197218',0),
(3,NULL,NULL,'lecorre@yahoo.com','lecorre@yahoo.com','cyrille','le corre','1974-12-22 00:00:00','m','2025-01-30 19:42:54','2025-01-30 19:47:42','0644197218',0),
(4,NULL,NULL,'eval91@yahoo.com','eval91@yahoo.com',NULL,NULL,NULL,'u','2025-01-30 20:06:32','2025-01-30 20:06:32',NULL,0),
(5,NULL,NULL,'contact@multimedia-services.fr','contact@multimedia-services.fr',NULL,NULL,NULL,'u','2025-01-30 20:14:05','2025-01-30 20:14:05',NULL,0);
/*!40000 ALTER TABLE `sylius_customer` ENABLE KEYS */;

--
-- Table structure for table `sylius_customer_group`
--

DROP TABLE IF EXISTS `sylius_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_customer_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7FCF9B0577153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_customer_group`
--

/*!40000 ALTER TABLE `sylius_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_customer_group` ENABLE KEYS */;

--
-- Table structure for table `sylius_exchange_rate`
--

DROP TABLE IF EXISTS `sylius_exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_exchange_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_currency` int(11) NOT NULL,
  `target_currency` int(11) NOT NULL,
  `ratio` decimal(10,5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5F52B852A76BEEDB3FD5856` (`source_currency`,`target_currency`),
  KEY `IDX_5F52B852A76BEED` (`source_currency`),
  KEY `IDX_5F52B85B3FD5856` (`target_currency`),
  CONSTRAINT `FK_5F52B852A76BEED` FOREIGN KEY (`source_currency`) REFERENCES `sylius_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5F52B85B3FD5856` FOREIGN KEY (`target_currency`) REFERENCES `sylius_currency` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_exchange_rate`
--

/*!40000 ALTER TABLE `sylius_exchange_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_exchange_rate` ENABLE KEYS */;

--
-- Table structure for table `sylius_gateway_config`
--

DROP TABLE IF EXISTS `sylius_gateway_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_gateway_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`config`)),
  `gateway_name` varchar(255) NOT NULL,
  `factory_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_gateway_config`
--

/*!40000 ALTER TABLE `sylius_gateway_config` DISABLE KEYS */;
INSERT INTO `sylius_gateway_config` VALUES
(1,'{\"publishable_key\":\"pk_test_51PXdMgDkRKSNjj9TS6VPTxV2oWagm16Btp2gK69ttAaeJPF13qNzNhrnOK8o4Jqswt8XLlCszECbLX2WMXboILim00BV0Z6Rje\",\"secret_key\":\"sk_test_51PXdMgDkRKSNjj9TYUGsC0Ra5FIbKTLXJeOmDEHVqFEvVIQHjqlE30HSCLZnJbJ1HAD9N3PaGmYc8ad1LXlEIo2A00HqQyYyfT\"}','stripe','stripe_checkout'),
(2,'{\"publishable_key\":\"pk_test_51PXdMgDkRKSNjj9TS6VPTxV2oWagm16Btp2gK69ttAaeJPF13qNzNhrnOK8o4Jqswt8XLlCszECbLX2WMXboILim00BV0Z6Rje\",\"secret_key\":\"sk_test_51PXdMgDkRKSNjj9TYUGsC0Ra5FIbKTLXJeOmDEHVqFEvVIQHjqlE30HSCLZnJbJ1HAD9N3PaGmYc8ad1LXlEIo2A00HqQyYyfT\",\"use_authorize\":false,\"webhook_secret_keys\":[\"whsec_UHRLe0zsP6Og26DB77wWD5OLVdEhDEL7\"]}','stripe2','stripe_js'),
(3,'[]','cb_boutique','offline'),
(4,'[]','esp_boutique','offline');
/*!40000 ALTER TABLE `sylius_gateway_config` ENABLE KEYS */;

--
-- Table structure for table `sylius_invoicing_plugin_billing_data`
--

DROP TABLE IF EXISTS `sylius_invoicing_plugin_billing_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_invoicing_plugin_billing_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `province_code` varchar(255) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_invoicing_plugin_billing_data`
--

/*!40000 ALTER TABLE `sylius_invoicing_plugin_billing_data` DISABLE KEYS */;
INSERT INTO `sylius_invoicing_plugin_billing_data` VALUES
(1,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,'Côtes-d\'Armor'),
(2,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,'Côtes-d\'Armor'),
(3,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,'Côtes-d\'Armor'),
(4,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,'Côtes-d\'Armor'),
(5,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,'Côtes-d\'Armor'),
(6,'KOKOE','SITTI LE CORRE',NULL,'21 rue de la Trinité','Loudeac','22600','FR',NULL,NULL),
(7,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,NULL),
(8,'Multimedia','boutique.multimedia-services.fr','MULTIMEDIA-SERVICES','7 bd de la gare','LOUDEAC','22600','FR',NULL,NULL),
(9,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,NULL),
(10,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,NULL),
(11,'cyrille','le corre','L\'Atelier','7 bd de la gare','LOUDEAC','22600','FR',NULL,'Côtes-d\'Armor');
/*!40000 ALTER TABLE `sylius_invoicing_plugin_billing_data` ENABLE KEYS */;

--
-- Table structure for table `sylius_invoicing_plugin_invoice`
--

DROP TABLE IF EXISTS `sylius_invoicing_plugin_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_invoicing_plugin_invoice` (
  `id` varchar(255) NOT NULL,
  `billing_data_id` int(11) DEFAULT NULL,
  `issued_at` datetime NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `total` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  `locale_code` varchar(255) NOT NULL,
  `shop_billing_data_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_state` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3AA279BF5CDB2AEB` (`billing_data_id`),
  UNIQUE KEY `UNIQ_3AA279BFB5282EDF` (`shop_billing_data_id`),
  KEY `IDX_3AA279BF72F5A1AA` (`channel_id`),
  KEY `IDX_3AA279BF8D9F6D38` (`order_id`),
  CONSTRAINT `FK_3AA279BF5CDB2AEB` FOREIGN KEY (`billing_data_id`) REFERENCES `sylius_invoicing_plugin_billing_data` (`id`),
  CONSTRAINT `FK_3AA279BF72F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`),
  CONSTRAINT `FK_3AA279BF8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`),
  CONSTRAINT `FK_3AA279BFCFE4AA36` FOREIGN KEY (`shop_billing_data_id`) REFERENCES `sylius_invoicing_plugin_shop_billing_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_invoicing_plugin_invoice`
--

/*!40000 ALTER TABLE `sylius_invoicing_plugin_invoice` DISABLE KEYS */;
INSERT INTO `sylius_invoicing_plugin_invoice` VALUES
('08b3d9d6-eb32-446d-869b-b2e9261bb157',7,'2025-01-30 20:12:42','EUR',5000,'2025/01/000000007','fr_FR',7,1,7,'pending'),
('0919de4f-04c6-4f66-9e27-307bf5a1a690',9,'2025-01-31 05:35:06','EUR',1750,'2025/01/000000009','fr_FR',9,1,9,'pending'),
('0a2cb41c-44ce-469d-8422-ea5a474ea8b4',11,'2025-01-31 12:32:49','EUR',1500,'2025/01/000000011','fr_FR',11,1,11,'pending'),
('12c29fa5-c24e-4a79-8857-fe284d34994d',8,'2025-01-30 20:14:38','EUR',1800,'2025/01/000000008','fr_FR',8,1,8,'pending'),
('36ae965d-a6d9-4ee8-a546-0b4c3100cf86',2,'2025-01-30 18:24:25','EUR',1800,'2025/01/000000002','fr_FR',2,1,2,'pending'),
('5baf3d1b-6ee3-4723-b5f3-22b8a9ae84a8',5,'2025-01-30 18:24:25','EUR',1800,'2025/01/000000005','fr_FR',5,1,5,'completed'),
('95811721-f43a-44cb-950e-79b215d1a106',10,'2025-01-31 08:57:29','EUR',1500,'2025/01/000000010','fr_FR',10,1,10,'pending'),
('b3a94a90-ffad-4bd3-8b46-0e66689ec8bc',1,'2025-01-30 18:24:25','EUR',1800,'2025/01/000000001','fr_FR',1,1,1,'pending'),
('fa588755-2195-4c78-a929-29fc0746177a',6,'2025-01-30 18:24:25','EUR',1800,'2025/01/000000006','fr_FR',6,1,6,'completed'),
('faffe58e-20cc-4649-81a5-0ce72cb898e5',4,'2025-01-30 18:24:25','EUR',1800,'2025/01/000000004','fr_FR',4,1,4,'completed'),
('fe202bf9-dc0e-4b8d-a988-528fc010e29a',3,'2025-01-30 18:24:25','EUR',1800,'2025/01/000000003','fr_FR',3,1,3,'pending');
/*!40000 ALTER TABLE `sylius_invoicing_plugin_invoice` ENABLE KEYS */;

--
-- Table structure for table `sylius_invoicing_plugin_line_item`
--

DROP TABLE IF EXISTS `sylius_invoicing_plugin_line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_invoicing_plugin_line_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `tax_total` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `variant_code` varchar(255) DEFAULT NULL,
  `variant_name` varchar(255) DEFAULT NULL,
  `tax_rate` varchar(255) DEFAULT NULL,
  `discounted_unit_net_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C91408292989F1FD` (`invoice_id`),
  CONSTRAINT `FK_C91408292989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `sylius_invoicing_plugin_invoice` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_invoicing_plugin_line_item`
--

/*!40000 ALTER TABLE `sylius_invoicing_plugin_line_item` DISABLE KEYS */;
INSERT INTO `sylius_invoicing_plugin_line_item` VALUES
(1,'b3a94a90-ffad-4bd3-8b46-0e66689ec8bc','Mug',1,1800,1800,0,1800,'MUG',NULL,NULL,1800),
(2,'36ae965d-a6d9-4ee8-a546-0b4c3100cf86','Mug',1,1800,1800,0,1800,'MUG',NULL,NULL,1800),
(3,'fe202bf9-dc0e-4b8d-a988-528fc010e29a','Mug',1,1800,1800,0,1800,'MUG',NULL,NULL,1800),
(4,'faffe58e-20cc-4649-81a5-0ce72cb898e5','Mug',1,1800,1800,0,1800,'MUG',NULL,NULL,1800),
(5,'5baf3d1b-6ee3-4723-b5f3-22b8a9ae84a8','Mug',1,1800,1800,0,1800,'MUG',NULL,NULL,1800),
(6,'fa588755-2195-4c78-a929-29fc0746177a','Mug',1,1800,1800,0,1800,'MUG',NULL,NULL,1800),
(7,'08b3d9d6-eb32-446d-869b-b2e9261bb157','Mug Noir',1,2000,2000,0,2000,'MUG001','Mug Noir',NULL,2000),
(8,'08b3d9d6-eb32-446d-869b-b2e9261bb157','Mug Jaune',2,1500,3000,0,3000,'MUG002','Mug Jaune',NULL,1500),
(9,'08b3d9d6-eb32-446d-869b-b2e9261bb157','Vente sur place',1,0,0,0,0,NULL,NULL,NULL,0),
(10,'12c29fa5-c24e-4a79-8857-fe284d34994d','Mug',1,1800,1800,0,1800,'MUG','Mug',NULL,1800),
(11,'0919de4f-04c6-4f66-9e27-307bf5a1a690','Mug Rouge',1,1750,1750,0,1750,'MUG003','Mug Rouge',NULL,1750),
(12,'0919de4f-04c6-4f66-9e27-307bf5a1a690','Vente sur place',1,0,0,0,0,NULL,NULL,NULL,0),
(13,'95811721-f43a-44cb-950e-79b215d1a106','Mug Jaune',1,1500,1500,0,1500,'MUG002','Mug Jaune',NULL,1500),
(14,'95811721-f43a-44cb-950e-79b215d1a106','Vente sur place',1,0,0,0,0,NULL,NULL,NULL,0),
(15,'0a2cb41c-44ce-469d-8422-ea5a474ea8b4','Mug Jaune',1,1500,1500,0,1500,'MUG002','Mug Jaune',NULL,1500),
(16,'0a2cb41c-44ce-469d-8422-ea5a474ea8b4','Vente sur place',1,0,0,0,0,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sylius_invoicing_plugin_line_item` ENABLE KEYS */;

--
-- Table structure for table `sylius_invoicing_plugin_sequence`
--

DROP TABLE IF EXISTS `sylius_invoicing_plugin_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_invoicing_plugin_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idx` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_invoicing_plugin_sequence`
--

/*!40000 ALTER TABLE `sylius_invoicing_plugin_sequence` DISABLE KEYS */;
INSERT INTO `sylius_invoicing_plugin_sequence` VALUES
(1,11,11);
/*!40000 ALTER TABLE `sylius_invoicing_plugin_sequence` ENABLE KEYS */;

--
-- Table structure for table `sylius_invoicing_plugin_shop_billing_data`
--

DROP TABLE IF EXISTS `sylius_invoicing_plugin_shop_billing_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_invoicing_plugin_shop_billing_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `representative` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_invoicing_plugin_shop_billing_data`
--

/*!40000 ALTER TABLE `sylius_invoicing_plugin_shop_billing_data` DISABLE KEYS */;
INSERT INTO `sylius_invoicing_plugin_shop_billing_data` VALUES
(1,'L\'Atelier',NULL,'7 bd de la gare','LOUDEAC','22600',NULL,NULL),
(2,'L\'Atelier',NULL,'7 bd de la gare','LOUDEAC','22600',NULL,NULL),
(3,'L\'Atelier',NULL,'7 bd de la gare','LOUDEAC','22600',NULL,NULL),
(4,'L\'Atelier',NULL,'7 bd de la gare','LOUDEAC','22600',NULL,NULL),
(5,'L\'Atelier',NULL,'7 bd de la gare','LOUDEAC','22600',NULL,NULL),
(6,'L\'Atelier',NULL,'7 bd de la gare','LOUDEAC','22600',NULL,NULL),
(7,'MULTIMEDIA-SERVICES',NULL,'7 bd de la gare','LOUDEAC','22600','FR',NULL),
(8,'MULTIMEDIA-SERVICES',NULL,'7 bd de la gare','LOUDEAC','22600','FR',NULL),
(9,'MULTIMEDIA-SERVICES',NULL,'7 bd de la gare','LOUDEAC','22600','FR',NULL),
(10,'MULTIMEDIA-SERVICES',NULL,'7 bd de la gare','LOUDEAC','22600','FR',NULL),
(11,'MULTIMEDIA-SERVICES',NULL,'7 bd de la gare','LOUDEAC','22600','FR',NULL);
/*!40000 ALTER TABLE `sylius_invoicing_plugin_shop_billing_data` ENABLE KEYS */;

--
-- Table structure for table `sylius_invoicing_plugin_tax_item`
--

DROP TABLE IF EXISTS `sylius_invoicing_plugin_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_invoicing_plugin_tax_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2951C61C2989F1FD` (`invoice_id`),
  CONSTRAINT `FK_2951C61C2989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `sylius_invoicing_plugin_invoice` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_invoicing_plugin_tax_item`
--

/*!40000 ALTER TABLE `sylius_invoicing_plugin_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_invoicing_plugin_tax_item` ENABLE KEYS */;

--
-- Table structure for table `sylius_locale`
--

DROP TABLE IF EXISTS `sylius_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7BA1286477153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_locale`
--

/*!40000 ALTER TABLE `sylius_locale` DISABLE KEYS */;
INSERT INTO `sylius_locale` VALUES
(1,'fr_FR','2025-01-30 05:53:19','2025-01-30 05:53:19');
/*!40000 ALTER TABLE `sylius_locale` ENABLE KEYS */;

--
-- Table structure for table `sylius_migrations`
--

DROP TABLE IF EXISTS `sylius_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_migrations` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_migrations`
--

/*!40000 ALTER TABLE `sylius_migrations` DISABLE KEYS */;
INSERT INTO `sylius_migrations` VALUES
('App\\Migrations\\Version20250131102124','2025-01-31 10:21:48',12),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161202011555','2025-01-30 05:52:52',697),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161209095131','2025-01-30 05:52:52',0),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161214153137','2025-01-30 05:52:52',13),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161215103325','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161219160441','2025-01-30 05:52:52',13),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161220092422','2025-01-30 05:52:52',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161221133514','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161223091334','2025-01-30 05:52:52',5),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20161223164558','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170103120334','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170109143010','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170110120125','2025-01-30 05:52:52',8),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170116215417','2025-01-30 05:52:52',17),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170117075436','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170120164250','2025-01-30 05:52:52',44),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170124221955','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170201094058','2025-01-30 05:52:52',16),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170206122839','2025-01-30 05:52:52',4),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170206141520','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170208102345','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170208103250','2025-01-30 05:52:52',6),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170214095710','2025-01-30 05:52:52',12),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170214104908','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170215143031','2025-01-30 05:52:52',6),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170217141621','2025-01-30 05:52:52',8),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170220150813','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170223071604','2025-01-30 05:52:52',16),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170301135010','2025-01-30 05:52:52',15),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170303170201','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170321131352','2025-01-30 05:52:52',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170327135945','2025-01-30 05:52:52',56),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170401200415','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170518123056','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170824124122','2025-01-30 05:52:53',6),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20170913125128','2025-01-30 05:52:53',7),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20171003103916','2025-01-30 05:52:53',14),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20180102140039','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20180226142349','2025-01-30 05:52:53',5),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20190109095211','2025-01-30 05:52:53',14),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20190109160409','2025-01-30 05:52:53',5),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20190204092544','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20190416073011','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20190607135638','2025-01-30 05:52:53',7),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20191024065651','2025-01-30 05:52:53',8),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20200110132702','2025-01-30 05:52:53',14),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20200122082429','2025-01-30 05:52:53',12),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20200202104152','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20200309172908','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20200325075815','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20200916093101','2025-01-30 05:52:53',5),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20201017150005','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20201104085538','2025-01-30 05:52:53',8),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20201130071338','2025-01-30 05:52:53',101),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20201204071301','2025-01-30 05:52:53',68),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20201208105207','2025-01-30 05:52:53',1),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210311142134','2025-01-30 05:52:53',8),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210408131321','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210422105530','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210809121349','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210819203611','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210824132538','2025-01-30 05:52:53',6),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210825090004','2025-01-30 05:52:53',8),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210826054355','2025-01-30 05:52:53',13),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210826063828','2025-01-30 05:52:53',7),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210830193340','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20210921093619','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211001073918','2025-01-30 05:52:53',7),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211006182150','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211008105704','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211018130725','2025-01-30 05:52:53',13),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211025082311','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211028150911','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211122104644','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211125085254','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211125122631','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20211129213836','2025-01-30 05:52:53',16),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220127150747','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220203115813','2025-01-30 05:52:53',88),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220210135918','2025-01-30 05:52:53',3),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220407131547','2025-01-30 05:52:53',91),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220412144156','2025-01-30 05:52:53',1),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220614124639','2025-01-30 05:52:53',0),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220728115129','2025-01-30 05:52:53',2),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220803125615','2025-01-30 05:52:53',6),
('Sylius\\Bundle\\CoreBundle\\Migrations\\Version20220912091947','2025-01-30 05:52:53',2),
('Sylius\\InvoicingPlugin\\Migrations\\Version20180626120743','2025-01-30 18:23:27',29),
('Sylius\\InvoicingPlugin\\Migrations\\Version20180711070226','2025-01-30 18:23:27',42),
('Sylius\\InvoicingPlugin\\Migrations\\Version20180711084815','2025-01-30 18:23:27',11),
('Sylius\\InvoicingPlugin\\Migrations\\Version20180801083047','2025-01-30 18:23:27',3),
('Sylius\\InvoicingPlugin\\Migrations\\Version20180826064735','2025-01-30 18:23:27',3),
('Sylius\\InvoicingPlugin\\Migrations\\Version20190103134228','2025-01-30 18:23:27',3),
('Sylius\\InvoicingPlugin\\Migrations\\Version20190604071441','2025-01-30 18:23:27',3),
('Sylius\\InvoicingPlugin\\Migrations\\Version20190607001446','2025-01-30 18:23:27',9),
('Sylius\\InvoicingPlugin\\Migrations\\Version20190607002945','2025-01-30 18:23:27',8),
('Sylius\\InvoicingPlugin\\Migrations\\Version20191016124548','2025-01-30 18:23:27',31),
('Sylius\\InvoicingPlugin\\Migrations\\Version20191216134233','2025-01-30 18:23:27',14),
('Sylius\\InvoicingPlugin\\Migrations\\Version20210607115930','2025-01-30 18:23:27',21),
('Sylius\\InvoicingPlugin\\Migrations\\Version20210729071327','2025-01-30 18:23:27',3),
('Sylius\\InvoicingPlugin\\Migrations\\Version20210812125029','2025-01-30 18:23:27',4),
('Sylius\\InvoicingPlugin\\Migrations\\Version20220811054008','2025-01-30 18:23:27',3),
('Sylius\\PayPalPlugin\\Migrations\\Version20200907102535','2025-01-30 05:52:53',6),
('Sylius\\RefundPlugin\\Migrations\\Version20180704112314','2025-01-30 18:23:27',3),
('Sylius\\RefundPlugin\\Migrations\\Version20180718125528','2025-01-30 18:23:27',6),
('Sylius\\RefundPlugin\\Migrations\\Version20180817130113','2025-01-30 18:23:27',7),
('Sylius\\RefundPlugin\\Migrations\\Version20180820132147','2025-01-30 18:23:27',4),
('Sylius\\RefundPlugin\\Migrations\\Version20180829090832','2025-01-30 18:23:27',3),
('Sylius\\RefundPlugin\\Migrations\\Version20190207125150','2025-01-30 18:23:27',5),
('Sylius\\RefundPlugin\\Migrations\\Version20190215154028','2025-01-30 18:23:27',4),
('Sylius\\RefundPlugin\\Migrations\\Version20190517064223','2025-01-30 18:23:27',2),
('Sylius\\RefundPlugin\\Migrations\\Version20190928200659','2025-01-30 18:23:27',47),
('Sylius\\RefundPlugin\\Migrations\\Version20191217075815','2025-01-30 18:23:27',11),
('Sylius\\RefundPlugin\\Migrations\\Version20191230121402','2025-01-30 18:23:27',20),
('Sylius\\RefundPlugin\\Migrations\\Version20200113091731','2025-01-30 18:23:27',3),
('Sylius\\RefundPlugin\\Migrations\\Version20200125182414','2025-01-30 18:23:27',20),
('Sylius\\RefundPlugin\\Migrations\\Version20200131082149','2025-01-30 18:23:27',21),
('Sylius\\RefundPlugin\\Migrations\\Version20200304172851','2025-01-30 18:23:27',1),
('Sylius\\RefundPlugin\\Migrations\\Version20200306145439','2025-01-30 18:23:27',9),
('Sylius\\RefundPlugin\\Migrations\\Version20200306153205','2025-01-30 18:23:27',11),
('Sylius\\RefundPlugin\\Migrations\\Version20200310094633','2025-01-30 18:23:27',4),
('Sylius\\RefundPlugin\\Migrations\\Version20200310185620','2025-01-30 18:23:27',3),
('Sylius\\RefundPlugin\\Migrations\\Version20210608074013','2025-01-30 18:23:27',17),
('Sylius\\RefundPlugin\\Migrations\\Version20210609071246','2025-01-30 18:23:27',17);
/*!40000 ALTER TABLE `sylius_migrations` ENABLE KEYS */;

--
-- Table structure for table `sylius_order`
--

DROP TABLE IF EXISTS `sylius_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `promotion_coupon_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `checkout_completed_at` datetime DEFAULT NULL,
  `items_total` int(11) NOT NULL,
  `adjustments_total` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `locale_code` varchar(255) NOT NULL,
  `checkout_state` varchar(255) NOT NULL,
  `payment_state` varchar(255) NOT NULL,
  `shipping_state` varchar(255) NOT NULL,
  `token_value` varchar(255) DEFAULT NULL,
  `customer_ip` varchar(255) DEFAULT NULL,
  `created_by_guest` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6196A1F996901F54` (`number`),
  UNIQUE KEY `UNIQ_6196A1F94D4CFF2B` (`shipping_address_id`),
  UNIQUE KEY `UNIQ_6196A1F979D0C0E4` (`billing_address_id`),
  UNIQUE KEY `UNIQ_6196A1F9BEA95C75` (`token_value`),
  KEY `IDX_6196A1F972F5A1AA` (`channel_id`),
  KEY `IDX_6196A1F917B24436` (`promotion_coupon_id`),
  KEY `IDX_6196A1F99395C3F3` (`customer_id`),
  KEY `IDX_6196A1F9A393D2FB43625D9F` (`state`,`updated_at`),
  CONSTRAINT `FK_6196A1F917B24436` FOREIGN KEY (`promotion_coupon_id`) REFERENCES `sylius_promotion_coupon` (`id`),
  CONSTRAINT `FK_6196A1F94D4CFF2B` FOREIGN KEY (`shipping_address_id`) REFERENCES `sylius_address` (`id`),
  CONSTRAINT `FK_6196A1F972F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`),
  CONSTRAINT `FK_6196A1F979D0C0E4` FOREIGN KEY (`billing_address_id`) REFERENCES `sylius_address` (`id`),
  CONSTRAINT `FK_6196A1F99395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `sylius_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_order`
--

/*!40000 ALTER TABLE `sylius_order` DISABLE KEYS */;
INSERT INTO `sylius_order` VALUES
(1,1,2,1,NULL,1,'000000001',NULL,'new','2025-01-30 06:15:26',1800,0,1800,'2025-01-30 06:14:51','2025-01-30 06:15:26','EUR','fr_FR','completed','awaiting_payment','shipped','ZmdE7V1wXB_LZlKc-aC2L3Jy-zDqBSkIcvxLAraZ4ni~XzC_Z0lg-h6V8X7oSg6t','88.180.147.50',1),
(2,3,4,1,NULL,1,'000000002',NULL,'new','2025-01-30 06:37:52',1800,0,1800,'2025-01-30 06:37:22','2025-01-30 06:37:52','EUR','fr_FR','completed','awaiting_payment','shipped','GTzp_OI1n7F957vdXn3DLb8bACgzgiLqBTlGopumJnfCpk93Wp3kj4BV3rTUhvz4','88.180.147.50',1),
(3,5,6,1,NULL,1,'000000003',NULL,'new','2025-01-30 08:45:06',1800,0,1800,'2025-01-30 08:44:32','2025-01-30 08:45:06','EUR','fr_FR','completed','awaiting_payment','shipped','_EwVcRKr3vNxOQ1rIs3xiaXzARQR5UolYQP~e8VLGcFLbfQLOXZ96zfAL6YSMY6H','185.233.130.9',1),
(4,7,8,1,NULL,1,'000000004',NULL,'fulfilled','2025-01-30 08:53:07',1800,0,1800,'2025-01-30 08:52:41','2025-01-30 08:53:21','EUR','fr_FR','completed','paid','shipped','ClnMgl3tF8nEsA509UhHMkJJGSPuoJhi5FdG-TkmaHDHqtsZi_69qXsCgMQ8C7wL','185.233.130.9',1),
(5,9,10,1,NULL,1,'000000005',NULL,'fulfilled','2025-01-30 09:52:38',1800,0,1800,'2025-01-30 09:52:07','2025-01-30 09:53:25','EUR','fr_FR','completed','paid','shipped','ZP3pD2U~a~XRRPzYofSLJ5d3eu38OHt3n3DYSIMj-Usr_3sQ8Sjj1e1p7-IZPSDH','185.233.130.9',1),
(6,11,12,1,NULL,2,'000000006',NULL,'fulfilled','2025-01-30 10:40:39',1800,0,1800,'2025-01-30 10:40:08','2025-01-30 10:55:09','EUR','fr_FR','completed','paid','shipped','YxzwD2Ues~c9qxUDn2j9hkWc7ZvM43nz3-oDQ6~i7FOEHzkOWszf6oqmJKf-wWBD','185.233.130.9',0),
(7,15,16,1,NULL,3,'000000007',NULL,'new','2025-01-30 20:12:42',5000,0,5000,'2025-01-30 20:12:41','2025-01-30 20:12:42','EUR','fr_FR','completed','awaiting_payment','ready','iPXCFNigL8CV5QFoIOJ-XYTJ2x45910CAeWcHxG9Lr2aDRoZ6hgaFpT5CItXSUEZ',NULL,1),
(8,17,18,1,NULL,5,'000000008',NULL,'new','2025-01-30 20:14:38',1800,0,1800,'2025-01-30 20:14:38','2025-01-30 20:14:38','EUR','fr_FR','completed','awaiting_payment','shipped','2jIsrfcr8ogL6MLCYoK1uUYElmYn4otlQyXgaFk_hIujZF934sDz0J74~qsa_837',NULL,1),
(9,19,20,1,NULL,3,'000000009',NULL,'new','2025-01-31 05:35:06',1750,0,1750,'2025-01-31 05:35:06','2025-01-31 05:35:30','EUR','fr_FR','completed','awaiting_payment','shipped','~kYw1r2jR21KcxSCp5TijwAVHaP~s29w0gKtWIvrIC0glnRLlou8o6~SwPTtB~ff',NULL,1),
(10,22,23,1,NULL,1,'000000010',NULL,'new','2025-01-31 08:57:29',1500,0,1500,'2025-01-31 08:57:29','2025-01-31 08:57:29','EUR','fr_FR','completed','awaiting_payment','ready','Ly3ub-npZJqf_biItLtvLH3DwXzfyLK~O_Ri94gonGPMaKulAwOn3P7lEW4FNtnv',NULL,1),
(11,24,25,1,NULL,3,'000000011',NULL,'new','2025-01-31 12:32:49',1500,0,1500,'2025-01-31 12:28:25','2025-01-31 12:33:09','EUR','fr_FR','completed','paid','ready','4rL_~uAVxNuQop4GzgGCn0MBtWzh7HGKJJxbewY9g~XIj~tNQWdiQt_a7QFILDws','88.180.147.50',0);
/*!40000 ALTER TABLE `sylius_order` ENABLE KEYS */;

--
-- Table structure for table `sylius_order_item`
--

DROP TABLE IF EXISTS `sylius_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `units_total` int(11) NOT NULL,
  `adjustments_total` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `is_immutable` tinyint(1) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `variant_name` varchar(255) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `original_unit_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_77B587ED8D9F6D38` (`order_id`),
  KEY `IDX_77B587ED3B69A9AF` (`variant_id`),
  CONSTRAINT `FK_77B587ED3B69A9AF` FOREIGN KEY (`variant_id`) REFERENCES `sylius_product_variant` (`id`),
  CONSTRAINT `FK_77B587ED8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_order_item`
--

/*!40000 ALTER TABLE `sylius_order_item` DISABLE KEYS */;
INSERT INTO `sylius_order_item` VALUES
(1,1,1,1,1800,1800,0,1800,0,'Mug',NULL,2,1800),
(2,2,1,1,1800,1800,0,1800,0,'Mug',NULL,2,1800),
(3,3,1,1,1800,1800,0,1800,0,'Mug',NULL,2,1800),
(4,4,1,1,1800,1800,0,1800,0,'Mug',NULL,2,1800),
(5,5,1,1,1800,1800,0,1800,0,'Mug',NULL,2,1800),
(6,6,1,1,1800,1800,0,1800,0,'Mug',NULL,2,1800),
(7,7,2,1,2000,2000,0,2000,0,'Mug Noir','Mug Noir',1,2000),
(8,7,3,2,1500,3000,0,3000,0,'Mug Jaune','Mug Jaune',1,1500),
(9,8,1,1,1800,1800,0,1800,0,'Mug','Mug',1,1800),
(10,9,4,1,1750,1750,0,1750,0,'Mug Rouge','Mug Rouge',1,1750),
(11,10,3,1,1500,1500,0,1500,0,'Mug Jaune','Mug Jaune',1,1500),
(12,11,3,1,1500,1500,0,1500,0,'Mug Jaune','Mug Jaune',2,1500);
/*!40000 ALTER TABLE `sylius_order_item` ENABLE KEYS */;

--
-- Table structure for table `sylius_order_item_unit`
--

DROP TABLE IF EXISTS `sylius_order_item_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_order_item_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) NOT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `adjustments_total` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_82BF226EE415FB15` (`order_item_id`),
  KEY `IDX_82BF226E7BE036FC` (`shipment_id`),
  CONSTRAINT `FK_82BF226E7BE036FC` FOREIGN KEY (`shipment_id`) REFERENCES `sylius_shipment` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_82BF226EE415FB15` FOREIGN KEY (`order_item_id`) REFERENCES `sylius_order_item` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_order_item_unit`
--

/*!40000 ALTER TABLE `sylius_order_item_unit` DISABLE KEYS */;
INSERT INTO `sylius_order_item_unit` VALUES
(1,1,NULL,0,'2025-01-30 06:14:51','2025-01-30 06:14:51'),
(2,2,NULL,0,'2025-01-30 06:37:22','2025-01-30 06:37:22'),
(3,3,NULL,0,'2025-01-30 08:44:32','2025-01-30 08:44:33'),
(4,4,NULL,0,'2025-01-30 08:52:41','2025-01-30 08:52:41'),
(5,5,NULL,0,'2025-01-30 09:52:07','2025-01-30 09:52:07'),
(6,6,NULL,0,'2025-01-30 10:40:08','2025-01-30 10:40:08'),
(7,7,1,0,'2025-01-30 20:12:42','2025-01-30 20:12:42'),
(8,8,1,0,'2025-01-30 20:12:42','2025-01-30 20:12:42'),
(9,8,1,0,'2025-01-30 20:12:42','2025-01-30 20:12:42'),
(10,9,NULL,0,'2025-01-30 20:14:38','2025-01-30 20:14:38'),
(11,10,2,0,'2025-01-31 05:35:06','2025-01-31 05:35:06'),
(12,11,3,0,'2025-01-31 08:57:29','2025-01-31 08:57:29'),
(13,12,4,0,'2025-01-31 12:28:25','2025-01-31 12:28:25');
/*!40000 ALTER TABLE `sylius_order_item_unit` ENABLE KEYS */;

--
-- Table structure for table `sylius_order_sequence`
--

DROP TABLE IF EXISTS `sylius_order_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_order_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idx` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_order_sequence`
--

/*!40000 ALTER TABLE `sylius_order_sequence` DISABLE KEYS */;
INSERT INTO `sylius_order_sequence` VALUES
(1,11,11);
/*!40000 ALTER TABLE `sylius_order_sequence` ENABLE KEYS */;

--
-- Table structure for table `sylius_payment`
--

DROP TABLE IF EXISTS `sylius_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `amount` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`details`)),
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D9191BD419883967` (`method_id`),
  KEY `IDX_D9191BD48D9F6D38` (`order_id`),
  CONSTRAINT `FK_D9191BD419883967` FOREIGN KEY (`method_id`) REFERENCES `sylius_payment_method` (`id`),
  CONSTRAINT `FK_D9191BD48D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_payment`
--

/*!40000 ALTER TABLE `sylius_payment` DISABLE KEYS */;
INSERT INTO `sylius_payment` VALUES
(1,1,1,'EUR',1800,'new','{\"amount\":1800,\"currency\":\"EUR\",\"description\":\"Le paiement contient 1 article pour un total de 18\"}','2025-01-30 06:14:51','2025-01-30 06:15:27'),
(2,1,2,'EUR',1800,'new','{\"amount\":1800,\"currency\":\"EUR\",\"description\":\"Le paiement contient 1 article pour un total de 18\"}','2025-01-30 06:37:22','2025-01-30 06:37:53'),
(3,1,3,'EUR',1800,'new','{\"amount\":1800,\"currency\":\"EUR\",\"description\":\"Le paiement contient 1 article pour un total de 18\",\"card\":\"tok_1QmtO8DkRKSNjj9Twj0gPRcp\"}','2025-01-30 08:44:33','2025-01-30 08:51:05'),
(4,1,4,'EUR',1800,'completed','{\"amount\":1800,\"currency\":\"eur\",\"description\":\"Le paiement contient 1 article pour un total de 18\",\"card\":\"tok_1QmtUuDkRKSNjj9TO1JkBbHE\",\"id\":\"ch_3QmtUxDkRKSNjj9T3XeyDQ2M\",\"object\":\"charge\",\"amount_captured\":1800,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3QmtUxDkRKSNjj9T3Tozghfv\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"latelier.cyrille@gmail.com\",\"phone\":null},\"calculated_statement_descriptor\":\"MULTIMEDIA-SERVICES.FR\",\"captured\":true,\"created\":1738227199,\"customer\":null,\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"advice_code\":null,\"network_advice_code\":null,\"network_decline_code\":null,\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":38,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1QmtUuDkRKSNjj9TZ6PzDCxn\",\"payment_method_details\":{\"card\":{\"amount_authorized\":1800,\"authorization_code\":null,\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":12,\"exp_year\":2025,\"extended_authorization\":{\"status\":\"disabled\"},\"fingerprint\":\"QqqVfPB98jVjvjR1\",\"funding\":\"credit\",\"incremental_authorization\":{\"status\":\"unavailable\"},\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"multicapture\":{\"status\":\"unavailable\"},\"network\":\"visa\",\"network_token\":{\"used\":false},\"network_transaction_id\":\"811131138610280\",\"overcapture\":{\"maximum_amount_capturable\":1800,\"status\":\"unavailable\"},\"regulated_status\":\"unregulated\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xUFhkTWdEa1JLU05qajlUKID87LwGMgYo5XkBmYM6LBZlWBRFxPgRPqm-XO4ArnciZAySSr84I3jur-XW1Tv0KI7ADBNoc1HZUXei\",\"refunded\":false,\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1QmtUuDkRKSNjj9TZ6PzDCxn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"allow_redisplay\":\"unspecified\",\"brand\":\"Visa\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":12,\"exp_year\":2025,\"fingerprint\":\"QqqVfPB98jVjvjR1\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"latelier.cyrille@gmail.com\",\"regulated_status\":\"unregulated\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}','2025-01-30 08:52:41','2025-01-30 08:53:21'),
(5,2,5,'EUR',1800,'completed','{\"id\":\"pi_3QmuQNDkRKSNjj9T2KoYtUDl\",\"object\":\"payment_intent\",\"amount\":1800,\"amount_capturable\":0,\"amount_details\":{\"tip\":[]},\"amount_received\":1800,\"application\":null,\"application_fee_amount\":null,\"automatic_payment_methods\":{\"allow_redirects\":\"always\",\"enabled\":true},\"canceled_at\":null,\"cancellation_reason\":null,\"capture_method\":\"automatic\",\"client_secret\":\"pi_3QmuQNDkRKSNjj9T2KoYtUDl_secret_NKZfWCtwgLIQsjnqEeF3uZpus\",\"confirmation_method\":\"automatic\",\"created\":1738230759,\"currency\":\"eur\",\"customer\":null,\"description\":null,\"invoice\":null,\"last_payment_error\":null,\"latest_charge\":\"ch_3QmuQNDkRKSNjj9T2CakpOoh\",\"livemode\":false,\"metadata\":{\"token_hash\":\"zME9BrbuOWzmeyDZyacqzDhwVPVm1Vg5Zaa8Fac1K40\"},\"next_action\":null,\"on_behalf_of\":null,\"payment_method\":\"pm_1QmuR5DkRKSNjj9TJsp786UO\",\"payment_method_configuration_details\":null,\"payment_method_options\":{\"card\":{\"installments\":null,\"mandate_options\":null,\"network\":null,\"request_three_d_secure\":\"automatic\"}},\"payment_method_types\":[\"card\"],\"processing\":null,\"receipt_email\":null,\"review\":null,\"setup_future_usage\":null,\"shipping\":null,\"source\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}','2025-01-30 09:52:07','2025-01-30 09:53:25'),
(6,2,6,'EUR',1800,'completed','{\"id\":\"pi_3QmvAqDkRKSNjj9T4kfYhIND\",\"object\":\"payment_intent\",\"amount\":1800,\"amount_capturable\":0,\"amount_details\":{\"tip\":[]},\"amount_received\":1800,\"application\":null,\"application_fee_amount\":null,\"automatic_payment_methods\":{\"allow_redirects\":\"always\",\"enabled\":true},\"canceled_at\":null,\"cancellation_reason\":null,\"capture_method\":\"automatic\",\"client_secret\":\"pi_3QmvAqDkRKSNjj9T4kfYhIND_secret_UF8IsWZpoykL9DkjburonVIXO\",\"confirmation_method\":\"automatic\",\"created\":1738233640,\"currency\":\"eur\",\"customer\":null,\"description\":null,\"invoice\":null,\"last_payment_error\":null,\"latest_charge\":\"ch_3QmvAqDkRKSNjj9T4k6Sd4pB\",\"livemode\":false,\"metadata\":{\"token_hash\":\"d_i_8ZRcgCh3s4nLCjb4CwmpL2TaMDDHi7U1qROMw9g\"},\"next_action\":null,\"on_behalf_of\":null,\"payment_method\":\"pm_1QmvOoDkRKSNjj9TI03oRGD6\",\"payment_method_configuration_details\":{\"id\":\"pmc_1QmuQsDkRKSNjj9TDAYUQgWb\",\"parent\":null},\"payment_method_options\":{\"bancontact\":{\"preferred_language\":\"en\"},\"card\":{\"installments\":null,\"mandate_options\":null,\"network\":null,\"request_three_d_secure\":\"automatic\"},\"eps\":[],\"giropay\":[],\"klarna\":{\"preferred_locale\":null},\"link\":{\"persistent_token\":null}},\"payment_method_types\":[\"card\",\"bancontact\",\"eps\",\"giropay\",\"klarna\",\"link\"],\"processing\":null,\"receipt_email\":null,\"review\":null,\"setup_future_usage\":null,\"shipping\":null,\"source\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}','2025-01-30 10:40:08','2025-01-30 10:55:09'),
(7,1,7,'EUR',5000,'new','{\"payment-link\":\"https:\\/\\/sylius.latelier22.fr\\/fr_FR\\/order\\/after-pay?payum_token=xVx0PLBc7AQGfYiOw_e96bN9SLWUowhVyR1OCdF5sK4\"}','2025-01-30 20:12:42','2025-01-30 20:12:42'),
(8,1,8,'EUR',1800,'new','{\"payment-link\":\"https:\\/\\/sylius.latelier22.fr\\/fr_FR\\/order\\/after-pay?payum_token=oElrNEEJ9GrfjLMJ5Q-jB-w6mDvfX6yc428OijaVt_I\"}','2025-01-30 20:14:38','2025-01-30 20:14:38'),
(9,1,9,'EUR',1750,'new','{\"payment-link\":\"https:\\/\\/sylius.latelier22.fr\\/fr_FR\\/order\\/after-pay?payum_token=3Fwbi7o2kgx9E5ak8B9jyfumLH6f3_qcZJUEKZIMMlA\"}','2025-01-31 05:35:06','2025-01-31 05:35:07'),
(10,1,10,'EUR',1500,'new','{\"payment-link\":\"https:\\/\\/sylius.latelier22.fr\\/fr_FR\\/order\\/after-pay?payum_token=JT3u7d1PD-_tRQESkM89KFvjTkVpo1vNVcvtGHq07dI\"}','2025-01-31 08:57:29','2025-01-31 08:57:30'),
(11,2,11,'EUR',1500,'completed','{\"id\":\"pi_3QnJOwDkRKSNjj9T3sJq9YDq\",\"object\":\"payment_intent\",\"amount\":1500,\"amount_capturable\":0,\"amount_details\":{\"tip\":[]},\"amount_received\":1500,\"application\":null,\"application_fee_amount\":null,\"automatic_payment_methods\":{\"allow_redirects\":\"always\",\"enabled\":true},\"canceled_at\":null,\"cancellation_reason\":null,\"capture_method\":\"automatic\",\"client_secret\":\"pi_3QnJOwDkRKSNjj9T3sJq9YDq_secret_qLNC7WaoF7RsyUGlXzoPNragO\",\"confirmation_method\":\"automatic\",\"created\":1738326770,\"currency\":\"eur\",\"customer\":null,\"description\":null,\"invoice\":null,\"last_payment_error\":null,\"latest_charge\":\"ch_3QnJOwDkRKSNjj9T3wz9MF7I\",\"livemode\":false,\"metadata\":{\"token_hash\":\"MvsA3C7PQ_HU7WUG1AYnoFnf_eDinx9CadZ5EskuMho\"},\"next_action\":null,\"on_behalf_of\":null,\"payment_method\":\"pm_1QnJPDDkRKSNjj9TC0mfwFiM\",\"payment_method_configuration_details\":{\"id\":\"pmc_1QmuQsDkRKSNjj9TDAYUQgWb\",\"parent\":null},\"payment_method_options\":{\"bancontact\":{\"preferred_language\":\"en\"},\"card\":{\"installments\":null,\"mandate_options\":null,\"network\":null,\"request_three_d_secure\":\"automatic\"},\"eps\":[],\"giropay\":[],\"klarna\":{\"preferred_locale\":null},\"link\":{\"persistent_token\":null}},\"payment_method_types\":[\"card\",\"bancontact\",\"eps\",\"giropay\",\"klarna\",\"link\"],\"processing\":null,\"receipt_email\":null,\"review\":null,\"setup_future_usage\":null,\"shipping\":null,\"source\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}','2025-01-31 12:28:25','2025-01-31 12:33:09');
/*!40000 ALTER TABLE `sylius_payment` ENABLE KEYS */;

--
-- Table structure for table `sylius_payment_method`
--

DROP TABLE IF EXISTS `sylius_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gateway_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A75B0B0D77153098` (`code`),
  KEY `IDX_A75B0B0DF23D6140` (`gateway_config_id`),
  CONSTRAINT `FK_A75B0B0DF23D6140` FOREIGN KEY (`gateway_config_id`) REFERENCES `sylius_gateway_config` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_payment_method`
--

/*!40000 ALTER TABLE `sylius_payment_method` DISABLE KEYS */;
INSERT INTO `sylius_payment_method` VALUES
(1,'STRIPE',NULL,1,2,'2025-01-30 06:13:33','2025-01-30 06:13:33',1),
(2,'STRIPE2',NULL,1,3,'2025-01-30 09:51:32','2025-01-30 09:51:32',2),
(3,'CB-BOUTIQUE',NULL,1,0,'2025-01-31 12:25:32','2025-01-31 12:26:42',3),
(4,'ESP-BOUTIQUE',NULL,1,1,'2025-01-31 12:27:43','2025-01-31 12:27:43',4);
/*!40000 ALTER TABLE `sylius_payment_method` ENABLE KEYS */;

--
-- Table structure for table `sylius_payment_method_channels`
--

DROP TABLE IF EXISTS `sylius_payment_method_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_payment_method_channels` (
  `payment_method_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_method_id`,`channel_id`),
  KEY `IDX_543AC0CC5AA1164F` (`payment_method_id`),
  KEY `IDX_543AC0CC72F5A1AA` (`channel_id`),
  CONSTRAINT `FK_543AC0CC5AA1164F` FOREIGN KEY (`payment_method_id`) REFERENCES `sylius_payment_method` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_543AC0CC72F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_payment_method_channels`
--

/*!40000 ALTER TABLE `sylius_payment_method_channels` DISABLE KEYS */;
INSERT INTO `sylius_payment_method_channels` VALUES
(1,1),
(2,1),
(3,2),
(4,2);
/*!40000 ALTER TABLE `sylius_payment_method_channels` ENABLE KEYS */;

--
-- Table structure for table `sylius_payment_method_translation`
--

DROP TABLE IF EXISTS `sylius_payment_method_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_payment_method_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `instructions` longtext DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_payment_method_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_966BE3A12C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_966BE3A12C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_payment_method` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_payment_method_translation`
--

/*!40000 ALTER TABLE `sylius_payment_method_translation` DISABLE KEYS */;
INSERT INTO `sylius_payment_method_translation` VALUES
(1,1,'Payement par carte STRIPE',NULL,NULL,'fr_FR'),
(2,2,'Payement Carte SRIPE Double sécurité',NULL,NULL,'fr_FR'),
(3,3,'Payement par carte SUR PLACE',NULL,NULL,'fr_FR'),
(4,4,'Payement en espèces SUR PLACE',NULL,NULL,'fr_FR');
/*!40000 ALTER TABLE `sylius_payment_method_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_payment_security_token`
--

DROP TABLE IF EXISTS `sylius_payment_security_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_payment_security_token` (
  `hash` varchar(255) NOT NULL,
  `details` longtext DEFAULT NULL COMMENT '(DC2Type:object)',
  `after_url` longtext DEFAULT NULL,
  `target_url` longtext NOT NULL,
  `gateway_name` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_payment_security_token`
--

/*!40000 ALTER TABLE `sylius_payment_security_token` DISABLE KEYS */;
INSERT INTO `sylius_payment_security_token` VALUES
('-cBxxe0A64KlxkviHcwVWL_yUe6gU0e_oM1jlbh9NVI','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:5;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=W44v8Aa0wDHcy0LBBjVVBZdxK9HtkAutxqJgPO7erTs','https://sylius.latelier22.fr/payment/capture/-cBxxe0A64KlxkviHcwVWL_yUe6gU0e_oM1jlbh9NVI','stripe2'),
('3Fwbi7o2kgx9E5ak8B9jyfumLH6f3_qcZJUEKZIMMlA','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:9;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=3Fwbi7o2kgx9E5ak8B9jyfumLH6f3_qcZJUEKZIMMlA','stripe'),
('d_i_8ZRcgCh3s4nLCjb4CwmpL2TaMDDHi7U1qROMw9g','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:6;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/payment/notify/d_i_8ZRcgCh3s4nLCjb4CwmpL2TaMDDHi7U1qROMw9g','stripe2'),
('gkhXSHDWfJRvhz9ecePjtvdnDD-XJ5zMafnQ-N1SOSk','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:2;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=lfGGSxJEZNvJ-3vfhW6P-gnYIblh4mHbBa6rZTbZc8E','https://sylius.latelier22.fr/payment/capture/gkhXSHDWfJRvhz9ecePjtvdnDD-XJ5zMafnQ-N1SOSk','stripe'),
('h_uumolGs7416gxIgIv67PInjqHe1-WD6ncJHrLEj9Y','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:3;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=h_uumolGs7416gxIgIv67PInjqHe1-WD6ncJHrLEj9Y','stripe'),
('JGaGAaNteSS-pse5kYtKR7z6MTdsVkQHKC4_lcW0c94','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:3;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=h_uumolGs7416gxIgIv67PInjqHe1-WD6ncJHrLEj9Y','https://sylius.latelier22.fr/payment/capture/JGaGAaNteSS-pse5kYtKR7z6MTdsVkQHKC4_lcW0c94','stripe'),
('JT3u7d1PD-_tRQESkM89KFvjTkVpo1vNVcvtGHq07dI','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:10;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=JT3u7d1PD-_tRQESkM89KFvjTkVpo1vNVcvtGHq07dI','stripe'),
('kOrYdOmmClWB_t-1hRQhQwgnwqFxjpMRzPJ_MN5ks5o','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:10;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=JT3u7d1PD-_tRQESkM89KFvjTkVpo1vNVcvtGHq07dI','https://sylius.latelier22.fr/payment/capture/kOrYdOmmClWB_t-1hRQhQwgnwqFxjpMRzPJ_MN5ks5o','stripe'),
('LAxmOrnOONmrH1pyOqmfRkKHbwp-4rxpbaXYtTAy3cQ','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:1;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=TgmIlHrjInkJDRenFI_jXk-iP2PGs5TmB8OzOD_gppg','https://sylius.latelier22.fr/payment/capture/LAxmOrnOONmrH1pyOqmfRkKHbwp-4rxpbaXYtTAy3cQ','stripe'),
('lfGGSxJEZNvJ-3vfhW6P-gnYIblh4mHbBa6rZTbZc8E','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:2;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=lfGGSxJEZNvJ-3vfhW6P-gnYIblh4mHbBa6rZTbZc8E','stripe'),
('LMGCzwcloQ8OLx62ibPRg0wVT5V_CnHiVE1dMH_vvhI','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:9;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=3Fwbi7o2kgx9E5ak8B9jyfumLH6f3_qcZJUEKZIMMlA','https://sylius.latelier22.fr/payment/capture/LMGCzwcloQ8OLx62ibPRg0wVT5V_CnHiVE1dMH_vvhI','stripe'),
('MvsA3C7PQ_HU7WUG1AYnoFnf_eDinx9CadZ5EskuMho','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:11;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/payment/notify/MvsA3C7PQ_HU7WUG1AYnoFnf_eDinx9CadZ5EskuMho','stripe2'),
('oElrNEEJ9GrfjLMJ5Q-jB-w6mDvfX6yc428OijaVt_I','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:8;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=oElrNEEJ9GrfjLMJ5Q-jB-w6mDvfX6yc428OijaVt_I','stripe'),
('q4dbMCs7kN_Bqcsu3Gl-f4bkBEqV_xRVkuw-CQ_WT9o','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:7;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=xVx0PLBc7AQGfYiOw_e96bN9SLWUowhVyR1OCdF5sK4','https://sylius.latelier22.fr/payment/capture/q4dbMCs7kN_Bqcsu3Gl-f4bkBEqV_xRVkuw-CQ_WT9o','stripe'),
('RgK0Eu9p8LrQDx8sUOXJqrB-OB8cREO-VsEMe-Uz98U','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:8;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=oElrNEEJ9GrfjLMJ5Q-jB-w6mDvfX6yc428OijaVt_I','https://sylius.latelier22.fr/payment/capture/RgK0Eu9p8LrQDx8sUOXJqrB-OB8cREO-VsEMe-Uz98U','stripe'),
('TgmIlHrjInkJDRenFI_jXk-iP2PGs5TmB8OzOD_gppg','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:1;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=TgmIlHrjInkJDRenFI_jXk-iP2PGs5TmB8OzOD_gppg','stripe'),
('VK2r-4RZl4Y0k2lzdySy-GOvwNBTMT1MfziwJR7xePE','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:6;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=XpSpwsdNc_z0oxiulfJOhM4dt2nn53MOJJ2rh-lOh5c','https://sylius.latelier22.fr/payment/capture/VK2r-4RZl4Y0k2lzdySy-GOvwNBTMT1MfziwJR7xePE','stripe2'),
('w-tok2h_TRYWlAy7vBjYEICrvOSXQdwRLqo8vd4OkjM','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:11;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}','https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=PqMWBrbdxtzFenmbxzMGUzfvthC_us_vLsuIshk-lV0','https://sylius.latelier22.fr/payment/capture/w-tok2h_TRYWlAy7vBjYEICrvOSXQdwRLqo8vd4OkjM','stripe2'),
('xVx0PLBc7AQGfYiOw_e96bN9SLWUowhVyR1OCdF5sK4','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:7;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/fr_FR/order/after-pay?payum_token=xVx0PLBc7AQGfYiOw_e96bN9SLWUowhVyR1OCdF5sK4','stripe'),
('zME9BrbuOWzmeyDZyacqzDhwVPVm1Vg5Zaa8Fac1K40','O:25:\"Payum\\Core\\Model\\Identity\":2:{i:0;i:5;i:1;s:26:\"App\\Entity\\Payment\\Payment\";}',NULL,'https://sylius.latelier22.fr/payment/notify/zME9BrbuOWzmeyDZyacqzDhwVPVm1Vg5Zaa8Fac1K40','stripe2');
/*!40000 ALTER TABLE `sylius_payment_security_token` ENABLE KEYS */;

--
-- Table structure for table `sylius_paypal_plugin_pay_pal_credentials`
--

DROP TABLE IF EXISTS `sylius_paypal_plugin_pay_pal_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_paypal_plugin_pay_pal_credentials` (
  `id` varchar(255) NOT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `access_token` varchar(255) NOT NULL,
  `creation_time` datetime NOT NULL,
  `expiration_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C56F54AD5AA1164F` (`payment_method_id`),
  CONSTRAINT `FK_C56F54AD5AA1164F` FOREIGN KEY (`payment_method_id`) REFERENCES `sylius_payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_paypal_plugin_pay_pal_credentials`
--

/*!40000 ALTER TABLE `sylius_paypal_plugin_pay_pal_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_paypal_plugin_pay_pal_credentials` ENABLE KEYS */;

--
-- Table structure for table `sylius_product`
--

DROP TABLE IF EXISTS `sylius_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_taxon_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `variant_selection_method` varchar(255) NOT NULL,
  `average_rating` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_677B9B7477153098` (`code`),
  KEY `IDX_677B9B74731E505` (`main_taxon_id`),
  CONSTRAINT `FK_677B9B74731E505` FOREIGN KEY (`main_taxon_id`) REFERENCES `sylius_taxon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product`
--

/*!40000 ALTER TABLE `sylius_product` DISABLE KEYS */;
INSERT INTO `sylius_product` VALUES
(1,3,'MUG','2025-01-30 06:14:29','2025-01-30 12:46:26',1,'choice',0),
(5,NULL,'MUG001','2025-01-30 12:35:38','2025-01-30 12:35:38',1,'choice',0),
(6,NULL,'MUG002','2025-01-30 12:35:38','2025-01-30 12:35:38',1,'choice',0),
(7,NULL,'MUG003','2025-01-30 12:35:38','2025-01-30 12:35:38',1,'choice',0),
(8,2,'CAR15x15','2025-01-31 14:00:26','2025-01-31 14:08:56',1,'choice',0);
/*!40000 ALTER TABLE `sylius_product` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_association`
--

DROP TABLE IF EXISTS `sylius_product_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `association_type_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_association_idx` (`product_id`,`association_type_id`),
  KEY `IDX_48E9CDABB1E1C39` (`association_type_id`),
  KEY `IDX_48E9CDAB4584665A` (`product_id`),
  CONSTRAINT `FK_48E9CDAB4584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_48E9CDABB1E1C39` FOREIGN KEY (`association_type_id`) REFERENCES `sylius_product_association_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_association`
--

/*!40000 ALTER TABLE `sylius_product_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_association` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_association_product`
--

DROP TABLE IF EXISTS `sylius_product_association_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_association_product` (
  `association_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`product_id`),
  KEY `IDX_A427B983EFB9C8A5` (`association_id`),
  KEY `IDX_A427B9834584665A` (`product_id`),
  CONSTRAINT `FK_A427B9834584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A427B983EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `sylius_product_association` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_association_product`
--

/*!40000 ALTER TABLE `sylius_product_association_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_association_product` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_association_type`
--

DROP TABLE IF EXISTS `sylius_product_association_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_association_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CCB8914C77153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_association_type`
--

/*!40000 ALTER TABLE `sylius_product_association_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_association_type` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_association_type_translation`
--

DROP TABLE IF EXISTS `sylius_product_association_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_association_type_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_product_association_type_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_4F618E52C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_4F618E52C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_product_association_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_association_type_translation`
--

/*!40000 ALTER TABLE `sylius_product_association_type_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_association_type_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_attribute`
--

DROP TABLE IF EXISTS `sylius_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `storage_type` varchar(255) NOT NULL,
  `configuration` longtext NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) NOT NULL,
  `translatable` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BFAF484A77153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_attribute`
--

/*!40000 ALTER TABLE `sylius_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_attribute` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_attribute_translation`
--

DROP TABLE IF EXISTS `sylius_product_attribute_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_attribute_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_product_attribute_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_93850EBA2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_93850EBA2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_product_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_attribute_translation`
--

/*!40000 ALTER TABLE `sylius_product_attribute_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_attribute_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_attribute_value`
--

DROP TABLE IF EXISTS `sylius_product_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_attribute_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `text_value` longtext DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` double DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `locale_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8A053E544584665A` (`product_id`),
  KEY `IDX_8A053E54B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_8A053E544584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8A053E54B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `sylius_product_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_attribute_value`
--

/*!40000 ALTER TABLE `sylius_product_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_attribute_value` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_channels`
--

DROP TABLE IF EXISTS `sylius_product_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_channels` (
  `product_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`channel_id`),
  KEY `IDX_F9EF269B4584665A` (`product_id`),
  KEY `IDX_F9EF269B72F5A1AA` (`channel_id`),
  CONSTRAINT `FK_F9EF269B4584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F9EF269B72F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_channels`
--

/*!40000 ALTER TABLE `sylius_product_channels` DISABLE KEYS */;
INSERT INTO `sylius_product_channels` VALUES
(1,1),
(5,1),
(6,1),
(7,1),
(8,1),
(8,2);
/*!40000 ALTER TABLE `sylius_product_channels` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_image`
--

DROP TABLE IF EXISTS `sylius_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_88C64B2D7E3C61F9` (`owner_id`),
  CONSTRAINT `FK_88C64B2D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_image`
--

/*!40000 ALTER TABLE `sylius_product_image` DISABLE KEYS */;
INSERT INTO `sylius_product_image` VALUES
(1,1,NULL,'16/0f/5e308a1ea2c6b724f26aa072b58c.png'),
(5,5,NULL,'mug001NB-1.webp');
/*!40000 ALTER TABLE `sylius_product_image` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_image_product_variants`
--

DROP TABLE IF EXISTS `sylius_product_image_product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_image_product_variants` (
  `image_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  PRIMARY KEY (`image_id`,`variant_id`),
  KEY `IDX_8FFDAE8D3DA5256D` (`image_id`),
  KEY `IDX_8FFDAE8D3B69A9AF` (`variant_id`),
  CONSTRAINT `FK_8FFDAE8D3B69A9AF` FOREIGN KEY (`variant_id`) REFERENCES `sylius_product_variant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8FFDAE8D3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `sylius_product_image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_image_product_variants`
--

/*!40000 ALTER TABLE `sylius_product_image_product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_image_product_variants` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_option`
--

DROP TABLE IF EXISTS `sylius_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E4C0EBEF77153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_option`
--

/*!40000 ALTER TABLE `sylius_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_option` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_option_translation`
--

DROP TABLE IF EXISTS `sylius_product_option_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_option_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_product_option_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_CBA491AD2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_CBA491AD2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_product_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_option_translation`
--

/*!40000 ALTER TABLE `sylius_product_option_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_option_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_option_value`
--

DROP TABLE IF EXISTS `sylius_product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F7FF7D4B77153098` (`code`),
  KEY `IDX_F7FF7D4BA7C41D6F` (`option_id`),
  CONSTRAINT `FK_F7FF7D4BA7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `sylius_product_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_option_value`
--

/*!40000 ALTER TABLE `sylius_product_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_option_value` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_option_value_translation`
--

DROP TABLE IF EXISTS `sylius_product_option_value_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_option_value_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_product_option_value_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_8D4382DC2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_8D4382DC2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_product_option_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_option_value_translation`
--

/*!40000 ALTER TABLE `sylius_product_option_value_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_option_value_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_options`
--

DROP TABLE IF EXISTS `sylius_product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_options` (
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`option_id`),
  KEY `IDX_2B5FF0094584665A` (`product_id`),
  KEY `IDX_2B5FF009A7C41D6F` (`option_id`),
  CONSTRAINT `FK_2B5FF0094584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2B5FF009A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `sylius_product_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_options`
--

/*!40000 ALTER TABLE `sylius_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_options` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_review`
--

DROP TABLE IF EXISTS `sylius_product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C7056A994584665A` (`product_id`),
  KEY `IDX_C7056A99F675F31B` (`author_id`),
  CONSTRAINT `FK_C7056A994584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C7056A99F675F31B` FOREIGN KEY (`author_id`) REFERENCES `sylius_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_review`
--

/*!40000 ALTER TABLE `sylius_product_review` DISABLE KEYS */;
INSERT INTO `sylius_product_review` VALUES
(1,5,3,'top',5,'top','new','2025-01-31 09:13:03','2025-01-31 09:13:03');
/*!40000 ALTER TABLE `sylius_product_review` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_taxon`
--

DROP TABLE IF EXISTS `sylius_product_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_taxon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_taxon_idx` (`product_id`,`taxon_id`),
  KEY `IDX_169C6CD94584665A` (`product_id`),
  KEY `IDX_169C6CD9DE13F470` (`taxon_id`),
  CONSTRAINT `FK_169C6CD94584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_169C6CD9DE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `sylius_taxon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_taxon`
--

/*!40000 ALTER TABLE `sylius_product_taxon` DISABLE KEYS */;
INSERT INTO `sylius_product_taxon` VALUES
(1,1,1,0),
(2,1,2,0),
(3,1,3,0);
/*!40000 ALTER TABLE `sylius_product_taxon` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_translation`
--

DROP TABLE IF EXISTS `sylius_product_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_product_translation_uniq_trans` (`translatable_id`,`locale`),
  UNIQUE KEY `UNIQ_105A9084180C698989D9B62` (`locale`,`slug`),
  KEY `IDX_105A9082C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_105A9082C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_translation`
--

/*!40000 ALTER TABLE `sylius_product_translation` DISABLE KEYS */;
INSERT INTO `sylius_product_translation` VALUES
(1,1,'Mug','mug','Mug Blanc personnable à imprimer',NULL,NULL,'Mug blanc','fr_FR'),
(2,5,'Mug Noir','mug-noir','Superbe Mug intérieur et anse noir','','','Superbe Mug intérieur et anse noir','fr_FR'),
(3,6,'Mug Jaune','mug-jaune','Superbe Mug intérieur et anse Jaune','','','Superbe Mug intérieur et anse Jaune','fr_FR'),
(4,7,'Mug Rouge','mug-rouge','Superbe Mug intérieur et anse Rouge','','','Superbe Mug intérieur et anse Rouge','fr_FR'),
(5,8,'Mug céramique blanc','mug-ceramique-blanc',NULL,NULL,NULL,NULL,'fr_FR');
/*!40000 ALTER TABLE `sylius_product_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_variant`
--

DROP TABLE IF EXISTS `sylius_product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `shipping_category_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `on_hold` int(11) NOT NULL,
  `on_hand` int(11) NOT NULL,
  `tracked` tinyint(1) NOT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `depth` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `position` int(11) NOT NULL,
  `shipping_required` tinyint(1) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `enabled` tinyint(1) NOT NULL,
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A29B52377153098` (`code`),
  KEY `IDX_A29B5234584665A` (`product_id`),
  KEY `IDX_A29B5239DF894ED` (`tax_category_id`),
  KEY `IDX_A29B5239E2D1A41` (`shipping_category_id`),
  CONSTRAINT `FK_A29B5234584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A29B5239DF894ED` FOREIGN KEY (`tax_category_id`) REFERENCES `sylius_tax_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A29B5239E2D1A41` FOREIGN KEY (`shipping_category_id`) REFERENCES `sylius_shipping_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_variant`
--

/*!40000 ALTER TABLE `sylius_product_variant` DISABLE KEYS */;
INSERT INTO `sylius_product_variant` VALUES
(1,1,NULL,NULL,'MUG','2025-01-30 06:14:29','2025-02-02 06:58:34',1,10,1,NULL,NULL,NULL,NULL,0,0,5,1,'123'),
(2,5,NULL,NULL,'MUG001','2025-01-30 12:35:38','2025-01-30 12:35:38',0,0,0,NULL,NULL,NULL,NULL,0,1,1,1,NULL),
(3,6,NULL,NULL,'MUG002','2025-01-30 12:35:38','2025-01-30 12:35:38',0,0,0,NULL,NULL,NULL,NULL,0,1,1,1,NULL),
(4,7,NULL,NULL,'MUG003','2025-01-30 12:35:38','2025-01-30 12:35:38',0,0,0,NULL,NULL,NULL,NULL,0,1,1,1,NULL),
(5,8,NULL,NULL,'CAR15x15','2025-01-31 14:00:26','2025-02-02 06:59:02',0,0,0,NULL,NULL,NULL,NULL,0,1,2,1,'9782754085311');
/*!40000 ALTER TABLE `sylius_product_variant` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_variant_option_value`
--

DROP TABLE IF EXISTS `sylius_product_variant_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_variant_option_value` (
  `variant_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  PRIMARY KEY (`variant_id`,`option_value_id`),
  KEY `IDX_76CDAFA13B69A9AF` (`variant_id`),
  KEY `IDX_76CDAFA1D957CA06` (`option_value_id`),
  CONSTRAINT `FK_76CDAFA13B69A9AF` FOREIGN KEY (`variant_id`) REFERENCES `sylius_product_variant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_76CDAFA1D957CA06` FOREIGN KEY (`option_value_id`) REFERENCES `sylius_product_option_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_variant_option_value`
--

/*!40000 ALTER TABLE `sylius_product_variant_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_product_variant_option_value` ENABLE KEYS */;

--
-- Table structure for table `sylius_product_variant_translation`
--

DROP TABLE IF EXISTS `sylius_product_variant_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_variant_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_product_variant_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_8DC18EDC2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_8DC18EDC2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_product_variant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_variant_translation`
--

/*!40000 ALTER TABLE `sylius_product_variant_translation` DISABLE KEYS */;
INSERT INTO `sylius_product_variant_translation` VALUES
(1,1,'Mug','fr_FR'),
(2,2,'Mug Noir','fr_FR'),
(3,3,'Mug Jaune','fr_FR'),
(4,4,'Mug Rouge','fr_FR'),
(5,1,NULL,'en_US'),
(6,5,'car11','fr_FR');
/*!40000 ALTER TABLE `sylius_product_variant_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_promotion`
--

DROP TABLE IF EXISTS `sylius_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `exclusive` tinyint(1) NOT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used` int(11) NOT NULL,
  `coupon_based` tinyint(1) NOT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `applies_to_discounted` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F157396377153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_promotion`
--

/*!40000 ALTER TABLE `sylius_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_promotion` ENABLE KEYS */;

--
-- Table structure for table `sylius_promotion_action`
--

DROP TABLE IF EXISTS `sylius_promotion_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_promotion_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `configuration` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_933D0915139DF194` (`promotion_id`),
  CONSTRAINT `FK_933D0915139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `sylius_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_promotion_action`
--

/*!40000 ALTER TABLE `sylius_promotion_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_promotion_action` ENABLE KEYS */;

--
-- Table structure for table `sylius_promotion_channels`
--

DROP TABLE IF EXISTS `sylius_promotion_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_promotion_channels` (
  `promotion_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`promotion_id`,`channel_id`),
  KEY `IDX_1A044F64139DF194` (`promotion_id`),
  KEY `IDX_1A044F6472F5A1AA` (`channel_id`),
  CONSTRAINT `FK_1A044F64139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `sylius_promotion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1A044F6472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_promotion_channels`
--

/*!40000 ALTER TABLE `sylius_promotion_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_promotion_channels` ENABLE KEYS */;

--
-- Table structure for table `sylius_promotion_coupon`
--

DROP TABLE IF EXISTS `sylius_promotion_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_promotion_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used` int(11) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `per_customer_usage_limit` int(11) DEFAULT NULL,
  `reusable_from_cancelled_orders` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B04EBA8577153098` (`code`),
  KEY `IDX_B04EBA85139DF194` (`promotion_id`),
  CONSTRAINT `FK_B04EBA85139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `sylius_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_promotion_coupon`
--

/*!40000 ALTER TABLE `sylius_promotion_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_promotion_coupon` ENABLE KEYS */;

--
-- Table structure for table `sylius_promotion_order`
--

DROP TABLE IF EXISTS `sylius_promotion_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_promotion_order` (
  `order_id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`promotion_id`),
  KEY `IDX_BF9CF6FB8D9F6D38` (`order_id`),
  KEY `IDX_BF9CF6FB139DF194` (`promotion_id`),
  CONSTRAINT `FK_BF9CF6FB139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `sylius_promotion` (`id`),
  CONSTRAINT `FK_BF9CF6FB8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_promotion_order`
--

/*!40000 ALTER TABLE `sylius_promotion_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_promotion_order` ENABLE KEYS */;

--
-- Table structure for table `sylius_promotion_rule`
--

DROP TABLE IF EXISTS `sylius_promotion_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_promotion_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `configuration` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_2C188EA8139DF194` (`promotion_id`),
  CONSTRAINT `FK_2C188EA8139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `sylius_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_promotion_rule`
--

/*!40000 ALTER TABLE `sylius_promotion_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_promotion_rule` ENABLE KEYS */;

--
-- Table structure for table `sylius_province`
--

DROP TABLE IF EXISTS `sylius_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B5618FE477153098` (`code`),
  UNIQUE KEY `UNIQ_B5618FE4F92F3E705E237E06` (`country_id`,`name`),
  KEY `IDX_B5618FE4F92F3E70` (`country_id`),
  CONSTRAINT `FK_B5618FE4F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `sylius_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_province`
--

/*!40000 ALTER TABLE `sylius_province` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_province` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_credit_memo`
--

DROP TABLE IF EXISTS `sylius_refund_credit_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_credit_memo` (
  `id` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `locale_code` varchar(255) NOT NULL,
  `comment` longtext NOT NULL,
  `issued_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5C4F333196901F54` (`number`),
  UNIQUE KEY `UNIQ_5C4F333178CED90B` (`from_id`),
  UNIQUE KEY `UNIQ_5C4F333130354A65` (`to_id`),
  KEY `IDX_5C4F333172F5A1AA` (`channel_id`),
  KEY `IDX_5C4F33318D9F6D38` (`order_id`),
  CONSTRAINT `FK_5C4F333130354A65` FOREIGN KEY (`to_id`) REFERENCES `sylius_refund_shop_billing_data` (`id`),
  CONSTRAINT `FK_5C4F333172F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`),
  CONSTRAINT `FK_5C4F333178CED90B` FOREIGN KEY (`from_id`) REFERENCES `sylius_refund_customer_billing_data` (`id`),
  CONSTRAINT `FK_5C4F33318D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_credit_memo`
--

/*!40000 ALTER TABLE `sylius_refund_credit_memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_credit_memo` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_credit_memo_line_items`
--

DROP TABLE IF EXISTS `sylius_refund_credit_memo_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_credit_memo_line_items` (
  `credit_memo_id` varchar(255) NOT NULL,
  `line_item_id` int(11) NOT NULL,
  PRIMARY KEY (`credit_memo_id`,`line_item_id`),
  UNIQUE KEY `UNIQ_1453B90EA7CBD339` (`line_item_id`),
  KEY `IDX_1453B90E8E574316` (`credit_memo_id`),
  CONSTRAINT `FK_1453B90E8E574316` FOREIGN KEY (`credit_memo_id`) REFERENCES `sylius_refund_credit_memo` (`id`),
  CONSTRAINT `FK_1453B90EA7CBD339` FOREIGN KEY (`line_item_id`) REFERENCES `sylius_refund_line_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_credit_memo_line_items`
--

/*!40000 ALTER TABLE `sylius_refund_credit_memo_line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_credit_memo_line_items` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_credit_memo_sequence`
--

DROP TABLE IF EXISTS `sylius_refund_credit_memo_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_credit_memo_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idx` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_credit_memo_sequence`
--

/*!40000 ALTER TABLE `sylius_refund_credit_memo_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_credit_memo_sequence` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_credit_memo_tax_items`
--

DROP TABLE IF EXISTS `sylius_refund_credit_memo_tax_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_credit_memo_tax_items` (
  `credit_memo_id` varchar(255) NOT NULL,
  `tax_item_id` int(11) NOT NULL,
  PRIMARY KEY (`credit_memo_id`,`tax_item_id`),
  UNIQUE KEY `UNIQ_9BBDFBE25327F254` (`tax_item_id`),
  KEY `IDX_9BBDFBE28E574316` (`credit_memo_id`),
  CONSTRAINT `FK_9BBDFBE25327F254` FOREIGN KEY (`tax_item_id`) REFERENCES `sylius_refund_tax_item` (`id`),
  CONSTRAINT `FK_9BBDFBE28E574316` FOREIGN KEY (`credit_memo_id`) REFERENCES `sylius_refund_credit_memo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_credit_memo_tax_items`
--

/*!40000 ALTER TABLE `sylius_refund_credit_memo_tax_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_credit_memo_tax_items` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_customer_billing_data`
--

DROP TABLE IF EXISTS `sylius_refund_customer_billing_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_customer_billing_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  `province_code` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_customer_billing_data`
--

/*!40000 ALTER TABLE `sylius_refund_customer_billing_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_customer_billing_data` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_line_item`
--

DROP TABLE IF EXISTS `sylius_refund_line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_line_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_net_price` int(11) NOT NULL,
  `unit_gross_price` int(11) NOT NULL,
  `net_value` int(11) NOT NULL,
  `gross_value` int(11) NOT NULL,
  `tax_amount` int(11) NOT NULL,
  `tax_rate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_line_item`
--

/*!40000 ALTER TABLE `sylius_refund_line_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_line_item` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_refund`
--

DROP TABLE IF EXISTS `sylius_refund_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `refunded_unit_id` int(11) DEFAULT NULL,
  `type` varchar(256) NOT NULL COMMENT '(DC2Type:sylius_refund_refund_type)',
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DEF86A0E8D9F6D38` (`order_id`),
  CONSTRAINT `FK_DEF86A0E8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_refund`
--

/*!40000 ALTER TABLE `sylius_refund_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_refund` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_refund_payment`
--

DROP TABLE IF EXISTS `sylius_refund_refund_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_refund_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EC283EA55AA1164F` (`payment_method_id`),
  KEY `IDX_EC283EA58D9F6D38` (`order_id`),
  CONSTRAINT `FK_EC283EA55AA1164F` FOREIGN KEY (`payment_method_id`) REFERENCES `sylius_payment_method` (`id`),
  CONSTRAINT `FK_EC283EA58D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_refund_payment`
--

/*!40000 ALTER TABLE `sylius_refund_refund_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_refund_payment` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_shop_billing_data`
--

DROP TABLE IF EXISTS `sylius_refund_shop_billing_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_shop_billing_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_shop_billing_data`
--

/*!40000 ALTER TABLE `sylius_refund_shop_billing_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_shop_billing_data` ENABLE KEYS */;

--
-- Table structure for table `sylius_refund_tax_item`
--

DROP TABLE IF EXISTS `sylius_refund_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_refund_tax_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_refund_tax_item`
--

/*!40000 ALTER TABLE `sylius_refund_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_refund_tax_item` ENABLE KEYS */;

--
-- Table structure for table `sylius_shipment`
--

DROP TABLE IF EXISTS `sylius_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `tracking` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `adjustments_total` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FD707B3319883967` (`method_id`),
  KEY `IDX_FD707B338D9F6D38` (`order_id`),
  CONSTRAINT `FK_FD707B3319883967` FOREIGN KEY (`method_id`) REFERENCES `sylius_shipping_method` (`id`),
  CONSTRAINT `FK_FD707B338D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `sylius_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_shipment`
--

/*!40000 ALTER TABLE `sylius_shipment` DISABLE KEYS */;
INSERT INTO `sylius_shipment` VALUES
(1,1,7,'ready',NULL,'2025-01-30 20:12:42','2025-01-30 20:12:42',NULL,0),
(2,1,9,'shipped','9782253184423','2025-01-31 05:35:06','2025-01-31 05:35:30','2025-01-31 05:35:30',0),
(3,1,10,'ready',NULL,'2025-01-31 08:57:29','2025-01-31 08:57:29',NULL,0),
(4,1,11,'ready',NULL,'2025-01-31 12:28:25','2025-01-31 12:32:49',NULL,0);
/*!40000 ALTER TABLE `sylius_shipment` ENABLE KEYS */;

--
-- Table structure for table `sylius_shipping_category`
--

DROP TABLE IF EXISTS `sylius_shipping_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_shipping_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B1D6465277153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_shipping_category`
--

/*!40000 ALTER TABLE `sylius_shipping_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_shipping_category` ENABLE KEYS */;

--
-- Table structure for table `sylius_shipping_method`
--

DROP TABLE IF EXISTS `sylius_shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_shipping_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `zone_id` int(11) NOT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `configuration` longtext NOT NULL COMMENT '(DC2Type:array)',
  `category_requirement` int(11) NOT NULL,
  `calculator` varchar(255) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5FB0EE1177153098` (`code`),
  KEY `IDX_5FB0EE1112469DE2` (`category_id`),
  KEY `IDX_5FB0EE119F2C3FAB` (`zone_id`),
  KEY `IDX_5FB0EE119DF894ED` (`tax_category_id`),
  CONSTRAINT `FK_5FB0EE1112469DE2` FOREIGN KEY (`category_id`) REFERENCES `sylius_shipping_category` (`id`),
  CONSTRAINT `FK_5FB0EE119DF894ED` FOREIGN KEY (`tax_category_id`) REFERENCES `sylius_tax_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_5FB0EE119F2C3FAB` FOREIGN KEY (`zone_id`) REFERENCES `sylius_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_shipping_method`
--

/*!40000 ALTER TABLE `sylius_shipping_method` DISABLE KEYS */;
INSERT INTO `sylius_shipping_method` VALUES
(1,NULL,1,NULL,'BOUTIQUE','a:2:{s:7:\"default\";a:1:{s:6:\"amount\";i:0;}s:8:\"BOUTIQUE\";a:1:{s:6:\"amount\";i:0;}}',1,'per_unit_rate',1,0,'2025-01-30 20:10:28','2025-01-30 20:10:28',NULL),
(2,NULL,1,NULL,'SURPLACE','a:2:{s:7:\"default\";a:1:{s:6:\"amount\";i:0;}s:8:\"BOUTIQUE\";a:1:{s:6:\"amount\";i:0;}}',1,'flat_rate',1,1,'2025-01-31 12:52:05','2025-01-31 12:52:05',NULL);
/*!40000 ALTER TABLE `sylius_shipping_method` ENABLE KEYS */;

--
-- Table structure for table `sylius_shipping_method_channels`
--

DROP TABLE IF EXISTS `sylius_shipping_method_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_shipping_method_channels` (
  `shipping_method_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`shipping_method_id`,`channel_id`),
  KEY `IDX_2D9833355F7D6850` (`shipping_method_id`),
  KEY `IDX_2D98333572F5A1AA` (`channel_id`),
  CONSTRAINT `FK_2D9833355F7D6850` FOREIGN KEY (`shipping_method_id`) REFERENCES `sylius_shipping_method` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2D98333572F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `sylius_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_shipping_method_channels`
--

/*!40000 ALTER TABLE `sylius_shipping_method_channels` DISABLE KEYS */;
INSERT INTO `sylius_shipping_method_channels` VALUES
(1,1),
(2,2);
/*!40000 ALTER TABLE `sylius_shipping_method_channels` ENABLE KEYS */;

--
-- Table structure for table `sylius_shipping_method_rule`
--

DROP TABLE IF EXISTS `sylius_shipping_method_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_shipping_method_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_method_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `configuration` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_88A0EB655F7D6850` (`shipping_method_id`),
  CONSTRAINT `FK_88A0EB655F7D6850` FOREIGN KEY (`shipping_method_id`) REFERENCES `sylius_shipping_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_shipping_method_rule`
--

/*!40000 ALTER TABLE `sylius_shipping_method_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_shipping_method_rule` ENABLE KEYS */;

--
-- Table structure for table `sylius_shipping_method_translation`
--

DROP TABLE IF EXISTS `sylius_shipping_method_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_shipping_method_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sylius_shipping_method_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_2B37DB3D2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_2B37DB3D2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_shipping_method` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_shipping_method_translation`
--

/*!40000 ALTER TABLE `sylius_shipping_method_translation` DISABLE KEYS */;
INSERT INTO `sylius_shipping_method_translation` VALUES
(1,1,'Vente sur place',NULL,'fr_FR'),
(2,2,'Vente sur place',NULL,'fr_FR');
/*!40000 ALTER TABLE `sylius_shipping_method_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_shop_billing_data`
--

DROP TABLE IF EXISTS `sylius_shop_billing_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_shop_billing_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_shop_billing_data`
--

/*!40000 ALTER TABLE `sylius_shop_billing_data` DISABLE KEYS */;
INSERT INTO `sylius_shop_billing_data` VALUES
(1,'MULTIMEDIA-SERVICES',NULL,'FR','7 bd de la gare','LOUDEAC','22600'),
(2,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sylius_shop_billing_data` ENABLE KEYS */;

--
-- Table structure for table `sylius_shop_user`
--

DROP TABLE IF EXISTS `sylius_shop_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_shop_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `username_canonical` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `email_verification_token` varchar(255) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `email` varchar(255) DEFAULT NULL,
  `email_canonical` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `encoder_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7C2B74809395C3F3` (`customer_id`),
  CONSTRAINT `FK_7C2B74809395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `sylius_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_shop_user`
--

/*!40000 ALTER TABLE `sylius_shop_user` DISABLE KEYS */;
INSERT INTO `sylius_shop_user` VALUES
(1,2,'artsvisuelsdemayotte@gmail.com','artsvisuelsdemayotte@gmail.com',1,'a4bjx03awrkgkk8sw8o84k00ckowsso','$argon2i$v=19$m=65536,t=4,p=1$cVlnMWdiVDRzZVpvbWVFcA$/uE5xDt0kWojO/JaRlAiq/YJrR426VyQMf8Wf5g1A2I','2025-01-30 10:56:29',NULL,NULL,NULL,'2025-01-30 10:56:16',0,NULL,NULL,'a:1:{i:0;s:9:\"ROLE_USER\";}',NULL,NULL,'2025-01-30 10:38:47','2025-01-30 10:56:29','argon2i'),
(2,1,'latelier.cyrille@gmail.com','latelier.cyrille@gmail.com',1,'6z2vdv02smkogoogkkkwccgc0wkkk84','$argon2i$v=19$m=65536,t=4,p=1$ZWxsUnN0NFY0NGJ0anFPYg$s8uCTWLpGzHwcjZZCaGD1b8rK4XhzldjJBDT5j2hGls',NULL,NULL,NULL,NULL,'2025-01-30 10:39:28',0,NULL,NULL,'a:1:{i:0;s:9:\"ROLE_USER\";}',NULL,NULL,'2025-01-30 10:39:28','2025-01-30 10:54:07',NULL),
(3,3,'lecorre@yahoo.com','lecorre@yahoo.com',1,'721ywt3uqngogosskwkcc84o0s4o4sg','$argon2i$v=19$m=65536,t=4,p=1$dGhHVjNiVVhXbVk2MXMuLw$kCi7J6NzaZkCSjJF6gwbNuRUgT4vgAwfYHWqdgrNBY0','2025-02-09 17:16:23',NULL,NULL,NULL,'2025-01-30 19:47:42',0,NULL,NULL,'a:1:{i:0;s:9:\"ROLE_USER\";}',NULL,NULL,'2025-01-30 19:47:42','2025-02-09 17:16:24','argon2i');
/*!40000 ALTER TABLE `sylius_shop_user` ENABLE KEYS */;

--
-- Table structure for table `sylius_tax_category`
--

DROP TABLE IF EXISTS `sylius_tax_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_tax_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_221EB0BE77153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_tax_category`
--

/*!40000 ALTER TABLE `sylius_tax_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_tax_category` ENABLE KEYS */;

--
-- Table structure for table `sylius_tax_rate`
--

DROP TABLE IF EXISTS `sylius_tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_tax_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(10,5) NOT NULL,
  `included_in_price` tinyint(1) NOT NULL,
  `calculator` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3CD86B2E77153098` (`code`),
  KEY `IDX_3CD86B2E12469DE2` (`category_id`),
  KEY `IDX_3CD86B2E9F2C3FAB` (`zone_id`),
  CONSTRAINT `FK_3CD86B2E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `sylius_tax_category` (`id`),
  CONSTRAINT `FK_3CD86B2E9F2C3FAB` FOREIGN KEY (`zone_id`) REFERENCES `sylius_zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_tax_rate`
--

/*!40000 ALTER TABLE `sylius_tax_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_tax_rate` ENABLE KEYS */;

--
-- Table structure for table `sylius_taxon`
--

DROP TABLE IF EXISTS `sylius_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_taxon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tree_root` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `tree_left` int(11) NOT NULL,
  `tree_right` int(11) NOT NULL,
  `tree_level` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CFD811CA77153098` (`code`),
  KEY `IDX_CFD811CAA977936C` (`tree_root`),
  KEY `IDX_CFD811CA727ACA70` (`parent_id`),
  CONSTRAINT `FK_CFD811CA727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `sylius_taxon` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CFD811CAA977936C` FOREIGN KEY (`tree_root`) REFERENCES `sylius_taxon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_taxon`
--

/*!40000 ALTER TABLE `sylius_taxon` DISABLE KEYS */;
INSERT INTO `sylius_taxon` VALUES
(1,1,NULL,'CATEGORIES',1,8,0,0,'2025-01-30 12:42:55','2025-01-30 12:42:55',1),
(2,1,1,'CERAMIQUE',2,7,1,0,'2025-01-30 12:43:26','2025-01-30 12:43:27',1),
(3,1,2,'MUG',3,4,2,0,'2025-01-30 12:44:21','2025-01-30 12:44:21',1),
(4,1,2,'MUGI',5,6,2,1,'2025-01-30 12:45:41','2025-01-30 12:45:41',1);
/*!40000 ALTER TABLE `sylius_taxon` ENABLE KEYS */;

--
-- Table structure for table `sylius_taxon_image`
--

DROP TABLE IF EXISTS `sylius_taxon_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_taxon_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DBE52B287E3C61F9` (`owner_id`),
  CONSTRAINT `FK_DBE52B287E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `sylius_taxon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_taxon_image`
--

/*!40000 ALTER TABLE `sylius_taxon_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_taxon_image` ENABLE KEYS */;

--
-- Table structure for table `sylius_taxon_translation`
--

DROP TABLE IF EXISTS `sylius_taxon_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_taxon_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_uidx` (`locale`,`slug`),
  UNIQUE KEY `sylius_taxon_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_1487DFCF2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_1487DFCF2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_taxon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_taxon_translation`
--

/*!40000 ALTER TABLE `sylius_taxon_translation` DISABLE KEYS */;
INSERT INTO `sylius_taxon_translation` VALUES
(1,1,'Catégories','categories',NULL,'fr_FR'),
(2,2,'Céramique','categories/ceramique',NULL,'fr_FR'),
(3,3,'MUGS à imprimer','categories/ceramique/mugs-a-imprimer',NULL,'fr_FR'),
(4,4,'Mugs imprimés','categories/ceramique/mugs-imprimes',NULL,'fr_FR');
/*!40000 ALTER TABLE `sylius_taxon_translation` ENABLE KEYS */;

--
-- Table structure for table `sylius_user_oauth`
--

DROP TABLE IF EXISTS `sylius_user_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_user_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_provider` (`user_id`,`provider`),
  KEY `IDX_C3471B78A76ED395` (`user_id`),
  CONSTRAINT `FK_C3471B78A76ED395` FOREIGN KEY (`user_id`) REFERENCES `sylius_shop_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_user_oauth`
--

/*!40000 ALTER TABLE `sylius_user_oauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `sylius_user_oauth` ENABLE KEYS */;

--
-- Table structure for table `sylius_zone`
--

DROP TABLE IF EXISTS `sylius_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(8) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7BE2258E77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_zone`
--

/*!40000 ALTER TABLE `sylius_zone` DISABLE KEYS */;
INSERT INTO `sylius_zone` VALUES
(1,'FRANCE','France','country','all');
/*!40000 ALTER TABLE `sylius_zone` ENABLE KEYS */;

--
-- Table structure for table `sylius_zone_member`
--

DROP TABLE IF EXISTS `sylius_zone_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_zone_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongs_to` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E8B5ABF34B0E929B77153098` (`belongs_to`,`code`),
  KEY `IDX_E8B5ABF34B0E929B` (`belongs_to`),
  CONSTRAINT `FK_E8B5ABF34B0E929B` FOREIGN KEY (`belongs_to`) REFERENCES `sylius_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_zone_member`
--

/*!40000 ALTER TABLE `sylius_zone_member` DISABLE KEYS */;
INSERT INTO `sylius_zone_member` VALUES
(1,1,'FR');
/*!40000 ALTER TABLE `sylius_zone_member` ENABLE KEYS */;

--
-- Dumping routines for database 'sylius_112_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-09 17:42:55
