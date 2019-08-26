SELECT * 
FROM sqlite_master;
--SELECT * FROM countries LEFT JOIN population_years ON countries.id = population_years.country_id;

-- How many entries in the database are from Africa?
SELECT COUNT(*) 
FROM countries 
WHERE continent = 'Africa';
-- 56

-- What was the total population of Oceania in 2005?
WITH country_pop 
AS (
SELECT * 
FROM countries 
LEFT JOIN population_years 
ON countries.id = population_years.country_id
)
SELECT SUM(population) 
FROM country_pop 
WHERE continent = 'Oceania';
-- 359.47808

-- What is the average population of countries in South America in 2003?
WITH country_pop 
AS (
SELECT * 
FROM countries 
LEFT JOIN population_years 
ON countries.id = population_years.country_id
)
SELECT AVG(population) 
FROM country_pop 
WHERE continent = 'South America' AND year = 2003;
-- 25.8906514285714

-- What country had the smallest population in 2007?
WITH country_pop 
AS (
SELECT * 
FROM countries 
LEFT JOIN population_years 
ON countries.id = population_years.country_id
)
SELECT MIN(population) 
FROM country_pop 
WHERE year = 2007;
-- 0.00216

-- What is the average population of Poland during the time period covered by this dataset?
WITH country_pop 
AS (
SELECT * 
FROM countries 
LEFT JOIN population_years 
ON countries.id = population_years.country_id
)
SELECT AVG(population) 
FROM country_pop 
WHERE name = 'Poland';
-- 38.5606790909091


-- How many countries have the word "The" in their name?
WITH country_pop 
AS (
SELECT * 
FROM countries 
LEFT JOIN population_years 
ON countries.id = population_years.country_id
)
SELECT COUNT(*) 
FROM country_pop 
WHERE name LIKE '%The';
-- 22


-- What was the total population of each continent in 2010?
WITH country_pop 
AS (
SELECT * 
FROM countries 
LEFT JOIN population_years 
ON countries.id = population_years.country_id
)
SELECT SUM(population), continent 
FROM country_pop 
WHERE year = 2010 
GROUP BY 2 
ORDER BY 1 DESC;
/*
1	4133.09148	Asia
2	1015.47846	Africa
3	723.06044	Europe
4	539.79456	North America
5	396.58235	South America
6	34.95696	Oceania
*/