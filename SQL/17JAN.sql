CREATE DATABASE ECOMMERCE;

USE ECOMMERCE;

DROP TABLE PRODUCTS;
CREATE TABLE PRODUCTS(
	PRODUCT_ID INT AUTO_INCREMENT,
    PRODUCT_NAME VARCHAR(64) NOT NULL,
    CATEGORY_ID INT NOT NULL,
    PRODUCT_PRICE FLOAT,
    PRODUCT_WEIGHT FLOAT,
    PRIMARY KEY (PRODUCT_ID),
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID) ON DELETE CASCADE
);

DROP TABLE CATEGORY;
CREATE TABLE CATEGORY(
	CATEGORY_ID INT AUTO_INCREMENT,
    CATEGORY_NAME VARCHAR(64) NOT NULL,
    CATEGORY_PARENT_ID INT DEFAULT 0,
    PRIMARY KEY (CATEGORY_ID)
);
/*ALTER TABLE CATEGORY
ADD foreign key (CATEGORY_PARENT_ID) references CATEGORY (CATEGORY_ID) ON DELETE CASCADE; */

DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
	CUSTOMER_ID INT AUTO_INCREMENT,
    CUSTOMER_NAME VARCHAR(64) NOT NULL,
    MOBILE_NUMBER VARCHAR(16) NOT NULL,
    EMAIL VARCHAR(64) NOT NULL,
    PRIMARY KEY (CUSTOMER_ID)
);
select* from PRODUCTS;

/*select CUSTOMER.CUSTOMER_ID,PRODUCTS.PRODUCT_NAME,CUSTOMER.CUSTOMER_NAME,ORDERS.ORDER_DATE, ADDRESS.ADDRESS_ID,ADDRESS.STREET, ADDRESS.CITY, ADDRESS.COUNTRY,ADDRESS.POST_CODE*/

SELECT *
FROM CUSTOMER
left OUTER JOIN ADDRESS ON CUSTOMER.CUSTOMER_ID=ADDRESS.CUSTOMER_ID
 where 
 CUSTOMER.CUSTOMER_NAME = 'pragati';

 /*join orders
on
orders.CUSTOMER_ID=CUSTOMER.CUSTOMER_ID
  join PRODUCTS
on
orders.PRODUCT_ID=PRODUCTS.PRODUCT_ID
 where orders.ORDER_DATE >= '2022-01-01' and orders.ORDER_DATE<='2022-01-30';*/

DROP TABLE ADDRESS;
CREATE TABLE ADDRESS (
	ADDRESS_ID INT AUTO_INCREMENT,
    CUSTOMER_ID INT NOT NULL,
    STREET VARCHAR(64),
    CITY VARCHAR(16) NOT NULL,
    COUNTRY VARCHAR(16) NOT NULL,
    POST_CODE VARCHAR(8) NOT NULL,
    PRIMARY KEY (ADDRESS_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID) ON DELETE CASCADE
);

DROP TABLE ORDERS;
CREATE TABLE ORDERS (
	ORDER_ID INT AUTO_INCREMENT,
    CUSTOMER_ID INT NOT NULL,
    PRODUCT_ID INT NOT NULL,
    ADDRESS_ID INT NOT NULL,
    ORDER_DATE DATE NOT NULL,
    ORDER_AMOUNT FLOAT NOT NULL,
    ORDER_QUANTITY INT DEFAULT 1,
    ORDER_PRICE FLOAT NOT NULL,
    PRIMARY KEY (ORDER_ID),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID) ON DELETE CASCADE,
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID) ON DELETE CASCADE,
	FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID) ON DELETE CASCADE
);

INSERT INTO CATEGORY VALUES (0, "Electronics",0),
(0,"Non Electronics",0),
(0,"Mobile Phone",1),
(0,"Laptop",1),
(0,"TV",1),
(0,"Apple",3),
(0,"Apple",4),
(0,"OnePlus",3),
(0,"Lenovo",4),
(0,"Sony",5),
(0,"Chair",2),
(0,"Kichen War",2),
(0,"Knife",12),
(0,"Measuring Cups",12),
(0,"Bowls",12),
(0,"Vegetable Peeler",12);

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS VALUES (0,"OnePlus A20",8,"26000","1.8"),
(0,"Apple 12 pro",6,"80000","1.6"),
(0,"Lenovo s145",9,"55000","2.2"),
(0,"Sony A+",10,"60000","5.6"),
(0,"Blue chair",11,"200","1.6"),
(0,"Bowls",15,"100","1.0"),
(0,"Knife",13,"50","0.5"),
(0,"I pad",7,"112000","2.8"),
(0,"Measuring Cups",14,"200","0.8"),
(0,"OnePlus M",8,"25000","1.7"),
(0,"Vegetable Peeler",16,"100","0.9");

INSERT INTO ADDRESS VALUES (0,1,1,"Amreli","India","365460"),
(0,2,2,"wshaiting","Amerika","365460"),
(0,3,3,"Toranto","Canada","360001"),
(0,4,1,"Surat","India","363000"),
(0,5,4,"Rome","Italy","362000"),
(0,6,1,"Canberra","Australia","363456"),
(0,7,5,"Islambad","Pakistan","365543"),
(0,8,2,"Thimphu","Bhutan","362312"),
(0,9,1,"Beijing","China","369864"),
(0,10,3,"Budapest","Hungary","366500"),
(0,11,2,"Amreli","India","365460"),
(0,12,3,"Canberra","Australia","363456"),
(0,13,2,"Thimphu","Bhutan","362312"),
(0,14,1,"Beijing","China","369864"),
(0,3,1,"wshaiting","Amerika","365460"),
(0,5,2,"Toranto","Canada","360001"),
(0,7,4,"Surat","India","363000"),
(0,9,1,"Rome","Italy","362000"),
(0,11,3,"Canberra","Australia","363456");

select * from ADDRESS;
INSERT INTO CUSTOMER VALUES (0,"Pragati","7400005500","timpli@123"),
(0,"Pragati","7400005500","timpli@123"),
(0,"Siddh","7400005501","timpli@456"),
(0,"Milan","7400005502","timpli@789"),
(0,"Mitu","7400005503","timpli@234"),
(0,"Pari","7400005504","timpli@345"),
(0,"Happy","7400005505","timpli@567"),
(0,"Nidhi","74000055006","timpli@1"),
(0,"Abhi","74000055007","timpli@12"),
(0,"Uniq","74000055070","timpli@2"),
(0,"Sanjay","7400005508","timpli@3"),
(0,"Mihir","7400005509","timpli@13"),
(0,"Khushi","7400005522","timpli@133"),
(0,"Hitly","7400005533","timpli@143");


INSERT INTO ORDERS VALUES (0,1,1,1,"2022-01-13","26000",1,"26000"),
(0,2,2,2,"2022-01-4","80000",1,"80000"),
(0,3,3,3,"2022-01-12","55000",1,"55000"),
(0,5,4,5,"2022-01-11","60000",2,"120000"),
(0,4,5,4,"2022-01-10","200",4,"800"),
(0,7,6,7,"2022-01-9","100",3,"300"),
(0,8,7,8,"2022-01-8","50",2,"100"),
(0,10,8,10,"2022-01-7","112000",1,"112000"),
(0,9,9,9,"2022-01-6","200",5,"1000"),
(0,11,10,11,"2022-01-5","25000",3,"75000"),
(0,12,11,12,"2022-01-4","100",1,"100"),
(0,13,1,13,"2022-01-3","26000",2,"52000"),
(0,14,2,14,"2022-01-2","80000",1,"80000"),
(0,1,3,1,"2022-01-1","55000",1,"55000"),
(0,2,4,2,"2021-12-13","60000",1,"60000"),
(0,5,5,16,"2021-12-12","200",2,"400"),
(0,6,6,6,"2021-12-11","100",6,"600"),
(0,9,7,18,"2021-12-10","50",3,"150"),
(0,4,9,4,"2021-12-9","200",3,"600");
