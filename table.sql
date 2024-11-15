
CREATE DATABASE FIFA;

USE FIFA;

CREATE TABLE Country(
	  SNo INT AUTO_INCREMENT NOT NULL,
    Team VARCHAR(20) NOT NULL,
	  Tournament_Participated INT NOT NULL,
    Played INT NOT NULL,
    Win INT NOT NULL,
    Draw INT NOT NULL,
    Loss INT NOT NULL,
    Goal_For INT NOT NULL,
    Goal_Against INT NOT NULL,
    Goal_Difference INT NOT NULL,
    Points INT NOT NULL,
    Titles INT NOT NULL,
    UNIQUE(SNo,Team)
);


CREATE TABLE Player(
	  SNo INT AUTO_INCREMENT NOT NULL,
    Player_Name VARCHAR(20) NOT NULL,
    Country VARCHAR(20) NOT NULL,
    Goal INT NOT NULL,
    Assist INT NOT NULL,
    Apperences INT NOT NULL,
    UNIQUE(SNo,Player_Name)
);


INSERT INTO Country VALUES
  (1, 'Brazil', 22, 114, 76, 19, 19, 237, 108, 129, 247, 5),
  (2, 'Germany', 20, 112, 68, 21, 23, 232, 130, 102, 225, 4),
  (3, 'Argentina', 18, 88, 47, 17, 24, 152, 101, 51, 158, 3),
  (4, 'Italy', 18, 83, 45, 21, 17, 128, 77, 51, 156, 4),
  (5, 'France', 16, 73, 39, 14, 20, 136, 85, 51, 131, 2),
  (6, 'England', 16, 74, 32, 22, 20, 104, 68, 36, 118, 1),
  (7, 'Spain', 16, 67, 31, 17, 19, 108, 75, 33, 110, 1),
  (8, 'Netherlands', 11, 55, 30, 14, 11, 96, 52, 44, 104, 0),
  (9, 'Uruguay', 14, 59, 25, 13, 21, 89, 76, 13, 88, 2),
  (10, 'Belgium', 14, 51, 21, 10, 20, 69, 74, -5, 73, 0);
