use af3;

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

select email as username, name, phone, dob, sex, "member" as type, password, gym_id from users
union
select staff_id as username, name, phone, dob, sex, type, password, gym_id from staff;

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
                          IN sex ENUM("Male", "Female", "Other"),
                          IN type ENUM("staff", "trainer", "admin"),
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
                             IN v_staff_id VARCHAR(30))
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









