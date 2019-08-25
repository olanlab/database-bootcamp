-- CREATE DATABASE
CREATE DATABASE OLEAGUE; 
CREATE DATABASE OLEAGUE CHARACTER SET utf8 COLLATE utf8_general_ci;

-- DELETE DATABASE
DROP DATABASE OLEAGUE;

-- USE DATABASE
USE OLEAGUE

-- CREATE TABLE
CREATE TABLE MATCHES (
  MATCH_ID INTEGER NOT NULL,
  TEAM_ID INTEGER NOT NULL,
  PLAYER_ID INTEGER NOT NULL,
  WON SMALLINT NOT NULL,
  LOST SMALLINT NOT NULL,
  PRIMARY KEY (MATCH_ID)
);

CREATE TABLE MEMBERS (
  PLAYER_ID INTEGER NOT NULL,
  EFFECTIVE_DATE DATE NOT NULL,
  EXPIRED_DATE DATE DEFAULT NULL,
  POSITION CHAR(20) DEFAULT NULL, 
  PRIMARY KEY (PLAYER_ID, EFFECTIVE_DATE)
);

CREATE TABLE PAYMENTS (
  PAYMENT_ID INTEGER NOT NULL,
  PLAYER_ID INTEGER NOT NULL,
  PAYMENT_DATE DATE NOT NULL,
  AMOUNT DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (PAYMENT_ID)
);

CREATE TABLE PLAYERS (
  PLAYER_ID INTEGER NOT NULL,
  FIRSTNAME CHAR(50) NOT NULL,
  LASTNAME CHAR(50) NOT NULL,
  BIRTH_DATE  DATE DEFAULT NULL,
  SEX CHAR(1) NOT NULL,
  JOINED SMALLINT NOT NULL,
  HOUSE_NO CHAR(50) DEFAULT NULL,
  STREET VARCHAR(100) NOT NULL,
  DISTRICT VARCHAR(100) DEFAULT NULL,
  AMPHUR VARCHAR(100) DEFAULT NULL,
  CITY VARCHAR(100) NOT NULL,
  ZIPCODE CHAR(10) DEFAULT NULL,
  TEL CHAR(20) DEFAULT NULL,
  LEAGUE_ID CHAR(4) DEFAULT NULL,
  PRIMARY KEY (PLAYER_ID)
);

CREATE TABLE TEAMS (
  TEAM_ID INTEGER NOT NULL,
  PLAYER_ID INTEGER NOT NULL,
  DIVISION CHAR(20) NOT NULL,
  PRIMARY KEY (TEAM_ID)
);

-- INSERT DATA
INSERT INTO MATCHES (MATCH_ID, TEAM_ID, PLAYER_ID, WON, LOST) VALUES
(1, 1, 6, 3, 1),
(2, 1, 6, 2, 3),
(3, 1, 6, 3, 0),
(4, 1, 44, 3, 2),
(5, 1, 83, 0, 3),
(6, 1, 2, 1, 3),
(7, 1, 57, 3, 0),
(8, 1, 8, 0, 3),
(9, 2, 27, 3, 2),
(10, 2, 104, 3, 2),
(11, 2, 112, 2, 3),
(12, 2, 112, 1, 3),
(13, 2, 8, 0, 3);

INSERT INTO MEMBERS (PLAYER_ID, EFFECTIVE_DATE, EXPIRED_DATE, POSITION) VALUES
(2, '2010-01-01', '2012-12-31', 'chairman'),
(2, '2014-01-01', NULL, 'member'),
(6, '2010-01-01', '2010-12-31', 'secretary'),
(6, '2011-01-01', '2012-12-31', 'member'),
(6, '2012-01-01', '2013-12-31', 'treasurer'),
(6, '2013-01-01', NULL, 'chairman'),
(8, '2010-01-01', '2010-12-31', 'treasurer'),
(8, '2011-01-01', '2011-12-31', 'secretary'),
(8, '2013-01-01', '2013-12-31', 'member'),
(8, '2014-01-01', NULL, 'member'),
(27, '2010-01-01', '2010-12-31', 'member'),
(27, '2011-01-01', '2011-12-31', 'treasurer'),
(27, '2013-01-01', '2013-12-31', 'treasurer'),
(57, '2012-01-01', '2012-12-31', 'secretary'),
(95, '2014-01-01', NULL, 'treasurer'),
(112, '2012-01-01', '2012-12-31', 'member'),
(112, '2014-01-01', NULL, 'secretary');

INSERT INTO PAYMENTS (PAYMENT_ID, PLAYER_ID, PAYMENT_DATE, AMOUNT) VALUES
(1, 6, '2010-12-08', '100.00'),
(2, 44, '2011-05-05', '75.00'),
(3, 27, '2013-09-10', '100.00'),
(4, 104, '2014-12-08', '50.00'),
(5, 44, '2010-12-08', '25.00'),
(6, 8, '2010-12-08', '25.00'),
(7, 44, '2012-12-30', '30.00'),
(8, 27, '2014-11-12', '75.00');

INSERT INTO PLAYERS (PLAYER_ID, FIRSTNAME, LASTNAME, BIRTH_DATE, SEX, JOINED, HOUSE_NO, STREET, DISTRICT, AMPHUR, CITY, ZIPCODE, TEL, LEAGUE_ID) VALUES
(2, 'olan', 'samritjiarapon', '1978-09-01', 'M', 2005, '11', 'Chaturathit Rd.', 'Bang Kapi', 'Huai Khwang', 'bangkok', '10310', '088-605-42XX', '2411'),
(6, 'jerry', 'red', '1994-06-25', 'M', 2007, '32', 'Ramkhamhaeng Rd.', 'Bang Kapi', 'Hua Mak', 'bangkok', '10240', '082-487-80XX', '8467'),
(7, 'mickey', 'mouse', '1993-05-11', 'M', 2011, '101', '', '', '', 'bangkok', '', '085-022-90XX', NULL),
(8, 'sofie', 'black', '1992-07-08', 'F', 2007, '29', 'Jira Rd.', 'Nai Mueang', 'Mueang Buri Ram', 'buriram', '31000', '086-011-76XX', '2983'),
(27, 'cordia', 'deva', '1994-12-28', 'F', 2008, '900', '', 'Tha Muang', 'Muang Chum', 'kanchanaburi', '71110', '081-661-00XX', '2513'),
(28, 'cordia', 'cee', '1993-06-22', 'F', 2013, '55', 'Si Racha-Nong Yai Bu Rd.', 'Surasak', 'Si Racha', 'chonburi', '20110', '089-221-98XX', NULL),
(39, 'bee', 'water', '1986-10-29', 'M', 2010, '21', 'Sukhumvit 101/1 Rd.', 'Bang Chak', 'Phra Khanong', 'bangkok', '10260', '096-899-42XX', NULL),
(44, 'joe', 'black', '1993-01-09', 'M', 2010, '65', '', '', '', 'buriram', '', '084-087-37XX', '1124'),
(57, 'brown', 'sugar', '2001-08-17', 'M', 2009, '77', 'Soi Wat Bang Nam Phueng Alley', 'Bang Nam Phueng', 'Phra Pradaeng', 'samutprakan', '10130', '081-908-99XX', '6409'),
(83, 'jame', 'miler', '1986-11-11', 'M', 2012, '77', '', '', '', 'bangkok', '', '081-496-12XX', '1608'),
(95, 'jim', 'white', '1993-05-14', 'M', 2002, '42', 'Karnjanavanit Road', 'Khao Rup Chang', 'Mueang Songkhla', 'songkhla', '90000', '082-771-00XX', NULL),
(100, 'ruzh', 'rider', '1993-02-28', 'M', 2009, '64', 'Soi Charoen Krung 23', 'Pom Prap', 'Pom Prap Sattru Phai', 'bangkok', '10100', '088-901-44XX', '6524'),
(104, 'bow', 'tk', '2000-05-10', 'F', 2014, '20', '', 'Tha Muang', 'Muang Chum', 'kanchanaburi', '71110', '085-123-62XX', '7060'),
(112, 'ann', 'ink', '1993-10-01', 'F', 2009, '4', 'Loi Kroh Rd', 'Chang Moi', 'Amphoe Mueang', 'chiang mai', '50100', '099-801-77XX', '1319');

INSERT INTO TEAMS (TEAM_ID, PLAYER_ID, DIVISION) VALUES
(1, 6, 'premier'),
(2, 27, 'championship');