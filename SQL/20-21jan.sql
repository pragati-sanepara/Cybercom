CREATE DATABASE IF NOT EXISTS newsletter;

USE newsletter;

CREATE TABLE user
(
	user_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    mobile_no VARCHAR(255),
    email_address VARCHAR(255),
    password_hash VARCHAR(255) NOT NULL,
    admin TINYINT(1) NOT NULL,
    customer TINYINT(1) NOT NULL,
    registered_at DATETIME NOT NULL,
    last_login DATETIME,
    intro TINYTEXT,
    profile TEXT,
    PRIMARY KEY (user_id)
);


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