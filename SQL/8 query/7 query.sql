-- Create a database schema for student grade system. It contains student data and their grade of each subject based on the different semester.

CREATE DATABASE studentGradeSystem;

USE studentGradeSystem;

CREATE TABLE course 
(
	course_id 		INT		 		NOT NULL 	AUTO_INCREMENT,
	course_name 	VARCHAR(16) 	NOT NULL,
	description 	VARCHAR(64) 	NOT NULL,
	PRIMARY KEY (course_id)
);


CREATE TABLE schoolYear 
(
	school_year_id 	INT     		NOT NULL 	AUTO_INCREMENT,
	school_year		VARCHAR(8) 	    NOT NULL,
	semester 		VARCHAR(8) 		NOT NULL,
	PRIMARY KEY (school_year_id)
);


CREATE TABLE student 
(
	student_id 				INT     		NOT NULL 	AUTO_INCREMENT,
	student_no 				VARCHAR(16) 	NOT NULL,
	student_first_name 		VARCHAR(16) 	NOT NULL,
	student_middle_name 	VARCHAR(16) 	NOT NULL,
	student_last_name 		VARCHAR(16) 	NOT NULL,
	course_id				INT      		NOT NULL,
	username 				VARCHAR(16)		NOT NULL,
	password				VARCHAR(32) 	NOT NULL,
	created_at 				DATE 			NOT NULL,
	PRIMARY KEY (student_id),
	UNIQUE KEY (student_no),
	FOREIGN KEY (course_id) REFERENCES course (course_id)
);

CREATE TABLE subject 
(
	subject_id 		INT      		NOT NULL 	AUTO_INCREMENT,
	subject_code 	VARCHAR(16) 	NOT NULL,
	subject_name 	VARCHAR(16) 	NOT NULL,
	school_year_id 	INT     		NOT NULL,
	PRIMARY KEY (subject_id),
	UNIQUE KEY (subject_code),
	UNIQUE KEY (subject_name),
	FOREIGN KEY (school_year_id) REFERENCES schoolYear (school_year_id)
);

CREATE TABLE studentSubject 
(
	student_subject_id 		INT 	NOT NULL 	AUTO_INCREMENT,
	student_id 				INT 	NOT NULL,
	subject_id 				INT 	NOT NULL,
	PRIMARY KEY (student_subject_id),
	FOREIGN KEY (student_id) REFERENCES student (student_id),
	FOREIGN KEY (subject_id) REFERENCES subject (subject_id)
);

CREATE TABLE studentGrade 
(
	student_grade_id 	INT		 	NOT NULL 	AUTO_INCREMENT,
	student_id 			INT		 	NOT NULL,
	subject_id 			INT			NOT NULL,
	course_id 			INT		 	NOT NULL,
	school_year_id 		INT		 	NOT NULL,
	prelim 				DOUBLE 		NOT NULL,
	midterm 			DOUBLE 		NOT NULL,
	final 				DOUBLE 		NOT NULL,
	final_grade			DOUBLE 		NOT NULL,
	PRIMARY KEY (student_grade_id),
	UNIQUE KEY  (student_id,subject_id),
	FOREIGN KEY (course_id) REFERENCES course (course_id),
	FOREIGN KEY (school_year_id) REFERENCES schoolYear (school_year_id),
	FOREIGN KEY (student_id) REFERENCES student (student_id),
	FOREIGN KEY (subject_id) REFERENCES subject (subject_id)
);

