


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


SELECT SNo AS `Rank`, Team, Points, Titles
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


SELECT Team, MAX(Titles) AS Most_Title_Team 
FROM Country 
GROUP BY Team 
LIMIT 1;

+--------+-----------------+
| Team   | Most_Title_Team |
+--------+-----------------+
| Brazil |               5 |
+--------+-----------------+


SELECT Team, Tournament_Participated 
FROM Country
ORDER BY Tournament_Participated DESC, Played DESC
LIMIT 5;

+-----------+-------------------------+
| Team      | Tournament_Participated |
+-----------+-------------------------+
| Brazil    |                      22 |
| Germany   |                      20 |
| Argentina |                      18 |
| Italy     |                      18 |
| England   |                      16 |
+-----------+-------------------------+


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
