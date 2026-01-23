CREATE DATABASE  IF NOT EXISTS `job_bridge` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `job_bridge`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: job_bridge
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `application_id` int NOT NULL,
  `req_id` int DEFAULT NULL,
  `jobseeker_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `current_stage` varchar(50) DEFAULT NULL,
  `applied_date` date DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `fk_app_req` (`req_id`),
  KEY `fk_app_jobseeker` (`jobseeker_id`),
  CONSTRAINT `fk_app_jobseeker` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseeker` (`jobseeker_id`),
  CONSTRAINT `fk_app_req` FOREIGN KEY (`req_id`) REFERENCES `job_requirement` (`req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `company_email` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `company_description` text,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `fk_company_user` (`user_id`),
  CONSTRAINT `fk_company_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (201,'ABC Technologies','contact@abctech.com','https://abctech.com','Pune','Software services company',102,'2026-01-22 09:54:51'),(202,'XYZ Solutions','hr@xyz.com','https://xyz.com','Mumbai','IT & consulting',102,'2026-01-22 09:54:51');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `edu_id` int NOT NULL AUTO_INCREMENT,
  `jobSeeker_id` int DEFAULT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `university` varchar(50) DEFAULT NULL,
  `college` varchar(40) DEFAULT NULL,
  `percentage_cgpa` decimal(4,2) DEFAULT NULL,
  `year_of_passing` int DEFAULT NULL,
  `Education_Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`edu_id`),
  KEY `fk_edu_jobseeker` (`jobSeeker_id`),
  CONSTRAINT `fk_edu_jobseeker` FOREIGN KEY (`jobSeeker_id`) REFERENCES `jobseeker` (`jobseeker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `experience_id` int NOT NULL,
  `jobseeker_id` int DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `employment_type` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `skills_used` varchar(255) DEFAULT NULL,
  `description` text,
  `years_of_experience` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`experience_id`),
  KEY `fk_exp_jobseeker` (`jobseeker_id`),
  CONSTRAINT `fk_exp_jobseeker` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseeker` (`jobseeker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_requirement`
--

DROP TABLE IF EXISTS `job_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_requirement` (
  `req_id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `domain_id` int DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `job_description` text,
  `experience_required` int DEFAULT NULL,
  `min_cgpa` decimal(3,2) DEFAULT NULL,
  `salary_package` varchar(50) DEFAULT NULL,
  `job_type` varchar(30) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `vacancy_count` int DEFAULT NULL,
  `application_deadline` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `posted_date` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `skill_id` int DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `fk_req_company` (`company_id`),
  KEY `fk_req_skill` (`skill_id`),
  CONSTRAINT `fk_req_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `fk_req_skill` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_requirement`
--

LOCK TABLES `job_requirement` WRITE;
/*!40000 ALTER TABLE `job_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobseeker`
--

DROP TABLE IF EXISTS `jobseeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobseeker` (
  `jobseeker_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `resume_url` varchar(255) DEFAULT NULL,
  `jobseeker_skill_id` int DEFAULT NULL,
  `current_location` varchar(100) DEFAULT NULL,
  `relocate` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `edu_id` int DEFAULT NULL,
  PRIMARY KEY (`jobseeker_id`),
  KEY `fk_jobseeker_user` (`user_id`),
  KEY `fk_jobseeker_edu` (`edu_id`),
  KEY `fk_jobseeker_skillrow` (`jobseeker_skill_id`),
  CONSTRAINT `fk_jobseeker_edu` FOREIGN KEY (`edu_id`) REFERENCES `education` (`edu_id`),
  CONSTRAINT `fk_jobseeker_skillrow` FOREIGN KEY (`jobseeker_skill_id`) REFERENCES `jobseeker_skill` (`jobseeker_skill_id`),
  CONSTRAINT `fk_jobseeker_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobseeker`
--

LOCK TABLES `jobseeker` WRITE;
/*!40000 ALTER TABLE `jobseeker` DISABLE KEYS */;
INSERT INTO `jobseeker` VALUES (301,103,'https://example.com/resume/vedant.pdf',NULL,'Pune','YES','2002-01-15','Male','2026-01-22 09:54:51',NULL);
/*!40000 ALTER TABLE `jobseeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobseeker_skill`
--

DROP TABLE IF EXISTS `jobseeker_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobseeker_skill` (
  `jobseeker_skill_id` int NOT NULL,
  `jobseeker_id` int DEFAULT NULL,
  `skill_id` int DEFAULT NULL,
  PRIMARY KEY (`jobseeker_skill_id`),
  KEY `fk_js_skill_jobseeker` (`jobseeker_id`),
  KEY `fk_js_skill_skill` (`skill_id`),
  CONSTRAINT `fk_js_skill_jobseeker` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseeker` (`jobseeker_id`),
  CONSTRAINT `fk_js_skill_skill` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobseeker_skill`
--

LOCK TABLES `jobseeker_skill` WRITE;
/*!40000 ALTER TABLE `jobseeker_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobseeker_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'RECRUITER'),(3,'JOBSEEKER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortlist`
--

DROP TABLE IF EXISTS `shortlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortlist` (
  `shortlist_id` int NOT NULL,
  `application_id` int DEFAULT NULL,
  `shortlisted` tinyint(1) DEFAULT NULL,
  `round_number` int DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_mode` varchar(30) DEFAULT NULL,
  `interviewer_name` varchar(100) DEFAULT NULL,
  `selection_status` varchar(50) DEFAULT NULL,
  `feedback` text,
  `final_decision` tinyint(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`shortlist_id`),
  KEY `fk_shortlist_app` (`application_id`),
  CONSTRAINT `fk_shortlist_app` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortlist`
--

LOCK TABLES `shortlist` WRITE;
/*!40000 ALTER TABLE `shortlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `shortlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL,
  `skill_name` varchar(100) DEFAULT NULL,
  `skill_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_users_role` (`role_id`),
  CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (101,'admin@jobbridge.com','admin','admin@123','Admin User','9999999999',NULL,1,1,'2026-01-22 09:54:51'),(102,'hr@abc.com','abc_hr','hr@123','ABC HR','8888888888',NULL,2,1,'2026-01-22 09:54:51'),(103,'vedant@gmail.com','vedant','vedant@123','Vedant Nargide','7777777777',NULL,3,1,'2026-01-22 09:54:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-22 16:01:57
