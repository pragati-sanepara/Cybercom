create database poll;

use poll;

select * from user;
CREATE TABLE user 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(50) NULL DEFAULT NULL,
  middleName VARCHAR(50) NULL DEFAULT NULL,
  lastName VARCHAR(50) NULL DEFAULT NULL,
  mobile VARCHAR(15) NULL,
  email VARCHAR(50) NULL,
  passwordHash VARCHAR(32) NOT NULL,
  host TINYINT(1) NOT NULL DEFAULT 0,
  registeredAt DATETIME NOT NULL,
  lastLogin DATETIME NULL DEFAULT NULL,
  intro TINYTEXT NULL DEFAULT NULL,
  profile TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX (mobile),
  UNIQUE INDEX (email) 
);
  INSERT INTO `poll`.`user` (`firstName`, `passwordHash`, `registeredAt`) VALUES ('pari', 'q', '2021-01-02 12:12:12');
INSERT INTO `poll`.`user` (`firstName`, `passwordHash`, `registeredAt`) VALUES ('happy', 'w', '2021-01-02 12:12:12');
INSERT INTO `poll`.`user` (`firstName`, `passwordHash`, `registeredAt`) VALUES ('ysh', 'e', '2021-01-02 12:12:12');
UPDATE `poll`.`user` SET `lastLogin` = '2022-01-24 12:12:12' WHERE (`id` = '1');
UPDATE `poll`.`user` SET `lastLogin` = '2021-01-02 12:12:12' WHERE (`id` = '2');
UPDATE `poll`.`user` SET `lastLogin` = '2021-01-02 12:12:12' WHERE (`id` = '3');
UPDATE `poll`.`user` SET `email` = 'ab@a.com' WHERE (`id` = '1');
UPDATE `poll`.`user` SET `email` = 'a@gmail.com' WHERE (`id` = '2');
UPDATE `poll`.`user` SET `email` = 'b@googlemail.com' WHERE (`id` = '3');
INSERT INTO `poll`.`user` (`id`, `firstName`, `email`, `passwordHash`, `registeredAt`) VALUES ('4', 'pragati', 'bb@outlook.com', 'w', '2021-01-02 12:12:12');

select * from poll;
  CREATE TABLE poll 
  (
  id BIGINT NOT NULL AUTO_INCREMENT,
  hostId BIGINT NOT NULL,
  title VARCHAR(75) NOT NULL,
  metaTitle VARCHAR(100) NULL,
  slug VARCHAR(100) NOT NULL,
  summary TINYTEXT NULL,
  type SMALLINT(6) NOT NULL DEFAULT 0,
  published TINYINT(1) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  publishedAt DATETIME NULL DEFAULT NULL,
  startsAt DATETIME NULL DEFAULT NULL,
  endsAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (hostId) REFERENCES user (id) ON DELETE CASCADE
);
    INSERT INTO `poll`.`poll` (`hostId`, `title`, `slug`, `createdAt`) VALUES ('1', 'a', 'd', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll` (`hostId`, `title`, `slug`, `createdAt`) VALUES ('2', 'b', 'w', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll` (`hostId`, `title`, `slug`, `createdAt`) VALUES ('3', 'c', 'q', '2021-01-02 12:12:12');
UPDATE `poll`.`poll` SET `publishedAt` = '2021-01-02 12:12:12' WHERE (`id` = '1');
UPDATE `poll`.`poll` SET `publishedAt` = '2021-01-02 12:12:12' WHERE (`id` = '2');
UPDATE `poll`.`poll` SET `publishedAt` = '2022-01-02 12:12:12' WHERE (`id` = '3');

CREATE TABLE poll_met
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  pollId BIGINT NOT NULL,
  key1 VARCHAR(50) NOT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (pollId) REFERENCES poll (id) ON DELETE CASCADE
 ); 
 
select * from  poll_question;
CREATE TABLE poll_question 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  pollId BIGINT NOT NULL,
  type VARCHAR(50) NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (pollId) REFERENCES poll (id) ON DELETE CASCADE
  );
  
  INSERT INTO `poll`.`poll_question` (`pollId`, `type`, `createdAt`) VALUES ('1', '1', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll_question` (`pollId`, `type`, `createdAt`) VALUES ('2', '2', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll_question` (`pollId`, `type`, `createdAt`) VALUES ('1', '3', '2021-01-02 12:12:12');
UPDATE `poll`.`poll_question` SET `active` = '1' WHERE (`id` = '1');
UPDATE `poll`.`poll_question` SET `active` = '1' WHERE (`id` = '2');

select * from   poll_answer;
CREATE TABLE poll_answer (
  id BIGINT NOT NULL AUTO_INCREMENT,
  pollId BIGINT NOT NULL,
  questionId BIGINT NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (pollId) REFERENCES poll (id) ON DELETE CASCADE,
    FOREIGN KEY (questionId) REFERENCES poll_question (id) ON DELETE CASCADE
);
INSERT INTO `poll`.`poll_answer` (`pollId`, `questionId`, `createdAt`) VALUES ('1', '1', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll_answer` (`pollId`, `questionId`, `createdAt`) VALUES ('2', '2', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll_answer` (`pollId`, `questionId`, `createdAt`) VALUES ('1', '3', '2021-01-02 12:12:12');
UPDATE `poll`.`poll_answer` SET `active` = '1' WHERE (`id` = '2');
UPDATE `poll`.`poll_answer` SET `active` = '1' WHERE (`id` = '1');

select * from   poll_vote;
CREATE TABLE poll_vote 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  pollId BIGINT NOT NULL,
  questionId BIGINT NOT NULL,
  answerId BIGINT DEFAULT NULL,
  userId BIGINT NOT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (pollId) REFERENCES poll (id) ON DELETE CASCADE,
	FOREIGN KEY (questionId) REFERENCES poll_question (id) ON DELETE CASCADE,
	FOREIGN KEY (answerId) REFERENCES poll_answer (id) ON DELETE CASCADE,
    FOREIGN KEY (userId) REFERENCES user (id) ON DELETE CASCADE
);
INSERT INTO `poll`.`poll_vote` (`pollId`, `questionId`, `answerId`, `userId`, `createdAt`) VALUES ('1', '1', '1', '1', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll_vote` (`pollId`, `questionId`, `answerId`, `userId`, `createdAt`) VALUES ('2', '2', '2', '2', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll_vote` (`pollId`, `questionId`, `answerId`, `userId`, `createdAt`) VALUES ('1', '3', '3', '1', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll_vote` (`pollId`, `questionId`, `answerId`, `userId`, `createdAt`) VALUES ('2', '2', '2', '2', '2021-01-02 12:12:12');
INSERT INTO `poll`.`poll_vote` (`pollId`, `questionId`, `answerId`, `userId`, `createdAt`) VALUES ('1', '1', '1', '1', '2021-01-02 12:12:12');

select * from category;
CREATE TABLE category 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  parentId BIGINT NULL DEFAULT NULL,
  title VARCHAR(75) NOT NULL,
  metaTitle VARCHAR(100) NULL DEFAULT NULL,
  slug VARCHAR(100) NOT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (parentId) REFERENCES category (id) ON DELETE CASCADE
);
  INSERT INTO `poll`.`category` (`parentId`, `title`, `slug`) VALUES ('1', 'aa', 's');
INSERT INTO `poll`.`category` (`parentId`, `title`, `slug`) VALUES ('2', 'bb', 'd');
INSERT INTO `poll`.`category` (`parentId`, `title`, `slug`) VALUES ('3', 'cc', 'f');

select * from poll_category;
CREATE TABLE poll_category 
(
  pollId BIGINT NOT NULL,
  categoryId BIGINT NOT NULL,
  PRIMARY KEY (pollId, categoryId),
  FOREIGN KEY (pollId) REFERENCES poll (id) ON DELETE CASCADE,
  FOREIGN KEY (categoryId) REFERENCES category (id) ON DELETE CASCADE
);
    INSERT INTO `poll`.`poll_category` (`pollId`, `categoryId`) VALUES ('1', '1');
INSERT INTO `poll`.`poll_category` (`pollId`, `categoryId`) VALUES ('2', '2');
INSERT INTO `poll`.`poll_category` (`pollId`, `categoryId`) VALUES ('3', '1');
INSERT INTO `poll`.`poll_category` (`pollId`, `categoryId`) VALUES ('1', '2');
INSERT INTO `poll`.`poll_category` (`pollId`, `categoryId`) VALUES ('3', '3');
INSERT INTO `poll`.`poll_category` (`pollId`, `categoryId`) VALUES ('2', '1');

    