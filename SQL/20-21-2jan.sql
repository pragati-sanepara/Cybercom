create database emp;
use emp;


CREATE TABLE permission (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),
    slug VARCHAR(64),
    description TINYTEXT,
    type SMALLINT(8),
    active SMALLINT(8),
    createdAt DATETIME,
    updatedAt DATETIME,
    content TEXT
);


CREATE TABLE role (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),
    slug VARCHAR(64),
    description TINYTEXT,
    type SMALLINT(8),
    active SMALLINT(8),
    createdAt DATETIME,
    updatedAt DATETIME,
    content TEXT
);

CREATE TABLE role_permission (
    roleId BIGINT,
    permissionId BIGINT,
    createdAt DATETIME,
    updatedAt DATETIME,
    foreign key (permissionId) references permission (id),
    foreign key (roleId) references role (id)
);

CREATE TABLE user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    roleId BIGINT,
    firstName VARCHAR(32),
    middleName VARCHAR(32),
    lastName VARCHAR(32),
    mobile VARCHAR(16),
    email VARCHAR(32),
    passwordHash VARCHAR(32),
    registeredAt DATETIME,
    lastLogin DATETIME,
    intro TINYTEXT,
    profile TEXT,
    foreign key (roleId) references role (id)
);

CREATE TABLE organization (
    id BIGINT(24) PRIMARY KEY AUTO_INCREMENT,
    createdBy BIGINT(24),
    updatedBy BIGINT(24),
    title VARCHAR(80),
    metaTitle VARCHAR(104),
    slug VARCHAR(104),
    summary TINYTEXT,
    status SMALLINT(8),
    createdAt DATETIME,
    updatedAt DATETIME,
    profile TEXT,
    content TEXT,
     foreign key (createdBy) references user (id),
    foreign key (updatedBy) references user (id)
);


CREATE TABLE employee (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    userId BIGINT,
    organizationId BIGINT,
    roleId BIGINT,
    createdBy BIGINT,
    updatedBy BIGINT,
    code VARCHAR(64),
    status SMALLINT(8),
    createdAt DATETIME,
    updatedAt DATETIME,
    startsAt DATETIME,
    endsAt DATETIME,
    notes TEXT,
    foreign key (userId) references user (id),
    foreign key (organizationId) references organization (id),
    foreign key (roleId) references role (id),
    foreign key (createdBy) references user (id),
    foreign key (updatedBy) references user (id)
);

CREATE TABLE organization_meta (
    id BIGINT(24) PRIMARY KEY AUTO_INCREMENT,
    organizationId BIGINT(24),
    ke VARCHAR(56),
    content TEXT,
    foreign key (organizationId) references organization (id)
);


INSERT INTO `emp`.`permission` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('aaa', 'a', 'xyz', '1', '1', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'ggg');
INSERT INTO `emp`.`permission` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('bbb', 'b', 'xyz', '2', '0', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'ggg');
INSERT INTO `emp`.`permission` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('ccc', 'c', 'xyz', '3', '1', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'ggg');
INSERT INTO `emp`.`permission` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('ddd', 'd', 'xyz', '4', '0', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'ggg');
INSERT INTO `emp`.`permission` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('eee', 'e', 'xyz', '1', '1', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'ggg');


INSERT INTO `emp`.`role` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('a', 'z', 'aaa', '1', '1', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'xyz');
INSERT INTO `emp`.`role` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('b', 'x', 'bbb', '2', '0', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'xyz');
INSERT INTO `emp`.`role` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('c', 'y', 'ccc', '3', '1', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'xyz');
INSERT INTO `emp`.`role` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('d', 'w', 'ddd', '4', '0', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'xyz');
INSERT INTO `emp`.`role` (`title`, `slug`, `description`, `type`, `active`, `createdAt`, `updatedAt`, `content`) VALUES ('e', 'q', 'eee', '1', '1', '2021-01-02 12:12:12', '2022-01-01 02:12:12', 'xyz');


insert into role_permission (roleId, permissionId) values
(5,5),
(5,4),
(6,3),
(6,2),
(7,1),
(7,5),
(8,4),
(8,3),
(9,2),
(9,1);

INSERT INTO `emp`.`user` (`roleId`, `firstName`, `middleName`, `lastName`, `mobile`, `email`) VALUES ('5', 'pragati', 'r', 'patel', '9595959595', 'a@gmail.com');
INSERT INTO `emp`.`user` (`roleId`, `firstName`, `middleName`, `lastName`, `mobile`, `email`, `passwordHash`) VALUES ('6', 'mitu', 'r', 'patel', '9595959595', 'b@gmail.com', 'aaa');
INSERT INTO `emp`.`user` (`roleId`, `firstName`, `middleName`, `lastName`, `mobile`, `email`, `passwordHash`) VALUES ('7', 'sid', 't', 'patel', '9595959595', 'c@gmail.com', 'aaa');
INSERT INTO `emp`.`user` (`roleId`, `firstName`, `middleName`, `lastName`, `mobile`, `email`, `passwordHash`) VALUES ('8', 'mihir', 'y', 'patel', '9595959595', 'd@gmail.com', 'aaa');
INSERT INTO `emp`.`user` (`roleId`, `firstName`, `middleName`, `lastName`, `mobile`, `email`, `passwordHash`) VALUES ('9', 'pari', 'u', 'patel', '9595959595', 'e@gmail.com', 'aaa');
INSERT INTO `emp`.`user` (`roleId`, `firstName`, `middleName`, `lastName`, `mobile`, `email`, `passwordHash`) VALUES ('5', 'yash', 'i', 'patel', '9595959595', 'f@gmail.com', 'aaa');
INSERT INTO `emp`.`user` (`roleId`, `firstName`, `middleName`, `lastName`, `mobile`, `email`, `passwordHash`) VALUES ('6', 'krish', 'o', 'patel', '9595959595', 'g@gmail.com', 'aaa');


INSERT INTO `emp`.`organization_meta` (`organizationId`, `ke`, `content`) VALUES ('1', 'ee', 'a');
INSERT INTO `emp`.`organization_meta` (`organizationId`, `ke`, `content`) VALUES ('2', 'aa', 's');
INSERT INTO `emp`.`organization_meta` (`organizationId`, `ke`, `content`) VALUES ('3', 'bb', 'd');
INSERT INTO `emp`.`organization_meta` (`organizationId`, `ke`, `content`) VALUES ('4', 'cc', 'f');
INSERT INTO `emp`.`organization_meta` (`organizationId`, `ke`, `content`) VALUES ('5', 'dd', 'g');


INSERT INTO `emp`.`employee` (`userId`, `organizationId`, `roleId`, `createdBy`, `updatedBy`, `code`, `status`) VALUES ('1', '1', '5', '1', '2', 'kk', '1');
INSERT INTO `emp`.`employee` (`userId`, `organizationId`, `roleId`, `createdBy`, `updatedBy`, `code`, `status`) VALUES ('2', '2', '6', '2', '3', 'jj', '0');
INSERT INTO `emp`.`employee` (`userId`, `organizationId`, `roleId`, `createdBy`, `updatedBy`, `code`, `status`) VALUES ('3', '3', '7', '3', '4', 'h', '1');
INSERT INTO `emp`.`employee` (`userId`, `organizationId`, `roleId`, `createdBy`, `updatedBy`, `code`, `status`) VALUES ('4', '4', '8', '4', '5', 'gg', '0');
INSERT INTO `emp`.`employee` (`userId`, `organizationId`, `roleId`, `createdBy`, `updatedBy`, `code`, `status`) VALUES ('5', '5', '9', '5', '2', 'll', '1');
