DROP DATABASE IF EXISTS absolute_fitness;
CREATE DATABASE absolute_fitness;
USE absolute_fitness;

DROP TABLE IF EXISTS gyms;
CREATE TABLE gyms (
gym_id 			INT 				PRIMARY KEY 	AUTO_INCREMENT,
phone 			VARCHAR(15) 		NOT NULL 	UNIQUE,
location 		VARCHAR(50) 		NOT NULL	UNIQUE,
membership_fee 	DECIMAL(10, 2) 		NOT NULL
);

DROP TABLE IF EXISTS health_records;
CREATE TABLE health_records (
record_id 			INT 			PRIMARY KEY 	AUTO_INCREMENT,
height 				DECIMAL(3, 2) 	NOT NULL,
weight 				DECIMAL(4, 2)	NOT NULL,
date_calculated 	DATE 			NOT NULL,
BMI 				DECIMAL(2,2) 	NOT NULL
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
location 		INT 			NOT NULL,
opening_time 	VARCHAR(20) 	NOT NULL,
closing_time    VARCHAR(20) 	NOT NULL,
FOREIGN KEY (location) REFERENCES gyms(gym_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS equipments;
CREATE TABLE equipments (
name 			VARCHAR(20) 	NOT NULL,
quantity		INT 			NOT NULL,
last_serviced 	DATE,
location 		INT 			NOT NULL,
PRIMARY KEY (name, location),
FOREIGN KEY (location) REFERENCES gyms(gym_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
staff_id 	INT 			PRIMARY KEY 	AUTO_INCREMENT,
name 		VARCHAR(50) 	NOT NULL,
phone 		VARCHAR(15) 	NOT NULL 		UNIQUE,
part_time 	BOOL 			DEFAULT FALSE,
salary 		DECIMAL(10, 2) 	NOT NULL 		CHECK(salary>0)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
email		VARCHAR(30) 	PRIMARY KEY,
name 		VARCHAR(50) 	NOT NULL,
age 		INT 			NOT NULL 			CHECK(age>0),
sex 		ENUM("Male", "Female", "Unknown") 	NOT NULL,
password	VARCHAR(100) 	NOT NULL,
gym_id 		INT 			NOT NULL,
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON DELETE CASCADE
);