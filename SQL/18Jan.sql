create database shoppingCart;

use shoppingCart;

drop table category;
create table category (
	category_id bigint auto_increment primary key,
    parent_id bigint,
    title varchar(75),
    meta_title varchar(100),
    slug varchar(100),
    content text,
    foreign key (parent_id) references category(category_id)
);

select * from user;
drop table user;
create table user (
	user_id bigint auto_increment primary key,
    first_name varchar(50),
    middle_name varchar(50),
    last_name varchar(50),
    mobile varchar(15),
    email varchar(50),
    password_hash varchar(32),
    admin tinyint,
    vendor tinyint,
    registeredAt datetime,
    lastLogin datetime,
    intro tinytext,
    profile text
);

create table cart(
	cart_id bigint auto_increment primary key,
    user_id bigint,
    session_id varchar(100),
    token varchar(100),
    status smallint,
    first_name varchar(50),
    middle_name varchar(50),
    last_name varchar(50),
    mobile varchar(15),
    email varchar(50),
    line1 varchar(50),
    line2 varchar(50),
    city varchar(50),
    province varchar(50),
    country varchar(50),
	createdAt datetime,
    updatedAt datetime,
	content text,
    foreign key (user_id) references user (user_id) on delete cascade
);


create table product (
	product_id bigint auto_increment primary key,
    user_id bigint,
    title varchar(75),
    meta_title varchar(100),				
    slug varchar(100),
    summary tinytext,
    type smallint,
    sku varchar(100),
    price float,
    discount float,
    quantity smallint,
    shop tinyint,
    createdAt datetime,
    updatedAt datetime,
    publishedAt datetime,
    startsAt datetime,
    endsAt datetime,
	content text,
	foreign key (user_id) references user (user_id) on delete cascade
);
select * from product
where updatedAt between 2 and 3;

alter table product
add unique key (sku);
 
create table cartItem (
	cartItem_id bigint auto_increment primary key,
    product_id bigint,
    cart_id bigint,
    sku varchar(100),
    price float,
    discount float,
    quantity smallint,
    active tinyint,
    createdAt datetime,
    updatedAt datetime,
    content text,
	foreign key (product_id) references product (product_id) on delete cascade,
	foreign key (cart_id) references cart (cart_id) on delete cascade
);

drop table orders;
CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY auto_increment,
    user_id BIGINT,
    session_id VARCHAR(100),
    token VARCHAR(100),
    status SMALLINT,
    sub_total FLOAT,
    item_Discount FLOAT,
    tax FLOAT,
    shipping FLOAT,
    total FLOAT,
    promo VARCHAR(50),
    discount FLOAT,
    grand_total FLOAT,
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    mobile VARCHAR(15),
    email VARCHAR(50),
    line1 VARCHAR(50),
    line2 VARCHAR(50),
    city VARCHAR(50),
    province VARCHAR(50),
    country VARCHAR(50),
    createdAt DATETIME,
    updatedAt DATETIME,
    content TEXT,
    FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE
);
select user_id, count(*) as orders_count from orders 
group by user_id;
select * from orders
where promo is not null;

drop table orderItem;
CREATE TABLE orderItem (
    orderItem_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT,
    order_id BIGINT,
    sku VARCHAR(100),
    price FLOAT,
    discount FLOAT,
    quantity SMALLINT,
    createdAt DATETIME,
    updatedAt DATETIME,
    content TEXT,
    FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE
);

drop table productReview;
create table productReview (
	productReview_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT,
	parent_id bigint,
    title varchar(100),
    rating smallint,
    published tinyint,
    createdAt datetime,
    publishedAt datetime,
    content text,
	FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
	FOREIGN KEY (parent_id) REFERENCES productReview (productReview_id) ON DELETE CASCADE
);

insert into productReview (product_id,parent_id,title)values
(1,1,"iphone 13"),
(2,1,"ipad"),
(3,1,"oneplus pro"),
(4,1,"lenovo s145"),
(6,1,"blue chair"),
(10,1,"less sharp knife"),
(8,1,"iphone 13"),
(1,2,"iphone 13"),
(1,3,"iphone 13"),
(2,2,"ipad"),
(4,2,"lenovo s145"),
(6,2,"blue chair");

select * from category 
where category_id in (select parent_id from category);
drop table transactions;
CREATE TABLE transactions (
    transaction_id BIGINT,
    user_id BIGINT,
    order_id BIGINT,
    code VARCHAR(100),
    type SMALLINT,
    mode SMALLINT,
    status SMALLINT,
    createdAt DATETIME,
    updatedAt DATETIME,
    content TEXT,
    FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE
);

CREATE TABLE tag (
    tag_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(75),
    meta_title VARCHAR(100),
    slug VARCHAR(100),
    content TEXT
);
select * from tag;

create table productTag(
	product_id bigint,
	tag_id bigint,
	foreign key (product_id) references product(product_id) on delete cascade,
	foreign key (tag_id) references tag(tag_id) on delete cascade
);

create table productMeta (
	productMeta_id BIGINT PRIMARY KEY AUTO_INCREMENT,
	product_id bigint,
    key1 varchar(50),
    content text,
	FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE
); 

CREATE TABLE productCategory (
    product_id BIGINT,
    category_id BIGINT,
    FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE
);

select * from category;

SET FOREIGN_KEY_CHECKS=0;
insert into category (category_id,title,parent_id,meta_title,slug,content) values 
(0,"Electronics",0,"include electronics items","a","capacitors, inductors, resistors, diodes, transistors"),
(0,"Non Electronics",0,"include non electronics items","b","there are many content in this"),
(0,"Mobile Phone",1,"include many types of mobiles","c","display, keypad, microphone, speaker, SIM card, battery"),
(0,"Laptop",1,"include many types of laptop","d","display screen, small speakers, a keyboard"),
(0,"TV",1,"include many types of TVs","e","news and current affairs, non-news and current affairs"),
(0,"Apple",3,"include many types of Apple phones","f","apple include mobile phones content"),
(0,"Apple",4,"include many types of Apple laptops","g","apple include laptop content"),
(0,"OnePlus",3,"include many types of OnePlus laptops","h","OnePlus include mobile phones content"),
(0,"Lenovo",4,"include many types of Lenovo laptops","i","Lenovo include laptop content"),
(0,"Sony",5,"include many types of sony tvs","j","sony include tv content"),
(0,"Chair",2,"include many type and color of chairs","k","wood, metal"),
(0,"Kichen War",2,"include many type of kichen war","l","it dependent to thing"),
(0,"Knife",12,"include many types of knifes","m","carbon steel, stainless steel, tool steel"),
(0,"Measuring Cups",12,"include many types of cups","n","sand, limestone, sodium carbonate"),
(0,"Bowls",12,"include many types of bowls","o","ceramic, metal, wood, plastic");

select * from category;







insert into user values 
(0,"pragati","A","sanepara","9595959595","pra@123","aaa",0,0,"2021-01-01 12:12:12","2022-01-01 01:12:12","I am a engineer1","Developer1"),
(0,"sid","B","buha","9494949494","nik@123","bbb",0,0,"2021-01-02 12:12:12","2022-01-02 01:12:12","I am a engineer2","Developer2"),
(0,"pari","C","bhuva","9393939393","pari@123","ccc",0,0,"2021-03-01 12:12:12","2022-03-01 01:12:12","I am a engineer3","Developer3"),
(0,"kisu","D","patel","9292929292","kisu@123","ddd",0,0,"2021-01-04 12:12:12","2022-01-02 01:12:12","I am a engineer4","Developer4"),
(0,"mitu","E","pokiya","9191919191","mitu@123","eee",0,0,"2021-01-05 12:12:12","2022-05-01 01:12:12","I am a engineer5","Developer5"),
(0,"ram","F","nimavat","9696969696","ram@123","fff",0,0,"2021-01-06 12:12:12","2022-01-04 01:12:12","I am a engineer6","Developer6"),
(0,"nam","G","suvagiya","9797979797","nam@123","ggg",0,0,"2021-01-07 12:12:12","2022-01-03 01:12:12","I am a engineer7","Developer7"),
(0,"riya","H","gosay","9898989898","riya@123","hhh",0,0,"2021-01-02 12:12:12","2022-01-05 01:12:12","I am a engineer8","Developer8"),
(0,"maya","I","baraliya","9999999999","maya@123","iii",0,0,"2021-01-08 12:12:12","2022-08-01 01:12:12","I am a engineer9","Developer9"),
(0,"chhaya","J","bavarva","1111111111","chhaya@123","jjj",0,0,"2021-01-09 12:12:12","2022-01-07 01:12:12","I am a engineer10","Developer10");


insert into cart values
(0,1,"101","201",0,"pragati","A","sanepara","9595959595","pra@123","ab","abc","amreli","kukavav","india","2021-01-02 12:12:12","2022-01-01 02:12:12","I am a engineer1 this is my cart"),
(0,2,"102","202",1,"sid","B","buha","9494949494","nik@123","ab","abc","bhavnagar","vadia","canda","2021-01-03 12:12:12","2022-01-02 02:12:12","I am a engineer2 this is my cart"),
(0,3,"103","203",0,"pari","C","bhuva","9393939393","pari@123","bc","bcd","ahemdabad","babra","pakistan","2021-03-02 12:12:12","2022-03-01 02:12:12","I am a engineer3 this is my cart"),
(0,4,"104","204",1,"kisu","D","patel","9292929292","kisu@123","cd","cde","morbi","morbi","nepal","2021-01-05 12:12:12","2022-01-02 02:12:12","I am a engineer4 this is my cart"),
(0,5,"105","205",0,"mitu","E","pokiya","9191919191","mitu@123","de","def","navsari","rajkot","bhtan","2021-01-06 12:12:12","2022-05-01 02:12:12","I am a engineer5 this is my cart"),
(0,6,"106","206",1,"ram","F","nimavat","9696969696","ram@123","ef","efg","derdi","devgam","usa","2021-01-07 12:12:12","2022-01-04 02:12:12","I am a engineer6 this is my cart"),
(0,7,"107","207",0,"nam","G","suvagiya","9797979797","nam@123","fg","fgh","lathi","matirala","india","2021-01-08 12:12:12","2022-01-03 02:12:12","I am a engineer7 this is my cart"),
(0,8,"108","208",1,"riya","H","gosay","9898989898","riya@123","gh","ghi","surat","swati","canada","2021-01-03 12:12:12","2022-01-05 02:12:12","I am a engineer8 this is my cart"),
(0,9,"109","209",0,"maya","I","baraliya","9999999999","maya@123","hi","hij","baroda","dhari","usa","2021-01-09 12:12:12","2022-08-01 02:12:12","I am a engineer9 this is my cart"),
(0,10,"110","210",1,"chhaya","J","bavarva","1111111111","chhaya@123","ij","ijk","keriya","pakistan","india","2021-01-10 12:12:12","2022-01-07 02:12:12","I am a engineer10 this is my cart");




insert into product values 
(0,1,"iphone 13","it is a model of Apple phone","z","more secure","10","901","120000","10000","1","5","2021-01-05 12:12:12","2021-02-05 12:12:12","2021-02-10 12:12:12","2021-02-11 12:12:12","2021-12-11 12:12:12","same centent as electronic item"),
(0,2,"ipad ","it is a model of Apple laptop","y","also secure","12","902","150000","15000","1","6","2021-02-05 12:12:12","2021-03-05 12:12:12","2021-03-10 12:12:12","2021-03-11 12:12:12","2021-12-12 12:12:12","same centent as electronic item"),
(0,3,"oneplus pro","it is a model of oneplus","x","less secure","13","903","30000","1000","2","7","2021-02-10 12:12:12","2021-03-05 12:12:12","2021-03-10 12:12:12","2021-03-11 12:12:12","2021-12-13 12:12:12","same centent as electronic item"),
(0,5,"lenovo s145","it is a model of lenovo","w"," also less secure","14","904","450000","2000","1","8","2021-01-10 12:12:12","2021-02-10 12:12:12","2021-02-15 12:12:12","2021-02-16 12:12:12","2021-12-14 12:12:12","same centent as electronic item"),
(0,7,"sony A1","it is a model of sony","v","big tv","15","905","60000","5000","1","9","2021-03-05 12:12:12","2021-04-05 12:12:12","2021-04-10 12:12:12","2021-04-11 12:12:12","2021-12-15 12:12:12","same centent as electronic item"),
(0,8,"blue chair","it is a type of chair","u","blue","16","906","200","20","4","10","2021-03-10 12:12:12","2021-04-10 12:12:12","2021-04-15 12:12:12","2021-04-19 12:12:12","2021-12-16 12:12:12","same centent as electronic item"),
(0,10," sharp knife","it is a type of knife","t","sharp","17","907","50","5","3","11","2021-04-05 12:12:12","2021-05-05 12:12:12","2021-05-10 12:12:12","2021-05-11 12:12:12","2021-12-17 12:12:12","same centent as electronic item"),
(0,1,"cup of glass","it is a tyoe of cup","s","glass","18","908","100","10","2","12","2021-04-10 12:12:12","2021-05-10 12:12:12","2021-05-15 12:12:12","2021-05-16 12:12:12","2021-12-18 12:12:12","same centent as electronic item"),
(0,5,"bowls of glass","it is a type of bowl","r","glass","19","909","150","15","6","13","2021-05-05 12:12:12","2021-06-05 12:12:12","2021-06-10 12:12:12","2021-06-11 12:12:12","2021-12-19 12:12:12","same centent as electronic item"),
(0,3,"less sharp knife","it is a type of knife","q","less sharp","20","910","40","4","2","14","2021-05-10 12:12:12","2021-06-10 12:12:12","2021-06-15 12:12:12","2021-06-16 12:12:12","2021-12-20 12:12:12","same centent as electronic item");
select * from cartItem;


insert into cartItem values 
(0,10,1,"801","40","4","1","1","2021-05-10 12:12:12","2021-06-10 12:12:12","wood"),
(0,8,2,"802","100","10","1","2","2021-05-10 12:12:12","2021-06-10 12:12:12","glass"),
(0,6,3,"803","200","20","1","3","2021-05-10 12:12:12","2021-06-10 12:12:12","wood"),
(0,4,4,"804","45000","2000","1","4","2021-05-10 12:12:12","2021-06-10 12:12:12","electronic"),
(0,2,5,"805","150000","15000","1","1","2021-05-10 12:12:12","2021-06-10 12:12:12","electronic"),
(0,1,6,"806","120000","10000","1","2","2021-05-10 12:12:12","2021-06-10 12:12:12","electronic"),
(0,5,7,"807","60000","5000","1","3","2021-05-10 12:12:12","2021-06-10 12:12:12","electronic"),
(0,8,2,"808","100","10","1","4","2021-05-10 12:12:12","2021-06-10 12:12:12","glass"),
(0,10,3,"809","40","4","1","1","2021-05-10 12:12:12","2021-06-10 12:12:12","wood"),
(0,4,5,"810","45000","2000","1","2","2021-05-10 12:12:12","2021-06-10 12:12:12","electronic");


insert into orders values 
(0,1,"101","201",0,"40","4","10","10","60","501","20","56","pragati","A","sanepara","9595959595","pra@123","ab","abc","amreli","kukavav","india","2021-01-02 12:12:12","2022-01-01 02:12:12","I am a engineer1 this is my cart"),
(0,2,"102","202",1,"100","10","10","10","120","502","10","110","sid","B","buha","9494949494","nik@123","ab","abc","bhavnagar","vadia","canda","2021-01-03 12:12:12","2022-01-02 02:12:12","I am a engineer2 this is my cart"),
(0,3,"103","203",0,"200","20","10","10","220","503","20","200","pari","C","bhuva","9393939393","pari@123","bc","bcd","ahemdabad","babra","pakistan","2021-03-02 12:12:12","2022-03-01 02:12:12","I am a engineer3 this is my cart"),
(0,4,"104","204",1,"45000","2000","100","10","45110","504","2000","43110","kisu","D","patel","9292929292","kisu@123","cd","cde","morbi","morbi","nepal","2021-01-05 12:12:12","2022-01-02 02:12:12","I am a engineer4 this is my cart"),
(0,5,"105","205",0,"150000","15000","100","10","150110","505","15100","134900","mitu","E","pokiya","9191919191","mitu@123","de","def","navsari","rajkot","bhtan","2021-01-06 12:12:12","2022-05-01 02:12:12","I am a engineer5 this is my cart"),
(0,6,"106","206",1,"120000","10000","100","10","120110","506","10000","110110","ram","F","nimavat","9696969696","ram@123","ef","efg","derdi","devgam","usa","2021-01-07 12:12:12","2022-01-04 02:12:12","I am a engineer6 this is my cart"),
(0,7,"107","207",0,"60000","5000","100","10","60110","507","5000","55110","nam","G","suvagiya","9797979797","nam@123","fg","fgh","lathi","matirala","india","2021-01-08 12:12:12","2022-01-03 02:12:12","I am a engineer7 this is my cart"),
(0,2,"108","208",1,"100","10","10","10","120","508","10","110","sid","B","buha","9494949494","nik@123","ab","abc","bhavnagar","vadia","canda","2021-01-03 12:12:12","2022-01-02 02:12:12","I am a engineer2 this is my cart"),
(0,3,"109","209",0,"40","4","4","10","54","509","4","50","pari","C","bhuva","9393939393","pari@123","bc","bcd","ahemdabad","babra","pakistan","2021-03-02 12:12:12","2022-03-01 02:12:12","I am a engineer3 this is my cart"),
(0,5,"110","210",1,"45000","2000","100","10","45110","510","2000","43110","mitu","E","pokiya","9191919191","mitu@123","de","def","navsari","rajkot","bhtan","2021-01-06 12:12:12","2022-05-01 02:12:12","I am a engineer5 this is my cart");
insert into orders values(0, '1', '108', '208', '1', '3500', '100', '10', '10', '4500', '508', '500', '4000', 'Yash', 'K', 'Ramanuj', '9574947065', 'abc@123', 'yk', 'hk', 'Jamnagar', 'Dhrol', 'India', '2021-01-19 12:12:12', '2021-01-08 12:12:12', 'This is my cart');

select * from orderItem;
   
insert into orderItem values
(0,9,1,"301","40","4","1","2021-01-02 12:12:12","2022-01-01 02:12:12","I am a engineer1 this is my cart"),
(0,8,2,"302","100","10","2","2021-01-03 12:12:12","2022-01-02 02:12:12","I am a engineer2 this is my cart"),
(0,6,3,"303","200","20","2","2021-03-02 12:12:12","2022-03-01 02:12:12","I am a engineer3 this is my cart"),
(0,4,4,"304","45000","2000","1","2021-01-05 12:12:12","2022-01-02 02:12:12","I am a engineer4 this is my cart"),
(0,4,5,"305","45000","2000","2","2021-01-06 12:12:12","2022-05-01 02:12:12","I am a engineer5 this is my cart"),
(0,1,6,"306","120000","10000","1","2021-01-07 12:12:12","2022-01-04 02:12:12","I am a engineer6 this is my cart"),
(0,5,7,"307","60000","5000","1","2021-01-08 12:12:12","2022-01-03 02:12:12","I am a engineer7 this is my cart");

insert into productcategory values(1,1),(1,3),(2,1),(2,4),(3,1),(3,3),(4,1),(5,1),(5,4),(5,3);

INSERT INTO producttag
VALUES (1,1),(1,2),(1,4),(2,1),(2,2),(2,4),(3,2),(3,4),(4,1),(5,4),(6,1),(6,4);

Select * from product where createdAt >= createdAt - INTERVAL 5 HOUR;
select * from  product where updatedAt >= DATE_SUB(NOW(),INTERVAL 2 HOUR);