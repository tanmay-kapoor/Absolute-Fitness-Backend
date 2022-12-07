DROP DATABASE IF EXISTS absolute_fitness;
CREATE DATABASE absolute_fitness;
USE absolute_fitness;

DROP TABLE IF EXISTS gyms;
CREATE TABLE gyms (
gym_id 			INT 				PRIMARY KEY 	AUTO_INCREMENT,
image_url 		VARCHAR(200) 		NOT NULL, 		
phone 			VARCHAR(10) 		NOT NULL 		UNIQUE,
location 		VARCHAR(50) 		NOT NULL		UNIQUE,
membership_fee 	DECIMAL(65,2) 		NOT NULL
);

DROP TABLE IF EXISTS news_letters;
CREATE TABLE news_letters (
letter_id 		INT 			PRIMARY KEY 	AUTO_INCREMENT,
date 			DATE 			NOT NULL,
title 			VARCHAR(100) 	NOT NULL,
description 	VARCHAR(500) 	NOT NULL
);

DROP TABLE IF EXISTS facilities;
CREATE TABLE facilities (
name 			VARCHAR(20) 	PRIMARY KEY,
image_url		VARCHAR(200)	NOT NULL,
gym_id	 		INT 			NOT NULL,
opening_time 	VARCHAR(20) 	NOT NULL,
closing_time    VARCHAR(20) 	NOT NULL,
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS equipments;
CREATE TABLE equipments (
name 			VARCHAR(20) 	NOT NULL,
quantity		INT 			NOT NULL,
last_serviced 	DATE,
gym_id	 		INT 			NOT NULL,
PRIMARY KEY (name, gym_id),
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
staff_id 	INT 			PRIMARY KEY,
name 		VARCHAR(50) 	NOT NULL,
phone 		VARCHAR(10) 	NOT NULL 		UNIQUE,
part_time 	BOOLEAN 		DEFAULT FALSE,
salary 		DECIMAL(65, 2) 	NOT NULL 		CHECK(salary>0),
description VARCHAR(100) 	NOT NULL,
password 	VARCHAR(100)	NOT NULL,
gym_id 		INT 			NOT NULL,
FOREIGN KEY (gym_id) REFERENCES gyms (gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS gym_admins;
CREATE TABLE gym_admins (
staff_id 	INT 	UNIQUE 		NOT NULL,
gym_id 		INT 	UNIQUE 		NOT NULL,
PRIMARY KEY (staff_id, gym_id),
FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- create whenever gym is added it should have an admin

DROP TABLE IF EXISTS trainers;
CREATE TABLE trainers (
staff_id  		INT 			PRIMARY KEY,
image_url 		VARCHAR(200) 	NOT NULL,
years_of_exp	INT 			NOT NULL 	CHECK (years_of_exp >= 0),
speciality		VARCHAR(30)		NOT NULL,
FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
email		VARCHAR(30) 	PRIMARY KEY,
name 		VARCHAR(50) 	NOT NULL,
phone 		VARCHAR(10) 	NOT NULL	 		UNIQUE,
dob			DATE			NOT NULL			CHECK(dob>="1900-01-01"),
sex 		ENUM("Male", "Female", "Other") 	NOT NULL,
password	VARCHAR(100) 	NOT NULL,
gym_id 		INT 			NOT NULL,
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS health_records;
CREATE TABLE health_records (
record_id 			INT 				PRIMARY KEY 	AUTO_INCREMENT,
height 				DECIMAL(65, 2) 		NOT NULL,
weight 				DECIMAL(65, 2)		NOT NULL,
date_calculated 	DATE 				NOT NULL,
bmi 				DECIMAL(65,2) 		NOT NULL,
email		 		VARCHAR(30)			NOT NULL,
FOREIGN KEY (email) REFERENCES users (email) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS excercises;
CREATE TABLE excercises (
name			VARCHAR(32)		PRIMARY KEY,
reps			INT 			NOT NULL	CHECK (sets > 0),
sets			INT 			NOT NULL 	CHECK (reps > 0),
image_url		VARCHAR(200)	NOT NULL
);

-- INSERT INTO excercises VALUES ("Pushups", 5, 20, "https://blog.nasm.org/hubfs/power-pushups.jpg");
-- INSERT INTO excercises VALUES ("Pullups", 3, 15, "https://post.healthline.com/wp-content/uploads/2019/09/pull-up-pullup-gym-1200x628-facebook.jpg");
-- INSERT INTO excercises VALUES ("Bench Press", 5, 40, "https://cdn.mos.cms.futurecdn.net/pLaRi5jXSHDKu6WRydetBo.jpg");

DROP TABLE IF EXISTS workout_plans;
CREATE TABLE workout_plans (
plan_id 		INT 			PRIMARY KEY		AUTO_INCREMENT,
name			VARCHAR(32) 	NOT NULL 		UNIQUE,
description  	VARCHAR(512),
excercise_1		VARCHAR(32),
excercise_2		VARCHAR(32),
excercise_3		VARCHAR(32),
FOREIGN KEY (excercise_1) REFERENCES excercises (name) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (excercise_2) REFERENCES excercises (name) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (excercise_3) REFERENCES excercises (name) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE IF EXISTS meal_choices;
CREATE TABLE meal_choices (
meal		VARCHAR(100)	PRIMARY KEY,
calories	INT 			NOT NULL		CHECK (calories > 0),
image_url	VARCHAR(200)	NOT NULL
);

-- INSERT INTO meal_choices values ("Oats", 150, "https://post.healthline.com/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg");
-- INSERT INTO meal_choices values ("Porridge", 95, "https://insanelygoodrecipes.com/wp-content/uploads/2022/04/Oatmeal-Porridge-with-Nuts-and-Blueberries-in-a-Blue-Bowl.jpg");
-- INSERT INTO meal_choices values ("Chicken", 250, "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/healthy-chicken-recipes-1641586837.jpeg?crop=1.00xw:0.498xh;0,0.285xh&resize=1200:*");

DROP TABLE IF EXISTS diet_plans;
CREATE TABLE diet_plans (
plan_id 			INT 				PRIMARY KEY 	AUTO_INCREMENT,
name				VARCHAR(32) 		NOT NULL 		UNIQUE,
description 		VARCHAR(512),
breakfast			VARCHAR(100),
lunch				VARCHAR(100),
dinner				VARCHAR(100),
FOREIGN KEY (breakfast) REFERENCES meal_choices (meal) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (lunch) REFERENCES meal_choices (meal) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (dinner) REFERENCES meal_choices (meal) ON UPDATE CASCADE ON DELETE SET NULL
); 

DROP TABLE IF EXISTS health_plans;
CREATE TABLE health_plans (
plan_id 		INT 			PRIMARY KEY		AUTO_INCREMENT,
trainer_id 		INT 			UNIQUE,
email 			VARCHAR(100) 	NOT NULL 		UNIQUE,
workout_plan 	INT,
diet_plan 		INT,
description		VARCHAR(512),
FOREIGN KEY (trainer_id) REFERENCES trainers (staff_id) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (email) REFERENCES users (email) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (workout_plan) REFERENCES workout_plans (plan_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (diet_plan) REFERENCES diet_plans (plan_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP FUNCTION IF EXISTS getRandomTrainer;
DELIMITER //
CREATE FUNCTION getRandomTrainer(v_gym INT)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE random_trainer INT;
    
	SELECT s.gym_id, t.staff_id INTO random_trainer FROM 
    trainers t JOIN staff s
    ON t.staff_id = s.staff_id
    HAVING s.gym_id = v_gym
    LIMIT 1;
    
    RETURN random_trainer;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS randomly_assign_health_plan;
DELIMITER //
CREATE TRIGGER randomly_assign_health_plan
AFTER INSERT ON users FOR EACH ROW
BEGIN
	INSERT INTO health_plan (trainer_id, email, workout_plan, diet_plan, description) 
    VALUES (getRandomTrainer(NEW.gym_id), NEW.email, 4, 4, "randomly assigned plan");
END //
DELIMITER ;

DROP TABLE IF EXISTS food_items;
CREATE TABLE food_items (
item_id 			INT 			PRIMARY KEY 	AUTO_INCREMENT,
name 				VARCHAR(32)		NOT NULL,
calories			INT  			NOT NULL,
is_gluten_free		BOOLEAN 		NOT NULL,
is_vegan			BOOLEAN 		NOT NULL,
image_url 			VARCHAR(200)
);

-- DROP FUNCTION IF EXISTS getRandomTrainer;
-- DELIMITER //
-- CREATE FUNCTION getRandomTrainer(v_gym INT)
-- RETURNS INT READS SQL DATA
-- BEGIN
-- 	DECLARE random_trainer INT;
--     
-- 	SELECT s.gym_id, t.staff_id INTO random_trainer FROM 
--     trainers t JOIN staff s
--     ON t.staff_id = s.staff_id
--     HAVING s.gym_id = v_gym
--     LIMIT 1;
--     
--     RETURN random_trainer;
-- END //
-- DELIMITER ;

-- DROP TRIGGER IF EXISTS randomly_assign_health_plan;
-- DELIMITER //
-- CREATE TRIGGER randomly_assign_health_plan
-- AFTER INSERT ON users FOR EACH ROW
-- BEGIN
-- 	INSERT INTO health_plans (trainer_id, email, workout_plan, diet_plan, description) 
--     VALUES (getRandomTrainer(NEW.gym_id), NEW.email, 4, 4, "randomly assigned plan");
-- END //
-- DELIMITER ;
