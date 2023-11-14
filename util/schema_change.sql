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