use af3;

DROP TABLE IF EXISTS tokens;
CREATE TABLE tokens (
	token		VARCHAR(512)	PRIMARY KEY,
	username	VARCHAR(30)		NOT NULL
);

DROP PROCEDURE IF EXISTS addResetToken;
DELIMITER //
CREATE PROCEDURE addResetToken(IN v_token VARCHAR(512), 
							   IN v_username VARCHAR(30))
BEGIN
	INSERT INTO tokens VALUES (v_token, v_username);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getResetToken;
DELIMITER //
CREATE PROCEDURE getResetToken(IN v_token VARCHAR(512))
BEGIN
	SELECT * FROM tokens WHERE token = v_token;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteOldResetTokens;
DELIMITER //
CREATE PROCEDURE deleteOldResetTokens(IN v_username VARCHAR(30))
BEGIN
	DELETE FROM tokens WHERE username = v_username;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS resetPassword;
DELIMITER //
CREATE PROCEDURE resetPassword(IN v_username VARCHAR(30), 
							   IN v_password VARCHAR(100), 
							   IN v_type ENUM("member", "staff", "trainer", "admin", "root"))
BEGIN
    IF v_type = "member" THEN
		UPDATE users SET password = v_password 
		WHERE email = v_username;
    ELSEIF v_type in ("admin", "root") THEN
		UPDATE staff SET password = v_password 
		WHERE staff_id = v_username;
    END IF;
END //
DELIMITER ;

alter table staff
add column type enum("staff", "trainer", "admin") not null default "staff" after phone,
add column sex enum("Male", "Female", "Other") not null default "Male" after phone,
add column dob date not null default "1985-10-10" after phone;

-- alter table staff
-- drop column type,
-- drop column dob,
-- drop column sex;

update staff
set type = "trainer" 
where staff_id in (select staff_id from trainers);

update staff
set type = "admin" 
where staff_id in (select staff_id from gym_admins);

-- select * from staff;
-- insert into staff values ("1@2.com", "fname sname", 0987654321, "1994-12-12", "Male", "staff", False, 25000.46, "desc", "$2a$10$1CK4fQdkK7WlpHZeRAVgtuXSGRJCSE4SkzCrKKz6DdMwdu0xXHVxu", 1);




alter table gym_admins
drop constraint gym_admins_ibfk_1;

alter table gym_admins
modify column staff_id varchar(30) not null;

alter table trainers
drop constraint trainers_ibfk_1;

alter table health_plans 
drop constraint health_plans_ibfk_1;

alter table health_plans 
modify column trainer_id varchar(30);

alter table trainers
modify column staff_id varchar(30) not null;

alter table health_plans 
add constraint health_plans_ibfk_1
foreign key (trainer_id) references trainers (staff_id) on update cascade on delete set null;

alter table staff
modify column staff_id varchar(30);

alter table gym_admins
add constraint gym_admins_ibfk_1
foreign key (staff_id) references staff (staff_id) on update cascade on delete cascade;

alter table trainers
add constraint trainers_ibfk_1
foreign key (staff_id) references staff (staff_id) on update cascade on delete cascade;



-- change all procedures that use staff_id as int and redefine with varchar

DROP PROCEDURE IF EXISTS getTrainer;
DELIMITER //
CREATE PROCEDURE getTrainer(IN v_staff_id varchar(30))
BEGIN 
	SELECT * FROM trainers WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllAdmins;
DELIMITER //
CREATE PROCEDURE getAllAdmins()
BEGIN
	SELECT * FROM staff WHERE type = "admin";
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAdmin;
DELIMITER //
CREATE PROCEDURE getAdmin (IN v_staff_id VARCHAR(30))
BEGIN 
	SELECT * FROM staff 
    WHERE staff_id = v_staff_id AND type = "admin";
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllAdminsForGym;
DELIMITER //
CREATE PROCEDURE getAllAdminsForGym (IN v_gym_id INT)
BEGIN 
	SELECT * FROM staff 
    WHERE type = "admin" AND gym_id = v_gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS createNewAdminForGym;
DELIMITER //
CREATE PROCEDURE createNewAdminForGym(IN v_staff_id VARCHAR(30),
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
	CALL addStaff(v_staff_id, v_name, v_phone, v_dob, v_sex, "admin", v_part_time, v_salary, v_description, v_password, v_gym_id);
	INSERT INTO gym_admins VALUES (v_staff_id, v_gym_id);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS promoteStaffToAdmin;
DELIMITER //
CREATE PROCEDURE promoteStaffToAdmin(IN v_staff_id VARCHAR(30))
BEGIN
	DECLARE v_gym_id INT;
    
	UPDATE staff SET type = "admin" WHERE staff_id = v_staff_id;
    
    SELECT gym_id INTO v_gym_id WHERE
    staff_id = v_staff_id;
    
	INSERT INTO gym_admins VALUES (v_staff_id, v_gym_id);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllUserHealthRecordsForTrainer;
DELIMITER //
CREATE PROCEDURE getAllUserHealthRecordsForTrainer(IN v_trainer_id VARCHAR(30))
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

DROP PROCEDURE IF EXISTS getStaff;
DELIMITER //
CREATE PROCEDURE getStaff(IN v_staff_id VARCHAR(30)) 
BEGIN
	SELECT * FROM staff WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addStaff;
DELIMITER //
CREATE PROCEDURE addStaff(IN v_staff_id VARCHAR(30),
						  IN v_name VARCHAR(50), 
                          IN v_phone VARCHAR(10), 
                          IN v_dob DATE,
                          IN v_sex ENUM("Male", "Female", "Other"),
                          IN v_type ENUM("staff", "trainer", "admin"),
                          IN v_part_time BOOLEAN, 
                          IN v_salary DECIMAL(65, 2), 
                          IN v_description VARCHAR(512), 
                          IN v_password VARCHAR(100), 
                          IN v_gym_id INT)
BEGIN
	INSERT INTO staff (staff_id, name, phone, sex, type, part_time, salary, description, password, gym_id) 
    VALUES (v_staff_id, v_name, v_phone, v_sex, v_type, v_part_time, v_salary, v_description, v_password, v_gym_id);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateStaff;
DELIMITER //
CREATE PROCEDURE updateStaff(IN v_name VARCHAR(50), 
						     IN v_phone VARCHAR(10), 
                             IN v_dob DATE,
                             IN v_sex ENUM("Male", "Female", "Other"),
                             IN v_type ENUM("staff", "trainer", "admin", "root"),
						     IN v_part_time BOOLEAN, 
						     IN v_salary DECIMAL(65, 2), 
						     IN v_description VARCHAR(512), 
						     IN v_password VARCHAR(100),
                             IN v_staff_id VARCHAR(30))
BEGIN
	UPDATE staff SET 
		name = v_name, phone = v_phone, 
        dob = v_dob, sex = v_sex, type = v_type,
        part_time = v_part_time, 
        salary = v_salary, 
        description = v_description, 
        password = v_password 
	WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteStaff;
DELIMITER //
CREATE PROCEDURE deleteStaff(IN v_staff_id VARCHAR(30))
BEGIN
	DELETE FROM staff WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS getRandomTrainer;
DELIMITER //
CREATE FUNCTION getRandomTrainer(v_gym INT)
RETURNS VARCHAR(30) READS SQL DATA
BEGIN
	DECLARE random_trainer VARCHAR(30);
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

set sql_safe_updates = 0;

update staff
set staff_id = concat(staff_id, "@gmail.com");

DROP PROCEDURE IF EXISTS getEntryForLogin;
DELIMITER //
CREATE PROCEDURE getEntryForLogin(IN v_username VARCHAR(30))
BEGIN
	with entries as (
		select email as username, name, phone, dob, sex, "member" as type, subscribed, password, gym_id from users
		union
		select staff_id as username, name, phone, dob, sex, type, false as subscribed, password, gym_id from staff
	)
	select * from entries where username = v_username;
END //
DELIMITER ;


-- change gyms table and add new table for gym_image_urls (1 gym can have many photos now)
DROP TABLE IF EXISTS gym_image_urls;
CREATE TABLE gym_image_urls (
image_url 		VARCHAR(200)	NOT NULL,
gym_id 			INT 			NOT NULL,
PRIMARY KEY (image_url, gym_id),
FOREIGN KEY (gym_id) REFERENCES gyms (gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO gym_image_urls (
	SELECT image_url, gym_id from gyms
);

ALTER TABLE gyms
DROP COLUMN image_url;

DROP PROCEDURE IF EXISTS getAllGyms;
DELIMITER //
CREATE PROCEDURE getAllGyms()
BEGIN
	SELECT g.*, u.image_url FROM 
    gyms g LEFT JOIN gym_image_urls u
    ON g.gym_id = u.gym_id
    WHERE g.gym_id != 0;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getGym;
DELIMITER //
CREATE PROCEDURE getGym(IN v_gym_id INT)
BEGIN
	SELECT g.*, u.image_url FROM 
    gyms g LEFT JOIN gym_image_urls u
    ON g.gym_id = u.gym_id
    WHERE g.gym_id = v_gym_id;
END //
DELIMITER ;


-- add trainer option
DROP PROCEDURE IF EXISTS addTrainer;
DELIMITER //
CREATE PROCEDURE addTrainer (IN v_staff_id VARCHAR(30),
							 IN v_name VARCHAR(50), 
							 IN v_phone VARCHAR(10), 
							 IN v_dob DATE,
							 IN v_sex ENUM("Male", "Female", "Other"),
							 IN v_part_time BOOLEAN, 
							 IN v_salary DECIMAL(65, 2), 
							 IN v_description VARCHAR(512), 
							 IN v_password VARCHAR(100), 
							 IN v_gym_id INT, -- staff fields till here
							 IN v_image_url VARCHAR(200),
							 IN v_years_of_exp INT,
							 IN v_speciality VARCHAR(30))
BEGIN
	CALL addStaff(v_staff_id, v_name, v_phone, v_dob, v_sex, "trainer", v_part_time, v_salary, v_description, "not needed", v_gym_id);
    INSERT INTO trainers VALUES (v_staff_id, v_image_url, v_years_of_exp, v_speciality);
END //
DELIMITER ;

select * from trainers;

DROP PROCEDURE IF EXISTS updateTrainer;
DELIMITER //
CREATE PROCEDURE updateTrainer(IN v_staff_id VARCHAR(30),
							   IN v_name VARCHAR(50), 
                               IN v_phone VARCHAR(10), 
                               IN v_dob DATE,
                               IN v_sex ENUM("Male", "Female", "Other"),
                               IN v_part_time BOOLEAN, 
                               IN v_salary DECIMAL(65, 2), 
                               IN v_description VARCHAR(512), 
                               IN v_password VARCHAR(100),  -- staff fields till here
                               IN v_image_url VARCHAR(200),
                               IN v_years_of_exp INT,
                               IN v_speciality VARCHAR(30))
BEGIN
	CALL updateStaff(v_name, v_phone, v_dob, v_sex, "trainer", v_part_time, v_salary, v_description, "not needed", v_staff_id);
    
    UPDATE trainers
    SET image_url = v_image_url, years_of_exp = v_years_of_exp, speciality = v_speciality
    WHERE staff_id = v_staff_id;
END //
DELIMITER ;

-- add equipment in equipment table
DROP FUNCTION IF EXISTS addEquipment;
DELIMITER //
CREATE FUNCTION addEquipment(v_name VARCHAR(20), 
								 v_image_url VARCHAR(512))
RETURNS INT READS SQL DATA 
BEGIN
	INSERT INTO equipments (name, image_url) VALUES (v_name, v_image_url);
    RETURN LAST_INSERT_ID();
END //
DELIMITER ;

-- add new equipment and gym realtion
DROP PROCEDURE IF EXISTS addEquipmentForGym;
DELIMITER //
CREATE PROCEDURE addEquipmentForGym(IN v_gym_id INT,
									INOUT v_equipment_id INT,
                                    IN v_name VARCHAR(20),
                                    IN v_image_url VARCHAR(512),
                                    IN v_quantity INT,
                                    IN v_last_serviced DATE)
BEGIN
	IF v_equipment_id IS NULL THEN 
		CALL addEquipment(v_name, v_image_url, v_equipment_id);
    END IF;
    
    INSERT INTO gym_equipments VALUES (v_gym_id, v_equipment_id, v_quantity, v_last_serviced);
    
	SELECT e.*, g.gym_id, g.quantity, g.last_serviced FROM 
    equipments e JOIN gym_equipments g
    ON e.equipment_id = g.equipment_id
    WHERE e.equipment_id = v_equipment_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteEquipmentForGym;
DELIMITER //
CREATE PROCEDURE deleteEquipmentForGym(IN v_gym_id INT,
									   IN v_equipment_id INT)
BEGIN
	DELETE FROM gym_equipments 
    WHERE gym_id = v_gym_id AND equipment_id = v_equipment_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getAllEquipments;
DELIMITER //
CREATE PROCEDURE getAllEquipments()
BEGIN
	SELECT * FROM equipments;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getEquipment;
DELIMITER //
CREATE PROCEDURE getEquipment(IN v_equipment_id INT)
BEGIN
	SELECT * FROM equipments WHERE equipment_id = v_equipment_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateEquipment;
DELIMITER //
CREATE PROCEDURE updateEquipment(IN v_equipment_id INT, 
								 IN v_name VARCHAR(20), 
                                 IN v_image_url VARCHAR(512))
BEGIN
	UPDATE equipments
    SET name = v_name, image_url = v_image_url
    WHERE equipment_id = v_equipment_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteEquipment;
DELIMITER //
CREATE PROCEDURE deleteEquipment(IN v_equipment_id INT)
BEGIN
	DELETE FROM equipments WHERE equipment = v_equipment_id;
END //
DELIMITER ;

alter table staff
modify column type enum ("staff", "trainer", "admin", "root");

insert into staff values ("root@absolutefitness.com", "Toto Wolff", 6176732882, "1972-01-12", "Male", "root", 0, 1500000, "Root user. Can add new gyms, staff and assign admins.", "$2a$10$MKaHMW71SBA5bOWoVqVGq.bGC7by3abRw44g7FCzTXCjhmKmNCuia", 0);

alter table gyms
add column branch varchar(50) not null default("jp") after gym_id;

alter table gyms
modify column branch varchar(50);

alter table gyms
add column pincode varchar(5) not null default "00000" after branch;

alter table gyms
modify column location varchar(512) not null unique;

-- DROP FUNCTION IF EXISTS addGym;
-- DELIMITER //
-- CREATE FUNCTION addGym(v_branch VARCHAR(50), 
-- 						   v_pincode VARCHAR(5),
--                            v_phone VARCHAR(10), 
--                            v_location VARCHAR(50), 
--                            v_membership_fee DECIMAL(65, 2))
-- RETURNS INT READS SQL DATA 
-- BEGIN
-- 	INSERT INTO gyms (branch, pincode, phone, location, membership_fee) 
--     VALUES (v_branch, v_pincode, v_phone, v_location, v_membership_fee);
--     
--     RETURN LAST_INSERT_ID();
-- END //
-- DELIMITER ;

DROP PROCEDURE IF EXISTS addGym;
DELIMITER //
CREATE PROCEDURE addGym(in v_branch VARCHAR(50), 
						   in v_pincode VARCHAR(5),
                           in v_phone VARCHAR(10), 
                           in v_location VARCHAR(50), 
                           in v_membership_fee DECIMAL(65, 2),
                           
                           in v_staff_id VARCHAR(30),
                           in v_name VARCHAR(50), 
                           in v_admin_phone VARCHAR(10), 
                           in v_dob DATE,
                           in v_sex ENUM("Male", "Female", "Other"),
                           in v_type ENUM("staff", "trainer", "admin"),
                           in v_part_time BOOLEAN, 
                           in v_salary DECIMAL(65, 2), 
                           in v_description VARCHAR(512), 
                           in v_password VARCHAR(100))
BEGIN
	DECLARE error_code INT;
	DECLARE error_message VARCHAR(16383);
    declare tp varchar(200);
    declare new_gym_id int;
    
	DECLARE exit handler for sqlexception
    BEGIN
        -- If an error occurs, roll back the transaction
        GET DIAGNOSTICS CONDITION 1
			error_code = MYSQL_ERRNO, error_message = MESSAGE_TEXT;
		
        select substring(error_message, 1, 100) into tp;
        
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = tp;
    END;
    
    SET AUTOCOMMIT = 0;
    
    START TRANSACTION;
    
	INSERT INTO gyms (branch, pincode, phone, location, membership_fee) 
    VALUES (v_branch, v_pincode, v_phone, v_location, v_membership_fee);
    
    SELECT LAST_INSERT_ID() INTO new_gym_id;
    
    INSERT INTO staff (staff_id, name, phone, sex, type, part_time, salary, description, password, gym_id) 
    VALUES (v_staff_id, v_name, v_admin_phone, v_sex, v_type, v_part_time, v_salary, v_description, v_password, new_gym_id);
    
    INSERT INTO gym_admins VALUES (v_staff_id, new_gym_id);
    
    COMMIT;
    
    SELECT new_gym_id AS gym_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addImageUrlForGym;
DELIMITER //
CREATE PROCEDURE addImageUrlForGym(IN v_image_url VARCHAR(200), 
								   IN v_gym_id INT)
BEGIN
	INSERT INTO gym_image_urls VALUES (v_image_url, v_gym_id);
END //
DELIMITER ;

DROP VIEW IF EXISTS user_health_plan_details;
CREATE VIEW user_health_plan_details AS
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
ON h.diet_plan = d.plan_id;

DROP VIEW IF EXISTS diet_plan_details;
CREATE VIEW diet_plan_details AS
SELECT h.email, d.*, 
		m1.calories as m1_calories, m1.image_url as m1_url, 
		m2.calories as m2_calories, m2.image_url as m2_url, 
		m3.calories as m3_calories, m3.image_url as m3_url FROM 
health_plans h LEFT JOIN diet_plans d 
ON h.diet_plan = d.plan_id
LEFT JOIN meal_choices m1 ON d.breakfast = m1.meal 
LEFT JOIN meal_choices m2 ON d.lunch = m2.meal 
LEFT JOIN meal_choices m3 ON d.dinner = m3.meal;


ALTER TABLE users
ADD COLUMN subscribed BOOL NOT NULL DEFAULT False AFTER sex;

DROP PROCEDURE IF EXISTS promoteToPayingCustomer;
DELIMITER //
CREATE PROCEDURE promoteToPayingCustomer(v_email VARCHAR(30))
BEGIN
	UPDATE users SET subscribed = true WHERE email = v_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateGym;
DELIMITER //
CREATE PROCEDURE updateGym(in v_branch VARCHAR(50), 
						   in v_pincode VARCHAR(5),
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
