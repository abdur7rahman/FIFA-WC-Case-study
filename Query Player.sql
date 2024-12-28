

SELECT * FROM Player;

+-----+-------------------+-------------+------+--------+-------------------+------------+--------+
| sno | Player_Name       | Country     | Goal | Assist | Goal_Contribution | Apperences | titles |
+-----+-------------------+-------------+------+--------+-------------------+------------+--------+
|   1 | Miroslav Klose    | Germany     |   16 |      4 |                20 |         24 |      1 |
|   2 | Ronaldo Nazário   | Brazil      |   15 |      4 |                19 |         19 |      2 |
|   3 | Lionel Messi      | Argentina   |   13 |      8 |                21 |         26 |      1 |
|   4 | Pelé              | Brazil      |   12 |      5 |                17 |         14 |      3 |
|   5 | Thomas Müller     | Germany     |   12 |      6 |                18 |         16 |      1 |
|   6 | Cristiano Ronaldo | Portugal    |    8 |      2 |                10 |         22 |      0 |
|   7 | Kylian Mbappé     | France      |   12 |      2 |                14 |         14 |      1 |
|   8 | Johan Cruyff      | Netherlands |    3 |      4 |                 7 |          7 |      0 |
|   9 | Zinedine Zidane   | France      |    5 |      2 |                 7 |         12 |      1 |
|  10 | Wayne Rooney      | England     |    7 |      3 |                10 |         15 |      0 |
+-----+-------------------+-------------+------+--------+-------------------+------------+--------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Goal, Assist, Goal_Contribution,
ROUND(( Goal / Apperences),1) AS Goal_Ratio,
ROUND(( Assist / Apperences),1) AS Assist_Ratio, 
ROUND(( Goal_Contribution / Apperences),1) AS Goal_Contribution_Ratio 
FROM Player;

+-------------------+------+--------+-------------------+------------+--------------+-------------------------+
| Player_Name       | Goal | Assist | Goal_Contribution | Goal_Ratio | Assist_Ratio | Goal_Contribution_Ratio |
+-------------------+------+--------+-------------------+------------+--------------+-------------------------+
| Miroslav Klose    |   16 |      4 |                20 |        0.7 |          0.2 |                     0.8 |
| Ronaldo Nazário   |   15 |      4 |                19 |        0.8 |          0.2 |                     1.0 |
| Lionel Messi      |   13 |      8 |                21 |        0.5 |          0.3 |                     0.8 |
| Pelé              |   12 |      5 |                17 |        0.9 |          0.4 |                     1.2 |
| Thomas Müller     |   12 |      6 |                18 |        0.8 |          0.4 |                     1.1 |
| Cristiano Ronaldo |    8 |      2 |                10 |        0.4 |          0.1 |                     0.5 |
| Kylian Mbappé     |   12 |      2 |                14 |        0.9 |          0.1 |                     1.0 |
| Johan Cruyff      |    3 |      4 |                 7 |        0.4 |          0.6 |                     1.0 |
| Zinedine Zidane   |    5 |      2 |                 7 |        0.4 |          0.2 |                     0.6 |
| Wayne Rooney      |    7 |      3 |                10 |        0.5 |          0.2 |                     0.7 |
+-------------------+------+--------+-------------------+------------+--------------+-------------------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Country, 
MAX(Goal) AS Most_Goal
FROM Player 
GROUP BY Player_Name, Country 
LIMIT 1;

+----------------+---------+-----------+
| Player_Name    | Country | Most_Goal |
+----------------+---------+-----------+
| Miroslav Klose | Germany |        16 |
+----------------+---------+-----------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Country, 
Assist AS Most_Assist
FROM Player 
ORDER BY Assist DESC 
LIMIT 1;

+--------------+-----------+-------------+
| Player_Name  | Country   | Most_Assist |
+--------------+-----------+-------------+
| Lionel Messi | Argentina |           8 |
+--------------+-----------+-------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Country, 
Goal_Contribution AS Most_Goal_Contribution 
FROM Player
ORDER BY Goal_Contribution DESC 
LIMIT 1;

+--------------+-----------+------------------------+
| Player_Name  | Country   | Most_Goal_Contribution |
+--------------+-----------+------------------------+
| Lionel Messi | Argentina |                     21 |
+--------------+-----------+------------------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Country, 
Apperences AS Most_Apperences
FROM Player
ORDER BY Apperences DESC
LIMIT 1;

+--------------+-----------+-----------------+
| Player_Name  | Country   | Most_Apperences |
+--------------+-----------+-----------------+
| Lionel Messi | Argentina |              26 |
+--------------+-----------+-----------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Country, 
Titles AS Most_Titles
FROM Player
ORDER BY Titles DESC
LIMIT 1;

+-------------+---------+-------------+
| Player_Name | Country | Most_Titles |
+-------------+---------+-------------+
| Pelé        | Brazil  |           3 |
+-------------+---------+-------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Country, Titles 
FROM Player 
WHERE Titles >= 1 
ORDER BY Titles DESC ;

+-----------------+-----------+--------+
| Player_Name     | Country   | Titles |
+-----------------+-----------+--------+
| Pelé            | Brazil    |      3 |
| Ronaldo Nazário | Brazil    |      2 |
| Miroslav Klose  | Germany   |      1 |
| Lionel Messi    | Argentina |      1 |
| Thomas Müller   | Germany   |      1 |
| Kylian Mbappé   | France    |      1 |
| Zinedine Zidane | France    |      1 |
+-----------------+-----------+--------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Country, 
COUNT(Player_Name) AS Total_Players 
FROM Player 
GROUP BY Country;

+-------------+---------------+
| Country     | Total_Players |
+-------------+---------------+
| Germany     |             2 |
| Brazil      |             2 |
| Argentina   |             1 |
| Portugal    |             1 |
| France      |             2 |
| Netherlands |             1 |
| England     |             1 |
+-------------+---------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW Goal_Contribute AS 
SELECT Player_Name, Goal_Contribution,
ROUND((Goal_Contribution / Apperences),2) AS Goal_Contribution_Ratio 
FROM Player;

SELECT * FROM Goal_Contribute
WHERE Goal_Contribution_Ratio > 1;

+---------------+-------------------+-------------------------+
| Player_Name   | Goal_Contribution | Goal_Contribution_Ratio |
+---------------+-------------------+-------------------------+
| Pelé          |                17 |                    1.21 |
| Thomas Müller |                18 |                    1.13 |
+---------------+-------------------+-------------------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Goal, 
ROUND(( Goal / Apperences),2) AS Goal_Ratio 
FROM Player 
ORDER BY Goal_Ratio DESC 
LIMIT 1;

+-------------+------+------------+
| Player_Name | Goal | Goal_Ratio |
+-------------+------+------------+
| Pelé        |   12 |       0.86 |
+-------------+------+------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Goal, Assist 
FROM Player 
WHERE Goal >= 10 AND Assist >=5 
ORDER BY Goal_Contribution DESC;

+---------------+------+--------+
| Player_Name   | Goal | Assist |
+---------------+------+--------+
| Lionel Messi  |   13 |      8 |
| Thomas Müller |   12 |      6 |
| Pelé          |   12 |      5 |
+---------------+------+--------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Player_Name, Goal_Contribution,Apperences
FROM Player
WHERE Goal_Contribution >= 5 AND Apperences <= 10;

+--------------+-------------------+------------+
| Player_Name  | Goal_Contribution | Apperences |
+--------------+-------------------+------------+
| Johan Cruyff |                 7 |          7 |
+--------------+-------------------+------------+

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
