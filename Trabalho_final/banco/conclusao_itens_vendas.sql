CREATE DATABASE  IF NOT EXISTS `conclusao` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `conclusao`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: conclusao
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `itens_vendas`
--

DROP TABLE IF EXISTS `itens_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_vendas` (
  `produto` int(11) NOT NULL,
  `venda` int(11) NOT NULL,
  `qtdVenda` int(45) DEFAULT NULL,
  `valorUnitario` double DEFAULT NULL,
  `desconto` double DEFAULT NULL,
  `acrecimo` double DEFAULT NULL,
  PRIMARY KEY (`produto`,`venda`),
  KEY `fk_Produto_has_Venda_Venda1_idx` (`venda`),
  KEY `fk_Produto_has_Venda_Produto1_idx` (`produto`),
  CONSTRAINT `fk_Produto_has_Venda_Produto1` FOREIGN KEY (`produto`) REFERENCES `produto` (`idPrd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Venda_Venda1` FOREIGN KEY (`venda`) REFERENCES `venda` (`idV`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_vendas`
--

LOCK TABLES `itens_vendas` WRITE;
/*!40000 ALTER TABLE `itens_vendas` DISABLE KEYS */;
INSERT INTO `itens_vendas` VALUES (1,1,20,3,0.5,3),(2,4,3,5,1,2),(2,6,3,5,2,2),(4,4,4,3.2,0,2),(5,1,30,1.2,1,3),(5,5,10,1.2,0,0),(6,5,2,3.2,0,1),(7,1,4,1.5,0,1);
/*!40000 ALTER TABLE `itens_vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-05 21:31:25
