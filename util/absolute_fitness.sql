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
years_of_exp		INT 			NOT NULL 	CHECK (years_of_exp >= 0),
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

DROP TABLE IF EXISTS workout_plan;
CREATE TABLE workout_plan (
plan_id 		INT 			PRIMARY KEY		AUTO_INCREMENT,
name			VARCHAR(32) 	NOT NULL 		UNIQUE,
description  	VARCHAR(512) 	NOT NULL
);

DROP TABLE IF EXISTS diet_plan;
CREATE TABLE diet_plan (
plan_id 		INT 			PRIMARY KEY 	AUTO_INCREMENT,
name			VARCHAR(32) 	NOT NULL 		UNIQUE,
descrption 		VARCHAR(512) 	NOT NULL
); 

DROP TABLE IF EXISTS health_plan;
CREATE TABLE health_plan (
plan_id 		INT 			PRIMARY KEY,
trainer_id 		INT 			UNIQUE,
email 			VARCHAR(100) 	NOT NULL 		UNIQUE,
workout_plan 	INT 			NOT NULL,
diet_plan 		INT,
FOREIGN KEY (trainer_id) REFERENCES trainers (staff_id) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (email) REFERENCES users (email) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (workout_plan) REFERENCES workout_plan (plan_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (diet_plan) REFERENCES diet_plan (plan_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS food_items;
CREATE TABLE food_items (
item_id 			INT 			PRIMARY KEY 	AUTO_INCREMENT,
name 				VARCHAR(32)		NOT NULL,
calories			INT  			NOT NULL,
is_gluten_free		BOOLEAN 		NOT NULL,
is_vegan			BOOLEAN 		NOT NULL,
image_url 			VARCHAR(200)
);
