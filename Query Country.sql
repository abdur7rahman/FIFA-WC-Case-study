
-- 1.Summarize the FIFA World Cup performance data for each country.

 SELECT * FROM Country;

+-----+-------------+-------------------------+--------+-----+------+------+----------+--------------+-----------------+--------+--------+
| SNo | Team        | Tournament_Participated | Played | Win | Draw | Loss | Goal_For | Goal_Against | Goal_Difference | Points | Titles |
+-----+-------------+-------------------------+--------+-----+------+------+----------+--------------+-----------------+--------+--------+
|   1 | Brazil      |                      22 |    114 |  76 |   19 |   19 |      237 |          108 |             129 |    247 |      5 |
|   2 | Germany     |                      20 |    112 |  68 |   21 |   23 |      232 |          130 |             102 |    225 |      4 |
|   3 | Argentina   |                      18 |     88 |  47 |   17 |   24 |      152 |          101 |              51 |    158 |      3 |
|   4 | Italy       |                      18 |     83 |  45 |   21 |   17 |      128 |           77 |              51 |    156 |      4 |
|   5 | France      |                      16 |     73 |  39 |   14 |   20 |      136 |           85 |              51 |    131 |      2 |
|   6 | England     |                      16 |     74 |  32 |   22 |   20 |      104 |           68 |              36 |    118 |      1 |
|   7 | Spain       |                      16 |     67 |  31 |   17 |   19 |      108 |           75 |              33 |    110 |      1 |
|   8 | Netherlands |                      11 |     55 |  30 |   14 |   11 |       96 |           52 |              44 |    104 |      0 |
|   9 | Uruguay     |                      14 |     59 |  25 |   13 |   21 |       89 |           76 |              13 |     88 |      2 |
|  10 | Belgium     |                      14 |     51 |  21 |   10 |   20 |       69 |           74 |              -5 |     73 |      0 |
+-----+-------------+-------------------------+--------+-----+------+------+----------+--------------+-----------------+--------+--------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
-- 2.Which are the top five teams in FIFA World Cup history based on points and titles?
 
SELECT SNo AS Rank, Team, Points, Titles
FROM Country
LIMIT 5;

+------+-----------+--------+--------+
| Rank | Team      | Points | Titles |
+------+-----------+--------+--------+
|    1 | Brazil    |    247 |      5 |
|    2 | Germany   |    225 |      4 |
|    3 | Argentina |    158 |      3 |
|    4 | Italy     |    156 |      4 |
|    5 | France    |    131 |      2 |
+------+-----------+--------+--------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3.Which team has won the most FIFA World Cup titles?
 
SELECT Team, MAX(Titles) AS Most_Title_Team 
FROM Country 
GROUP BY Team 
LIMIT 1;

+--------+-----------------+
| Team   | Most_Title_Team |
+--------+-----------------+
| Brazil |               5 |
+--------+-----------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4.List all teams that have won at least one FIFA World Cup?
 
SELECT Team, Titles 
FROM Country 
WHERE Titles > 0 
ORDER BY Titles DESC;
+-----------+--------+
| Team      | Titles |
+-----------+--------+
| Brazil    |      5 |
| Germany   |      4 |
| Italy     |      4 |
| Argentina |      3 |
| France    |      2 |
| Uruguay   |      2 |
| England   |      1 |
| Spain     |      1 |
+-----------+--------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5.Which are the top five teams with the most FIFA World Cup tournament participations and matches played?
 
SELECT Team, Tournament_Participated, Played
FROM Country
ORDER BY Tournament_Participated DESC, Played DESC
LIMIT 5;

+-----------+-------------------------+--------+
| Team      | Tournament_Participated | Played |
+-----------+-------------------------+--------+
| Brazil    |                      22 |    114 |
| Germany   |                      20 |    112 |
| Argentina |                      18 |     88 |
| Italy     |                      18 |     83 |
| England   |                      16 |     74 |
+-----------+-------------------------+--------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6.What is the win, draw, and loss percentage for each team based on their FIFA World Cup performance?
 
SELECT Team, Played, Win, Draw, Loss, 
ROUND((( Win / Played ) * 100),2) AS Win_Percent, 
ROUND((( Draw / Played ) * 100),2) AS Draw_Percent, 
ROUND((( Loss / Played ) * 100),2) AS Loss_Percent 
FROM Country;

+-------------+--------+-----+------+------+-------------+--------------+--------------+
| Team        | Played | Win | Draw | Loss | Win_Percent | Draw_Percent | Loss_Percent |
+-------------+--------+-----+------+------+-------------+--------------+--------------+
| Brazil      |    114 |  76 |   19 |   19 |       66.67 |        16.67 |        16.67 |
| Germany     |    112 |  68 |   21 |   23 |       60.71 |        18.75 |        20.54 |
| Argentina   |     88 |  47 |   17 |   24 |       53.41 |        19.32 |        27.27 |
| Italy       |     83 |  45 |   21 |   17 |       54.22 |        25.30 |        20.48 |
| France      |     73 |  39 |   14 |   20 |       53.42 |        19.18 |        27.40 |
| England     |     74 |  32 |   22 |   20 |       43.24 |        29.73 |        27.03 |
| Spain       |     67 |  31 |   17 |   19 |       46.27 |        25.37 |        28.36 |
| Netherlands |     55 |  30 |   14 |   11 |       54.55 |        25.45 |        20.00 |
| Uruguay     |     59 |  25 |   13 |   21 |       42.37 |        22.03 |        35.59 |
| Belgium     |     51 |  21 |   10 |   20 |       41.18 |        19.61 |        39.22 |
+-------------+--------+-----+------+------+-------------+--------------+--------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 7.What is the goal scoring and conceding performance for each team, including goal ratios and goal per match statistics?
 
 SELECT Team, Goal_For, Goal_Against, Goal_Difference, 
 ROUND(( Goal_For / Played),1) AS Goal_For_Ratio, 
 ROUND(( Goal_Against / Played),1) AS Goal_Against_Ratio, 
 ROUND(( Goal_For / Goal_Against),1) AS Goal_Ratio 
 FROM Country 
 ORDER BY Goal_Ratio DESC;


+-------------+----------+--------------+-----------------+----------------+--------------------+------------+
| Team        | Goal_For | Goal_Against | Goal_Difference | Goal_For_Ratio | Goal_Against_Ratio | Goal_Ratio |
+-------------+----------+--------------+-----------------+----------------+--------------------+------------+
| Brazil      |      237 |          108 |             129 |            2.1 |                0.9 |        2.2 |
| Germany     |      232 |          130 |             102 |            2.1 |                1.2 |        1.8 |
| Netherlands |       96 |           52 |              44 |            1.7 |                0.9 |        1.8 |
| Italy       |      128 |           77 |              51 |            1.5 |                0.9 |        1.7 |
| France      |      136 |           85 |              51 |            1.9 |                1.2 |        1.6 |
| Argentina   |      152 |          101 |              51 |            1.7 |                1.1 |        1.5 |
| England     |      104 |           68 |              36 |            1.4 |                0.9 |        1.5 |
| Spain       |      108 |           75 |              33 |            1.6 |                1.1 |        1.4 |
| Uruguay     |       89 |           76 |              13 |            1.5 |                1.3 |        1.2 |
| Belgium     |       69 |           74 |              -5 |            1.4 |                1.5 |        0.9 |
+-------------+----------+--------------+-----------------+----------------+--------------------+------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 8.Which team has the highest goal difference in FIFA World Cup history?

SELECT Team, MAX(Goal_Difference)
FROM Country 
GROUP BY Team
LIMIT 1;

+--------+----------------------+
| Team   | MAX(Goal_Difference) |
+--------+----------------------+
| Brazil |                  129 |
+--------+----------------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 9.Which teams have a goal-for ratio greater than 1.5 and a goal-against ratio of less than 1?
 
CREATE VIEW Goal_Performance AS
SELECT Team,
ROUND((Goal_For / Played), 1) AS Goal_For_Ratio,
ROUND((Goal_Against / Played), 1) AS Goal_Against_Ratio
FROM Country;

SELECT * FROM Goal_Performance WHERE Goal_For_Ratio > 1.5 AND Goal_Against_Ratio < 1;

+-------------+----------------+--------------------+
| Team        | Goal_For_Ratio | Goal_Against_Ratio |
+-------------+----------------+--------------------+
| Brazil      |            2.1 |                0.9 |
| Netherlands |            1.7 |                0.9 |
+-------------+----------------+--------------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 10.Which team has scored the most goals in FIFA World Cup history?
 
SELECT Team,
MAX(Goal_For) AS Most_Goal_Scored_Team 
FROM Country 
GROUP BY Team 
LIMIT 1;

+--------+-----------------------+
| Team   | Most_Goal_Scored_Team |
+--------+-----------------------+
| Brazil |                   237 |
+--------+-----------------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 11.Which team has the least goal-conceded ratio in FIFA World Cup history?
 
SELECT Team,
ROUND((Goal_Against / Played),2) AS Least_Goal_Conceded_Team_Ratio 
FROM Country 
ORDER BY Least_Goal_Conceded_Team_Ratio 
LIMIT 1;

+---------+--------------------------------+
| Team    | Least_Goal_Conceded_Team_Ratio |
+---------+--------------------------------+
| England |                           0.92 |
+---------+--------------------------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 12.Which teams have a win percentage of 50% or higher in FIFA World Cup history?
 
CREATE VIEW Win_Percent AS
SELECT Team, Played, Win, Draw, Loss,
ROUND((( Win / Played ) * 100),2) AS Win_Percent
FROM Country;

SELECT * FROM Win_Percent WHERE Win_Percent >= 50;

+-------------+--------+-----+------+------+-------------+
| Team        | Played | Win | Draw | Loss | Win_Percent |
+-------------+--------+-----+------+------+-------------+
| Brazil      |    114 |  76 |   19 |   19 |       66.67 |
| Germany     |    112 |  68 |   21 |   23 |       60.71 |
| Argentina   |     88 |  47 |   17 |   24 |       53.41 |
| Italy       |     83 |  45 |   21 |   17 |       54.22 |
| France      |     73 |  39 |   14 |   20 |       53.42 |
| Netherlands |     55 |  30 |   14 |   11 |       54.55 |
+-------------+--------+-----+------+------+-------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
