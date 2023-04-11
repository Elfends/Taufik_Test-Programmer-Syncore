-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: test3_syncore
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `biodata`
--

DROP TABLE IF EXISTS `biodata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biodata` (
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_calon` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `posisi_dilamar` varchar(100) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_calon`),
  KEY `biodata_FK` (`id_user`),
  CONSTRAINT `biodata_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biodata`
--

LOCK TABLES `biodata` WRITE;
/*!40000 ALTER TABLE `biodata` DISABLE KEYS */;
INSERT INTO `biodata` VALUES ('Surya Nugroh','surya@puyol.id','1234',1,'1994-03-13','Solokan Jeruk','OB',2);
/*!40000 ALTER TABLE `biodata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendidikan_terakhir`
--

DROP TABLE IF EXISTS `pendidikan_terakhir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendidikan_terakhir` (
  `id_pendidikan` int(11) NOT NULL AUTO_INCREMENT,
  `id_calon` int(11) NOT NULL,
  `jenjang` varchar(5) NOT NULL,
  `nama_sekolah` varchar(100) DEFAULT NULL,
  `tahun_lulus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pendidikan`),
  KEY `pendidikan_terakhir_FK` (`id_calon`),
  CONSTRAINT `pendidikan_terakhir_FK` FOREIGN KEY (`id_calon`) REFERENCES `biodata` (`id_calon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendidikan_terakhir`
--

LOCK TABLES `pendidikan_terakhir` WRITE;
/*!40000 ALTER TABLE `pendidikan_terakhir` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendidikan_terakhir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_pekerjaan`
--

DROP TABLE IF EXISTS `riwayat_pekerjaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat_pekerjaan` (
  `id_riwayat_kerja` int(11) NOT NULL AUTO_INCREMENT,
  `id_calon` int(11) NOT NULL,
  `nama_instansi` varchar(100) DEFAULT NULL,
  `tahun_masuk` int(11) DEFAULT NULL,
  `tahun_keluar` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_riwayat_kerja`),
  KEY `riwayat_pekerjaan_FK` (`id_calon`),
  CONSTRAINT `riwayat_pekerjaan_FK` FOREIGN KEY (`id_calon`) REFERENCES `biodata` (`id_calon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_pekerjaan`
--

LOCK TABLES `riwayat_pekerjaan` WRITE;
/*!40000 ALTER TABLE `riwayat_pekerjaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayat_pekerjaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_pelatihan`
--

DROP TABLE IF EXISTS `riwayat_pelatihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat_pelatihan` (
  `id_riwayat_latih` int(11) NOT NULL AUTO_INCREMENT,
  `id_calon` int(11) NOT NULL,
  `nama_instansi` varchar(100) DEFAULT NULL,
  `bidang_pelatihan` varchar(100) DEFAULT NULL,
  `tahun_lulus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_riwayat_latih`),
  KEY `riwayat_pelatihan_FK` (`id_calon`),
  CONSTRAINT `riwayat_pelatihan_FK` FOREIGN KEY (`id_calon`) REFERENCES `biodata` (`id_calon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_pelatihan`
--

LOCK TABLES `riwayat_pelatihan` WRITE;
/*!40000 ALTER TABLE `riwayat_pelatihan` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayat_pelatihan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type_user` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin',2),(2,'surya@puyol.id','1234',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test3_syncore'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 14:47:11
