CREATE DATABASE restaurant;

USE restaurant;
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
  admin TINYINT(1) NOT NULL DEFAULT 0,
  vendor TINYINT(1) NOT NULL DEFAULT 0,
  chef TINYINT(1) NOT NULL DEFAULT 0,
  agent TINYINT(1) NOT NULL DEFAULT 0,
  registeredAt DATETIME NOT NULL,
  lastLogin DATETIME NULL DEFAULT NULL,
  intro TINYTEXT NULL DEFAULT NULL,
  profile TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO `restaurant`.`user` (`firstName`, `passwordHash`, `vendor`, `registeredAt`) VALUES ('pari', 'aa', '1', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`user` (`firstName`, `passwordHash`, `vendor`, `registeredAt`) VALUES ('happy', 'ss', '1', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`user` (`firstName`, `passwordHash`, `vendor`, `registeredAt`) VALUES ('ysh', 'dd', '0', '2021-01-02 12:12:12');

CREATE TABLE ingredient 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  userId BIGINT NOT NULL,
  vendorId BIGINT DEFAULT NULL,
  title VARCHAR(75) NOT NULL,
  slug VARCHAR(100),
  summary TINYTEXT NULL,
  type SMALLINT(6) NOT NULL DEFAULT 0,
  sku VARCHAR(100) NOT NULL,
  quantity FLOAT NOT NULL DEFAULT 0,
  unit SMALLINT(6) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES user (id) ON DELETE CASCADE,
  FOREIGN KEY (vendorId) REFERENCES user (id) ON DELETE CASCADE
);

select * from item;
CREATE TABLE item 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  userId BIGINT NOT NULL,
  vendorId BIGINT DEFAULT NULL,
  title VARCHAR(75) NOT NULL,
  slug VARCHAR(100) NULL,
  summary TINYTEXT NULL,
  type SMALLINT(6) NOT NULL DEFAULT 0,
  cooking TINYINT(1) NOT NULL DEFAULT 0,
  sku VARCHAR(100),
  price FLOAT NOT NULL DEFAULT 0,
  quantity FLOAT NOT NULL DEFAULT 0,
  unit SMALLINT(6) NOT NULL DEFAULT 0,
  recipe TEXT NULL DEFAULT NULL,
  instructions TEXT NULL DEFAULT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES user (id) ON DELETE CASCADE,
  FOREIGN KEY (userId) REFERENCES user (id) ON DELETE CASCADE
);
INSERT INTO `restaurant`.`item` (`userId`, `vendorId`, `title`, `price`, `quantity`, `createdAt`) VALUES ('1', '1', 'cc', '100', '10', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`item` (`userId`, `vendorId`, `title`, `price`, `quantity`, `createdAt`) VALUES ('2', '2', 'ss', '200', '20', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`item` (`userId`, `vendorId`, `title`, `price`, `quantity`, `createdAt`) VALUES ('1', '1', 'dd', '300', '30', '2021-01-02 12:12:12');


CREATE TABLE recipe 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  itemId BIGINT NOT NULL,
  ingredientId BIGINT NOT NULL,
  quantity FLOAT NOT NULL DEFAULT 0,
  unit SMALLINT(6) NOT NULL DEFAULT 0,
  instructions TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (itemId) REFERENCES item (id) ON DELETE CASCADE,
  FOREIGN KEY (ingredientId) REFERENCES ingredient (id) ON DELETE CASCADE
);
select * from menu;
CREATE TABLE menu 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  userId BIGINT NOT NULL,
  title VARCHAR(75) NOT NULL,
  slug VARCHAR(100) NULL,
  summary TINYTEXT NULL,
  type SMALLINT(6) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES user (id) ON DELETE CASCADE
);
INSERT INTO `restaurant`.`menu` (`userId`, `title`, `createdAt`) VALUES ('1', 'a', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`menu` (`userId`, `title`, `createdAt`) VALUES ('2', 'b', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`menu` (`userId`, `title`, `createdAt`) VALUES ('3', 'c', '2021-01-02 12:12:12');

select * from menu_item;
CREATE TABLE menu_item 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  menuId BIGINT NOT NULL,
  itemId BIGINT NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  FOREIGN KEY (menuId) REFERENCES menu (id) ON DELETE CASCADE,
  FOREIGN KEY (itemId) REFERENCES item (id) ON DELETE CASCADE
);
INSERT INTO `restaurant`.`menu_item` (`menuId`, `itemId`) VALUES ('1', '4');
INSERT INTO `restaurant`.`menu_item` (`menuId`, `itemId`) VALUES ('2', '5');
INSERT INTO `restaurant`.`menu_item` (`menuId`, `itemId`) VALUES ('3', '6');

select * from item_chef;
CREATE TABLE item_chef 
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  itemId BIGINT NOT NULL,
  chefId BIGINT NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  FOREIGN KEY (itemId) REFERENCES item (id) ON DELETE CASCADE,
  FOREIGN KEY (chefId) REFERENCES user (id) ON DELETE CASCADE
);
INSERT INTO `restaurant`.`item_chef` (`itemId`, `chefId`) VALUES ('4', '1');
INSERT INTO `restaurant`.`item_chef` (`itemId`, `chefId`) VALUES ('5', '2');
INSERT INTO `restaurant`.`item_chef` (`itemId`, `chefId`) VALUES ('6', '1');

  
  CREATE TABLE table_top 
  (
  id BIGINT NOT NULL AUTO_INCREMENT,
  code VARCHAR(100) NOT NULL,
  status SMALLINT(6) NOT NULL DEFAULT 0,
  capacity SMALLINT(6) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);
  
  CREATE TABLE booking 
  (
  id BIGINT NOT NULL AUTO_INCREMENT,
  tableId BIGINT NOT NULL,
  userId BIGINT NULL DEFAULT NULL,
  token VARCHAR(100) NOT NULL,
  status SMALLINT(6) NOT NULL DEFAULT 0,
  firstName VARCHAR(50) NULL DEFAULT NULL,
  middleName VARCHAR(50) NULL DEFAULT NULL,
  lastName VARCHAR(50) NULL DEFAULT NULL,
  mobile VARCHAR(15) NULL,
  email VARCHAR(50) NULL,
  line1 VARCHAR(50) NULL DEFAULT NULL,
  line2 VARCHAR(50) NULL DEFAULT NULL,
  city VARCHAR(50) NULL DEFAULT NULL,
  province VARCHAR(50) NULL DEFAULT NULL,
  country VARCHAR(50) NULL DEFAULT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (tableId)  REFERENCES table_top (id) ON DELETE CASCADE,
  FOREIGN KEY (userId)  REFERENCES user (id) ON DELETE CASCADE
);

  
  CREATE TABLE booking_item 
  (
  id BIGINT NOT NULL AUTO_INCREMENT,
  bookingId BIGINT NOT NULL,
  itemId BIGINT NOT NULL,
  sku VARCHAR(100) NOT NULL,
  price FLOAT NOT NULL DEFAULT 0,
  discount FLOAT NOT NULL DEFAULT 0,
  quantity FLOAT NOT NULL DEFAULT 0,
  unit SMALLINT(6) NOT NULL DEFAULT 0,
  status SMALLINT(6) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (bookingId) REFERENCES booking (id) ON DELETE CASCADE,
  FOREIGN KEY (itemId) REFERENCES item (id) ON DELETE CASCADE
);

select * from order1;  
  CREATE TABLE order1
  (
  id BIGINT NOT NULL AUTO_INCREMENT,
  userId BIGINT NULL DEFAULT NULL,
  vendorId BIGINT NULL DEFAULT NULL,
  token VARCHAR(100) NOT NULL,
  status SMALLINT(6) NOT NULL DEFAULT 0,
  subTotal FLOAT NOT NULL DEFAULT 0,
  itemDiscount FLOAT NOT NULL DEFAULT 0,
  tax FLOAT NOT NULL DEFAULT 0,
  shipping FLOAT NOT NULL DEFAULT 0,
  total FLOAT NOT NULL DEFAULT 0,
  promo VARCHAR(50) NULL DEFAULT NULL,
  discount FLOAT NOT NULL DEFAULT 0,
  grandTotal FLOAT NOT NULL DEFAULT 0,
  firstName VARCHAR(50) NULL DEFAULT NULL,
  middleName VARCHAR(50) NULL DEFAULT NULL,
  lastName VARCHAR(50) NULL DEFAULT NULL,
  mobile VARCHAR(15) NULL,
  email VARCHAR(50) NULL,
  line1 VARCHAR(50) NULL DEFAULT NULL,
  line2 VARCHAR(50) NULL DEFAULT NULL,
  city VARCHAR(50) NULL DEFAULT NULL,
  province VARCHAR(50) NULL DEFAULT NULL,
  country VARCHAR(50) NULL DEFAULT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES user (id) ON DELETE CASCADE,
  FOREIGN KEY (vendorId) REFERENCES user (id) ON DELETE CASCADE
);
  INSERT INTO `restaurant`.`order1` (`userId`, `vendorId`, `token`, `status`, `subTotal`, `itemDiscount`, `tax`, `shipping`, `total`, `discount`, `grandTotal`, `firstName`, `createdAt`) VALUES ('1', '1', '11','1',  '200', '20', '5', '5', '210', '20', '190', 'pari', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`order1` (`userId`, `vendorId`, `token`, `status`, `subTotal`, `itemDiscount`, `tax`, `shipping`, `total`, `discount`, `grandTotal`, `firstName`, `createdAt`) VALUES ('2', '2', '12','0',  '300', '30', '5', '5', '310', '30', '280', 'happy', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`order1` (`userId`, `vendorId`, `token`, `status`, `subTotal`, `itemDiscount`, `tax`, `shipping`, `total`, `discount`, `grandTotal`, `firstName`, `createdAt`) VALUES ('1', '1', '13', '1', '400', '40', '5', '5', '410', '40', '370', 'pari', '2021-01-02 12:12:12');
UPDATE `restaurant`.`order1` SET `createdAt` = '2021-11-09 12:12:12' WHERE (`id` = '2');
UPDATE `restaurant`.`order1` SET `createdAt` = '2021-11-09 12:12:12' WHERE (`id` = '1');
UPDATE `restaurant`.`order_item` SET `quantity` = '2' WHERE (`id` = '17');


  select * from order_item;
  CREATE TABLE order_item 
  (
  id BIGINT NOT NULL AUTO_INCREMENT,
  orderId BIGINT NOT NULL,
  itemId BIGINT NOT NULL,
  sku VARCHAR(100) NOT NULL,
  price FLOAT NOT NULL DEFAULT 0,
  discount FLOAT NOT NULL DEFAULT 0,
  quantity FLOAT NOT NULL DEFAULT 0,
  unit SMALLINT(6) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (orderId) REFERENCES order1 (id) ON DELETE CASCADE,
  FOREIGN KEY (itemId) REFERENCES item (id) ON DELETE CASCADE
);
INSERT INTO `restaurant`.`order_item` (`orderId`, `itemId`, `sku`, `price`, `discount`, `quantity`, `createdAt`) VALUES ('1', '4', 'a', '100', '10', '3', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`order_item` (`orderId`, `itemId`, `sku`, `price`, `discount`, `quantity`, `createdAt`) VALUES ('2', '5', 'b', '200', '20', '2', '2021-01-02 12:12:12');
INSERT INTO `restaurant`.`order_item` (`orderId`, `itemId`, `sku`, `price`, `discount`, `quantity`, `createdAt`) VALUES ('3', '6', 'c', '300', '30', '1', '2021-01-02 12:12:12');
UPDATE `restaurant`.`order_item` SET `createdAt` = '2021-11-09 12:12:12' WHERE (`id` = '15');
UPDATE `restaurant`.`order_item` SET `createdAt` = '2021-11-09 12:12:12' WHERE (`id` = '16');
UPDATE `restaurant`.`order_item` SET `createdAt` = '2021-11-09 20:01:00' WHERE (`id` = '16');
UPDATE `restaurant`.`order_item` SET `createdAt` = '2021-01-02 22:12:12' WHERE (`id` = '17');

  
  CREATE TABLE transaction 
  (
  id BIGINT NOT NULL AUTO_INCREMENT,
  userId BIGINT NOT NULL,
  vendorId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  code VARCHAR(100) NOT NULL,
  type SMALLINT(6) NOT NULL DEFAULT 0,
  mode SMALLINT(6) NOT NULL DEFAULT 0,
  status SMALLINT(6) NOT NULL DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES user (id) ON DELETE CASCADE,
  FOREIGN KEY (vendorId) REFERENCES user (id) ON DELETE CASCADE,
  FOREIGN KEY (orderId) REFERENCES order1 (id) ON DELETE CASCADE
);

  
  