CREATE DATABASE  IF NOT EXISTS `projectbd` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projectbd`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: projectbd
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `rue` varchar(64) NOT NULL,
  `ville` varchar(64) NOT NULL,
  `codePostal` varchar(7) NOT NULL,
  `province` varchar(64) NOT NULL,
  `pays` varchar(64) NOT NULL,
  `principale` tinyint(1) DEFAULT '1',
  `supprime` char(1) DEFAULT '-',
  `etudiantId` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_etudiant_adress` (`etudiantId`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,2906,'rue courcelle','saint-foy','G3C 4R5','Montreal','Canada',0,'-','1'),(2,1016,'boul rene-levesque','la cite-limoilou','G4F V3R','1','Canada',0,'-','2'),(3,484,'rue gabreille-roy','les chutes-de-la-chaudiere-quest','F3F R3W','Toronto','Canada',0,'-','3'),(4,122,'Grand alllee','vieux quebec','R3W 1C1','Quebec','Canada',0,'-','4'),(5,3380,'rue pincourt','la haute-saint-charles','2W3 R3W','BC','Canada',1,'-','5'),(6,1933,'av de la riviere-jaune','charlesbourg','G5Y R3W','Montreal','Canada',1,'-','6'),(7,100,'rue de la riviere','boischatel','G3C 4R5','Quebec','Canada',1,'-','7'),(8,754,'rue ste-olivier','la cite-limoilou','G4F V3R','Montreal','Canada',1,'-','8'),(9,138,'carre st-philippe','la malbaie','F3F R3W','Quebec','Canada',1,'-','9'),(10,93,'rg ste-anne','saint-basile','G5Y 7U8','BC','Canada',1,'-','10'),(11,640,'8e avenue','vieux limoilou','W3R R3w','Quebec','Canada',1,'-','11'),(12,41,'boul johnny parent','loretteville','G3F V3R','Quebec','Canada',0,'-','12'),(13,10,'rue de la riviere','sainte-catherine','G5Y R2W','Montreal','Canada',0,'-','13'),(14,315,'ave mathieu','new jersey','33125','NY','USA',0,'-','14'),(15,100,'first street','new york','31251','NY','USA',1,'-','15'),(16,7300,'3e avenue','charlesbourg','G4C 4R5','BC','Canada',1,'-','16');
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `age` int NOT NULL DEFAULT '18',
  `status` varchar(20) DEFAULT 'temps plein',
  `nombreCreditReussis` int DEFAULT '15',
  `codePermanent` varchar(12) DEFAULT NULL,
  `dateDeNaissance` date NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `etudiant_chk_1` CHECK ((`age` >= 18))
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
INSERT INTO `etudiant` VALUES (1,'Blow','Joe',72,'partiel',12,'BJOE4578545','1950-01-01'),(2,'Luke','Lucky',85,'partiel',3,'LUCL2504584','1937-05-06'),(3,'Allen','Woody',86,'plein',21,'WOOA8545788','1933-07-08'),(4,'Mouse','Mickey',22,'plein',30,'MICM7878802','1990-11-08'),(5,'Duck','Donald',28,'partiel',2,'DOND4512458','1990-11-09'),(6,'Tarrantino','Quentin',58,'partiel',18,'WEUT2054854','1965-05-06'),(7,'Morisson','Jim',37,'plein',3,'JIM7878545','1949-01-01'),(8,'John','Elton',33,'partiel',33,'ELTJ2004584','1970-12-15'),(9,'Star','Ringo',47,'plein',54,'RINS8545332','1932-07-22'),(10,'Lennon','John',62,'partiel',9,'JOHL7802027','1982-11-08'),(11,'Trump','Donald',100,'plein',0,'DONT0254875','1950-02-09'),(12,'St-Jean','Christiane',50,'plein',12,'STJ1235826','1988-02-25'),(13,'Brule','Michel',40,'partiel',6,'BRM147852456','1975-06-15'),(14,'Villeneuve','Julie',25,'plein',12,'VIJ456852159','1995-08-01'),(15,'Geoffroy','Nicolas',31,'plein',9,'GEN753159825','1990-09-04'),(16,'Brule','Mille',58,'partiel',15,'BRM456915352','1977-11-25');
/*!40000 ALTER TABLE `etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephone`
--

DROP TABLE IF EXISTS `telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telephone` (
  `id` int NOT NULL DEFAULT '0',
  `indicatif` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `numero` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `principal` tinyint(1) DEFAULT '1',
  `cellulaire` tinyint(1) DEFAULT '0',
  `Maison` tinyint(1) DEFAULT '0',
  `etudiantId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephone`
--

LOCK TABLES `telephone` WRITE;
/*!40000 ALTER TABLE `telephone` DISABLE KEYS */;
INSERT INTO `telephone` VALUES (1,'518','663-2545',1,0,0,'1'),(2,'514','452-2125',1,0,0,'2'),(3,'418','777-4585',0,1,0,'3'),(4,'418','785-2251',1,0,0,'4'),(5,'819','452-0215',0,1,0,'5'),(6,'819','784-5252',1,0,0,'6'),(7,'418','555-2360',1,0,0,'7'),(8,'514','875-5850',0,1,0,'8'),(9,'819','458-0258',1,0,0,'9'),(10,'819','785-5541',1,0,0,'10'),(11,'514','774-5582',0,1,0,'11'),(12,'418','338-6161',1,0,0,'12'),(13,'518','877-3903',0,1,0,'13'),(14,'819','849-1000',1,0,0,'14'),(15,'518','878-1011',0,1,0,'15'),(16,'418','853-6025',1,0,0,'16'),(17,'418','589-6321',1,0,0,'15');
/*!40000 ALTER TABLE `telephone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-03 14:15:46
