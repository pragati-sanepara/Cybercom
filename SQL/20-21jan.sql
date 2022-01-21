CREATE DATABASE IF NOT EXISTS newsletter;

USE newsletter;
select * from user;
drop table user;
CREATE TABLE user
(
	user_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    mobile_no VARCHAR(255),
    email_address VARCHAR(255),
    password_hash VARCHAR(255) NOT null,
    admin TINYINT(1) NOT NULL,
    customer TINYINT(1) NOT NULL,
    registered_at DATETIME NOT NULL,
    last_login DATETIME,
    intro TINYTEXT,
    profile TEXT,
    PRIMARY KEY (user_id)
);

select * from newsletter;
CREATE TABLE newsLetter
(
	newsletter_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(2048),
    type SMALLINT(6) NOT NULL,
    multiple TINYINT(1) NOT NULL,
    global TINYINT(1) NOT NULL,
    status SMALLINT(6) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    published_at DATETIME,
    content TEXT,
    PRIMARY KEY (newsletter_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);



select * from subscriber;
CREATE TABLE subscriber
(
	subscriber_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255) NOT NULL,
    mobile_no VARCHAR(255),
    phone_no VARCHAR(255),
    active TINYINT(1) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    PRIMARY KEY (subscriber_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

select * from address;
CREATE TABLE address
(
	address_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    subscriber_id INT NOT NULL,
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    mobile_no VARCHAR(255),
    email_address VARCHAR(255),
    add_line1 VARCHAR(255),
    add_line2 VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(255),
    country VARCHAR(255),
    area_code VARCHAR(255),
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    PRIMARY KEY (address_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(subscriber_id) ON DELETE CASCADE
);

select* from newsletter_meta;
CREATE TABLE newsletter_meta
(
	newsletter_meta_id INT NOT NULL AUTO_INCREMENT,
    newsletter_id INT NOT NULL,
    type VARCHAR(255) NOT NULL,
    meta_key VARCHAR(255) NOT NULL,
    content TEXT,
    PRIMARY KEY (newsletter_meta_id),
    FOREIGN KEY (newsletter_id) REFERENCES newsletter(newsletter_id) ON DELETE CASCADE
);

select* from edition;
CREATE TABLE edition
(
	edition_id INT NOT NULL AUTO_INCREMENT,
    newsletter_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(2048),
    status SMALLINT(6) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    published_at DATETIME,
    content TEXT,
    PRIMARY KEY (edition_id),
    FOREIGN KEY (newsletter_id) REFERENCES newsletter(newsletter_id) ON DELETE CASCADE
);

select * from newsletter_trigger;
CREATE TABLE newsletter_trigger
(
	newsletter_trigger_id INT NOT NULL AUTO_INCREMENT,
    newsletter_id INT NOT NULL,
    edition_id INT NOT NULL,
    subscriber_id INT NOT NULL,
    sent TINYINT(1) NOT NULL,
	delivered TINYINT(1) NOT NULL,
    mode SMALLINT(6) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    sent_at DATETIME,
    delivered_at DATETIME,
    PRIMARY KEY (newsletter_trigger_id),
    FOREIGN KEY (newsletter_id) REFERENCES newsletter(newsletter_id) ON DELETE CASCADE,
    FOREIGN KEY (edition_id) REFERENCES edition(edition_id) ON DELETE CASCADE,
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(subscriber_id) ON DELETE CASCADE
);

select * from mailing_list;
CREATE TABLE mailing_list
(
	mailing_list_id INT NOT NULL AUTO_INCREMENT,
    newsletter_id INT NOT NULL,
    subscriber_id INT NOT NULL,
    active TINYINT(1) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    PRIMARY KEY(mailing_list_id),
    FOREIGN KEY (newsletter_id) REFERENCES newsletter(newsletter_id) ON DELETE CASCADE,
	FOREIGN KEY (subscriber_id) REFERENCES subscriber(subscriber_id) ON DELETE CASCADE
);



INSERT INTO `newsletter`.`user` (`first_name`, `middle_name`, `last_name`, `mobile_no`, `email_address`, `password_hash`, `admin`, `customer`, `registered_at`) VALUES ('pragati', 'a', 'patel', '9595959595', 'a@b.com', 'aa', '1', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`user` (`first_name`, `middle_name`, `last_name`, `mobile_no`, `email_address`, `password_hash`, `admin`, `customer`, `registered_at`) VALUES ('pari', 'a', 'patel', '9595959595', 'a@c.com', 'aa', '0', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`user` (`first_name`, `middle_name`, `last_name`, `mobile_no`, `email_address`, `password_hash`, `admin`, `customer`, `registered_at`) VALUES ('happy', 'a', 'patel', '9595959595', 'a@d.com', 'aa', '0', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`user` (`first_name`, `middle_name`, `last_name`, `mobile_no`, `email_address`, `password_hash`, `admin`, `customer`, `registered_at`) VALUES ('janu', 'a', 'patel', '9595959595', 'a@e.com', 'aa', '1', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`user` (`first_name`, `middle_name`, `last_name`, `mobile_no`, `email_address`, `password_hash`, `admin`, `customer`, `registered_at`) VALUES ('khushi', 'a', 'patel', '9595959595', 'a@f.com', 'aa', '0', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`user` (`first_name`, `middle_name`, `last_name`, `mobile_no`, `email_address`, `password_hash`, `admin`, `customer`, `registered_at`) VALUES ('mihir', 'a', 'patel', '9595959595', 'a@g.com', 'aa', '0', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`user` (`first_name`, `middle_name`, `last_name`, `mobile_no`, `email_address`, `password_hash`, `admin`, `customer`, `registered_at`) VALUES ('yash', 'a', 'patel', '9595959595', 'a@h.com', 'aa', '1', '1', '2021-01-02 12:12:12');


INSERT INTO `newsletter`.`newsletter` (`user_id`, `title`, `type`, `multiple`, `global`, `status`, `created_at`) VALUES ('1', 'bb', '1', '1', '1', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter` (`user_id`, `title`, `type`, `multiple`, `global`, `status`, `created_at`) VALUES ('2', 'cc', '2', '0', '0', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter` (`user_id`, `title`, `type`, `multiple`, `global`, `status`, `created_at`) VALUES ('3', 'aa', '3', '1', '0', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter` (`user_id`, `title`, `type`, `multiple`, `global`, `status`, `created_at`) VALUES ('4', 'ab', '4', '0', '0', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter` (`user_id`, `title`, `type`, `multiple`, `global`, `status`, `created_at`) VALUES ('5', 'ss', '2', '1', '1', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter` (`user_id`, `title`, `type`, `multiple`, `global`, `status`, `created_at`) VALUES ('6', 'dd', '3', '0', '0', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter` (`user_id`, `title`, `type`, `multiple`, `global`, `status`, `created_at`) VALUES ('7', 'ee', '4', '1', '1', '1', '2021-01-02 12:12:12');


INSERT INTO `newsletter`.`subscriber` (`user_id`, `first_name`, `email_address`, `active`, `created_at`) VALUES ('1', 'pragati', 'a@b.com', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`subscriber` (`user_id`, `first_name`, `email_address`, `active`, `created_at`) VALUES ('2', 'pari', 'a@c.com', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`subscriber` (`user_id`, `first_name`, `email_address`, `active`, `created_at`) VALUES ('3', 'happy', 'a@d.com', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`subscriber` (`user_id`, `first_name`, `email_address`, `active`, `created_at`) VALUES ('4', 'janu', 'a@e.com', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`subscriber` (`user_id`, `first_name`, `email_address`, `active`, `created_at`) VALUES ('5', 'khushi', 'a@f.com', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`subscriber` (`user_id`, `first_name`, `email_address`, `active`, `created_at`) VALUES ('6', 'mihir', 'a@g.com', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`subscriber` (`user_id`, `first_name`, `email_address`, `active`, `created_at`) VALUES ('7', 'yash', 'a@h.com', '1', '2021-01-02 12:12:12');


INSERT INTO `newsletter`.`address` (`user_id`, `subscriber_id`, `first_name`, `email_address`, `city`, `country`, `created_at`) VALUES ('1', '1', 'pragati', 'a@b.com', 'amreli', 'us', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`address` (`user_id`, `subscriber_id`, `first_name`, `email_address`, `city`, `country`, `created_at`) VALUES ('2', '2', 'pari', 'a@c.com', 'surat', 'india', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`address` (`user_id`, `subscriber_id`, `first_name`, `email_address`, `city`, `country`, `created_at`) VALUES ('3', '3', 'happy', 'a@d.com', 'derdi', 'bhtan', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`address` (`user_id`, `subscriber_id`, `first_name`, `email_address`, `city`, `country`, `created_at`) VALUES ('4', '4', 'janu', 'a@e.com', 'lathi', 'nepal', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`address` (`user_id`, `subscriber_id`, `first_name`, `email_address`, `city`, `country`, `created_at`) VALUES ('5', '5', 'khushi', 'a@f.com', 'keriya', 'us', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`address` (`user_id`, `subscriber_id`, `first_name`, `email_address`, `city`, `country`, `created_at`) VALUES ('6', '6', 'mihir', 'a@g.com', 'amreli', 'canada', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`address` (`user_id`, `subscriber_id`, `first_name`, `email_address`, `city`, `country`, `created_at`) VALUES ('7', '7', 'yash', 'a@h.com', 'surat', 'india', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`address` (`user_id`, `subscriber_id`, `first_name`, `email_address`, `city`, `country`, `created_at`) VALUES ('7', '7', 'yash', 'a@h.com', 'ahemdabad', 'us', '2021-01-02 12:12:12');


INSERT INTO `newsletter`.`newsletter_meta` (`newsletter_id`, `type`, `meta_key`) VALUES ('6', '1', 'qq');
INSERT INTO `newsletter`.`newsletter_meta` (`newsletter_id`, `type`, `meta_key`) VALUES ('7', '2', 'ww');
INSERT INTO `newsletter`.`newsletter_meta` (`newsletter_id`, `type`, `meta_key`) VALUES ('8', '3', 'ee');
INSERT INTO `newsletter`.`newsletter_meta` (`newsletter_id`, `type`, `meta_key`) VALUES ('9', '4', 'rrr');
INSERT INTO `newsletter`.`newsletter_meta` (`newsletter_id`, `type`, `meta_key`) VALUES ('10', '1', 'tt');
INSERT INTO `newsletter`.`newsletter_meta` (`newsletter_id`, `type`, `meta_key`) VALUES ('11', '2', 'yy');
INSERT INTO `newsletter`.`newsletter_meta` (`newsletter_id`, `type`, `meta_key`) VALUES ('12', '3', 'uu');


INSERT INTO `newsletter`.`edition` (`newsletter_id`, `title`, `status`, `created_at`) VALUES ('6', 'aa', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`edition` (`newsletter_id`, `title`, `status`, `created_at`) VALUES ('7', 'dd', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`edition` (`newsletter_id`, `title`, `status`, `created_at`) VALUES ('8', 'cc', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`edition` (`newsletter_id`, `title`, `status`, `created_at`) VALUES ('9', 'bb', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`edition` (`newsletter_id`, `title`, `status`, `created_at`) VALUES ('10', 'jj', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`edition` (`newsletter_id`, `title`, `status`, `created_at`) VALUES ('11', 'kk', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`edition` (`newsletter_id`, `title`, `status`, `created_at`) VALUES ('12', 'll', '1', '2021-01-02 12:12:12');


INSERT INTO `newsletter`.`newsletter_trigger` (`newsletter_id`, `edition_id`, `subscriber_id`, `sent`, `delivered`, `mode`, `created_at`) VALUES ('6', '1', '1', '1', '1', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter_trigger` (`newsletter_id`, `edition_id`, `subscriber_id`, `sent`, `delivered`, `mode`, `created_at`) VALUES ('7', '2', '2', '0', '0', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter_trigger` (`newsletter_id`, `edition_id`, `subscriber_id`, `sent`, `delivered`, `mode`, `created_at`) VALUES ('8', '3', '3', '1', '1', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter_trigger` (`newsletter_id`, `edition_id`, `subscriber_id`, `sent`, `delivered`, `mode`, `created_at`) VALUES ('9', '4', '4', '0', '0', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter_trigger` (`newsletter_id`, `edition_id`, `subscriber_id`, `sent`, `delivered`, `mode`, `created_at`) VALUES ('10', '5', '5', '1', '1', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter_trigger` (`newsletter_id`, `edition_id`, `subscriber_id`, `sent`, `delivered`, `mode`, `created_at`) VALUES ('11', '6', '6', '0', '0', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`newsletter_trigger` (`newsletter_id`, `edition_id`, `subscriber_id`, `sent`, `delivered`, `mode`, `created_at`) VALUES ('12', '7', '7', '1', '1', '1', '2021-01-02 12:12:12');


INSERT INTO `newsletter`.`mailing_list` (`newsletter_id`, `subscriber_id`, `active`, `created_at`) VALUES ('6', '1', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`mailing_list` (`newsletter_id`, `subscriber_id`, `active`, `created_at`) VALUES ('7', '2', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`mailing_list` (`newsletter_id`, `subscriber_id`, `active`, `created_at`) VALUES ('8', '3', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`mailing_list` (`newsletter_id`, `subscriber_id`, `active`, `created_at`) VALUES ('9', '4', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`mailing_list` (`newsletter_id`, `subscriber_id`, `active`, `created_at`) VALUES ('10', '5', '1', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`mailing_list` (`newsletter_id`, `subscriber_id`, `active`, `created_at`) VALUES ('11', '6', '0', '2021-01-02 12:12:12');
INSERT INTO `newsletter`.`mailing_list` (`newsletter_id`, `subscriber_id`, `active`, `created_at`) VALUES ('12', '7', '1', '2021-01-02 12:12:12');
