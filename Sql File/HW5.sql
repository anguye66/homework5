-- Postgresql dump 10.13  Distrib 5.1.30, for Win32 (ia32)
--
-- Host: localhost    Database: AirlinesDatabase
-- ------------------------------------------------------
-- Server version	5.1.30-community

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customer` (
  `First_Name` varchar(40) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Email` varchar(20) NOT NULL,
  `paymentID` int(10) DEFAULT NULL,
  `FlightNo` int(10) DEFAULT NULL,
  `TicketNo` int(10) DEFAULT NULL,
  `Street` varchar(10) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(10) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `CountryCode` int(10) DEFAULT NULL,
  `AreaCode` int(10) DEFAULT NULL,
  `LocalNumber` int(10) DEFAULT NULL,
  `PhoneNumber` int(20) DEFAULT NULL,
  PRIMARY KEY (`Email`),
  KEY `TicketNo` (`TicketNo`),
  KEY `paymentID` (`paymentID`),
  KEY `FlightNo` (`FlightNo`),
  CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`FlightNo`) REFERENCES `flight` (`FlightNo`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`TicketNo`) REFERENCES `ticket` (`TicketNo`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `flight` (
  `Fligh_Origin` varchar(30) DEFAULT NULL,
  `Flight_Destination` varchar(30) DEFAULT NULL,
  `Flight_Length` time DEFAULT NULL,
  `Arrival_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Departing_Time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Price` int(20) DEFAULT NULL,
  `FlightNo` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FlightNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `payment` (
  `PaymentID` int(10) NOT NULL,
  `Customer_Name` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `FlightNo` int(10) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `FlightNo` (`FlightNo`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`FlightNo`) REFERENCES `flight` (`FlightNo`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`FlightNo`) REFERENCES `flight` (`FlightNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ticket` (
  `TicketNo` int(10) NOT NULL DEFAULT '0',
  `FlightNo` int(10) DEFAULT NULL,
  `Customer_Name` varchar(30) DEFAULT NULL,
  `Departing_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Date_of_Booking` time DEFAULT NULL,
  PRIMARY KEY (`TicketNo`),
  KEY `FlightNo` (`FlightNo`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`FlightNo`) REFERENCES `flight` (`FlightNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-27  3:57:11
