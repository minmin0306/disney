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
(null,'img/character_01.jpg','�����ܶ�Ա'),
(null,'img/character_02.jpg','С�����շ���'),
(null,'img/character_03.jpg','�����ս'),
(null,'img/character_04.jpg','��ѩ��Ե'),
(null,'img/character_05.jpg','��ʿ�ṫ��'),
(null,'img/character_06.jpg','���������������');
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
(null,'img/shopping_list02.jpg','С�װ�(����)',167.00),
(null,'img/shopping_list03.jpg','С�װ�(˫��)',290.00),
(null,'img/shopping_list04.jpg','��ɫ����Ƥ��',110.00),
(null,'img/shopping_list05.jpg','��ɫ�������а�',499.00);
CREATE TABLE msg_main(
  uid   INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(100) NOT NULL DEFAULT '',
  title  VARCHAR(50) NOT NULL DEFAULT '',
  content  VARCHAR(200) NOT NULL DEFAULT ''
);
INSERT INTO msg_main VALUES
(null,'img/info_list01.jpg','�����ձȺ���5����Ӱ��չ��½����','�ں���װ����װ��ɺ�����չ�����ղ��ϴ�����Ȧ�����л����õ�Ӱ������Ʒ�����ݵ�С����ǣ�520������ԼTAһ����~');
CREATE TABLE msg_list(
  uid   INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(100) NOT NULL DEFAULT '',
  title  VARCHAR(50) NOT NULL DEFAULT '',
  content  VARCHAR(200) NOT NULL DEFAULT ''
);
INSERT INTO msg_list VALUES
(null,'img/info_list02.jpg','FOREO��ʿ��ϵ�������������������ʽ�׷�����','�׿���Բ�����FOREO LUNA play ����TSUM TSUM������������ҫ���У�Q�ȵ�ͼ�����˲�份�����ͯ��'),
(null,'img/info_list03.jpg','�������������˻�������վ��5��27�տս�����','cosplay��ϲ���Ľ�ɫ���͸������������ӳ���������ɫ����ս����������˿��ô���Դ����'),
(null,'img/info_list03.jpg','�������������˻�������վ��5��27�տս�����','cosplay��ϲ���Ľ�ɫ���͸������������ӳ���������ɫ����ս����������˿��ô���Դ����'),
(null,'img/info_list02.jpg','FOREO��ʿ��ϵ�������������������ʽ�׷�����','�׿���Բ�����FOREO LUNA play ����TSUM TSUM������������ҫ���У�Q�ȵ�ͼ�����˲�份�����ͯ��');
CREATE TABLE order_list(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(16),
    user_name VARCHAR(16),
    order_time LONG,
    addr VARCHAR(256),
    pid INT
);
INSERT INTO order_list(oid, phone,user_name,order_time,addr,pid) VALUES
(NULL,'13501234567','����',1445154859209,'�������ж�B��',6),
(NULL,'13501234567','����',1445254959209,'�������ж�B��',7),
(NULL,'13501234567','����',1445354959209,'�������ж�B��',5);