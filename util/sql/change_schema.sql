use af3;

DROP TABLE IF EXISTS tokens;
CREATE TABLE tokens (
token		VARCHAR(36)										PRIMARY KEY,
username	VARCHAR(30)										NOT NULL,
type		ENUM("member", "staff", "trainer", "admin")		NOT NULL,
expiry 		DATETIME 										NOT NULL
);

DROP PROCEDURE IF EXISTS addResetToken;
DELIMITER //
CREATE PROCEDURE addResetToken(IN v_token VARCHAR(36), 
							   IN v_username VARCHAR(30), 
                               IN v_type ENUM("member", "staff", "trainer", "admin"),
                               IN v_exp_date DATETIME)
BEGIN
	INSERT INTO tokens VALUES (v_token, v_username, v_type, v_exp_date);
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
CREATE PROCEDURE resetPassword(IN v_username VARCHAR(30), IN v_password VARCHAR(100))
BEGIN
	DECLARE v_type ENUM("member", "staff", "trainer", "admin");
	
    SELECT type into v_type from tokens
    WHERE username = v_username;
    
    IF v_type = "member" THEN
		UPDATE users SET password = v_password 
		WHERE email = v_username;
    ELSEIF v_type = "admin" THEN
		UPDATE staff SET password = v_password 
		WHERE staff_id = v_username;
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getTokenExpiry;
DELIMITER //
CREATE PROCEDURE getTokenExpiry(IN v_token VARCHAR(36), IN v_username VARCHAR(30))
BEGIN
	SELECT expiry from tokens 
    WHERE token = v_token AND username = v_username;
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

DROP PROCEDURE IF EXISTS getAdmin;
DELIMITER //
CREATE PROCEDURE getAdmin (IN v_staff_id VARCHAR(30))
BEGIN 
	SELECT * FROM 
    staff s JOIN gym_admins a
	ON s.staff_id = a.staff_id
    HAVING a.staff_id = v_staff_id;
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
                             IN v_type ENUM("staff", "trainer", "admin"),
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
		select email as username, name, phone, dob, sex, "member" as type, password, gym_id from users
		union
		select staff_id as username, name, phone, dob, sex, type, password, gym_id from staff
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
	SELECT * FROM 
    gyms g JOIN gym_image_urls u
    ON g.gym_id = u.gym_id;
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
DROP PROCEDURE IF EXISTS addEquipment;
DELIMITER //
CREATE PROCEDURE addEquipment(IN v_name VARCHAR(20),
							  IN v_image_url VARCHAR(512),
                              OUT equipment_id INT)
BEGIN	
    INSERT INTO equipments (name, image_url) VALUES (v_name, v_image_url);
    SELECT LAST_INSERT_ID() INTO equipment_id;
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
