#Part2


--Name: Goh Soon Hing

--ID: 22488400

--create sample database
CREATE DATABASE OlympicGames_22488400;

--using database
USE OlympicGames_22488400;

--create Game Table
CREATE TABLE Games 
(
    GameID INT PRIMARY KEY NOT NULL,
    Year INT NOT NULL,
    Season VARCHAR(10) NOT NULL,
    City VARCHAR(50) NOT NULL
);

--create Event table
CREATE TABLE Event 
(
    EventID INT PRIMARY KEY NOT NULL,
    EventName VARCHAR(100) NOT NULL,
    Sport VARCHAR(50) NOT NULL,
    Discipline VARCHAR(50),
    Gender VARCHAR(10) NOT NULL,
    GameID INT NOT NULL,
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
);

--create Country table
CREATE TABLE Country 
(
    CountryCode CHAR(3) PRIMARY KEY NOT NULL,
    CountryName VARCHAR(50) NOT NULL
);

--create Participant table
CREATE TABLE Participant 
(
    ParticipantID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
    DateOfBirth DATE NOT NULL,
    CountryCode CHAR(3) NOT NULL,
    FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode)
);

--create Team table
CREATE TABLE Team 
(
    TeamID INT PRIMARY KEY NOT NULL,
    TeamName VARCHAR(100) NOT NULL,
    CountryCode CHAR(3) NOT NULL,
    FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode)
);

--create Participation table
CREATE TABLE Participation 
(
    ParticipationID INT PRIMARY KEY NOT NULL,
    EventID INT NOT NULL,
    ParticipantID INT,
    TeamID INT,
    Position INT,
    Result VARCHAR(50),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

--create Medal Table
CREATE TABLE Medal 
(
    MedalID INT PRIMARY KEY NOT NULL,
    MedalType VARCHAR(10) NOT NULL,
    EventID INT NOT NULL,
    ParticipantID INT,
    TeamID INT,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

--show tables
SHOW TABLES;

--insert data into Game table
INSERT INTO Games (GameID, Year, Season, City) VALUES
(1, 2020, 'Summer', 'Tokyo'),
(2, 2016, 'Summer', 'Rio de Janeiro'),
(3, 2012, 'Summer', 'London'),
(4, 2008, 'Summer', 'Beijing'),
(5, 2004, 'Summer', 'Athens'),
(6, 2000, 'Summer', 'Sydney'),
(7, 1996, 'Summer', 'Atlanta'),
(8, 1992, 'Summer', 'Barcelona'),
(9, 1988, 'Summer', 'Seoul'),
(10, 1984, 'Summer', 'Los Angeles'),
(11, 1980, 'Summer', 'Moscow'),
(12, 1976, 'Summer', 'Montreal'),
(13, 1972, 'Summer', 'Munich'),
(14, 1968, 'Summer', 'Mexico City'),
(15, 1964, 'Summer', 'Tokyo'),
(16, 1960, 'Summer', 'Rome'),
(17, 1956, 'Summer', 'Melbourne'),
(18, 1952, 'Summer', 'Helsinki'),
(19, 1948, 'Summer', 'London'),
(20, 1936, 'Summer', 'Berlin');

--verify inserted data
SELECT * FROM Games;

--insert sample data into Event table
INSERT INTO Event (EventID, EventName, Sport, Discipline, Gender, GameID) VALUES
(1, '100m Sprint', 'Athletics', 'Track', 'Men', 1),
(2, '200m Sprint', 'Athletics', 'Track', 'Women', 1),
(3, 'Long Jump', 'Athletics', 'Field', 'Men', 1),
(4, 'High Jump', 'Athletics', 'Field', 'Women', 1),
(5, '400m Relay', 'Athletics', 'Track', 'Men', 2),
(6, 'Marathon', 'Athletics', 'Long Distance', 'Women', 2),
(7, 'Javelin Throw', 'Athletics', 'Field', 'Men', 3),
(8, '800m', 'Athletics', 'Track', 'Women', 3),
(9, '100m Butterfly', 'Swimming', 'Butterfly', 'Men', 3),
(10, '200m Freestyle', 'Swimming', 'Freestyle', 'Women', 4),
(11, 'Diving', 'Aquatics', 'Springboard', 'Men', 4),
(12, 'Shooting', 'Shooting', 'Air Rifle', 'Women', 4),
(13, 'Cycling', 'Cycling', 'Road Race', 'Men', 5),
(14, 'Gymnastics', 'Gymnastics', 'Artistic', 'Women', 5),
(15, 'Tennis Singles', 'Tennis', 'Hard Court', 'Men', 5),
(16, 'Weightlifting', 'Weightlifting', 'Heavyweight', 'Men', 6),
(17, 'Boxing', 'Boxing', 'Lightweight', 'Men', 6),
(18, 'Archery', 'Archery', 'Recurve', 'Women', 7),
(19, 'Football Final', 'Football', 'Outdoor', 'Men', 7),
(20, 'Basketball Final', 'Basketball', 'Indoor', 'Women', 8);

--verify inserted data
SELECT * FROM Event;

--insert sample data into country table
INSERT INTO Country (CountryCode, CountryName) VALUES
('JAM', 'Jamaica'),
('USA', 'United States of America'),
('GBR', 'Great Britain'),
('RUS', 'Russia'),
('AUS', 'Australia'),
('KEN', 'Kenya'),
('BRA', 'Brazil'),
('ARG', 'Argentina'),
('SRB', 'Serbia'),
('ESP', 'Spain'),
('RSA', 'South Africa'),
('CHN', 'China'),
('JPN', 'Japan'),
('GER', 'Germany'),
('CAN', 'Canada'),
('FRA', 'France'),
('ITA', 'Italy'),
('FIN', 'Finland'),
('SWE', 'Sweden'),
('NOR', 'Norway');

--verify inserted data
SELECT * FROM Country;

--insert sample data into Participant table
INSERT INTO Participant (ParticipantID, FirstName, LastName, Gender, DateOfBirth, CountryCode) VALUES
(1, 'Michael', 'Smith', 'M', '1988-01-15', 'USA'),
(2, 'Jessica', 'Jones', 'F', '1990-02-22', 'GBR'),
(3, 'Robert', 'Johnson', 'M', '1989-03-12', 'BRA'),
(4, 'Sophia', 'Williams', 'F', '1994-04-05', 'ARG'),
(5, 'Liam', 'Brown', 'M', '1991-05-18', 'KEN'),
(6, 'Isabella', 'Davis', 'F', '1993-06-24', 'CHN'),
(7, 'Ethan', 'Miller', 'M', '1992-07-30', 'JPN'),
(8, 'Mia', 'Garcia', 'F', '1990-08-15', 'GER'),
(9, 'Noah', 'Martinez', 'M', '1991-09-10', 'CAN'),
(10, 'Olivia', 'Rodriguez', 'F', '1987-10-26', 'FRA'),
(11, 'William', 'Hernandez', 'M', '1994-11-11', 'ITA'),
(12, 'Emily', 'Lopez', 'F', '1992-12-22', 'FIN'),
(13, 'James', 'Wilson', 'M', '1988-01-20', 'SWE'),
(14, 'Ava', 'Anderson', 'F', '1993-02-19', 'NOR'),
(15, 'Benjamin', 'Thomas', 'M', '1990-03-29', 'USA'),
(16, 'Charlotte', 'Taylor', 'F', '1994-04-17', 'GBR'),
(17, 'Daniel', 'Moore', 'M', '1989-05-14', 'BRA'),
(18, 'Ella', 'Jackson', 'F', '1992-06-08', 'ARG'),
(19, 'Alexander', 'White', 'M', '1991-07-21', 'KEN'),
(20, 'Grace', 'Harris', 'F', '1993-08-27', 'CHN'),
(21, 'Liam', 'Martin', 'M', '1994-09-30', 'JPN'),
(22, 'Chloe', 'Thompson', 'F', '1986-10-12', 'GER'),
(23, 'Matthew', 'Garcia', 'M', '1990-11-03', 'CAN'),
(24, 'Sofia', 'Martinez', 'F', '1992-12-01', 'FRA'),
(25, 'Jackson', 'Rodriguez', 'M', '1994-01-18', 'ITA'),
(26, 'Mila', 'Lewis', 'F', '1987-02-14', 'FIN'),
(27, 'Lucas', 'Lee', 'M', '1993-03-11', 'SWE'),
(28, 'Zoe', 'Walker', 'F', '1991-04-25', 'NOR'),
(29, 'Aiden', 'Hall', 'M', '1989-05-07', 'USA'),
(30, 'Emma', 'Young', 'F', '1990-06-20', 'GBR'),
(31, 'Nathan', 'Allen', 'M', '1992-07-22', 'BRA'),
(32, 'Madison', 'King', 'F', '1994-08-19', 'ARG'),
(33, 'Henry', 'Wright', 'M', '1986-09-15', 'KEN'),
(34, 'Abigail', 'Scott', 'F', '1993-10-27', 'CHN'),
(35, 'Isaac', 'Green', 'M', '1991-11-30', 'JPN'),
(36, 'Aria', 'Adams', 'F', '1992-12-05', 'GER'),
(37, 'Samuel', 'Baker', 'M', '1988-01-12', 'CAN'),
(38, 'Ella', 'Gonzalez', 'F', '1990-02-23', 'FRA'),
(39, 'Daniel', 'Nelson', 'M', '1994-03-14', 'ITA'),
(40, 'Victoria', 'Carter', 'F', '1991-04-30', 'FIN'),
(41, 'Mason', 'Mitchell', 'M', '1993-05-28', 'SWE'),
(42, 'Scarlett', 'Perez', 'F', '1987-06-15', 'NOR'),
(43, 'Oliver', 'Roberts', 'M', '1994-07-21', 'USA'),
(44, 'Emily', 'Turner', 'F', '1992-08-17', 'GBR'),
(45, 'James', 'Phillips', 'M', '1990-09-09', 'BRA'),
(46, 'Lily', 'Campbell', 'F', '1988-10-30', 'ARG'),
(47, 'Lucas', 'Parker', 'M', '1991-11-20', 'KEN'),
(48, 'Sophia', 'Evans', 'F', '1994-12-25', 'CHN'),
(49, 'Henry', 'Edwards', 'M', '1989-01-16', 'JPN'),
(50, 'Ava', 'Collins', 'F', '1993-02-22', 'GER'),
(51, 'Mason', 'Stewart', 'M', '1990-03-27', 'CAN'),
(52, 'Mia', 'Sanchez', 'F', '1991-04-12', 'FRA'),
(53, 'Isaac', 'Morris', 'M', '1988-05-05', 'ITA'),
(54, 'Chloe', 'Rogers', 'F', '1994-06-14', 'FIN'),
(55, 'Jackson', 'Reed', 'M', '1992-07-08', 'SWE'),
(56, 'Zoe', 'Cook', 'F', '1990-08-25', 'NOR'),
(57, 'Ethan', 'Morgan', 'M', '1993-09-30', 'USA'),
(58, 'Sofia', 'Bell', 'F', '1991-10-03', 'GBR'),
(59, 'Lucas', 'Murphy', 'M', '1989-11-16', 'BRA'),
(60, 'Madison', 'Cooper', 'F', '1994-12-02', 'ARG'),
(61, 'Liam', 'Ward', 'M', '1990-01-24', 'KEN'),
(62, 'Emily', 'Richardson', 'F', '1992-02-27', 'CHN'),
(63, 'Isaac', 'Watson', 'M', '1987-03-18', 'JPN'),
(64, 'Charlotte', 'Brooks', 'F', '1991-04-10', 'GER'),
(65, 'James', 'James', 'M', '1989-05-27', 'CAN'),
(66, 'Abigail', 'Wood', 'F', '1993-06-12', 'FRA'),
(67, 'Jackson', 'Bennett', 'M', '1990-07-22', 'ITA'),
(68, 'Grace', 'Gray', 'F', '1991-08-30', 'FIN'),
(69, 'Oliver', 'Hughes', 'M', '1994-09-14', 'SWE'),
(70, 'Chloe', 'Price', 'F', '1986-10-19', 'NOR'),
(71, 'Liam', 'Powell', 'M', '1994-11-21', 'USA'),
(72, 'Sophia', 'Long', 'F', '1990-12-03', 'GBR'),
(73, 'Ethan', 'Perry', 'M', '1992-01-30', 'BRA'),
(74, 'Ava', 'Russell', 'F', '1991-02-14', 'ARG'),
(75, 'Benjamin', 'Sullivan', 'M', '1988-03-12', 'KEN'),
(76, 'Mia', 'Bell', 'F', '1993-04-28', 'CHN'),
(77, 'Isaac', 'Garrett', 'M', '1990-05-30', 'JPN'),
(78, 'Olivia', 'Alexander', 'F', '1991-06-18', 'GER'),
(79, 'Jackson', 'Foster', 'M', '1986-07-08', 'CAN'),
(80, 'Sophia', 'Ward', 'F', '1994-08-20', 'FRA'),
(81, 'Daniel', 'Harrison', 'M', '1992-09-05', 'ITA'),
(82, 'Emily', 'Jenkins', 'F', '1991-10-25', 'FIN'),
(83, 'Liam', 'Shaw', 'M', '1994-11-15', 'SWE'),
(84, 'Chloe', 'Curtis', 'F', '1987-12-12', 'NOR'),
(85, 'Noah', 'Holland', 'M', '1990-01-19', 'USA'),
(86, 'Grace', 'Little', 'F', '1993-02-09', 'GBR'),
(87, 'James', 'Barker', 'M', '1988-03-07', 'BRA'),
(88, 'Sofia', 'Sims', 'F', '1994-04-23', 'ARG'),
(89, 'Isaac', 'George', 'M', '1991-05-18', 'KEN'),
(90, 'Mia', 'Hudson', 'F', '1992-06-10', 'CHN'),
(91, 'Benjamin', 'Woods', 'M', '1990-07-29', 'JPN'),
(92, 'Ava', 'Mason', 'F', '1993-08-15', 'GER'),
(93, 'Jackson', 'Holmes', 'M', '1986-09-23', 'CAN'),
(94, 'Olivia', 'Ryan', 'F', '1991-10-05', 'FRA'),
(95, 'Ethan', 'Griffiths', 'M', '1992-11-16', 'ITA'),
(96, 'Emily', 'Hunter', 'F', '1994-12-07', 'FIN'),
(97, 'Daniel', 'Reid', 'M', '1990-01-13', 'SWE'),
(98, 'Charlotte', 'Hawkins', 'F', '1993-02-02', 'NOR'),
(99, 'Liam', 'Fox', 'M', '1989-03-18', 'USA'),
(100, 'Mia', 'Burton', 'F', '1994-04-28', 'GBR'),
(101, 'Oliver', 'Lynch', 'M', '1991-05-12', 'BRA'),
(102, 'Zoe', 'Page', 'F', '1992-06-14', 'ARG'),
(103, 'Lucas', 'Butler', 'M', '1986-07-22', 'KEN'),
(104, 'Sofia', 'Carter', 'F', '1994-08-29', 'CHN'),
(105, 'Ethan', 'Stanley', 'M', '1990-09-17', 'JPN'),
(106, 'Chloe', 'Duncan', 'F', '1993-10-24', 'GER'),
(107, 'Benjamin', 'Harrison', 'M', '1991-11-09', 'CAN'),
(108, 'Mila', 'Fox', 'F', '1988-12-03', 'FRA'),
(109, 'Liam', 'Nelson', 'M', '1994-01-28', 'ITA'),
(110, 'Ella', 'Murray', 'F', '1992-02-19', 'FIN'),
(111, 'James', 'Scott', 'M', '1991-03-16', 'SWE'),
(112, 'Olivia', 'Hughes', 'F', '1990-04-10', 'NOR'),
(113, 'Noah', 'Miller', 'M', '1993-05-15', 'USA'),
(114, 'Abigail', 'Ward', 'F', '1991-06-07', 'GBR'),
(115, 'Liam', 'Ross', 'M', '1994-07-01', 'BRA'),
(116, 'Sophia', 'James', 'F', '1992-08-22', 'ARG'),
(117, 'Lucas', 'Turner', 'M', '1988-09-18', 'KEN'),
(118, 'Zoe', 'Carter', 'F', '1994-10-30', 'CHN'),
(119, 'Ethan', 'Stevens', 'M', '1991-11-25', 'JPN'),
(120, 'Chloe', 'Reed', 'F', '1993-12-22', 'GER'),
(121, 'Benjamin', 'Bennett', 'M', '1990-01-14', 'CAN'),
(122, 'Mia', 'Cook', 'F', '1986-02-20', 'FRA'),
(123, 'Daniel', 'Scott', 'M', '1994-03-11', 'ITA'),
(124, 'Emily', 'Evans', 'F', '1992-04-24', 'FIN'),
(125, 'Jackson', 'Fisher', 'M', '1991-05-19', 'SWE'),
(126, 'Sophia', 'Morris', 'F', '1990-06-10', 'NOR'),
(127, 'Liam', 'Perry', 'M', '1993-07-26', 'USA'),
(128, 'Ava', 'Long', 'F', '1991-08-14', 'GBR'),
(129, 'Isaac', 'Cooper', 'M', '1988-09-09', 'BRA'),
(130, 'Mia', 'Reynolds', 'F', '1994-10-27', 'ARG'),
(131, 'Ethan', 'Murphy', 'M', '1990-11-02', 'KEN'),
(132, 'Emily', 'Howard', 'F', '1993-12-15', 'CHN'),
(133, 'Noah', 'Watson', 'M', '1991-01-24', 'JPN'),
(134, 'Olivia', 'Hughes', 'F', '1992-02-11', 'GER'),
(135, 'Lucas', 'Baker', 'M', '1986-03-28', 'CAN'),
(136, 'Zoe', 'Price', 'F', '1994-04-14', 'FRA'),
(137, 'Daniel', 'Harris', 'M', '1990-05-12', 'ITA'),
(138, 'Sofia', 'Clark', 'F', '1991-06-09', 'FIN'),
(139, 'Jackson', 'Rodriguez', 'M', '1993-07-07', 'SWE'),
(140, 'Chloe', 'Cook', 'F', '1988-08-03', 'NOR'),
(141, 'Ethan', 'Morgan', 'M', '1994-09-20', 'USA'),
(142, 'Mia', 'Bell', 'F', '1992-10-15', 'GBR'),
(143, 'James', 'Brooks', 'M', '1990-11-01', 'BRA'),
(144, 'Emily', 'Mitchell', 'F', '1986-12-30', 'ARG'),
(145, 'Lucas', 'Wright', 'M', '1991-01-18', 'KEN'),
(146, 'Ava', 'Scott', 'F', '1993-02-24', 'CHN'),
(147, 'Isaac', 'Adams', 'M', '1994-03-13', 'JPN'),
(148, 'Sofia', 'James', 'F', '1990-04-29', 'GER'),
(149, 'Liam', 'Parker', 'M', '1988-05-05', 'CAN'),
(150, 'Zoe', 'Gonzalez', 'F', '1991-06-14', 'FRA'),
(151, 'Jackson', 'Martinez', 'M', '1993-07-02', 'ITA'),
(152, 'Chloe', 'Clark', 'F', '1994-08-15', 'FIN'),
(153, 'Ethan', 'Lewis', 'M', '1986-09-18', 'SWE'),
(154, 'Olivia', 'Hill', 'F', '1991-10-22', 'NOR'),
(155, 'Noah', 'Young', 'M', '1994-11-30', 'USA'),
(156, 'Mia', 'Anderson', 'F', '1992-12-03', 'GBR'),
(157, 'Liam', 'Wood', 'M', '1988-01-10', 'BRA'),
(158, 'Sofia', 'Roberts', 'F', '1991-02-15', 'ARG'),
(159, 'Isaac', 'Scott', 'M', '1994-03-29', 'KEN'),
(160, 'Chloe', 'Thompson', 'F', '1990-04-11', 'CHN'),
(161, 'Ethan', 'Nelson', 'M', '1991-05-23', 'JPN'),
(162, 'Olivia', 'Hughes', 'F', '1992-06-29', 'GER'),
(163, 'Jackson', 'Rivera', 'M', '1986-07-19', 'CAN'),
(164, 'Zoe', 'Ward', 'F', '1993-08-25', 'FRA'),
(165, 'Daniel', 'Cook', 'M', '1991-09-14', 'ITA'),
(166, 'Sofia', 'Morris', 'F', '1990-10-18', 'FIN'),
(167, 'Ethan', 'Harrison', 'M', '1994-11-01', 'SWE'),
(168, 'Chloe', 'Hall', 'F', '1988-12-23', 'NOR'),
(169, 'Noah', 'Phillips', 'M', '1992-01-30', 'USA'),
(170, 'Mia', 'Bennett', 'F', '1993-02-16', 'GBR'),
(171, 'Liam', 'Bailey', 'M', '1994-03-26', 'BRA'),
(172, 'Ava', 'Hughes', 'F', '1990-04-15', 'ARG'),
(173, 'Jackson', 'Cook', 'M', '1986-05-22', 'KEN'),
(174, 'Sofia', 'Parker', 'F', '1991-06-08', 'CHN'),
(175, 'Ethan', 'Mitchell', 'M', '1994-07-05', 'JPN'),
(176, 'Chloe', 'Gonzalez', 'F', '1992-08-11', 'GER'),
(177, 'Isaac', 'Torres', 'M', '1990-09-29', 'CAN'),
(178, 'Emily', 'Roberts', 'F', '1988-10-30', 'FRA'),
(179, 'Daniel', 'Brooks', 'M', '1993-11-21', 'ITA'),
(180, 'Zoe', 'Collins', 'F', '1991-12-14', 'FIN'),
(181, 'Noah', 'Ward', 'M', '1986-01-05', 'SWE'),
(182, 'Ava', 'Morris', 'F', '1992-02-20', 'NOR'),
(183, 'Liam', 'Richardson', 'M', '1994-03-17', 'USA'),
(184, 'Emily', 'Scott', 'F', '1990-04-12', 'GBR'),
(185, 'Benjamin', 'Young', 'M', '1988-05-21', 'BRA'),
(186, 'Sofia', 'Clark', 'F', '1991-06-30', 'ARG'),
(187, 'Ethan', 'Harris', 'M', '1993-07-25', 'KEN'),
(188, 'Chloe', 'Adams', 'F', '1990-08-19', 'CHN'),
(189, 'Jackson', 'Baker', 'M', '1994-09-10', 'JPN'),
(190, 'Mia', 'Jones', 'F', '1992-10-14', 'GER'),
(191, 'Lucas', 'Thompson', 'M', '1986-11-02', 'CAN'),
(192, 'Zoe', 'Lee', 'F', '1990-12-27', 'FRA'),
(193, 'Daniel', 'White', 'M', '1993-01-23', 'ITA'),
(194, 'Chloe', 'Hughes', 'F', '1991-02-28', 'FIN'),
(195, 'Liam', 'Wright', 'M', '1988-03-11', 'SWE'),
(196, 'Sofia', 'Green', 'F', '1994-04-09', 'NOR'),
(197, 'Noah', 'Hill', 'M', '1992-05-15', 'USA'),
(198, 'Emily', 'Robinson', 'F', '1993-06-22', 'GBR'),
(199, 'Ethan', 'Lopez', 'M', '1991-07-29', 'BRA'),
(200, 'Mia', 'Hall', 'F', '1987-08-31', 'ARG'),
(201, 'Jackson', 'Scott', 'M', '1994-09-23', 'KEN'),
(202, 'Chloe', 'Morris', 'F', '1990-10-12', 'CHN'),
(203, 'Lucas', 'Perez', 'M', '1989-11-28', 'JPN'),
(204, 'Zoe', 'Clark', 'F', '1992-12-19', 'GER'),
(205, 'Benjamin', 'Lewis', 'M', '1986-01-25', 'CAN'),
(206, 'Olivia', 'Rodriguez', 'F', '1993-02-18', 'FRA'),
(207, 'Ethan', 'Kim', 'M', '1991-03-15', 'ITA'),
(208, 'Sofia', 'Yang', 'F', '1994-04-02', 'FIN'),
(209, 'Daniel', 'Nguyen', 'M', '1990-05-09', 'SWE'),
(210, 'Ava', 'Martinez', 'F', '1988-06-20', 'NOR'),
(211, 'Liam', 'Garcia', 'M', '1994-07-25', 'USA'),
(212, 'Mia', 'Lopez', 'F', '1992-08-17', 'GBR'),
(213, 'Jackson', 'Johnson', 'M', '1993-09-15', 'BRA'),
(214, 'Zoe', 'Hernandez', 'F', '1991-10-11', 'ARG'),
(215, 'Lucas', 'Smith', 'M', '1988-11-07', 'KEN'),
(216, 'Chloe', 'Martinez', 'F', '1994-12-02', 'CHN'),
(217, 'Noah', 'Lopez', 'M', '1990-01-30', 'JPN'),
(218, 'Ava', 'Gonzalez', 'F', '1993-02-14', 'GER'),
(219, 'Ethan', 'Johnson', 'M', '1992-03-22', 'CAN'),
(220, 'Mia', 'Robinson', 'F', '1986-04-28', 'FRA'),
(221, 'Daniel', 'Smith', 'M', '1993-05-19', 'ITA'),
(222, 'Emily', 'Davis', 'F', '1991-06-15', 'FIN'),
(223, 'Jackson', 'Moore', 'M', '1994-07-04', 'SWE'),
(224, 'Sofia', 'Anderson', 'F', '1990-08-12', 'NOR'),
(225, 'Liam', 'Harris', 'M', '1987-09-30', 'USA'),
(226, 'Zoe', 'White', 'F', '1994-10-29', 'GBR'),
(227, 'Isaac', 'Scott', 'M', '1992-11-10', 'BRA'),
(228, 'Chloe', 'Clark', 'F', '1993-12-03', 'ARG'),
(229, 'Ethan', 'Taylor', 'M', '1990-01-23', 'KEN'),
(230, 'Olivia', 'Rodriguez', 'F', '1988-02-15', 'CHN'),
(231, 'Benjamin', 'Lee', 'M', '1994-03-09', 'JPN'),
(232, 'Ava', 'Hall', 'F', '1991-04-28', 'GER'),
(233, 'Daniel', 'Lopez', 'M', '1987-05-31', 'CAN'),
(234, 'Emily', 'Young', 'F', '1993-06-20', 'FRA'),
(235, 'Liam', 'King', 'M', '1992-07-19', 'ITA'),
(236, 'Sofia', 'Evans', 'F', '1989-08-27', 'FIN'),
(237, 'Noah', 'Nelson', 'M', '1994-09-14', 'SWE'),
(238, 'Mia', 'Hall', 'F', '1991-10-22', 'NOR'),
(239, 'Isaac', 'Green', 'M', '1993-11-30', 'USA'),
(240, 'Chloe', 'Garcia', 'F', '1988-12-15', 'GBR'),
(241, 'Liam', 'Martin', 'M', '1992-01-17', 'BRA'),
(242, 'Zoe', 'Thompson', 'F', '1993-02-26', 'ARG'),
(243, 'Ethan', 'Lewis', 'M', '1990-03-15', 'KEN'),
(244, 'Olivia', 'Jackson', 'F', '1986-04-11', 'CHN'),
(245, 'Daniel', 'Martinez', 'M', '1993-05-07', 'JPN'),
(246, 'Sofia', 'Wright', 'F', '1991-06-02', 'GER'),
(247, 'Liam', 'Clark', 'M', '1994-07-30', 'CAN'),
(248, 'Emily', 'Lee', 'F', '1988-08-14', 'FRA'),
(249, 'Noah', 'Davis', 'M', '1990-09-05', 'ITA'),
(250, 'Ava', 'Hernandez', 'F', '1993-10-21', 'FIN');

--verify inserted data
SELECT * FROM Participant;

--insert sample data into Team table
INSERT INTO Team (TeamID, TeamName, CountryCode) VALUES
(1, 'Jamaica Sprint Team', 'JAM'),
(2, 'USA Track Team', 'USA'),
(3, 'Great Britain Marathon Team', 'GBR'),
(4, 'Russia Pole Vault Team', 'RUS'),
(5, 'Australia Relay Team', 'AUS'),
(6, 'Kenya Marathon Team', 'KEN'),
(7, 'Brazil Football Team', 'BRA'),
(8, 'Argentina Football Team', 'ARG'),
(9, 'Serbia Tennis Team', 'SRB'),
(10, 'USA Gymnastics Team', 'USA'),
(11, 'USA Swimming Team', 'USA'),
(12, 'Jamaica Relay Team', 'JAM'),
(13, 'Finland Distance Team', 'FIN'),
(14, 'South Africa Rugby Team', 'RSA'),
(15, 'Germany Cycling Team', 'GER'),
(16, 'France Basketball Team', 'FRA'),
(17, 'Italy Volleyball Team', 'ITA'),
(18, 'Japan Judo Team', 'JPN'),
(19, 'Spain Basketball Team', 'ESP'),
(20, 'Norway Ski Team', 'NOR');

--verify inserted data
SELECT * FROM Team;


--insert sample data into participation table
INSERT INTO Participation (ParticipationID, EventID, ParticipantID, TeamID, Position, Result) VALUES
(1, 1, 1, 12, 1, '9.58s'),
(2, 2, 2, 2, 1, '21.5s'),
(3, 3, 3, 11, 1, '4:03.84'),
(4, 4, 4, 3, 1, '2:05:11'),
(5, 5, 5, 10, 1, '58.68'),
(6, 6, 6, 4, 1, '5.05m'),
(7, 7, 7, 5, 1, '42.2s'),
(8, 8, 8, 6, 1, '2:01:39'),
(9, 9, 9, 7, 2, '2-1'),
(10, 10, 10, 10, 1, '58.68'),
(11, 11, 11, 8, 2, '1-0'),
(12, 12, 12, 9, 1, '3 sets'),
(13, 13, 13, 10, 1, '59.5s'),
(14, 14, 14, NULL, 2, '3 sets'),
(15, 15, 15, NULL, 1, '4:05'),
(16, 16, 16, NULL, 1, '43.18s'),
(17, 17, 17, NULL, 1, '2:00:00'),
(18, 18, 18, 2, 1, '21.6s'),
(19, 19, 19, NULL, 1, '9.8s'),
(20, 20, 20, 13, 1, '2:01');

--verify inserted data
SELECT * FROM Participation;

--insert sample data into medal table
INSERT INTO Medal (MedalID, MedalType, EventID, ParticipantID, TeamID) VALUES
(1, 'Gold', 1, 1, 12),
(2, 'Silver', 2, 2, 2),
(3, 'Gold', 3, 3, 11),
(4, 'Gold', 4, 4, 3),
(5, 'Gold', 5, 5, 10),
(6, 'Gold', 6, 6, 4),
(7, 'Gold', 7, 7, 5),
(8, 'Gold', 8, 8, 6),
(9, 'Gold', 9, 9, 7),
(10, 'Gold', 10, 10, 10),
(11, 'Silver', 11, 11, 8),
(12, 'Gold', 12, 12, 9),
(13, 'Gold', 13, 13, 10),
(14, 'Silver', 14, 14, NULL),
(15, 'Gold', 15, 15, NULL),
(16, 'Gold', 16, 16, NULL),
(17, 'Gold', 17, 17, NULL),
(18, 'Gold', 18, 18, 2),
(19, 'Gold', 19, 19, NULL),
(20, 'Gold', 20, 20, 13);


--verify inserted data
SELECT * FROM Medal;

