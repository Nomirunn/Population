-- SQLite
SELECT * FROM sqlite_master;
/*
1	table	population_years	population_years	2	CREATE TABLE population_years (
      country STRING NOT NULL,
      population NUMBER,
      year NUMBER
)*/

SELECT DISTINCT year FROM population_years;
/*
1	2000
2	2001
3	2002
4	2003
5	2004
6	2005
7	2006
8	2007
9	2008
10	2009
11	2010
*/

--What is the largest population for Gabon?
SELECT MAX(population) FROM population_years WHERE country = 'Gabon';
--1	1.54526

--What are the 10 lowest populated countries in 2005?
SELECT country, population FROM population_years WHERE year = 2005 ORDER BY population ASC LIMIT 10;
/*
1	Niue	0.00216
2	Falkland Islands (Islas Malvinas)	0.00297
3	Montserrat	0.00453
4	Saint Pierre and Miquelon	0.0062
5	Saint Helena	0.00748
6	Nauru	0.01001
7	Cook Islands	0.0136
8	Turks and Caicos Islands	0.02057
9	Virgin Islands, British	0.02268
10	Gibraltar	0.02846
*/

--What are the distinct countries with populations over 100 million in 2010?
SELECT DISTINCT country FROM population_years WHERE population > 100 AND year = 2010;
/*
1	Mexico
2	United States
3	Brazil
4	Russia
5	Nigeria
6	Bangladesh
7	China
8	India
9	Indonesia
10	Japan
11	Pakistan
*/

--What countries have the world "Islands" in their names?
SELECT DISTINCT country FROM population_years WHERE country LIKE '%Islands%';
/*
1	Cayman Islands
2	Falkland Islands (Islas Malvinas)
3	Turks and Caicos Islands
4	Virgin Islands,  U.S.
5	Virgin Islands, British
6	Faroe Islands
7	Cook Islands
8	Solomon Islands
9	U.S. Pacific Islands
*/

--What are the populaton differences in Indonesia in 2000 and 2010?
SELECT DISTINCT population FROM population_years WHERE country = 'Indonesia' AND year IN (2000, 2010);
/*
1	214.67661
2	242.96834
*/