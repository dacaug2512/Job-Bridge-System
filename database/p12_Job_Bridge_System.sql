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
  `application_id` int NOT NULL AUTO_INCREMENT,
  `req_id` int DEFAULT NULL,
  `jobseeker_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `current_stage` varchar(50) DEFAULT NULL,
  `applied_date` date DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `company_email` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `company_description` text,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
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
  `jobseeker_id` int DEFAULT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `university` varchar(50) DEFAULT NULL,
  `college` varchar(40) DEFAULT NULL,
  `percentage_cgpa` decimal(4,2) DEFAULT NULL,
  `year_of_passing` int DEFAULT NULL,
  `education_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`edu_id`),
  KEY `fk_edu_jobseeker` (`jobseeker_id`),
  CONSTRAINT `fk_edu_jobseeker` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseeker` (`jobseeker_id`)
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
  `experience_id` int NOT NULL AUTO_INCREMENT,
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
  `req_id` int NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `jobseeker_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `resume_url` varchar(255) DEFAULT NULL,
  `current_location` varchar(100) DEFAULT NULL,
  `relocate` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`jobseeker_id`),
  KEY `fk_jobseeker_user` (`user_id`),
  CONSTRAINT `fk_jobseeker_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobseeker`
--

LOCK TABLES `jobseeker` WRITE;
/*!40000 ALTER TABLE `jobseeker` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobseeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobseeker_skill`
--

DROP TABLE IF EXISTS `jobseeker_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobseeker_skill` (
  `jobseeker_skill_id` int NOT NULL AUTO_INCREMENT,
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
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `shortlist_id` int NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `skill_id` int NOT NULL AUTO_INCREMENT,
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
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_users_role` (`role_id`),
  CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2026-01-24  0:53:30
