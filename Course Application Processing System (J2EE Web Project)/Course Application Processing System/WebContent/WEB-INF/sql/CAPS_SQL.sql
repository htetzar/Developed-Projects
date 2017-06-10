DROP schema IF EXISTS `caps`;

CREATE SCHEMA `caps` ;

CREATE TABLE `caps`.`login` (
  `userId` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userId`));
  
  CREATE TABLE `caps`.`lecturer` (
  `lecturerId` VARCHAR(50) NOT NULL,
  `lecturerName` VARCHAR(45) NOT NULL,
  `lecturerEmail` VARCHAR(45) NULL,
  `lecturerPhoneNumber` VARCHAR(45) NULL,
  `lecturerAddress` VARCHAR(150) NULL,
  `joiningDate` DATETIME NULL,
  PRIMARY KEY (`lecturerId`));
  
  CREATE TABLE `caps`.`course` (
  `courseId` VARCHAR(50) NOT NULL,
  `lecturerId` VARCHAR(50) NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  `courseDescription` VARCHAR(250) NULL,
  `courseDuration` DOUBLE NULL,
  `courseType` VARCHAR(45) NULL,
  `courseStartDate` DATE NULL,
  `courseSize` INT NULL,
  `courseCredit` FLOAT NULL,
  `createdDate` DATETIME NULL,
  PRIMARY KEY (`courseId`),
  INDEX `lecturerId_idx` (`lecturerId` ASC),
  CONSTRAINT `lecturerId`
    FOREIGN KEY (`lecturerId`)
    REFERENCES `caps`.`lecturer` (`lecturerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE `caps`.`student` (
  `studentId` VARCHAR(50) NOT NULL,
  `studentName` VARCHAR(45) NOT NULL,
  `studentEmail` VARCHAR(45) NULL,
  `studentPhoneNumber` VARCHAR(45) NULL,
  `studentAddress` VARCHAR(150) NULL,
  `enrollmentDate` DATETIME NULL,
  PRIMARY KEY (`studentId`));
  
  CREATE TABLE `caps`.`enrollment` (
  `studentId` VARCHAR(50) NOT NULL,
  `courseId` VARCHAR(50) NOT NULL,
  `courseStartDate` DATE NULL,
  `courseEnrollmentDate` DATE NULL,
  `grade` FLOAT NULL,
  PRIMARY KEY (`studentId`, `courseId`),
  INDEX `courseId_idx` (`courseId` ASC),
  CONSTRAINT `studentId`
    FOREIGN KEY (`studentId`)
    REFERENCES `caps`.`student` (`studentId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `courseId`
    FOREIGN KEY (`courseId`)
    REFERENCES `caps`.`course` (`courseId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

USE caps;
/*
-- Query: SELECT * FROM caps.student
LIMIT 0, 1000

-- Date: 2016-12-06 01:14
*/
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s001','saTeamTenDemo','sa43team10@gmail.com','23652363','3217 Versante Drive','2016-01-01 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s002','Kassie Ardaly','sa43team10@gmail.com','34637457','6287 Renwood Dr','2016-01-02 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s003','Bettie Laper','sa43team10@gmail.com','25467547','P. O. Box 501','2016-01-03 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s004','Nichole Mosty','sa43team10@gmail.com','79765845','9109 Dove Ct','2016-01-04 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s005','Tami Vanert','TamiVanert@gmail.com','25437375','1004 Steeplewood Dr','2016-01-05 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s006','Ora Purtle ','OraPurtle@gmail.com','69785656','740 Bedford Ct','2016-01-09 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s007','Lee Fillo','LeeFillo@gmail.com','53475447','4601 Deville Dr','2016-01-11 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s008','Merlin Prok ','MerlinProk@gmail.com','98708676','637 Sandy Trail','2016-01-12 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s009','Vincent Lofton ','VincentLofton@gmail.com','95246754','427 Crestview Drive','2016-01-13 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s010','Oma Bannett ','Oma Bannett@gmail.com','34786865','712 Admiralty Way','2016-01-14 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s011','Grover Evitt','GroverEvitt@gmail.com','24675467','3809 Shawnee Tr','2016-01-15 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s012','Kitty Blomstrand','KittyBlomstrand@gmail.com','67975656','9848 Private Rd','2016-01-16 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s013','Cristopher Yakel','CristopherYakel@gmail.com','85433637','1201 Forum Way South','2016-01-17 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s014','Amy Smith','AmySmith@gmail.com','75685843','145 Highview Dr','2016-01-18 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s015','Victor Johnson','VictorJohnson@gmail.com','37848856','1120 Oakbend Lane','2016-01-19 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s016','Francis Mollett','FrancisMollett@gmail.com','45645688','1409 Lamplighter Lane','2016-01-20 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s017','Forest Turpen ','ForestTurpen@gmail.com','64895647','7820 Sheridan Rd','2016-01-21 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s018','Christal Gali','ChristalGali@gmail.com','76585699','6430 Stream Side Court','2016-01-22 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s019','Malinda Shelley ','sa43team10@gmail.com','67658658','717 Vickie Drive','2016-01-23 1:10:00');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrollmentDate`) VALUES ('s020','Jimmy Stoppel','sa43team10@gmail.com','79568522','6201 Whitman Ave','2016-02-01 1:10:00');

/*
-- Query: SELECT * FROM caps.lecturer
LIMIT 0, 1000

-- Date: 2016-12-06 01:10
*/
INSERT INTO `lecturer` (`lecturerId`,`lecturerName`,`lecturerEmail`,`lecturerPhoneNumber`,`lecturerAddress`,`joiningDate`) VALUES ('l001','Barry Easton','BarryEaston@gmail.com','78976075','524 Pecan Street','2016-01-01 1:10:00');
INSERT INTO `lecturer` (`lecturerId`,`lecturerName`,`lecturerEmail`,`lecturerPhoneNumber`,`lecturerAddress`,`joiningDate`) VALUES ('l002','Cassidy Poucher','CassidyPoucher@gmail.com','23675454','1246 Everett Avenue','2016-01-02 1:10:00');
INSERT INTO `lecturer` (`lecturerId`,`lecturerName`,`lecturerEmail`,`lecturerPhoneNumber`,`lecturerAddress`,`joiningDate`) VALUES ('l003','Maxwell Stillman','MaxwellStillman@gmail.com','97695575','7105 Plover Circle','2016-01-03 1:10:00');
INSERT INTO `lecturer` (`lecturerId`,`lecturerName`,`lecturerEmail`,`lecturerPhoneNumber`,`lecturerAddress`,`joiningDate`) VALUES ('l004','Clint Holom','ClintHolom@gmail.com','56856724','1022 Bridges Dr','2016-01-04 1:10:00');

/*
-- Query: SELECT * FROM caps.course
LIMIT 0, 1000

-- Date: 2016-12-05 17:04
*/
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c001','l004','Theatre Studies','study of theatrical performance in relation to its literary, physical, psycho-biological, sociological, and historical contexts',24,'Arts','2016-03-01',10,6,'2016-01-01 1:10:00');
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c002','l001','Architecture','principles of design and construction and ornamentation of fine buildings',32,'Arts','2016-04-01',10,8,'2016-01-02 1:10:00');
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c003','l001','Economics','production and distribution and consumption of goods and services and their management',10,'Economy','2016-11-01',10,8,'2016-02-01 1:10:00');
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c004','l001','Finance','management of money and credit and banking and investments',10,'Economy','2016-11-11',10,10,'2016-03-01 1:10:00');
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c005','l002','Philosophy','rational investigation of questions about existence and knowledge and ethics',10,'Philosophy','2016-12-12',10,6,'2016-04-01 1:10:00');
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c006','l004','Statistics','collection and interpretation of quantitative data and the use of probability theory to estimate population parameters',5,'Math','2016-12-14',10,4,'2016-05-01 1:10:00');
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c007','l001','Architectural Design', 'formulate architectural design ideas and development of aesthetics and 3D spatial awareness and appreciation',3,'Design','2016-12-20',10,4,'2016-06-01 1:10:00');
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c008','l001','Architectural Practice', 'concepts of professionalism and ethics, marketing and branding, time and work management, and contract administration procedures',3,'Design','2016-12-21',3,4,'2016-07-01 1:20:00');
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`,`createdDate`) VALUES ('c009','l001','Design Thinking', 'learn how to create materials that align technical and non-technical audiences and assess the effectiveness of your solutions.',2,'Design','2016-12-26',5,4,'2016-08-01 1:20:00');

/*
-- Query: SELECT * FROM caps.login
LIMIT 0, 1000

-- Date: 2016-12-05 17:07
*/
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('a001','a001','admin');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('a002','a002','admin');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('l001','l001','lecturer');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('l002','l002','lecturer');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('l003','l003','lecturer');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('l004','l004','lecturer');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s001','s001','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s002','s002','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s003','s003','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s004','s004','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s005','s005','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s006','s006','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s007','s007','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s008','s008','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s009','s009','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s010','s010','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s011','s011','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s012','s012','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s013','s013','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s014','s014','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s015','s015','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s016','s016','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s017','s017','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s018','s018','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s019','s019','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s020','s020','student');

/*
-- Query: SELECT * FROM caps.enrollment
LIMIT 0, 1000

-- Date: 2016-12-05 17:06
*/
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s001','c001','2016-03-01','2016-07-13',3.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s001','c002','2016-04-01','2016-07-13',2.5);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s001','c004','2016-11-11','2016-07-13',2.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s001','c005','2016-12-12','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s001','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s001','c007','2016-12-20','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s002','c003','2016-11-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s002','c004','2016-11-11','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s003','c005','2016-12-12','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s003','c008','2016-12-21','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s004','c001','2016-03-01','2016-07-13',4.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s004','c003','2016-11-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s004','c008','2016-12-21','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s005','c004','2016-11-11','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s005','c005','2016-12-12','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s006','c002','2016-04-01','2016-07-13',3.5);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s006','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s007','c001','2016-03-01','2016-07-13',3.5);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s007','c002','2016-04-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s007','c004','2016-11-11','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s007','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s008','c005','2016-12-12','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s008','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s008','c002','2016-04-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s009','c002','2016-04-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s009','c003','2016-11-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s010','c001','2016-03-01','2016-07-13',3.5);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s010','c005','2016-12-12','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s010','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s011','c002','2016-04-01','2016-07-13',2.5);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s011','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s012','c002','2016-04-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s012','c003','2016-11-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s012','c004','2016-11-11','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s013','c001','2016-08-01','2016-07-13',4.2);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s013','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s014','c002','2016-04-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s014','c003','2016-11-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s015','c004','2016-11-11','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s015','c005','2016-12-12','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s016','c002','2016-04-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s016','c004','2016-11-11','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s017','c001','2016-08-01','2016-07-13',3.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s017','c003','2016-11-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s018','c005','2016-12-12','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s018','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s019','c003','2016-11-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s019','c006','2016-12-14','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s020','c002','2016-04-01','2016-07-13',0.0);
INSERT INTO `enrollment` (`studentId`,`courseId`,`courseStartDate`,`courseenrollmentDate`,`grade`) VALUES ('s020','c005','2016-12-12','2016-07-13',0.0);