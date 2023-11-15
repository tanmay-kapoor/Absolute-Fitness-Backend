use absolute_fitness2;

-- staff id canot be modified unless foreign key ref to staff is dropped
ALTER TABLE gym_admins
DROP FOREIGN KEY gym_admins_ibfk_1;

-- change datatype to varchar. (since we want email now and not int value as staff_id)
ALTER TABLE gym_admins
MODIFY COLUMN staff_id VARCHAR(30);

-- references staff again after changing data type
ALTER TABLE gym_admins
ADD CONSTRAINT gym_admins_ibfk_1
FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE;

-- do same stuff for trainers
ALTER TABLE trainers
DROP FOREIGN KEY trainers_ibfk_1;

ALTER TABLE trainers
MODIFY COLUMN staff_id VARCHAR(30);

ALTER TABLE trainers
ADD CONSTRAINT trainers_ibfk_1
FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE;

-- trainer_id references trainers but we need to change data type and then link again
ALTER TABLE health_plans
DROP FOREIGN KEY health_plans_ibfk_1;

ALTER TABLE health_plans
MODIFY COLUMN trainer_id VARCHAR(30);

ALTER TABLE health_plans
ADD CONSTRAINT health_plans_ibfk_1
FOREIGN KEY (trainer_id) REFERENCES trainers (staff_id) ON UPDATE CASCADE ON DELETE CASCADE;

-- staff_id is now email and not INT
ALTER TABLE staff
MODIFY COLUMN staff_id VARCHAR(30);

-- getRandoomTrainer willr return email of a trainer and not INT id
DROP FUNCTION IF EXISTS getRandomTrainer;
DELIMITER //
CREATE FUNCTION getRandomTrainer(v_gym INT)
RETURNS VARCHAR(30) READS SQL DATA
BEGIN
	DECLARE random_trainer INT;
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


-- creating a table that contains all members and staff
DROP TABLE IF EXISTS all_users;
CREATE TABLE all_users (
username 	VARCHAR(30)					PRIMARY KEY,
name 		VARCHAR(50) 				NOT NULL,
phone 		VARCHAR(10) 				NOT NULL	 		UNIQUE,
type		ENUM("member", "staff")		NOT NULL,
gym_id		INT 						NOT NULL,		
password	VARCHAR(100)				NOT NULL,
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO all_users (username, name, phone, type, gym_id, password)
SELECT email, name, phone, "member", gym_id, password FROM users;

INSERT INTO all_users (username, name, phone, type, gym_id, password)
SELECT staff_id, name, phone, "staff", gym_id, password FROM staff;

-- not needed since i have deleted users table in some query after adding dob, sex to all_users table.
ALTER TABLE users
ADD FOREIGN KEY (email) REFERENCES all_users (username) ON UPDATE CASCADE ON DELETE CASCADE;

-- not needed
ALTER TABLE users
DROP COLUMN name,
DROP COLUMN phone,
DROP COLUMN gym_id,
DROP COLUMN password;

-- adding dob, sex columns to all_users table
ALTER TABLE all_users
add COLUMN sex ENUM("Male", "Female", "Other") DEFAULT "Male" AFTER phone,
ADD COLUMN dob DATE NOT NULL DEFAULT "1980-10-10" AFTER phone;

SET SQL_SAFE_UPDATES = 0;

-- assign random dob to all_users
UPDATE all_users
SET dob = DATE_ADD("1980-10-10", INTERVAL FLOOR(RAND()*365*10) DAY)
WHERE type = "staff";

-- assign random sex to all_users
UPDATE all_users
SET sex = 
	CASE FLOOR(RAND() * 3)
		WHEN 0 THEN "Male"
        WHEN 1 THEN "Female"
        WHEN 2 THEN "Other"
    END
WHERE type = "staff";

-- health_records references users removed (done so i can delete users table from database)
ALTER TABLE health_records
DROP CONSTRAINT health_records_ibfk_1;

-- health_records references all_users table.
ALTER TABLE health_records
ADD CONSTRAINT health_records_ibfk_1 
FOREIGN KEY (email) REFERENCES all_users (username) ON UPDATE CASCADE ON DELETE CASCADE;

-- health_plans references users removed
ALTER TABLE health_plans
DROP CONSTRAINT health_plans_ibfk_2;

-- health_plans references all_users table.
ALTER TABLE health_plans
ADD CONSTRAINT health_plans_ibfk_2
FOREIGN KEY (email) REFERENCES all_users (username) ON UPDATE CASCADE ON DELETE CASCADE;

-- this table is not needed anymore since all_users table has all te required details.
DROP TABLE IF EXISTS users;


-- staff references all_users
ALTER TABLE staff
ADD FOREIGN KEY (staff_id) REFERENCES all_users (username) ON UPDATE CASCADE ON DELETE CASCADE;

-- add @gmail.com for all staff ids
UPDATE all_users
SET username = CONCAT(username, "@gmail.com")
WHERE type = "staff";

-- drop gym foreign key reference so that column can be dropped
ALTER TABLE staff
DROP CONSTRAINT staff_ibfk_1;

-- all these columns are now in all_users;
ALTER TABLE staff
DROP COLUMN gym_id,
DROP COLUMN name,
DROP COLUMN phone,
DROP COLUMN password;


DROP PROCEDURE IF EXISTS getHealthPlanForUser;
DELIMITER //
CREATE PROCEDURE getHealthPlanForUser(IN v_email VARCHAR(30))
BEGIN 
	SELECT u.username as email, u.name, h.description as health_plan_description,
			t.staff_id as trainer_id, t.image_url as trainer_url,
			u.name as trainer_name, u.phone as trainer_phone, 
			w.plan_id as workout_plan_id, w.name as workout_plan_name, 
			w.description as workout_description, w.excercise_1, w.excercise_2, w.excercise_3, 
			d.plan_id as diet_plan_id, d.name as diet_name, d.description as diet_description, 
			d.breakfast, d.lunch, d.dinner FROM 
	(((all_users u LEFT JOIN health_plans h 
	ON h.email = u.username) 
	LEFT JOIN trainers t 
	ON h.trainer_id = t.staff_id) 
	LEFT JOIN workout_plans w  
	ON h.workout_plan = w.plan_id) 
	LEFT JOIN diet_plans d 
	ON h.diet_plan = d.plan_id 
	HAVING email = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllUserHealthRecordsForTrainer;
DELIMITER //
CREATE PROCEDURE getAllUserHealthRecordsForTrainer(IN v_trainer_id INT)
BEGIN
	SELECT h.trainer_id, r.* FROM 
	health_plans h JOIN all_users u 
	ON h.email = u.username 
	JOIN health_records r 
	ON u.username = r.email 
	HAVING h.trainer_id = 19994
	ORDER BY r.date_calculated ASC;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllHealthRecordsWithName;
DELIMITER //
CREATE PROCEDURE getAllHealthRecordsWithName()
BEGIN
	SELECT * FROM 
    health_records h LEFT JOIN all_users u 
    ON h.email = u.username;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS resetPassword;
DELIMITER //
CREATE PROCEDURE resetPassword(IN v_email VARCHAR(30), IN v_password VARCHAR(100))
BEGIN
	UPDATE all_users SET password = v_password 
    WHERE username = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getUser;
DELIMITER //
CREATE PROCEDURE getUser(IN v_email VARCHAR(30))
BEGIN
	SELECT * FROM all_users WHERE username = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addUser;
DELIMITER //
CREATE PROCEDURE addUser(IN v_email VARCHAR(30), in v_name VARCHAR(50), 
							IN v_phone VARCHAR(10), IN v_dob DATE, 
                            IN v_sex ENUM("Male", "Female", "Other"), 
                            IN v_gym_id INT, IN v_password VARCHAR(100))
BEGIN
	INSERT INTO all_users (username, name, phone, type, dob, sex, gym_id, password) 
    VALUES (v_email, v_name, v_phone, "member", v_dob, v_sex, v_gym_id, v_password);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateUser;
DELIMITER //
CREATE PROCEDURE updateUser(IN v_name VARCHAR(50), IN v_phone VARCHAR(10), 
							IN v_dob DATE, IN v_sex ENUM ("Male", "Female", "Other"), 
                            IN v_gym_id INT, IN v_password VARCHAR(100),
                            IN v_email VARCHAR(30))
BEGIN
	UPDATE all_users SET 
    name = v_name, phone = v_phone, dob = v_dob, sex = v_sex, gym_id = v_gym_id, password = v_password
    WHERE username = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteUser;
DELIMITER //
CREATE PROCEDURE deleteUser(IN v_email VARCHAR(30))
BEGIN
	DELETE FROM all_users WHERE username = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllUsersForGym;
DELIMITER //
CREATE PROCEDURE getAllUsersForGym(IN v_gym_id INT)
BEGIN
	SELECT * FROM all_users WHERE gym_id = v_gym_id;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS randomly_assign_health_plan;
DELIMITER //
CREATE TRIGGER randomly_assign_health_plan
AFTER INSERT ON all_users FOR EACH ROW
BEGIN
	SELECT getRandomTrainer(NEW.gym_id) INTO @trainer;
    SELECT getRandomWorkoutPlan() INTO @workout_plan;
	SELECT getRandomDietPlan() INTO @diet_plan;
    
	INSERT INTO health_plans (trainer_id, email, workout_plan, diet_plan, description) 
    VALUES (@trainer, NEW.username, @workout_plan, @diet_plan, "Randomly assigned plan");
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAlTrainersForGym;
DELIMITER //
CREATE PROCEDURE getAlTrainersForGym(IN v_gym_id INT)
BEGIN
	SELECT name, speciality, s.staff_id, years_of_exp, t.image_url, description, u.gym_id FROM 
	staff s JOIN all_users u 
	ON s.staff_id = u.username
	JOIN trainers t 
	ON s.staff_id = t.staff_id
	HAVING u.gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addStaff;
DELIMITER //
CREATE PROCEDURE addStaff(IN v_staff_id INT, 
						  IN v_name VARCHAR(50), 
                          IN v_phone VARCHAR(10), 
                          IN v_dob DATE,
                          IN v_sex ENUM("Male", "Female", "Other"),
                          IN v_part_time BOOLEAN, 
                          IN v_salary DECIMAL(65, 2), 
                          IN v_description VARCHAR(512), 
                          IN v_password VARCHAR(100), 
                          IN v_gym_id INT)
BEGIN
	INSERT INTO all_users (username, name, phone, dob, sex, type, gym_id, password)
    VALUES (v_staff_id, v_name, v_phone, v_dob, v_sex, "");
    
	INSERT INTO staff (staff_id,  part_time, salary, description, password, gym_id) 
    VALUES (v_staff_id, v_name, v_phone, v_part_time, v_salary, v_description, v_password, v_gym_id);
END //
DELIMITER ;



