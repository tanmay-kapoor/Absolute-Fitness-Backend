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

-- CALL addGym("https://bodyandstrength.com/Upload/site/wJSUa_cover.jpg", "2025550118", "55 Centre Avenue, #30, Austin, TX, 5634", 156.33);
-- CALL addGym("https://www.encorefitness.ru/upload/resize/a8/a8709705bb195a5d68f8c72b2b76537f_1024x2000.jpg", "2025550308", "65-45 Otto Rd, Queens, NY 11385", 253.99);
-- CALL addGym("https://cdn.abcotvs.com/dip/images/6193988_051820-wpvi-annie-nj-gyms-video-vid.jpg", "7097534584", "350 Tenth Ave, San Diego, CA 9210", 75);
-- CALL addGym("https://images.squarespace-cdn.com/content/v1/56e487181d07c0743d227289/1557248970918-530M1TO27B7Q41OEE985/fitness-4-1500x77.jpg?format=1500w", "8057779321", "2565 Washington St Suite B, Boston, MA 0211", 59.37);
-- CALL addGym("https://gymmboxx.com/wp-content/uploads/2020/02/WhatsApp-Image-2020-02-09-at-6.32.11-PM.jpeg", "6011185333", "515 S Figueroa St #102, Los Angeles, CA 90071", 195.46);
-- CALL addGym("https://cdn.vox-cdn.com/thumbor/2Bcpu3cwfzZJ2gUnhWaiyWFS0Mw=/0x0:8238x5492/1200x800/filters:focal(3460x2087:4778x3405)/cdn.vox-cdn.com/uploads/chorus_image/image/67606043/GettyImages_1132006407.0.jpg", "2025550250", "1146 Harrison St, Seattle WA 98109", 86.98);

DROP TABLE IF EXISTS facilities;
CREATE TABLE facilities (
facility_id		INT 			PRIMARY KEY 	AUTO_INCREMENT,
name 			VARCHAR(20) 	UNIQUE			NOT NULL,
image_url		VARCHAR(200)	NOT NULL,
opening_time 	VARCHAR(20) 	NOT NULL,
closing_time    VARCHAR(20) 	NOT NULL
);

-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Sauna", "https://media.istockphoto.com/id/517419408/photo/sauna.jpg?s=612x612&w=0&k=20&c=KR_zH8fEEVVJxHnwWpNFWffhXCITy3QEB1wSdJEtoqE=", "9 am", "8 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Cryotherapy", "https://performanceoptimalhealth.com/wp-content/uploads/cryotherapy-header.jpg", "9 am", "8 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Massage", "https://img.freepik.com/free-photo/attractive-african-woman-enjoying-face-massage-spa-salon_176420-13953.jpg?w=2000", "11 am", "7 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Badminton Court", "https://content.jdmagicbox.com/comp/chennai/p7/044pxx44.xx44.200929032721.f1p7/catalogue/kubera-sports-academy-indoor-badminton-court-ayyavoo-colony-chennai-badminton-courts-kt5g0ut01r.jpg?clr=204646", "6 am", "11 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Swimming Pool", "https://media.timeout.com/images/105489210/750/562/image.jpg", "5 am", "9 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Tennis Court", "https://mastersystemscourts.com/img/master-systems-courts-tennis-court-1-991x605l.jpg", "6 am", "11 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Basketball Court", "https://assets2.cbsnewsstatic.com/hub/i/r/2016/02/04/2e52ba67-a327-4291-b826-11a97f9a9ca7/thumbnail/640x360/76e04e5a75dfa57abd7dd7a5b900560f/hoopcambridgeathleticclub.jpg", "6 am", "10 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Squash", "https://asbsquash.com/modules/aktuality/galleries/14/125.jpg", "6 am", "11 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Yoga", "https://images.healthshots.com/healthshots/en/uploads/2021/12/18081913/bhujangasana.jpg", "5 am", "9 pm");
-- INSERT INTO facilities (name, image_url, opening_time, closing_time) VALUES ("Shower", "https://cimg0.ibsrv.net/cimg/www.fitday.com/693x350_85-1/400/showergym-207400.jpg", "5 am", "11 pm");

DROP TABLE IF EXISTS gym_facilities;
CREATE TABLE gym_facilities (
gym_id INT NOT NULL,
facility_id INT NOT NULL,
PRIMARY KEY (gym_id, facility_id),
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (facility_id) REFERENCES facilities(facility_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- INSERT INTO gym_facilities VALUES (1, 1);
-- INSERT INTO gym_facilities VALUES (1, 3);
-- INSERT INTO gym_facilities VALUES (1, 4);
-- INSERT INTO gym_facilities VALUES (1, 7);
-- INSERT INTO gym_facilities VALUES (1, 9);
-- INSERT INTO gym_facilities VALUES (2, 2);
-- INSERT INTO gym_facilities VALUES (2, 5);
-- INSERT INTO gym_facilities VALUES (2, 1);
-- INSERT INTO gym_facilities VALUES (2, 3); 
-- INSERT INTO gym_facilities VALUES (2, 6);
-- INSERT INTO gym_facilities VALUES (2, 10);
-- INSERT INTO gym_facilities VALUES (3, 5);
-- INSERT INTO gym_facilities VALUES (3, 10);
-- INSERT INTO gym_facilities VALUES (3, 2);
-- INSERT INTO gym_facilities VALUES (3, 7);
-- INSERT INTO gym_facilities VALUES (3, 4);
-- INSERT INTO gym_facilities VALUES (4, 3);
-- INSERT INTO gym_facilities VALUES (4, 4);
-- INSERT INTO gym_facilities VALUES (4, 1);
-- INSERT INTO gym_facilities VALUES (4, 6); 
-- INSERT INTO gym_facilities VALUES (5, 1);
-- INSERT INTO gym_facilities VALUES (5, 2);
-- INSERT INTO gym_facilities VALUES (5, 3);
-- INSERT INTO gym_facilities VALUES (5, 4);
-- INSERT INTO gym_facilities VALUES (5, 5);
-- INSERT INTO gym_facilities VALUES (5, 6);
-- INSERT INTO gym_facilities VALUES (5, 7); 
-- INSERT INTO gym_facilities VALUES (5, 8);
-- INSERT INTO gym_facilities VALUES (5, 9);
-- INSERT INTO gym_facilities VALUES (5, 10);
-- INSERT INTO gym_facilities VALUES (6, 2);
-- INSERT INTO gym_facilities VALUES (6, 5);
-- INSERT INTO gym_facilities VALUES (6, 1);
-- INSERT INTO gym_facilities VALUES (6, 8);

DROP TABLE IF EXISTS equipments;
CREATE TABLE equipments (
equipment_id 	INT 			PRIMARY KEY 	AUTO_INCREMENT,
name 			VARCHAR(20) 	UNIQUE 			NOT NULL,
image_url 		VARCHAR(512)	NOT NULL
);

-- INSERT INTO equipments (name, image_url) VALUES ("Chest Press Machine", "https://www.technogym.com/media/catalog/product/cache/1/image/040ec09b1e35df139433887a97daa66f/M/G/MG1500_purestrength_inclinechestpress_hero_01_22.jpg");
-- INSERT INTO equipments (name, image_url) VALUES ("Seated Dip Machine", "https://www.precor.com/sites/default/files/styles/product_image/public/ds_seateddip.png?itok=2ZLBsUsN");
-- INSERT INTO equipments (name, image_url) VALUES ("Treadmill", "https://cdn.shopify.com/s/files/1/2422/9487/products/1Stride_iPadFullproduct_600x.png?v=1657895735");
-- INSERT INTO equipments (name, image_url) VALUES ("Excercise Bike", "https://res.cloudinary.com/iconfitness/image/upload/dpr_3.0,f_auto,q_auto,w_500/v1/site--6/PFEX16718_1-01068.jpg");
-- INSERT INTO equipments (name, image_url) VALUES ("Dumbbells", "https://cdn.shopify.com/s/files/1/0471/3879/9774/products/210310_Dumbbells_2270x1500_d524e6c4-85b9-4244-abad-2e3e876e4a84_600x.jpg?v=1645084642");
-- INSERT INTO equipments (name, image_url) VALUES ("Barbell", "https://www.mensjournal.com/wp-content/uploads/mf/barbell_abs_main.jpg?w=1188&h=630&crop=1&quality=86&strip=all");
-- INSERT INTO equipments (name, image_url) VALUES ("Leg press machine", "https://truefitness.com/wp-content/uploads/2019/11/SPL0300-Acrylic-Alabaster_960-1.png");
-- INSERT INTO equipments (name, image_url) VALUES ("Pullup bar", "https://cdn.shopify.com/s/files/1/0471/3879/9774/products/XGYM-LSR-3.0-01-F07_main_1035x@2x.jpg?v=1669753609%202x");
-- INSERT INTO equipments (name, image_url) VALUES ("Kettle bells", "https://m.media-amazon.com/images/I/41luBUoSyFL._AC_SY1000_.jpg");
-- INSERT INTO equipments (name, image_url) VALUES ("Pec fly machine", "https://www.titan.fitness/dw/image/v2/BDBZ_PRD/on/demandware.static/-/Sites-masterCatalog_Titan/default/dw5058b97d/images/hi-res/Fitness/401494_01.jpg?sw=1001&sh=1000");

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

-- INSERT INTO gym_equipments VALUES (1, 1, 20, "2020-10-10");
-- INSERT INTO gym_equipments (gym_id, equipment_id, quantity) VALUES (1, 3, 15);
-- INSERT INTO gym_equipments VALUES (1, 5, 20, "2019-09-15");
-- INSERT INTO gym_equipments VALUES (1, 7, 20, "2021-11-11");
-- INSERT INTO gym_equipments (gym_id, equipment_id, quantity) VALUES (1, 9, 20);
-- INSERT INTO gym_equipments (gym_id, equipment_id, quantity) VALUES (2, 1, 10);
-- INSERT INTO gym_equipments VALUES (2, 2, 15, "2019-10-10");
-- INSERT INTO gym_equipments VALUES (2, 3, 18, "2015-01-01");
-- INSERT INTO gym_equipments VALUES (2, 4, 12, "2022-08-08");
-- INSERT INTO gym_equipments (gym_id, equipment_id, quantity) VALUES (2, 5, 38);
-- INSERT INTO gym_equipments VALUES (2, 6, 27, "2021-12-12");
-- INSERT INTO gym_equipments (gym_id, equipment_id, quantity) VALUES (2, 7, 14);
-- INSERT INTO gym_equipments (gym_id, equipment_id, quantity) VALUES (2, 8, 7);
-- INSERT INTO gym_equipments VALUES (2, 9, 29, "2010-01-01");
-- INSERT INTO gym_equipments VALUES (2, 10, 22, "2009-01-01");
-- INSERT INTO gym_equipments VALUES (3, 4, 4, "2010-10-10");
-- INSERT INTO gym_equipments VALUES (3, 2, 22, "2022-10-10");
-- INSERT INTO gym_equipments VALUES (3, 1, 10, "2022-10-10");
-- INSERT INTO gym_equipments (gym_id, equipment_id, quantity) VALUES (3, 9, 2);
-- INSERT INTO gym_equipments VALUES (3, 8, 14, "2021-10-10");
-- INSERT INTO gym_equipments VALUES (4, 7, 12, "2022-01-01");
-- INSERT INTO gym_equipments (gym_id, equipment_id, quantity) VALUES (4, 3, 10);
-- INSERT INTO gym_equipments VALUES (5, 2, 11, "2022-09-09");
-- INSERT INTO gym_equipments VALUES (5, 4, 10, "2022-11-11");
-- INSERT INTO gym_equipments VALUES (5, 5, 22, "2022-11-11");
-- INSERT INTO gym_equipments VALUES (6, 2, 34, "2022-09-09");
-- INSERT INTO gym_equipments VALUES (6, 7, 38, "2021-09-08");
-- INSERT INTO gym_equipments VALUES (6, 8, 8, "2020-10-10");
-- INSERT INTO gym_equipments VALUES (6, 9, 7, "2016-12-15");

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
staff_id 	INT 			PRIMARY KEY,
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
staff_id 	INT 	UNIQUE 		NOT NULL,
gym_id 		INT 	UNIQUE 		NOT NULL,
PRIMARY KEY (staff_id, gym_id),
FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (gym_id) REFERENCES gyms(gym_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- INSERT INTO gym_admins VALUES (11111, 1);
-- INSERT INTO gym_admins VALUES (22222, 2);
-- INSERT INTO gym_admins VALUES (33333, 3);
-- INSERT INTO gym_admins VALUES (44444, 4);
-- INSERT INTO gym_admins VALUES (55555, 5);
-- INSERT INTO gym_admins VALUES (66666, 6);

DROP TABLE IF EXISTS trainers;
CREATE TABLE trainers (
staff_id  		INT 			PRIMARY KEY,
image_url 		VARCHAR(200) 	NOT NULL,
years_of_exp	INT 			NOT NULL 	CHECK (years_of_exp >= 0),
speciality		VARCHAR(30)		NOT NULL,
FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- INSERT INTO trainers VALUES (19999, "https://images.unsplash.com/photo-1597452485669-2c7bb5fef90d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAyfHxneW0lMjB0cmFpbmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60", 3, "Calisthenics");
-- INSERT INTO trainers VALUES (19998, "https://images.unsplash.com/photo-1546817372-628669db4655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA3fHxneW0lMjB0cmFpbmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60", 1, "Flexibility");
-- INSERT INTO trainers VALUES (19997, "https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 10, "Calisthenics");
-- INSERT INTO trainers VALUES (19996, "https://images.unsplash.com/photo-1606889464198-fcb18894cf50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 22, "Weight loss");
-- INSERT INTO trainers VALUES (19995, "https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 12, "Muscle building");
-- INSERT INTO trainers VALUES (19994, "https://images.unsplash.com/photo-1639653818737-7e884dc84954?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTU5fHxneW0lMjB0cmFpbmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60", 2, "Muscle building");
-- INSERT INTO trainers VALUES (29999, "https://images.unsplash.com/photo-1532384748853-8f54a8f476e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 4, "Weight loss");
-- INSERT INTO trainers VALUES (29998, "https://images.unsplash.com/photo-1598267416824-5907946a3810?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 7, "Flexibility");
-- INSERT INTO trainers VALUES (29997, "https://images.unsplash.com/photo-1434596922112-19c563067271?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjB8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 11, "Calisthenics");
-- INSERT INTO trainers VALUES (29996, "https://images.unsplash.com/photo-1598575468023-85b93d887c3f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzh8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 1, "Flexibility");
-- INSERT INTO trainers VALUES (39999, "https://images.unsplash.com/photo-1579758629938-03607ccdbaba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 8, "Muscle building");
-- INSERT INTO trainers VALUES (39998, "https://images.unsplash.com/photo-1578971102567-916960872844?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 7, "Muscle building");
-- INSERT INTO trainers VALUES (39997, "https://images.unsplash.com/photo-1611672585731-fa10603fb9e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 11, "Weight loss");
-- INSERT INTO trainers VALUES (39996, "https://images.unsplash.com/photo-1601422407692-ec4eeec1d9b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 9, "Weight loss");
-- INSERT INTO trainers VALUES (39995, "https://images.unsplash.com/photo-1548690312-e3b507d8c110?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 2, "Calisthenics");
-- INSERT INTO trainers VALUES (39994, "https://images.unsplash.com/photo-1571731956672-f2b94d7dd0cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 5, "Flexibility");
-- INSERT INTO trainers VALUES (49999, "https://images.unsplash.com/photo-1597347324655-f99149f2e285?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", 3, "Muscle building");
-- INSERT INTO trainers VALUES (49998, "https://media.istockphoto.com/id/675179390/photo/muscular-trainer-writing-on-clipboard.jpg?s=612x612&w=0&k=20&c=9NKx1AwVMpPY0YBlk5H-hxx2vJSCu1Wc78BKRM9wFq0=", 9, "Weight loss");
-- INSERT INTO trainers VALUES (49997, "https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2019/03/How-Three-Personal-Trainers-Dress-for-the-Gym-Gear-Patrol-keith-v2.jpg?resize=480:*", 8, "Calisthenics");
-- INSERT INTO trainers VALUES (59999, "https://media.istockphoto.com/id/1324042769/photo/confident-gym-owner.jpg?b=1&s=170667a&w=0&k=20&c=iuz1kcCB1w8CBf44nub1mYr-F--88dLRjJvM-5uPahY=", 6, "Flexibility");
-- INSERT INTO trainers VALUES (69999, "https://images.unsplash.com/photo-1604480133080-602261a680df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3ltJTIwdHJhaW5lcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60", 25, "Weight loss");

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
reps			INT 			NOT NULL	CHECK (reps > 0),
sets			INT 			NOT NULL 	CHECK (sets > 0),
image_url		VARCHAR(200)	NOT NULL
);

INSERT INTO excercises VALUES ("Cable Fly", 5, 20, "https://s3.amazonaws.com/prod.skimble/assets/1531497/image_iphone.jpg");
INSERT INTO excercises VALUES ("Squats", 3, 15, "https://images.healthshots.com/healthshots/en/uploads/2021/09/06145503/shutterstock_1563301450.jpg");
INSERT INTO excercises VALUES ("Bench Press", 5, 40, "https://cdn.mos.cms.futurecdn.net/pLaRi5jXSHDKu6WRydetBo-1200-80.jpg");
INSERT INTO excercises VALUES ("Deadlift", 2, 30, "https://cdn.muscleandstrength.com/sites/default/files/deadlift_0.jpg");
INSERT INTO excercises VALUES ("Burpees", 10, 25, "https://www.muscleandfitness.com/wp-content/uploads/2017/04/burpee-1109.jpg?w=1200&h=630&crop=1&quality=86&strip=all");
INSERT INTO excercises VALUES ("Leg Press", 3, 20, "https://fitnessvolt.com/wp-content/uploads/2022/05/Leg-Press-Foot-Placements.jpg");

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

-- INSERT INTO workout_plans (name, description, excercise_1, excercise_2, excercise_3) VALUES ("Muscle gain", "Excercises that focus on increasing muscle strength", "Cable Fly", "Squats", "Deadlift");
-- INSERT INTO workout_plans (name, description, excercise_1, excercise_2, excercise_3) VALUES ("Flexibility increase", "Excercises that stretch muscle thereby increasing flexibility in the long run", "Squats", "Burpees", "Leg Press");
-- INSERT INTO workout_plans (name, description, excercise_1, excercise_2, excercise_3) VALUES ("Weight loss", "Do difficult excercises to burn excess fat in the body", "Bench Press", "Leg Press", "Burpees");

DROP TABLE IF EXISTS meal_choices;
CREATE TABLE meal_choices (
meal		VARCHAR(100)	PRIMARY KEY,
calories	INT 			NOT NULL		CHECK (calories > 0),
image_url	VARCHAR(200)	NOT NULL
);

-- INSERT INTO meal_choices VALUES ("Oats", 150, "https://post.healthline.com/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg");
-- INSERT INTO meal_choices VALUES ("Porridge", 95, "https://insanelygoodrecipes.com/wp-content/uploads/2022/04/Oatmeal-Porridge-with-Nuts-and-Blueberries-in-a-Blue-Bowl.jpg");
-- INSERT INTO meal_choices VALUES ("Chicken", 250, "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/healthy-chicken-recipes-1641586837.jpeg?crop=1.00xw:0.498xh;0,0.285xh&resize=1200:*");
-- INSERT INTO meal_choices VALUES ("Vegetable smoothie", 37, "https://thekitchencommunity.org/wp-content/uploads/2022/01/vegetable-smoothie.jpg");
-- INSERT INTO meal_choices VALUES ("Boiled Kidney Beans", 120, "https://myfavouritepastime.files.wordpress.com/2019/01/img_3330.jpg");
-- INSERT INTO meal_choices VALUES ("Boiled eggs", 98, "https://www.onceuponachef.com/images/2017/10/How-To-Make-Hard-Boiled-Eggs.jpg");
-- INSERT INTO meal_choices VALUES ("Red meat steak", 120, "https://i.insider.com/60ff1914f350d50019590549?width=1136&format=jpeg");

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

INSERT INTO diet_plans (name, description, breakfast, lunch, dinner) VALUES ("Weight loss", "Have smoothie and healthy foods to cleanse your body of the toxins and help boost weight reduction at the same time.", "Vegetable Smoothie", "Chicken", "Oats"); 
INSERT INTO diet_plans (name, description, breakfast, lunch, dinner) VALUES ("All purpose diet", "Plan that is designed to help in every aspect of the body's healing process", "Porridge", "Boiled Kidney Beans", "Chicken");
INSERT INTO diet_plans (name, description, breakfast, lunch, dinner) VALUES ("Carnivore diet", "Eat more of non vegetarian food to cure gut problems and increase protein intake", "Boiled eggs", "Red meat steak", "Chicken");
INSERT INTO diet_plans (name, description, breakfast, lunch, dinner) VALUES ("Protein increase", "Have food throghout the day that are rich in protein", "Vegetable smoothie", "Boiled eggs", "Chicken");

DROP TABLE IF EXISTS health_plans;
CREATE TABLE health_plans (
plan_id 		INT 			PRIMARY KEY		AUTO_INCREMENT,
trainer_id 		INT,
email 			VARCHAR(30) 	NOT NULL 		UNIQUE,
workout_plan 	INT,
diet_plan 		INT,
description		VARCHAR(512),
FOREIGN KEY (trainer_id) REFERENCES trainers (staff_id) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (email) REFERENCES users (email) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (workout_plan) REFERENCES workout_plans (plan_id) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (diet_plan) REFERENCES diet_plans (plan_id) ON UPDATE CASCADE ON DELETE SET NULL
);

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
CREATE PROCEDURE getTrainer(IN v_staff_id INT)
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
CREATE PROCEDURE getAdmin (IN v_staff_id INT)
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
	((((users u JOIN health_plans h 
	ON h.email = u.email) 
	JOIN trainers t 
	ON h.trainer_id = t.staff_id) 
	JOIN staff s 
	ON t.staff_id = s.staff_id)
	JOIN workout_plans w  
	ON h.workout_plan = w.plan_id) 
	JOIN diet_plans d 
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
CREATE PROCEDURE getAllUserHealthRecordsForTrainer(IN v_trainer_id INT)
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
CREATE PROCEDURE getStaff(IN v_staff_id INT)
BEGIN
	SELECT * FROM staff WHERE staff_id = v_staff_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS addStaff;
DELIMITER //
CREATE PROCEDURE addStaff(IN v_staff_id INT, 
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
                             IN v_staff_id INT)
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
CREATE PROCEDURE deleteStaff(IN v_staff_id INT)
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
	health_plans h JOIN workout_plans w ON 
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
RETURNS INT READS SQL DATA
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

select getRandomTrainer(1) into @idk;
select @idk;

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
