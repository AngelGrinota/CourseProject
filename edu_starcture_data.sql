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
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,2,'довольный всем',0),(2,2,'первый в ряду',0),(3,2,'красивая природа',1),(4,2,'очень тихо',0),(5,3,'по-осеннему холодный',1),(6,3,'девушка с характером',0),(7,3,'первая любовь',0),(8,3,'учиться быстро',0),(9,4,'именное',0),(10,4,'глагольное',1),(11,4,'наречное',0),(12,4,'нумеративное',0),(13,5,'объектные',0),(14,5,'обстоятельственные',0),(15,5,'определительные',1),(16,5,'субъектные',0),(17,6,'объектные',0),(18,6,'определительные',0),(19,6,'субъектные',0),(20,6,'обстоятельственные',1),(21,7,'любимый мной',1),(22,7,'читать книгу',0),(23,7,'жизнь в деревне',0),(24,7,'поездка в гости',0),(25,8,'управление',1),(26,8,'согласование',0),(27,8,'примыкание',0),(28,9,'согласование',0),(29,9,'примыкание',0),(30,9,'управление',1),(31,10,'согласование',0),(32,10,'примыкание',1),(33,10,'управление',0),(34,11,'приехать за вещами',0),(35,11,'прославиться талантом',0),(36,11,'варить суп',1),(37,11,'идти по дороге',0),(38,12,'нарисовать картину',0),(39,12,'не хотеть молока',0),(40,12,'приехать за вещами',1),(41,12,'связать шарф',0),(42,13,'фарфоровая ваза с росписью',0),(43,13,'сидеть сложа руки',1),(44,13,'интересный роман о любви',0),(45,13,'дом на окраине города',0),(46,14,'интересный роман о любви',1),(47,14,'девушка с карими глазами',0),(48,14,'буду думать',0),(49,14,'несколько яблок',0),(50,15,'брат и сестра',1),(51,15,'красивая погода',0),(52,15,'сидеть спокойносидеть спокойно',0),(53,15,'холодный ветер',0),(54,16,'свободным',0),(55,16,'синтаксически членимым',0),(56,16,'несвободным',1),(57,16,'сочетанием слов',0),(58,17,'пять учеников',0),(59,17,'с двумя друзьями',0),(60,17,'несколько столов',0),(61,17,'двое из нас',1),(74,18,'кто-то из присутствующих',0),(75,18,'что-то белое',1),(76,18,'две подруги',0),(77,18,'дед с матерью',0),(78,19,'кто-то в красном',0),(79,19,'несколько студентов',0),(80,19,'дед с матерью шли впереди',1),(81,20,'костер рябины',1),(82,20,'читать роман',0),(83,20,'темный от загара',0),(84,20,'смуглый от рождения',0),(85,21,'гулять в лесу',0),(86,21,'любить маму',0),(87,21,'играть вслепую',1),(88,21,'самый умный',0),(187,47,'Главные и второстепенные члены предложения',0),(188,47,'Подлежащее и инфинитив',0),(189,47,'Подлежащее и сказуемое',1),(190,47,'Глагол-связка и именная часть',0),(191,48,'Подлежащее, обозначающее предмет речи',1),(192,48,'Сказуемое, выражающее предикативность',0),(193,48,'Инфинитив, стоящий в препозиции',0),(194,48,'Именное подлежащее',0),(195,49,'Главный член, выражающий предикативность',0),(196,49,'Главный член, являющийся носителем модально-временного значения',0),(197,49,'Любая часть речи, употребленная в значении существительного',0),(198,49,'Максимально независимый главный член, обозначающий субъект мысли',1),(199,50,'Личное и безличное',0),(200,50,'Простое и составное',0),(201,50,'Именное и инфинитивное',1),(202,50,'Существительное и местоимение',0),(203,51,'Только существительным или инфинитивом',0),(204,51,'Существительным в любом падеже',0),(205,51,'Инфинитивом в постпозиции',0),(206,51,'Существительным, местоимением в именительном падеже, а также любой частью речи в значении существительного',1),(207,52,'Если он стоит в постпозиции (после сказуемого)',0),(208,52,'Если после него стоит глагол-связка',0),(209,52,'Если он стоит в препозиции (перед сказуемым)',1),(210,52,'Если сказуемое актуализируется',0),(211,53,'Сочетание слов со значением неопределенности',0),(212,53,'Метафорическое сочетание',0),(213,53,'Количественно-именное сочетание',1),(214,53,'Сочетание слов со значением совместности',0),(215,54,'Сочетание слов со значением приблизительности',0),(216,54,'Сочетание слов со значением выделительности',0),(217,54,'Сочетание слов со значением противопоставления',1),(218,54,'Крылатое выражение',0),(219,55,'Шли впереди всех',0),(220,55,'Дед с матерью шли',0),(221,55,'Всех',0),(222,55,'Дед с матерью (со значением совместности)',1),(223,56,'Семантическая классификация',0),(224,56,'Функциональная классификация',0),(225,56,'Структурная классификация',1),(226,56,'Морфологическая классификация',0),(227,57,'Простое, составное и сложное',0),(228,57,'Глагольное, именное, смешанное',0),(229,57,'Осложненное и неосложненное',0),(230,57,'Простое глагольное, составное глагольное и составное именное, сложное',1),(231,58,'В том, что оно выражает только лексическое значение',0),(232,58,'В наличии личной формы глагола',0),(233,58,'В том, что грамматическое и лексическое значение выражено одним словом',1),(234,58,'В том, что оно выражается личной формой глагола',0),(235,59,'Составное глагольное сказуемое',0),(236,59,'Составное именное сказуемое',0),(237,59,'Простое глагольное сказуемое (осложненное)',0),(238,59,'Простое глагольное сказуемое (неосложненное)',1),(239,60,'Замена инфинитива глаголом совершенного вида',0),(240,60,'Перестановка главных членов (постпозиция)',0),(241,60,'Замена инфинитива причастием',0),(242,60,'Замена именительного падежа существительного творительным падежом',1),(243,61,'Начинать',0),(244,61,'Кончать',0),(245,61,'Казаться',1),(246,61,'Продолжать',0);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `paragraph`
--

LOCK TABLES `paragraph` WRITE;
/*!40000 ALTER TABLE `paragraph` DISABLE KEYS */;
INSERT INTO `paragraph` VALUES (2,1,'Словосочетание как номинативная единица языка и сочетания слов','Resources\\Lectures\\Синтаксис\\Словосочетание\\СКНЕЯИСС.pdf'),(3,1,'Классификация словосочетания','Resources\\Lectures\\Синтаксис\\Словосочетание\\Классификация словосочетания.pdf'),(4,4,'Сложносочиненное предложение','Resources\\Lectures\\Синтаксис\\Сложное предложение\\Сложносочиненное предложение.pdf'),(5,4,'Сложноподчиненное предложение','Resources\\Lectures\\Синтаксис\\Сложное предложение\\Сложноподчиненное предложение.pdf'),(6,4,'Бессоюзное сложное предложение','Resources\\Lectures\\Синтаксис\\Сложное предложение\\Бессоюзное сложное предложение.pdf'),(7,2,'Предложение как коммуникативная единица языка','Resources\\Lectures\\Синтаксис\\Простое предложение\\Предложение как коммуникативная единица языка.pdf'),(8,2,'Классификация односоставных предложений','Resources\\Lectures\\Синтаксис\\Простое предложение\\Классификация односоставных предложений.pdf'),(9,2,'Главные члены предложения','Resources\\Lectures\\Синтаксис\\Простое предложение\\Главные члены предложения.pdf'),(10,2,'Второстепенные члены предложения','Resources\\Lectures\\Синтаксис\\Простое предложение\\Второстепенные члены предложения.pdf'),(11,3,'Предложения, осложненные однородными и обособленными членами','Resources\\Lectures\\Синтаксис\\Осложнённое предложение\\ПООИОЧ.pdf'),(12,3,'Предложения с вводными и вставными единицами. Предложения с обращениями','Resources\\Lectures\\Синтаксис\\Осложнённое предложение\\ПСВИВЕ.pdf'),(13,4,'Сложное предложение','Resources\\Lectures\\Синтаксис\\Сложное предложение\\Сложное предложение.pdf'),(14,6,'Сложносочиненное предложение','Resources\\Lectures\\Пунктуация\\Знаки препинания в сложном предложении\\Сложносочинённое предложение.pdf'),(15,6,'Сложноподчинённое предложение','Resources\\Lectures\\Пунктуация\\Знаки препинания в сложном предложении\\Сложноподчинённое предложение.pdf'),(16,6,'Бессоюзное сложное предложение','Resources\\Lectures\\Пунктуация\\Знаки препинания в сложном предложении\\Бессоюзное сложное предложение.pdf'),(17,7,'Прямая речь','Resources\\Lectures\\Пунктуация\\Прямая речь и диалоги\\Прямая речь.pdf'),(18,7,'Диалог','Resources\\Lectures\\Пунктуация\\Прямая речь и диалоги\\Диалог.pdf'),(19,7,'Цитаты','Resources\\Lectures\\Пунктуация\\Прямая речь и диалоги\\Цитаты.pdf'),(20,5,'Тире между подлежащим и сказуемым','Resources\\Lectures\\Пунктуация\\Знаки препинания в простом предложении\\Тире между подлежащим и сказуемым.pdf'),(21,5,'Однородные члены предложения','Resources\\Lectures\\Пунктуация\\Знаки препинания в простом предложении\\Однородные члены предложения.pdf'),(22,5,'Обособленные члены предложения','Resources\\Lectures\\Пунктуация\\Знаки препинания в простом предложении\\Обособленные члены предложения.pdf'),(23,5,'Слова, грамматически не связанные с предложением','Resources\\Lectures\\Пунктуация\\Знаки препинания в простом предложении\\СГНЕСЕ.pdf'),(24,5,'Сравнительный оборот','Resources\\Lectures\\Пунктуация\\Знаки препинания в простом предложении\\Сравнительный оборот.pdf');
/*!40000 ALTER TABLE `paragraph` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (2,1,'Какое словосочетание относится к субстантивным?',5),(3,1,'В каком словосочетании главное слово — прилагательное?',5),(4,1,'К какому типу относится словосочетание “учиться с детства”?',5),(5,1,'Какие отношения выражены в словосочетании “теплая погода”?',5),(6,1,'Какие отношения выражены в словосочетании “работать добросовестно”?',5),(7,1,'В каком словосочетании выражены субъектные отношения?',5),(8,1,'Какой тип связи представлен в словосочетании “красивая девушка”?',5),(9,1,'Какой тип связи представлен в словосочетании “гулять в парке”?',5),(10,1,'Какой тип связи представлен в словосочетании “люблю плавать”?',5),(11,1,'Какое словосочетание является примером сильного управления?',5),(12,1,'Какое словосочетание является примером слабого управления?',5),(13,1,'Что относится к простому словосочетанию?',5),(14,1,'Какое словосочетание является сложным (параллельная связь)?',5),(15,1,'Что из нижеуказанного НЕ относится к словосочетаниям?',5),(16,1,'Словосочетание “нести ответственность” является:',5),(17,1,'В каком примере словосочетание синтаксически нечленимое?',5),(18,1,'Какой тип словосочетаний имеет значение неопределённости?',5),(19,1,'В каком словосочетании проявляется значение совместности (нечленимое)?',5),(20,1,'Какое сочетание слов является метафорическим словосочетанием?',5),(21,1,'В каком примере зависимость выражена порядком слов?',5),(47,5,' Что образует предикативную основу, составляющую конструктивное ядро предложения?',3),(48,5,' Какой главный член предложения в семантическом плане является более важным?',3),(49,5,' Какое определение наиболее точно характеризует подлежащее?',3),(50,5,' По какой морфологической природе различают типы подлежащего в русском языке?',3),(51,5,' Чем может выражаться именное подлежащее?',4),(52,5,' В каком случае инфинитив является безусловным подлежащим?',4),(53,5,' К какому типу сочетаний слов относится подлежащее в предложении \"Прошло сто лет\"',4),(54,5,' Какое из перечисленных сочетаний слов не упомянуто в тексте как способ выражения подлежащего?',4),(55,5,' Какое сочетание слов является подлежащим в предложении \"Дед с матерью шли впереди всех\"?',4),(56,5,' Какая классификация сказуемого является наиболее распространенной в современной синтаксической науке?',3),(57,5,' На какие типы делятся сказуемые в зависимости от способа выражения модально-временного значения?',3),(58,5,' В чем заключается основное отличие простого глагольного сказуемого (ПГС) от составного и сложного?',3),(59,5,' Укажите тип сказуемого в предложении: \"Осень листья темной краской метит\"',4),(60,5,' Какой прием позволяет определить, является ли инфинитив подлежащим, а существительное — составным именным сказуемым?',3),(61,5,' Что из перечисленного не относится к фазисным глаголам, которые могут образовывать составное глагольное сказуемое?',3);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Студент'),(2,'Преподаватель'),(3,'Администратор');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'Синтаксис'),(2,'Пунктуация');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,1,'Тест по словосочетаниям',5),(5,2,'Тест по главным членам предложения',3);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `test_result`
--

LOCK TABLES `test_result` WRITE;
/*!40000 ALTER TABLE `test_result` DISABLE KEYS */;
INSERT INTO `test_result` VALUES (1,1,1,35,'2025-11-16 23:55:50'),(1,1,2,50,'2025-11-19 11:20:26'),(1,1,3,20,'2025-12-07 21:30:43'),(1,5,1,37,'2025-11-29 22:27:52'),(4,1,1,10,'2025-11-19 00:51:26'),(4,1,2,25,'2025-11-22 17:56:01'),(4,1,3,0,'2025-11-22 20:27:57'),(4,1,4,20,'2025-11-22 22:04:32'),(4,1,5,100,'2025-11-28 00:16:40'),(51,1,1,30,'2025-11-30 16:35:38');
/*!40000 ALTER TABLE `test_result` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,1,'Словосочетание'),(2,1,'Простое предложение'),(3,1,'Осложнённое предложение'),(4,1,'Сложное предложение'),(5,2,'Знаки препинания в простом предложении'),(6,2,'Знаки препинания в сложном предложении'),(7,2,'Прямая речь и диалоги');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,1,'angel','Вепрёв','Александр','Михайлович','12345678'),(2,1,3,'user123','Алехин','Михаил','Макарович','12345678'),(3,2,NULL,'teacher1','Ирина','Леонидовна','Самоукова','12345678'),(4,1,3,'angel1','Капитанская','Дарья','Андреевна','12345678'),(5,3,NULL,'admin','Админов','Админ','Админович','admin'),(11,2,NULL,'jsm','Маломан','Юлия','Сергеевна','12345678'),(12,2,NULL,'reyrom','Садовский','Роман','Викторович','qwerty12345'),(13,2,NULL,'teacher2','Лукина','Светлана','Викторовна','123456'),(15,1,2,'g','Нозиков','Григорий','Евгеньевич','098098098'),(51,1,5,'grinota','Нозиков','Григорий','Евгеньевич','qwerty12345!'),(67,1,3,'k','Пушкин','Александр','Сегеевич','12345678');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,'ИСПП-21'),(2,'ИСПП-31'),(3,'КСК-21'),(4,'КСК-31'),(5,'ИСПП-35'),(6,'ИСПП-25');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2025-12-08  3:07:27
