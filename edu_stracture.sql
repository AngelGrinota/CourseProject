-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: mysql.softsols.ru    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `answer_text` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `fk_answer_question2_idx` (`question_id`),
  CONSTRAINT `fk_answer_question2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `leaderboard`
--

-- Удаляем старую view, если есть
DROP VIEW IF EXISTS `leaderboard`;

-- Создаём view с полной логикой
CREATE ALGORITHM=UNDEFINED 
DEFINER=`admin`@`%` 
SQL SECURITY DEFINER 
VIEW `leaderboard` AS
SELECT 
    u.user_id AS user_id,
    u.login AS login,
    u.surname AS surname,
    u.name AS name,
    u.patronymic AS patronymic,
    ug.group_name AS group_name,
    SUM(tr.score) AS total_score,
    RANK() OVER (ORDER BY SUM(tr.score) DESC) AS rank
FROM `user` u
JOIN `user_group` ug ON u.group_id = ug.group_id
JOIN (
    SELECT tr1.user_id, tr1.test_id, tr1.score
    FROM `test_result` tr1
    JOIN (
        SELECT user_id, test_id, MAX(attempt_number) AS last_attempt
        FROM `test_result`
        GROUP BY user_id, test_id
    ) tr2 ON tr1.user_id = tr2.user_id 
           AND tr1.test_id = tr2.test_id 
           AND tr1.attempt_number = tr2.last_attempt
) tr ON tr.user_id = u.user_id
GROUP BY u.user_id, u.login, u.surname, u.name, u.patronymic, ug.group_name
HAVING total_score > 0
ORDER BY total_score DESC;

--
-- Table structure for table `paragraph`
--

DROP TABLE IF EXISTS `paragraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paragraph` (
  `paragraph_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `paragraph_title` varchar(80) NOT NULL,
  `path` varchar(300) NOT NULL,
  PRIMARY KEY (`paragraph_id`),
  KEY `fk_paragraph_theme1_idx` (`theme_id`),
  CONSTRAINT `fk_paragraph_theme1` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `test_id` int NOT NULL,
  `question_text` text NOT NULL,
  `points` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`question_id`),
  KEY `fk_question_test1_idx` (`test_id`),
  CONSTRAINT `fk_question_test1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `section_title` varchar(45) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `theme_id` int NOT NULL,
  `test_name` varchar(100) NOT NULL,
  `max_attempts` int NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `fk_test_theme1_idx` (`theme_id`),
  CONSTRAINT `fk_test_theme1` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_result`
--

DROP TABLE IF EXISTS `test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_result` (
  `user_id` int NOT NULL,
  `test_id` int NOT NULL,
  `attempt_number` int NOT NULL,
  `score` int NOT NULL,
  `passed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`test_id`,`attempt_number`),
  KEY `fk_user_has_test_test1_idx` (`test_id`),
  KEY `fk_user_has_test_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_test_test1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_test_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `test_result_display`
--

-- Удаляем старую view, если существует
DROP VIEW IF EXISTS `test_result_display`;

-- Создаём рабочую view
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `admin`@`%` 
    SQL SECURITY DEFINER
VIEW `test_result_display` AS
SELECT 
    tr.user_id AS user_id,
    u.login AS user_login,
    u.surname AS surname,
    u.name AS name,
    u.patronymic AS patronymic,
    ug.group_name AS user_group,
    tr.test_id AS test_id,
    t.test_name AS test_name,
    tr.attempt_number AS attempt_number,
    tr.score AS score,
    qs.max_score AS max_score,
    ROUND((tr.score / qs.max_score) * 100, 2) AS percent,
    CASE
        WHEN ((tr.score / qs.max_score) * 100) >= 90 THEN 5
        WHEN ((tr.score / qs.max_score) * 100) >= 75 THEN 4
        WHEN ((tr.score / qs.max_score) * 100) >= 60 THEN 3
        WHEN ((tr.score / qs.max_score) * 100) >= 40 THEN 2
        ELSE 1
    END AS grade,
    tr.passed_at AS passed_at
FROM test_result tr
JOIN user u ON tr.user_id = u.user_id
LEFT JOIN user_group ug ON u.group_id = ug.group_id
JOIN test t ON tr.test_id = t.test_id
JOIN (
    SELECT 
        question.test_id AS test_id,
        SUM(question.points) AS max_score
    FROM question
    GROUP BY question.test_id
) qs ON qs.test_id = tr.test_id;


--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme` (
  `theme_id` int NOT NULL AUTO_INCREMENT,
  `section_id` int NOT NULL,
  `theme_title` varchar(45) NOT NULL,
  PRIMARY KEY (`theme_id`),
  KEY `fk_theme_section1_idx` (`section_id`),
  CONSTRAINT `fk_theme_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `login` varchar(25) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_user_role2_idx` (`role_id`),
  KEY `fk_user_group1_idx` (`group_id`),
  CONSTRAINT `fk_user_group1` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `leaderboard`
--

/*!50001 DROP VIEW IF EXISTS `leaderboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `leaderboard` AS select `u`.`user_id` AS `user_id`,`u`.`login` AS `login`,`u`.`surname` AS `surname`,`u`.`name` AS `name`,`u`.`patronymic` AS `patronymic`,`ug`.`group_name` AS `group_name`,sum(`tr`.`score`) AS `total_score`,rank() OVER (ORDER BY sum(`tr`.`score`) desc )  AS `rank` from ((`user` `u` join `user_group` `ug` on((`u`.`group_id` = `ug`.`group_id`))) join (select `tr1`.`user_id` AS `user_id`,`tr1`.`test_id` AS `test_id`,`tr1`.`score` AS `score` from (`test_result` `tr1` join (select `test_result`.`user_id` AS `user_id`,`test_result`.`test_id` AS `test_id`,max(`test_result`.`attempt_number`) AS `last_attempt` from `test_result` group by `test_result`.`user_id`,`test_result`.`test_id`) `tr2` on(((`tr1`.`user_id` = `tr2`.`user_id`) and (`tr1`.`test_id` = `tr2`.`test_id`) and (`tr1`.`attempt_number` = `tr2`.`last_attempt`))))) `tr` on((`tr`.`user_id` = `u`.`user_id`))) group by `u`.`user_id`,`u`.`login`,`u`.`surname`,`u`.`name`,`u`.`patronymic`,`ug`.`group_name` having (`total_score` > 0) order by `total_score` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `test_result_display`
--

/*!50001 DROP VIEW IF EXISTS `test_result_display`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `test_result_display` AS select `tr`.`user_id` AS `user_id`,`u`.`login` AS `user_login`,`u`.`surname` AS `surname`,`u`.`name` AS `name`,`u`.`patronymic` AS `patronymic`,`ug`.`group_name` AS `user_group`,`tr`.`test_id` AS `test_id`,`t`.`test_name` AS `test_name`,`tr`.`attempt_number` AS `attempt_number`,`tr`.`score` AS `score`,`qs`.`max_score` AS `max_score`,round(((`tr`.`score` / `qs`.`max_score`) * 100),2) AS `percent`,(case when (((`tr`.`score` / `qs`.`max_score`) * 100) >= 90) then 5 when (((`tr`.`score` / `qs`.`max_score`) * 100) >= 75) then 4 when (((`tr`.`score` / `qs`.`max_score`) * 100) >= 60) then 3 when (((`tr`.`score` / `qs`.`max_score`) * 100) >= 40) then 2 else 1 end) AS `grade`,`tr`.`passed_at` AS `passed_at` from ((((`test_result` `tr` join `user` `u` on((`tr`.`user_id` = `u`.`user_id`))) left join `user_group` `ug` on((`u`.`group_id` = `ug`.`group_id`))) join `test` `t` on((`tr`.`test_id` = `t`.`test_id`))) join (select `question`.`test_id` AS `test_id`,sum(`question`.`points`) AS `max_score` from `question` group by `question`.`test_id`) `qs` on((`qs`.`test_id` = `tr`.`test_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-08  1:47:20
