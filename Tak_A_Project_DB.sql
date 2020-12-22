-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: recipe_management
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `category`
--
drop database if exists `recipe_management`;
create database `recipe_management`;

use  `recipe_management`;
DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Breakfast'),(2,'Dessert'),(3,'Comfort food'),(4,'Lunch'),(5,'Dinner'),(6,'Soup'),(7,'Appetizer'),(8,'Baking');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `comment` varchar(400) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,'a warning that if you cook this at 275°F three hours instead of at 400°F : twenty-five minutes its completely ruined. do you have any suggestions?'),(2,2,3,'I love this recipe! I added garlic powder, Italian seasoning, a few flakes of nutritional yeast, half a bottle of kombucha, za’atar, dried onion to mine. Great idea!'),(3,3,2,'Due to dietary restrictions, I am only able to eat Yatzhee dice. I made the necessary substitutions,  it turned out great.'),(4,4,1,'this was a very good post you made!'),(5,5,3,'Can we freeze it?'),(6,6,2,' Have you thought about making a sugar-free version of this? '),(7,7,4,' i dont have an oven, can i still make this? '),(8,8,5,' I didn’t have any eggs, so I used a banana-chia-flax seed pulse instead. It turned out terrible; this recipe is terrible.'),(9,9,6,'a warning that if you cook this at 275°F three hours instead of at 400°F : twenty-five minutes its completely ruined. do you have any suggestions?'),(10,1,7,'I love this recipe! I added garlic powder, Italian seasoning, a few flakes of nutritional yeast, half a bottle of kombucha, za’atar, dried onion to mine. Great idea!'),(11,3,8,'Due to dietary restrictions, I am only able to eat Yatzhee dice. I made the necessary substitutions,  it turned out great.'),(12,3,9,'this was a very good post you made!'),(13,2,10,'Can we freeze it?'),(14,4,11,' Have you thought about making a sugar-free version of this? '),(15,1,1,' i dont have an oven, can i still make this? '),(16,1,5,' I didn’t have any eggs, so I used a banana-chia-flax seed pulse instead. It turned out terrible; this recipe is terrible.');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `cuisine_id` int NOT NULL AUTO_INCREMENT,
  `cuisine_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cuisine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES (1,'Indian'),(2,'Mexican'),(3,'American'),(4,'Japanese'),(5,'Chinese'),(6,'Caribbean'),(7,'Vietnamese'),(8,'Thai'),(9,'Chinese'),(10,'Italian');
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `feedback` varchar(400) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,'Great place to find variety of recipes coming so many people across the globe'),(2,2,'I love this website! Great ideas, inventine bold recipes!'),(3,3,'Home to many traditional plus new recipes - a collection of inventive, simplistic twists.'),(4,1,'Nicely built application'),(5,2,'Great ideas, inventine bold recipes!'),(6,3,'Very helpful'),(7,1,'Great idea and utility'),(8,2,'I love this website! Thanks!'),(9,3,'Home to many traditional plus new recipes'),(10,4,'Can introduce more features'),(11,5,'We need more recipes!'),(12,6,'Thanks');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(40) NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `cuisine_id` int NOT NULL,
  `recipe` varchar(4000) NOT NULL,
  `ingredients` varchar(400) NOT NULL,
  `prep_time` int NOT NULL,
  `cook_time` int NOT NULL,
  `ready_time` int NOT NULL,
  `servings` int NOT NULL,
  `nutrition_val` varchar(10) NOT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `cuisine_id` (`cuisine_id`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipe_ibfk_3` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisine` (`cuisine_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'White pasta',1,3,10,'Boil 1 cup Pasta till three-fourth cooked. Now, add 24 oz white sauce, after a boil, add pasta. Let it cook for 10 mins, add seasoning(optional),serve!','Pasta, White Sauce, garlic seasoning, Parmesan cheese ',20,35,55,4,'1600'),(2,'Red pasta',1,3,10,'Boil 1 cup Pasta till three-fourth cooked. Now, add 24 oz red sauce, after a boil, add pasta. Let it cook for 10 mins, add seasoning(optional),serve!','Pasta, Red Sauce, garlic seasoning, Parmesan cheese ',20,35,55,2,'1600'),(3,'Tacos',2,3,2,'In a medium saucepan combine 2 cans drained and rinsed black beans, 1 cup salsa, 1 1/2 tsp chili powder and and 1 tsp cumin.Simmer mixture for about 5 -10 minutes, stirring occasionally.Slightly mash beans if desired.Add to warmed tortillas with desired toppings (note, I like to heat the tortillas in a little olive oil for added flavor and moisture).','1/2 medium avocado 1 Tbsp lime juice, or to taste,1/2 cup plain Greek yogurt,1 cup fresh cilantro,1 clove garlic, pressed through a garlic crusher',15,30,45,4,'1650'),(4,'White pasta',11,3,10,'Boil 2 cup Pasta till half cooked. Now, add 24 oz white sauce, after a boil, add pasta. Let it cook for 15 mins, add seasoning,serve!','Pasta, White Sauce, garlic seasoning',20,35,55,3,'800'),(5,'Red pasta',2,4,10,'Boil 1 cup Pasta till almost cooked. Now, add 20 oz red tomato sauce, after a boil, add pasta, stir well,add cheese. Let it cook for 10 mins, add seasoning,serve!','Pasta, Red Sauce, garlic seasoning, Parmesan cheese ',20,30,50,4,'600'),(6,'Tacos',12,3,2,'In a medium saucepan combine 2 cans drained and rinsed black beans,beef, 1 cup salsa, 1 1/2 tsp chili powder and and 1 tsp cumin.Simmer mixture for about 5 -10 minutes, stirring occasionally.Slightly mash beans if desired.Add to warmed tortillas with desired toppings (note, I like to heat the tortillas in a little olive oil for added flavor and moisture).','1/2 medium avocado 1 Tbsp lime juice, or to taste,1/2 cup plain Greek yogurt,1 cup fresh cilantro,1 clove garlic, pressed through a garlic crusher',15,30,45,4,'1250'),(7,'Palak Paneer',3,4,1,'shallow fry cottage cheese. grind spinach. fry onion and garlic, grind. add oil and cumin, with garlic-onion paste, stir well for 5 mins, add spices. add spinach paste, stir welll for 5 mins. add cottage cheese, let it cook for 20 mins.serve!','spinach,cottage cheese, salt, cumin powder, onion,pepper,garlic paste,oil ',20,30,50,4,'2600'),(8,'Corn Capsicum',4,4,1,'Boil 1 cup corn and 1 capsicum.heat oil,add grinder onion, add garlic paste, salt to taste, red chilli powder, dry mango powder, let it cook for 5 mins, until onion turn golden brown. add corn and capiscum,let it cook for 10 mins. Ready to serve!','Corn, capsicum, salt, red chilli powder, tomatoes, onion, cumin powder, dry mango powder  ',20,30,50,4,'1400'),(9,'Pizza',5,3,10,'Take crust, spread sauce evenly, top it with favorite veggies, sprinkle lots of mozarrella cheese , bake it at 400 F for 60 mins. Serve hot!','Pizza crust, tomatoes, olives, pienapple,onion, green pepper, parmesan cheese, garlic sauce,mozarrella cheese ',15,30,45,4,'1200'),(10,'Basil Fried Rice',5,4,8,'Slice white and green parts of scallions, keeping parts separate. (You should have about 1/4 cup each of white and green parts.) Step 2 Heat vegetable oil in a wok or large cast-iron skillet over high. Add red and green bell peppers, garlic, ginger, and white parts of scallions. Cook, stirring constantly, until vegetables are just tender, about 1 minute. Add rice and salt, stirring to break up clumps. Cook, stirring occasionally, until rice begins to crisp, about 4 minutes.  Step 3 Push rice mixture to 1 side of wok; add eggs to other side. Cook, stirring eggs often, until eggs are scrambled and cooked through, about 1 minute. Stir eggs into rice mixture. Add butter peas, chopped basil, soy sauce, and sesame oil. Cook, stirring constantly, until just combined and heated through, about 1 minute. Sprinkle with green parts of scallions and sliced basil.','scallions, sticky rice,kosher salt, garlic cloves, ginger, peas, soy sauce,green bell pepper,veg oil,butter',5,10,15,3,'1000'),(11,'Basil Fried Rice',6,5,8,'Heat oil over medium heat. Then, add the garlic and red chilis and saute them until they are fragrant, or about 30 seconds. (photo 1).Saute peppers, onions, and salt for about 4-5 minutes, or until they are slightly tender (photo 2).Add half the basil leaves, soy sauce, hoisin sauce, and chili garlic paste. Stir this well and fry them together.','scallions, sticky rice,kosher salt, garlic cloves, ginger, peas, soy sauce,green bell pepper,veg oil,butter',5,10,15,2,'1200');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(40) NOT NULL,
  `email_id` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `preference` varchar(40) NOT NULL,
  `diet_restric` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Anushka Tak','takanushka@gmail.com','atak123','vegetarian','peanuts'),(2,'Tom Cruise','tomcruise@gmail.com','tcruise123','non-vegetarian','none'),(3,'Peter Parker','peterparker@gmail.com','pparker123','pescatarian','dairy'),(4,'Tanya Jain','tanyajain@gmail.com','tjain123','vegan','glutten'),(5,'Tom Hanks','takanu@gmail.com','atak12345','vegetarian','peanuts'),(6,'Tom Matthews','tomc@gmail.com','tcruise12345','non-vegetarian','none'),(7,'Peter Washington','parker@gmail.com','pparker12345','pescatarian','dairy'),(8,'Tanya Malhotra','jain@gmail.com','tjain12345','vegan','glutten'),(9,'Kareena Kapoor','tak@gmail.com','atak12389','vegetarian','peanuts'),(10,'Marta Lopez','tom@gmail.com','tcruise12389','non-vegetarian','none'),(11,'Tiffany Brown','peter@gmail.com','pparker12389','pescatarian','dairy'),(12,'Tanya Saxena','tanya@gmail.com','tjain12389','vegan','glutten');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'recipe_management'
--

--
-- Dumping routines for database 'recipe_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_tables`()
BEGIN
    create table if not exists cuisine(cuisine_id int not null primary key AUTO_INCREMENT, cuisine_name varchar(20) not null ); 
    create table if not exists category(category_id int not null primary key AUTO_INCREMENT, category_name varchar(20) not null ); 
    create table if not exists users(user_id int not null primary key AUTO_INCREMENT, full_name varchar(40) not null, email_id  varchar(40) unique not null, password varchar(40) not null, preference varchar(40) not null, diet_restric varchar(40) );  
    create table if not exists feedback(feedback_id int not null primary key AUTO_INCREMENT, user_id int not null, feedback varchar(400) not null , FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE); 
    create table if not exists recipe(recipe_id int not null primary key AUTO_INCREMENT, recipe_name varchar(40)  not null, user_id int not null, category_id int not null, cuisine_id int not null,recipe  varchar(4000) not null, ingredients varchar(400) not null, prep_time int not null, cook_time int not null,ready_time int not null, servings int not null, nutrition_val varchar(10) not null, FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (cuisine_id) REFERENCES cuisine(cuisine_id) ON DELETE CASCADE ON UPDATE CASCADE); 
    create table if not exists comments(comment_id int not null primary key AUTO_INCREMENT, user_id int not null, recipe_id int not null, comment varchar(400) not null , FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id) ON DELETE CASCADE ON UPDATE CASCADE); 
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populate_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populate_category`()
BEGIN

	insert into category values(1, 'Breakfast') ; 
	insert into category values(2, 'Dessert') ; 
	insert into category values(3, 'Comfort food') ; 
	insert into category values(4, 'Lunch') ; 
	insert into category values(5, 'Dinner') ; 
	insert into category values(6, 'Soup') ; 
	insert into category values(7, 'Appetizer') ; 
	insert into category values(8, 'Baking') ; 
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populate_comments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populate_comments`()
BEGIN
	
    insert into comments values(1, 1, 1, "a warning that if you cook this at 275°F three hours instead of at 400°F : twenty-five minutes its completely ruined. do you have any suggestions?") ; 
	insert into comments values(2, 2, 3, "I love this recipe! I added garlic powder, Italian seasoning, a few flakes of nutritional yeast, half a bottle of kombucha, za’atar, dried onion to mine. Great idea!") ; 
	insert into comments values(3, 3, 2, "Due to dietary restrictions, I am only able to eat Yatzhee dice. I made the necessary substitutions,  it turned out great.") ; 
	insert into comments values(4, 4, 1, "this was a very good post you made!") ; 
	insert into comments values(5, 5, 3, "Can we freeze it?") ; 
	insert into comments values(6, 6, 2, " Have you thought about making a sugar-free version of this? ") ; 
	insert into comments values(7, 7, 4, " i dont have an oven, can i still make this? ") ; 
	insert into comments values(8, 8, 5, " I didn’t have any eggs, so I used a banana-chia-flax seed pulse instead. It turned out terrible; this recipe is terrible.") ; 
    insert into comments values(9, 9, 6, "a warning that if you cook this at 275°F three hours instead of at 400°F : twenty-five minutes its completely ruined. do you have any suggestions?") ; 
	insert into comments values(10, 1, 7, "I love this recipe! I added garlic powder, Italian seasoning, a few flakes of nutritional yeast, half a bottle of kombucha, za’atar, dried onion to mine. Great idea!") ; 
	insert into comments values(11, 3, 8, "Due to dietary restrictions, I am only able to eat Yatzhee dice. I made the necessary substitutions,  it turned out great.") ; 
	insert into comments values(12, 3, 9, "this was a very good post you made!") ; 
	insert into comments values(13, 2, 10, "Can we freeze it?") ; 
	insert into comments values(14, 4, 11, " Have you thought about making a sugar-free version of this? ") ; 
	insert into comments values(15, 1, 1, " i dont have an oven, can i still make this? ") ; 
	insert into comments values(16, 1, 5, " I didn’t have any eggs, so I used a banana-chia-flax seed pulse instead. It turned out terrible; this recipe is terrible.") ; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populate_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populate_cuisine`()
BEGIN
	insert into cuisine values(1, 'Indian') ;
	insert into cuisine values(2, 'Mexican') ;
	insert into cuisine values(3, 'American') ;
	insert into cuisine values(4, 'Japanese') ;
	insert into cuisine values(5, 'Chinese') ;
	insert into cuisine values(6, 'Caribbean');
	insert into cuisine values(7, 'Vietnamese'); 
	insert into cuisine values(8, 'Thai') ; 
	insert into cuisine values(9, 'Chinese') ; 
	insert into cuisine values(10, 'Italian') ; 
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populate_feedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populate_feedback`()
BEGIN
	
	insert into feedback values(1, 1,  "Great place to find variety of recipes coming so many people across the globe") ; 
	insert into feedback values(2, 2,  "I love this website! Great ideas, inventine bold recipes!") ; 
	insert into feedback values(3, 3, "Home to many traditional plus new recipes - a collection of inventive, simplistic twists.") ;
    insert into feedback values(4, 1,  "Nicely built application") ; 
	insert into feedback values(5, 2,  "Great ideas, inventine bold recipes!") ; 
	insert into feedback values(6, 3, "Very helpful") ;
    insert into feedback values(7, 1,  "Great idea and utility") ; 
	insert into feedback values(8, 2,  "I love this website! Thanks!") ; 
	insert into feedback values(9, 3, "Home to many traditional plus new recipes") ;
    insert into feedback values(10, 4,  "Can introduce more features") ; 
	insert into feedback values(11, 5,  "We need more recipes!") ; 
	insert into feedback values(12, 6, "Thanks") ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populate_recipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populate_recipe`()
BEGIN
	
	insert into recipe values(1,'White pasta',1,3,10, "Boil 1 cup Pasta till three-fourth cooked. Now, add 24 oz white sauce, after a boil, add pasta. Let it cook for 10 mins, add seasoning(optional),serve!","Pasta, White Sauce, garlic seasoning, Parmesan cheese ", 20, 35, 55, 4, 1600);
	insert into recipe values(2,'Red pasta',1,3,10, "Boil 1 cup Pasta till three-fourth cooked. Now, add 24 oz red sauce, after a boil, add pasta. Let it cook for 10 mins, add seasoning(optional),serve!","Pasta, Red Sauce, garlic seasoning, Parmesan cheese ", 20, 35, 55, 2, 1600);
	insert into recipe values(3,'Tacos',2,3,2, "In a medium saucepan combine 2 cans drained and rinsed black beans, 1 cup salsa, 1 1/2 tsp chili powder and and 1 tsp cumin.Simmer mixture for about 5 -10 minutes, stirring occasionally.Slightly mash beans if desired.Add to warmed tortillas with desired toppings (note, I like to heat the tortillas in a little olive oil for added flavor and moisture).","1/2 medium avocado 1 Tbsp lime juice, or to taste,1/2 cup plain Greek yogurt,1 cup fresh cilantro,1 clove garlic, pressed through a garlic crusher", 15, 30, 45, 4, 1650);
	insert into recipe values(4,'White pasta',11,3,10, "Boil 2 cup Pasta till half cooked. Now, add 24 oz white sauce, after a boil, add pasta. Let it cook for 15 mins, add seasoning,serve!","Pasta, White Sauce, garlic seasoning", 20, 35, 55, 3, 800);
	insert into recipe values(5,'Red pasta',2,4,10, "Boil 1 cup Pasta till almost cooked. Now, add 20 oz red tomato sauce, after a boil, add pasta, stir well,add cheese. Let it cook for 10 mins, add seasoning,serve!","Pasta, Red Sauce, garlic seasoning, Parmesan cheese ", 20, 30, 50, 4, 600);
	insert into recipe values(6,'Tacos',12,3,2, "In a medium saucepan combine 2 cans drained and rinsed black beans,beef, 1 cup salsa, 1 1/2 tsp chili powder and and 1 tsp cumin.Simmer mixture for about 5 -10 minutes, stirring occasionally.Slightly mash beans if desired.Add to warmed tortillas with desired toppings (note, I like to heat the tortillas in a little olive oil for added flavor and moisture).","1/2 medium avocado 1 Tbsp lime juice, or to taste,1/2 cup plain Greek yogurt,1 cup fresh cilantro,1 clove garlic, pressed through a garlic crusher", 15, 30, 45, 4, 1250);
	insert into recipe values(7,'Palak Paneer',3,4,1, "shallow fry cottage cheese. grind spinach. fry onion and garlic, grind. add oil and cumin, with garlic-onion paste, stir well for 5 mins, add spices. add spinach paste, stir welll for 5 mins. add cottage cheese, let it cook for 20 mins.serve!","spinach,cottage cheese, salt, cumin powder, onion,pepper,garlic paste,oil ", 20, 30, 50,  4, 2600);
	insert into recipe values(8,'Corn Capsicum',4,4,1, "Boil 1 cup corn and 1 capsicum.heat oil,add grinder onion, add garlic paste, salt to taste, red chilli powder, dry mango powder, let it cook for 5 mins, until onion turn golden brown. add corn and capiscum,let it cook for 10 mins. Ready to serve!","Corn, capsicum, salt, red chilli powder, tomatoes, onion, cumin powder, dry mango powder  ", 20, 30, 50,  4, 1400);
	insert into recipe values(9,'Pizza',5,3,10, "Take crust, spread sauce evenly, top it with favorite veggies, sprinkle lots of mozarrella cheese , bake it at 400 F for 60 mins. Serve hot!","Pizza crust, tomatoes, olives, pienapple,onion, green pepper, parmesan cheese, garlic sauce,mozarrella cheese ", 15, 30, 45, 4, 1200);
	insert into recipe values(10,'Basil Fried Rice',5,4,8, "Slice white and green parts of scallions, keeping parts separate. (You should have about 1/4 cup each of white and green parts.) Step 2 Heat vegetable oil in a wok or large cast-iron skillet over high. Add red and green bell peppers, garlic, ginger, and white parts of scallions. Cook, stirring constantly, until vegetables are just tender, about 1 minute. Add rice and salt, stirring to break up clumps. Cook, stirring occasionally, until rice begins to crisp, about 4 minutes.  Step 3 Push rice mixture to 1 side of wok; add eggs to other side. Cook, stirring eggs often, until eggs are scrambled and cooked through, about 1 minute. Stir eggs into rice mixture. Add butter peas, chopped basil, soy sauce, and sesame oil. Cook, stirring constantly, until just combined and heated through, about 1 minute. Sprinkle with green parts of scallions and sliced basil.","scallions, sticky rice,kosher salt, garlic cloves, ginger, peas, soy sauce,green bell pepper,veg oil,butter", 5, 10, 15, 3, 1000);
	insert into recipe values(11,'Basil Fried Rice',6,5,8, "Heat oil over medium heat. Then, add the garlic and red chilis and saute them until they are fragrant, or about 30 seconds. (photo 1).Saute peppers, onions, and salt for about 4-5 minutes, or until they are slightly tender (photo 2).Add half the basil leaves, soy sauce, hoisin sauce, and chili garlic paste. Stir this well and fry them together.","scallions, sticky rice,kosher salt, garlic cloves, ginger, peas, soy sauce,green bell pepper,veg oil,butter", 5, 10, 15, 2, 1200);
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populate_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populate_users`()
BEGIN
	
	insert into users values(1, "Anushka Tak","takanushka@gmail.com","atak123","vegetarian","peanuts" ) ; 
	insert into users values(2, "Tom Cruise" , "tomcruise@gmail.com","tcruise123","non-vegetarian","none") ; 
	insert into users values(3, "Peter Parker",  "peterparker@gmail.com","pparker123","pescatarian","dairy"); 
	insert into users values(4, "Tanya Jain","tanyajain@gmail.com" ,"tjain123","vegan","glutten") ; 
    insert into users values(5, "Tom Hanks","takanu@gmail.com","atak12345","vegetarian","peanuts" ) ; 
	insert into users values(6, "Tom Matthews" , "tomc@gmail.com","tcruise12345","non-vegetarian","none") ; 
	insert into users values(7, "Peter Washington",  "parker@gmail.com","pparker12345","pescatarian","dairy"); 
	insert into users values(8, "Tanya Malhotra","jain@gmail.com" ,"tjain12345","vegan","glutten") ; 
    insert into users values(9, "Kareena Kapoor","tak@gmail.com","atak12389","vegetarian","peanuts" ) ; 
	insert into users values(10, "Marta Lopez" , "tom@gmail.com","tcruise12389","non-vegetarian","none") ; 
	insert into users values(11, "Tiffany Brown",  "peter@gmail.com","pparker12389","pescatarian","dairy"); 
	insert into users values(12, "Tanya Saxena","tanya@gmail.com" ,"tjain12389","vegan","glutten") ; 
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-09 15:18:16
