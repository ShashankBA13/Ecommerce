-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_type` int unsigned DEFAULT NULL,
  `account_number` char(10) NOT NULL,
  `password` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `account_fk1` (`account_type`),
  KEY `account_fk2` (`created_by`),
  KEY `account_fk3` (`last_updated_by`),
  CONSTRAINT `account_fk1` FOREIGN KEY (`account_type`) REFERENCES `account_type` (`account_type_id`),
  CONSTRAINT `account_fk2` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `account_fk3` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_type` (
  `account_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_type` char(30) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`account_type_id`),
  KEY `account_type_fk1` (`created_by`),
  KEY `account_type_fk2` (`last_updated_by`),
  CONSTRAINT `account_type_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `account_type_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1001,'administrator',1,'2023-12-27',1,'2023-12-27'),(1002,'user',1,'2023-12-27',1,'2023-12-27'),(1003,'group',1,'2023-12-27',1,'2023-12-27'),(1004,'individual',1,'2023-12-27',1,'2023-12-27');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` int unsigned DEFAULT NULL,
  `account_id` int unsigned NOT NULL,
  `street_address` char(50) NOT NULL,
  `city_state_id` int unsigned NOT NULL,
  `postal_code_id` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `address_fk1` (`address_type`),
  KEY `address_fk2` (`account_id`),
  KEY `address_fk3` (`city_state_id`),
  KEY `address_fk4` (`postal_code_id`),
  KEY `address_fk5` (`created_by`),
  KEY `address_fk6` (`last_updated_by`),
  CONSTRAINT `address_fk1` FOREIGN KEY (`address_type`) REFERENCES `address_type` (`address_type_id`),
  CONSTRAINT `address_fk2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `address_fk3` FOREIGN KEY (`city_state_id`) REFERENCES `city_state` (`city_state_id`),
  CONSTRAINT `address_fk4` FOREIGN KEY (`postal_code_id`) REFERENCES `postal_code` (`postal_code_id`),
  CONSTRAINT `address_fk5` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `address_fk6` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_type`
--

DROP TABLE IF EXISTS `address_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_type` (
  `address_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` int unsigned DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`address_type_id`),
  KEY `address_type_fk1` (`created_by`),
  KEY `address_type_fk2` (`last_updated_by`),
  CONSTRAINT `address_type_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `address_type_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_type`
--

LOCK TABLES `address_type` WRITE;
/*!40000 ALTER TABLE `address_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int unsigned NOT NULL AUTO_INCREMENT,
  `city` char(200) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `city_fk1` (`created_by`),
  KEY `city_fk2` (`last_updated_by`),
  CONSTRAINT `city_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `city_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_state`
--

DROP TABLE IF EXISTS `city_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_state` (
  `city_state_id` int unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int unsigned NOT NULL,
  `state_id` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`city_state_id`),
  KEY `city_state_fk1` (`city_id`),
  KEY `city_state_fk2` (`state_id`),
  KEY `city_state_fk3` (`created_by`),
  KEY `city_state_fk4` (`last_updated_by`),
  CONSTRAINT `city_state_fk1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `city_state_fk2` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `city_state_fk3` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `city_state_fk4` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_state`
--

LOCK TABLES `city_state` WRITE;
/*!40000 ALTER TABLE `city_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contact_id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `contact_type` int unsigned DEFAULT NULL,
  `email` char(30) NOT NULL,
  `first_name` char(30) NOT NULL,
  `middle_name` char(30) DEFAULT NULL,
  `last_name` char(30) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `contact_fk1` (`account_id`),
  KEY `contact_fk2` (`contact_type`),
  KEY `contact_fk3` (`created_by`),
  KEY `contact_fk4` (`last_updated_by`),
  CONSTRAINT `contact_fk1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `contact_fk2` FOREIGN KEY (`contact_type`) REFERENCES `contact_type` (`contact_type_id`),
  CONSTRAINT `contact_fk3` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `contact_fk4` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'India'),(2,'England'),(3,'USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `credit_card_id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `credit_card_number` char(16) NOT NULL,
  `credit_card_type` int unsigned NOT NULL,
  `expiration_date` date NOT NULL,
  `cvv` char(6) DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`credit_card_id`),
  KEY `credit_card_fk1` (`account_id`),
  KEY `credit_card_fk2` (`credit_card_type`),
  KEY `credit_card_fk3` (`created_by`),
  KEY `credit_card_fk4` (`last_updated_by`),
  CONSTRAINT `credit_card_fk1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `credit_card_fk2` FOREIGN KEY (`credit_card_type`) REFERENCES `credit_card_type` (`credit_card_type_id`),
  CONSTRAINT `credit_card_fk3` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `credit_card_fk4` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card_type`
--

DROP TABLE IF EXISTS `credit_card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card_type` (
  `credit_card_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `credit_card_type` char(30) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`credit_card_type_id`),
  KEY `credit_card_type_fk1` (`created_by`),
  KEY `credit_card_type_fk2` (`last_updated_by`),
  CONSTRAINT `credit_card_type_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `credit_card_type_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card_type`
--

LOCK TABLES `credit_card_type` WRITE;
/*!40000 ALTER TABLE `credit_card_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_title` char(255) NOT NULL,
  `item_subtitle` char(255) DEFAULT NULL,
  `item_category_id` int unsigned NOT NULL,
  `item_subcategory_id` int unsigned DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_fk1` (`item_category_id`),
  KEY `item_fk2` (`item_subcategory_id`),
  KEY `item_fk3` (`created_by`),
  KEY `item_fk4` (`last_updated_by`),
  CONSTRAINT `item_fk1` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`item_category_id`),
  CONSTRAINT `item_fk2` FOREIGN KEY (`item_subcategory_id`) REFERENCES `item_subcategory` (`item_subcategory_id`),
  CONSTRAINT `item_fk3` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `item_fk4` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_category` (
  `item_category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_category` char(50) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`item_category_id`),
  KEY `item_category_fk1` (`created_by`),
  KEY `item_category_fk2` (`last_updated_by`),
  CONSTRAINT `item_category_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `item_category_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_category`
--

LOCK TABLES `item_category` WRITE;
/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_subcategory`
--

DROP TABLE IF EXISTS `item_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_subcategory` (
  `item_subcategory_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `item_subcategory` char(50) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`item_subcategory_id`),
  KEY `item_subcategory_fk1` (`category_id`),
  KEY `item_subcategory_fk2` (`created_by`),
  KEY `item_subcategory_fk3` (`last_updated_by`),
  CONSTRAINT `item_subcategory_fk1` FOREIGN KEY (`category_id`) REFERENCES `item_category` (`item_category_id`),
  CONSTRAINT `item_subcategory_fk2` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `item_subcategory_fk3` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_subcategory`
--

LOCK TABLES `item_subcategory` WRITE;
/*!40000 ALTER TABLE `item_subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'DELIVERED'),(2,'CLOSED'),(3,'IN_TRANSIT');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postal_code`
--

DROP TABLE IF EXISTS `postal_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postal_code` (
  `postal_code_id` int unsigned NOT NULL AUTO_INCREMENT,
  `postal_code` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`postal_code_id`),
  KEY `postal_code_fk1` (`created_by`),
  KEY `postal_code_fk2` (`last_updated_by`),
  CONSTRAINT `postal_code_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `postal_code_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postal_code`
--

LOCK TABLES `postal_code` WRITE;
/*!40000 ALTER TABLE `postal_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `postal_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `price_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int unsigned NOT NULL,
  `price_type` int unsigned DEFAULT NULL,
  `active_flag` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `amount` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`price_id`),
  KEY `price_fk1` (`item_id`),
  KEY `price_fk2` (`price_type`),
  KEY `price_fk3` (`created_by`),
  KEY `price_fk4` (`last_updated_by`),
  CONSTRAINT `price_fk1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `price_fk2` FOREIGN KEY (`price_type`) REFERENCES `price_type` (`price_type_id`),
  CONSTRAINT `price_fk3` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `price_fk4` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_type`
--

DROP TABLE IF EXISTS `price_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_type` (
  `price_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `price_type` char(50) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`price_type_id`),
  KEY `price_type_fk1` (`created_by`),
  KEY `price_type_fk2` (`last_updated_by`),
  CONSTRAINT `price_type_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `price_type_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_type`
--

LOCK TABLES `price_type` WRITE;
/*!40000 ALTER TABLE `price_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` int unsigned DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `state_fk1` (`created_by`),
  KEY `state_fk2` (`last_updated_by`),
  CONSTRAINT `state_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `state_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user` (
  `system_user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `system_user_name` char(20) NOT NULL,
  `system_user_type` int unsigned NOT NULL,
  `first_name` char(20) DEFAULT NULL,
  `middle_name` char(20) DEFAULT NULL,
  `last_name` char(20) DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`system_user_id`),
  KEY `system_user_fk1` (`system_user_type`),
  KEY `system_user_fk2` (`created_by`),
  KEY `system_user_fk3` (`last_updated_by`),
  CONSTRAINT `system_user_fk1` FOREIGN KEY (`system_user_type`) REFERENCES `system_user_type` (`system_user_type_id`),
  CONSTRAINT `system_user_fk2` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `system_user_fk3` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` VALUES (1001,'kylebirc_admin',1,NULL,NULL,NULL,1001,'2023-12-27',1,'2023-12-27');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_type`
--

DROP TABLE IF EXISTS `system_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_type` (
  `system_user_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `system_user_type` char(30) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`system_user_type_id`),
  KEY `system_user_type_fk1` (`created_by`),
  KEY `system_user_type_fk2` (`last_updated_by`),
  CONSTRAINT `system_user_type_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `system_user_type_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_type`
--

LOCK TABLES `system_user_type` WRITE;
/*!40000 ALTER TABLE `system_user_type` DISABLE KEYS */;
INSERT INTO `system_user_type` VALUES (1001,'database administrator',1,'2023-12-27',1,'2023-12-27'),(1002,'database developer',1,'2023-12-27',1,'2023-12-27');
/*!40000 ALTER TABLE `system_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephone`
--

DROP TABLE IF EXISTS `telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telephone` (
  `telephone_id` int unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int unsigned NOT NULL,
  `area_code` char(3) NOT NULL,
  `telephone_number` char(20) NOT NULL,
  `telephone_type` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`telephone_id`),
  KEY `telephone_fk1` (`contact_id`),
  KEY `telephone_fk2` (`telephone_type`),
  KEY `telephone_fk3` (`created_by`),
  KEY `telephone_fk4` (`last_updated_by`),
  CONSTRAINT `telephone_fk1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`),
  CONSTRAINT `telephone_fk2` FOREIGN KEY (`telephone_type`) REFERENCES `telephone_type` (`telephone_type_id`),
  CONSTRAINT `telephone_fk3` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `telephone_fk4` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephone`
--

LOCK TABLES `telephone` WRITE;
/*!40000 ALTER TABLE `telephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephone_type`
--

DROP TABLE IF EXISTS `telephone_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telephone_type` (
  `telephone_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `telephone_type` char(30) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`telephone_type_id`),
  KEY `telephone_type_fk1` (`created_by`),
  KEY `telephone_type_fk2` (`last_updated_by`),
  CONSTRAINT `telephone_type_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `telephone_type_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephone_type`
--

LOCK TABLES `telephone_type` WRITE;
/*!40000 ALTER TABLE `telephone_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `telephone_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `transaction_type` int unsigned DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `amount` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `transaction_fk1` (`account_id`),
  KEY `transaction_fk2` (`transaction_type`),
  KEY `transaction_fk3` (`created_by`),
  KEY `transaction_fk4` (`last_updated_by`),
  CONSTRAINT `transaction_fk1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `transaction_fk2` FOREIGN KEY (`transaction_type`) REFERENCES `transaction_type` (`transaction_type_id`),
  CONSTRAINT `transaction_fk3` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `transaction_fk4` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_item`
--

DROP TABLE IF EXISTS `transaction_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_item` (
  `transaction_item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`transaction_item_id`),
  KEY `transaction_item_fk1` (`transaction_id`),
  KEY `transaction_item_fk2` (`item_id`),
  KEY `transaction_item_fk3` (`created_by`),
  KEY `transaction_item_fk4` (`last_updated_by`),
  CONSTRAINT `transaction_item_fk1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  CONSTRAINT `transaction_item_fk2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `transaction_item_fk3` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `transaction_item_fk4` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_item`
--

LOCK TABLES `transaction_item` WRITE;
/*!40000 ALTER TABLE `transaction_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_type` (
  `transaction_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_type` char(50) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `creation_date` date NOT NULL,
  `last_updated_by` int unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`transaction_type_id`),
  KEY `transaction_type_fk1` (`created_by`),
  KEY `transaction_type_fk2` (`last_updated_by`),
  CONSTRAINT `transaction_type_fk1` FOREIGN KEY (`created_by`) REFERENCES `system_user` (`system_user_id`),
  CONSTRAINT `transaction_type_fk2` FOREIGN KEY (`last_updated_by`) REFERENCES `system_user` (`system_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-27 14:56:16
