SET NAMES UTF8;
DROP DATABASE IF EXISTS disney;
CREATE DATABASE disney CHARSET=utf8;
USE disney;
CREATE TABLE disney_user(
  uid   INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25) NOT NULL DEFAULT '',
  upwd  VARCHAR(32) NOT NULL DEFAULT ''
);
INSERT INTO disney_user VALUES(null,'tom','123');
INSERT INTO disney_user VALUES(null,'mary','123');
CREATE TABLE star_list(
  uid   INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(100) NOT NULL DEFAULT '',
  title  VARCHAR(32) NOT NULL DEFAULT ''
);
INSERT INTO star_list VALUES
(null,'img/character_01.jpg','赛车总动员'),
(null,'img/character_02.jpg','小公主苏菲亚'),
(null,'img/character_03.jpg','星球大战'),
(null,'img/character_04.jpg','冰雪奇缘'),
(null,'img/character_05.jpg','迪士尼公主'),
(null,'img/character_06.jpg','米奇和它的朋友们');
CREATE TABLE shopping_main(
  uid   INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(100) NOT NULL DEFAULT ''
);
INSERT INTO shopping_main VALUES
(null,'img/shopping_list01.jpg');
CREATE TABLE shopping_list(
  pid   INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(100) NOT NULL DEFAULT '',
  pname VARCHAR(50) NOT NULL DEFAULT '',
  price DOUBLE(10,2) NOT NULL DEFAULT 0
);
INSERT INTO shopping_list VALUES
(null,'img/shopping_list02.jpg','小白包(单肩)',167.00),
(null,'img/shopping_list03.jpg','小白包(双肩)',290.00),
(null,'img/shopping_list04.jpg','黑色主题皮夹',110.00),
(null,'img/shopping_list05.jpg','黑色主题旅行包',499.00);
CREATE TABLE msg_main(
  uid   INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(100) NOT NULL DEFAULT '',
  title  VARCHAR(50) NOT NULL DEFAULT '',
  content  VARCHAR(200) NOT NULL DEFAULT ''
);
INSERT INTO msg_main VALUES
(null,'img/info_list01.jpg','《加勒比海盗5》电影特展登陆广州','在海盗装扮区装扮成海盗与展区合照并上传朋友圈，就有机会获得电影限量礼品！广州的小伙伴们，520还不快约TA一起浪~');
CREATE TABLE msg_list(
  uid   INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(100) NOT NULL DEFAULT '',
  title  VARCHAR(50) NOT NULL DEFAULT '',
  content  VARCHAR(200) NOT NULL DEFAULT ''
);
INSERT INTO msg_list VALUES
(null,'img/info_list02.jpg','FOREO迪士尼系列限量联名款洁面仪正式首发啦！','首款珠圆玉润的FOREO LUNA play 米奇TSUM TSUM家族款洁面仪闪耀上市，Q萌的图案设计瞬间唤醒你的童心'),
(null,'img/info_list03.jpg','漫威复仇者联盟互动体验站”5月27日空降北京','cosplay最喜爱的角色，和钢铁侠、美国队长等人气角色并肩战斗，漫威粉丝怎么可以错过！'),
(null,'img/info_list03.jpg','漫威复仇者联盟互动体验站”5月27日空降北京','cosplay最喜爱的角色，和钢铁侠、美国队长等人气角色并肩战斗，漫威粉丝怎么可以错过！'),
(null,'img/info_list02.jpg','FOREO迪士尼系列限量联名款洁面仪正式首发啦！','首款珠圆玉润的FOREO LUNA play 米奇TSUM TSUM家族款洁面仪闪耀上市，Q萌的图案设计瞬间唤醒你的童心');
CREATE TABLE order_list(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(16),
    user_name VARCHAR(16),
    order_time LONG,
    addr VARCHAR(256),
    pid INT
);
INSERT INTO order_list(oid, phone,user_name,order_time,addr,pid) VALUES
(NULL,'13501234567','婷婷',1445154859209,'大钟寺中鼎B座',6),
(NULL,'13501234567','婷婷',1445254959209,'大钟寺中鼎B座',7),
(NULL,'13501234567','婷婷',1445354959209,'大钟寺中鼎B座',5);