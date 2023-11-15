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

DROP TABLE IF EXISTS facilities;
CREATE TABLE facilities (
facility_id		INT 			PRIMARY KEY 	AUTO_INCREMENT,
name 			VARCHAR(20) 	UNIQUE			NOT NULL,
image_url		VARCHAR(200)	NOT NULL,
opening_time 	VARCHAR(20) 	NOT NULL,
closing_time    VARCHAR(20) 	NOT NULL
);

DROP TABLE IF EXISTS gym_facilities;
CREATE TABLE gym_facilities (
gym_id INT NOT NULL,
facility_id INT NOT NULL,
PRIMARY KEY (gym_id, facility_id),
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (facility_id) REFERENCES facilities(facility_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS equipments;
CREATE TABLE equipments (
equipment_id 	INT 			PRIMARY KEY 	AUTO_INCREMENT,
name 			VARCHAR(20) 	UNIQUE 			NOT NULL,
image_url 		VARCHAR(512)	NOT NULL
);

DROP TABLE IF EXISTS gym_equipments;
CREATE TABLE gym_equipments (
gym_id				INT 	NOT NULL,
equipment_id		INT 	NOT NULL,
quantity			INT 	NOT NULL		CHECK(quantity > 0),
last_serviced		DATE,
PRIMARY KEY (gym_id, equipment_id),
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (equipment_id) REFERENCES equipments(equipment_id) ON UPDATE CASCADE ON DELETE CASCADE
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

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
staff_id 	INT 			PRIMARY KEY, -- change done
name 		VARCHAR(50) 	NOT NULL,
phone 		VARCHAR(10) 	NOT NULL 		UNIQUE,
part_time 	BOOLEAN 		DEFAULT FALSE,
salary 		DECIMAL(65, 2) 	NOT NULL 		CHECK(salary>0),
description VARCHAR(512) 	NOT NULL,
password 	VARCHAR(100)	NOT NULL,
gym_id 		INT 			NOT NULL,
FOREIGN KEY (gym_id) REFERENCES gyms (gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS gym_admins;
CREATE TABLE gym_admins (
staff_id 	INT  	NOT NULL, -- change done 
gym_id 		INT 	NOT NULL,
PRIMARY KEY (staff_id, gym_id),
FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS trainers;
CREATE TABLE trainers (
staff_id  		INT 			PRIMARY KEY, -- change done
image_url 		VARCHAR(200) 	NOT NULL,
years_of_exp	INT 			NOT NULL 	CHECK (years_of_exp >= 0),
speciality		VARCHAR(30)		NOT NULL,
FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE
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
reps			INT 			NOT NULL	CHECK (reps > 0),
sets			INT 			NOT NULL 	CHECK (sets > 0),
image_url		VARCHAR(200)	NOT NULL
);

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
trainer_id 		INT, -- change done
email 			VARCHAR(30) 	NOT NULL 		UNIQUE,
workout_plan 	INT,
diet_plan 		INT,
description		VARCHAR(512),
FOREIGN KEY (trainer_id) REFERENCES trainers (staff_id) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (email) REFERENCES users (email) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (workout_plan) REFERENCES workout_plans (plan_id) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (diet_plan) REFERENCES diet_plans (plan_id) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE IF EXISTS tokens;
CREATE TABLE tokens (
token	VARCHAR(36)		PRIMARY KEY,
email	VARCHAR(30)		NOT NULL,
expiry 	DATETIME 		NOT NULL
);

DROP PROCEDURE IF EXISTS addResetToken;
DELIMITER //
CREATE PROCEDURE addResetToken(IN v_token VARCHAR(36), 
							   IN v_email VARCHAR(30), 
                               IN v_exp_date DATETIME)
BEGIN
	INSERT INTO tokens VALUES (v_token, v_email, v_exp_date);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteOldResetTokens;
DELIMITER //
CREATE PROCEDURE deleteOldResetTokens(IN v_email VARCHAR(30))
BEGIN
	DELETE FROM tokens WHERE email = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS resetPassword;
DELIMITER //
CREATE PROCEDURE resetPassword(IN v_email VARCHAR(30), IN v_password VARCHAR(100))
BEGIN
	UPDATE users SET password = v_password 
    WHERE email = v_email;
END //
DELIMITER;

DROP PROCEDURE IF EXISTS getTokenExpiry;
DELIMITER //
CREATE PROCEDURE getTokenExpiry(IN v_token VARCHAR(36), IN v_email VARCHAR(30))
BEGIN
	SELECT expiry from tokens 
    WHERE token = v_token AND email = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllUsers;
DELIMITER //
CREATE PROCEDURE getAllUsers()
BEGIN
	SELECT * FROM users;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getUser;
DELIMITER //
CREATE PROCEDURE getUser(IN v_email VARCHAR(30))
BEGIN
	SELECT * FROM users WHERE email = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addUser;
DELIMITER //
CREATE PROCEDURE addUser(IN v_email VARCHAR(30), in v_name VARCHAR(50), 
							IN v_phone VARCHAR(10), IN v_dob DATE, 
                            IN v_sex ENUM("Male", "Female", "Other"), 
                            IN v_gym_id INT, IN v_password VARCHAR(100))
BEGIN
	INSERT INTO users (email, name, phone, dob, sex, gym_id, password) 
    VALUES (v_email, v_name, v_phone, v_dob, v_sex, v_gym_id, v_password);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateUser;
DELIMITER //
CREATE PROCEDURE updateUser(IN v_name VARCHAR(50), IN v_phone VARCHAR(10), 
							IN v_dob DATE, IN v_sex ENUM ("Male", "Female", "Other"), 
                            IN v_gym_id INT, IN v_password VARCHAR(100),
                            IN v_email VARCHAR(30))
BEGIN
	UPDATE users SET 
    name = v_name, phone = v_phone, dob = v_dob, sex = v_sex, gym_id = v_gym_id, password = v_password
    WHERE email = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteUser;
DELIMITER //
CREATE PROCEDURE deleteUser(IN v_email VARCHAR(30))
BEGIN
	DELETE FROM users WHERE email = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllUsersForGym;
DELIMITER //
CREATE PROCEDURE getAllUsersForGym(IN v_gym_id INT)
BEGIN
	SELECT * FROM users WHERE gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllStaffForGym;
DELIMITER //
CREATE PROCEDURE getAllStaffForGym(IN v_gym_id INT)
BEGIN
	SELECT * FROM staff WHERE gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllGyms;
DELIMITER //
CREATE PROCEDURE getAllGyms()
BEGIN
	SELECT * FROM gyms;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getTrainer;
DELIMITER //
CREATE PROCEDURE getTrainer(IN v_staff_id INT) -- change done
BEGIN 
	SELECT * FROM trainers WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAlTrainersForGym;
DELIMITER //
CREATE PROCEDURE getAlTrainersForGym(IN v_gym_id INT)
BEGIN
	SELECT name, speciality, s.staff_id, years_of_exp, t.image_url, description, g.gym_id FROM 
	(staff s JOIN trainers t 
	ON s.staff_id = t.staff_id)
	JOIN gyms g 
	ON s.gym_id = g.gym_id 
	HAVING g.gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getGym;
DELIMITER //
CREATE PROCEDURE getGym(IN v_gym_id INT)
BEGIN
	SELECT * FROM gyms WHERE gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addGym;
DELIMITER //
CREATE PROCEDURE addGym(IN v_image_url VARCHAR(200), 
						IN v_phone VARCHAR(10), 
                        IN v_location VARCHAR(50), 
                        IN v_membership_fee DECIMAL(65, 2))
BEGIN
	INSERT INTO gyms (image_url, phone, location, membership_fee) 
    VALUES (v_image_url, v_phone, v_location, v_membership_fee);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateGym;
DELIMITER //
CREATE PROCEDURE updateGym(IN v_image_url VARCHAR(200), 
						IN v_phone VARCHAR(10), 
                        IN v_location VARCHAR(50), 
                        IN v_membership_fee DECIMAL(65, 2),
                        IN v_gym_id INT)
BEGIN
	UPDATE gyms SET 
    image_url = v_image_url, phone = v_phone, location = v_location, membership_fee = v_membership_fee 
    WHERE gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteGym;
DELIMITER //
CREATE PROCEDURE deleteGym (IN v_gym_id INT)
BEGIN 
	DELETE FROM gyms WHERE gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAdmin;
DELIMITER //
CREATE PROCEDURE getAdmin (IN v_staff_id INT) -- change done
BEGIN 
	SELECT * FROM 
    staff s JOIN gym_admins a
	ON s.staff_id = a.staff_id
    HAVING a.staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllFacilitiesForGym;
DELIMITER //
CREATE PROCEDURE getAllFacilitiesForGym (IN v_gym_id INT)
BEGIN 
    SELECT f.*, g.gym_id FROM 
	facilities f LEFT JOIN gym_facilities g 
	ON f.facility_id = g.facility_id 
	HAVING g.gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllEquipmentsForGym;
DELIMITER //
CREATE PROCEDURE getAllEquipmentsForGym (IN v_gym_id INT)
BEGIN 
    SELECT e.*, g.gym_id, g.quantity, g.last_serviced FROM equipments e LEFT JOIN gym_equipments g
    ON e.equipment_id = g.equipment_id
    HAVING g.gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateEquipmentForGym;
DELIMITER //
CREATE PROCEDURE updateEquipmentForGym(IN v_gym_id INT, 
									   IN v_equipment_id INT, 
                                       IN v_quantity INT, 
                                       IN v_last_serviced DATE)
BEGIN
	UPDATE gym_equipments SET
    quantity = v_quantity, last_serviced = v_last_serviced
    WHERE gym_id = v_gym_id AND equipment_id = v_equipment_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllHealthRecords;
DELIMITER //
CREATE PROCEDURE getAllHealthRecords()
BEGIN
	SELECT * FROM health_records;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllHealthRecordsWithName;
DELIMITER //
CREATE PROCEDURE getAllHealthRecordsWithName()
BEGIN
	SELECT * FROM 
    health_records h LEFT JOIN users u 
    ON h.email = u.email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getHealthRecord;
DELIMITER //
CREATE PROCEDURE getHealthRecord(IN v_record_id INT)
BEGIN
	SELECT * FROM health_records WHERE record_id = v_record_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addHealthRecord;
DELIMITER //
CREATE PROCEDURE addHealthRecord(IN v_height DECIMAL(65, 2), 
								 IN v_weight DECIMAL(65,2), 
                                 IN v_date_calculated DATE, 
                                 IN v_bmi DECIMAL(65, 2), 
                                 IN v_email VARCHAR(30))
BEGIN
	INSERT INTO health_records (height, weight, date_calculated, bmi, email) 
    VALUES (v_height, v_weight, v_date_calculated, v_bmi, v_email);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateHealthRecord;
DELIMITER //
CREATE PROCEDURE updateHealthRecord(IN v_height DECIMAL(65, 2), 
								 IN v_weight DECIMAL(65,2), 
                                 IN v_date_calculated DATE, 
                                 IN v_bmi DECIMAL(65, 2), 
                                 IN v_email VARCHAR(30),
                                 IN v_record_id INT)
BEGIN 
	UPDATE health_records SET 
		height = v_height, weight = v_weight, 
		date_calculated = v_date_calculated, 
		bmi = v_bmi, email = v_email 
    WHERE record_id = v_record_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteHealthRecord;
DELIMITER //
CREATE PROCEDURE deleteHealthRecord(IN v_record_id INT)
BEGIN 
	DELETE FROM health_records WHERE record_id = v_record_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getHealthRecordsForUser;
DELIMITER //
CREATE PROCEDURE getHealthRecordsForUser(IN v_email VARCHAR(30))
BEGIN 
	SELECT * FROM health_records WHERE email = v_email ORDER BY date_calculated ASC;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getHealthPlanForUser;
DELIMITER //
CREATE PROCEDURE getHealthPlanForUser(IN v_email VARCHAR(30))
BEGIN 
	SELECT u.email, u.name, h.description as health_plan_description,
			t.staff_id as trainer_id, t.image_url as trainer_url,
			s.name as trainer_name, s.phone as trainer_phone, 
			w.plan_id as workout_plan_id, w.name as workout_plan_name, 
			w.description as workout_description, w.excercise_1, w.excercise_2, w.excercise_3, 
			d.plan_id as diet_plan_id, d.name as diet_name, d.description as diet_description, 
			d.breakfast, d.lunch, d.dinner FROM 
	((((users u LEFT JOIN health_plans h 
	ON h.email = u.email) 
	LEFT JOIN trainers t 
	ON h.trainer_id = t.staff_id) 
	LEFT JOIN staff s 
	ON t.staff_id = s.staff_id)
	LEFT JOIN workout_plans w  
	ON h.workout_plan = w.plan_id) 
	LEFT JOIN diet_plans d 
	ON h.diet_plan = d.plan_id 
	HAVING email = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllDietPlans;
DELIMITER //
CREATE PROCEDURE getAllDietPlans()
BEGIN 
	SELECT d.*, m1.calories as breakfast_calories, m1.image_url as breakfast_url,
			m2.calories as lunch_calories, m2.image_url as lunch_url, 
			m3.calories as dinner_calories, m3.image_url as dinner_url FROM
	((diet_plans d LEFT JOIN meal_choices m1 
    on d.breakfast = m1.meal) 
	LEFT JOIN meal_choices m2 ON d.lunch = m2.meal) 
	LEFT JOIN meal_choices m3 ON d.dinner = m3.meal;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS addDietPlan;
DELIMITER //
CREATE PROCEDURE addDietPlan(IN v_name VARCHAR(32), 
							 IN v_description VARCHAR(512), 
                             IN v_breakfast VARCHAR(100), 
                             IN v_lunch VARCHAR(100), 
                             IN v_dinner VARCHAR(100))
BEGIN 
	INSERT INTO diet_plans (name, description, breakfast, lunch, dinner) 
    VALUES (v_name, v_description, v_breakfast, v_lunch, v_dinner);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateDietPlan;
DELIMITER //
CREATE PROCEDURE updateDietPlan(IN v_name VARCHAR(32), 
							 IN v_description VARCHAR(512), 
                             IN v_breakfast VARCHAR(100), 
                             IN v_lunch VARCHAR(100), 
                             IN v_dinner VARCHAR(100),
                             IN v_plan_id INT)
BEGIN 
	UPDATE diet_plans SET
	name = v_name, description = v_description, breakfast = v_breakfast, lunch = v_lunch, dinner = v_dinner
	WHERE plan_id = v_plan_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteDietPlan;
DELIMITER //
CREATE PROCEDURE deleteDietPlan(IN v_plan_id INT)
BEGIN
	DELETE FROM diet_plans WHERE plan_id = v_plan_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getDietPlanForUser;
DELIMITER //
CREATE PROCEDURE getDietPlanForUser (IN v_email VARCHAR(30))
BEGIN 
	SELECT h.email, d.*, 
			m1.calories as m1_calories, m1.image_url as m1_url, 
			m2.calories as m2_calories, m2.image_url as m2_url, 
			m3.calories as m3_calories, m3.image_url as m3_url FROM 
	health_plans h LEFT JOIN diet_plans d 
	ON h.diet_plan = d.plan_id
	LEFT JOIN meal_choices m1 ON d.breakfast = m1.meal 
	LEFT JOIN meal_choices m2 ON d.lunch = m2.meal 
	LEFT JOIN meal_choices m3 ON d.dinner = m3.meal 
	HAVING h.email = v_email;
END // 
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllTrainersForGym;
DELIMITER //
CREATE PROCEDURE getAllTrainersForGym(IN v_gym_id INT) 
BEGIN
	SELECT name, speciality, s.staff_id, years_of_exp, t.image_url, description, g.gym_id FROM
	(staff s JOIN trainers t 
	ON s.staff_id = t.staff_id) 
	JOIN gyms g 
	ON s.gym_id = g.gym_id 
	HAVING g.gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllUserHealthRecordsForTrainer;
DELIMITER //
CREATE PROCEDURE getAllUserHealthRecordsForTrainer(IN v_trainer_id INT) -- change done
BEGIN
	SELECT h.trainer_id, r.* FROM 
	health_plans h JOIN users u 
	ON h.email = u.email 
	JOIN health_records r 
	ON u.email = r.email 
	HAVING h.trainer_id = v_trainer_id 
	ORDER BY r.date_calculated ASC;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllStaff;
DELIMITER //
CREATE PROCEDURE getAllStaff()
BEGIN
	SELECT * FROM staff;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getStaff;
DELIMITER //
CREATE PROCEDURE getStaff(IN v_staff_id INT) -- change done
BEGIN
	SELECT * FROM staff WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addStaff; -- change
DELIMITER //
CREATE PROCEDURE addStaff(IN v_staff_id INT, -- change done
						  IN v_name VARCHAR(50), 
                          IN v_phone VARCHAR(10), 
                          IN v_part_time BOOLEAN, 
                          IN v_salary DECIMAL(65, 2), 
                          IN v_description VARCHAR(512), 
                          IN v_password VARCHAR(100), 
                          IN v_gym_id INT)
BEGIN
	INSERT INTO staff (staff_id, name, phone, part_time, salary, description, password, gym_id) 
    VALUES (v_staff_id, v_name, v_phone, v_part_time, v_salary, v_description, v_password, v_gym_id);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateStaff;
DELIMITER //
CREATE PROCEDURE updateStaff(IN v_name VARCHAR(50), 
						     IN v_phone VARCHAR(10), 
						     IN v_part_time BOOLEAN, 
						     IN v_salary DECIMAL(65, 2), 
						     IN v_description VARCHAR(512), 
						     IN v_password VARCHAR(100),
                             IN v_staff_id INT) -- change done
BEGIN
	UPDATE staff SET 
		name = v_name, phone = v_phone, 
        part_time = v_part_time, 
        salary = v_salary, 
        description = v_description, 
        password = v_password 
	WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteStaff;
DELIMITER //
CREATE PROCEDURE deleteStaff(IN v_staff_id INT) -- change done
BEGIN
	DELETE FROM staff WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllWorkoutPlans;
DELIMITER //
CREATE PROCEDURE getAllWorkoutPlans()
BEGIN
	SELECT w.*, e1.image_url as e1_url, e1.sets as e1_sets, e1.reps as e1_reps, 
		   e2.image_url as e2_url, e2.sets as e2_sets, e2.reps as e2_reps, 
		   e3.image_url as e3_url, e3.sets as e3_sets, e3.reps as e3_reps FROM 
	((workout_plans w LEFT JOIN excercises e1 
	ON w.excercise_1 = e1.name) 
	LEFT JOIN excercises e2 
	ON w.excercise_2 = e2.name) 
	LEFT JOIN excercises e3 
	ON w.excercise_3 = e3.name;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addWorkoutPlan;
DELIMITER //
CREATE PROCEDURE addWorkoutPlan(IN v_name VARCHAR(32), 
								IN v_description VARCHAR(512), 
                                IN v_excercise_1 VARCHAR(32), 
                                IN v_excercise_2 VARCHAR(32), 
                                IN v_excercise_3 VARCHAR(32))
BEGIN
	INSERT INTO workout_plans (name, description, excercise_1, excercise_2, excercise_3) 
    VALUES (v_name, v_description, v_excercise_1, v_excercise_2, v_excercise_2);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateWorkoutPlan;
DELIMITER //
CREATE PROCEDURE updateWorkoutPlan (IN v_name VARCHAR(32), 
									IN v_description VARCHAR(512), 
									IN v_excercise_1 VARCHAR(32),
                                    IN v_excercise_2 VARCHAR(32),
                                    IN v_excercise_3 VARCHAR(32))
BEGIN
	UPDATE workout_plans SET 
		name = v_name, description = v_description, 
        excercise_1 = v_excercise_1, excercise_2 = v_excercise_2, excercise_3 = v_excercise_3
	WHERE plan_id = v_plan_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteWorkoutPlan;
DELIMITER //
CREATE PROCEDURE deleteWorkoutPlan(IN v_plan_id INT)
BEGIN
	DELETE FROM workout_plans WHERE plan_id = v_plan_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getWorkoutPlanForUser;
DELIMITER //
CREATE PROCEDURE getWorkoutPlanForUser(IN v_email VARCHAR(30))
BEGIN 
	SELECT h.email, w.*,
		   e1.sets as e1_sets, e1.reps as e1_reps, e1.image_url as e1_url, 
		   e2.sets as e2_sets, e2.reps as e2_reps, e2.image_url as e2_url, 
		   e3.sets as e3_sets, e3.reps as e3_reps, e3.image_url as e3_url FROM 
	health_plans h LEFT JOIN workout_plans w ON 
	h.workout_plan = w.plan_id 
	LEFT JOIN excercises e1 ON w.excercise_1 = e1.name 
	LEFT JOIN excercises e2 ON w.excercise_2 = e2.name 
	LEFT JOIN excercises e3 ON w.excercise_3 = e3.name 
	HAVING h.email = v_email;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS getRandomTrainer;
DELIMITER //
CREATE FUNCTION getRandomTrainer(v_gym INT)
RETURNS INT READS SQL DATA -- change done
BEGIN
	DECLARE random_trainer INT; -- change done
    DECLARE temp INT;
    
	SELECT s.gym_id, t.staff_id INTO temp, random_trainer FROM 
    trainers t JOIN staff s
    ON t.staff_id = s.staff_id
    HAVING s.gym_id = v_gym
    ORDER BY RAND()
    LIMIT 1;
    
    RETURN random_trainer;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS getRandomWorkoutPlan;
DELIMITER //
CREATE FUNCTION getRandomWorkoutPlan()
RETURNS INT READS SQL DATA
BEGIN
	DECLARE random_workout INT;
    
	SELECT plan_id INTO random_workout FROM workout_plans
    ORDER BY RAND()
    LIMIT 1;
    
    RETURN random_workout;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS getRandomDietPlan;
DELIMITER //
CREATE FUNCTION getRandomDietPlan()
RETURNS INT READS SQL DATA
BEGIN
	DECLARE random_diet INT;
    
	SELECT plan_id INTO random_diet FROM diet_plans
    ORDER BY RAND()
    LIMIT 1;
    
    RETURN random_diet;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS randomly_assign_health_plan;
DELIMITER //
CREATE TRIGGER randomly_assign_health_plan
AFTER INSERT ON users FOR EACH ROW
BEGIN
	SELECT getRandomTrainer(NEW.gym_id) INTO @trainer;
    SELECT getRandomWorkoutPlan() INTO @workout_plan;
	SELECT getRandomDietPlan() INTO @diet_plan;
    
	INSERT INTO health_plans (trainer_id, email, workout_plan, diet_plan, description) 
    VALUES (@trainer, NEW.email, @workout_plan, @diet_plan, "Randomly assigned plan");
END //
DELIMITER ;

DROP TRIGGER IF EXISTS admin_delete_check;
DELIMITER //
CREATE TRIGGER admin_delete_check
BEFORE DELETE ON staff FOR EACH ROW
BEGIN
	IF OLD.staff_id IN (SELECT staff_id FROM gym_admins) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Cannot delete an admin" ;
    END IF;
END //
DELIMITER ;
