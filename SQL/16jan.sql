create database UserData;
use UserData;

CREATE TABLE user (
    ID bigint(20) primary key auto_increment, 
    firstName varchar (50),
    middleName varchar (50),
    lastName varchar (50),
    username varchar (50),
    mobile varchar (15),
    email varchar (50),
    passwordHash varchar (32),
    registeredAt datetime,
    lastLogin datetime,
    intro tinytext,
    profile text
);
desc user;
insert into user values(0,"Pragati","R","Sanepara","pragati_2510","7435822509","timpli@gamil.com","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","2022-01-01 12:12:12","2022-01-01 01:12:12","I am a engineer","Developer");

CREATE TABLE user_post (
	    ID bigint(20) primary key auto_increment, 
		userID bigint(20),
        message tinytext,
        createdAt datetime,
        updatedAt datetime,
        CONSTRAINT fk_user FOREIGN KEY (userID) REFERENCES user(ID)
);
DROP TABLE user_post;
desc user_post;
insert into user_post values(0,1,"good","2022-01-04 01:12:12","2022-01-05 01:12:12");

CREATE TABLE groupofuser (
		ID bigint(20) primary key auto_increment, 
		createdBy bigint(20) FOREIGN KEY REFERENCES user(ID),
        updatedBy bigint(20) FOREIGN KEY REFERENCES user(ID),
        title varchar(75),
        metaTitle varchar(100),
        slug varchar(100),
        summary tinytext,
        status smallint(6),
        createdAt datetime,
        updatedAt datetime,
        profile text,
        content text
);
