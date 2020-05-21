-- Given table CITY with following columns
-- (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION)(NUMBER, VARCHAR, VARCHAR, VARCHAR, NUMBER)
-- =============================================================================================================================

-- Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.
SELECT *
FROM CITY
WHERE POPULATION > 100000
    AND COUNTRYCODE = 'USA';

-- Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.
SELECT NAME
FROM CITY
WHERE POPULATION > 120000
    AND COUNTRYCODE = 'USA';

-- Query all columns (attributes) for every row in the CITY table.
SELECT *
FROM CITY;

-- Query all columns for a city in CITY with the ID 1661.
SELECT *
FROM CITY
WHERE ID=1661;

-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT *
FROM CITY
WHERE COUNTRYCODE='JPN';

-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE='JPN';

-- Query a count of the number of cities in CITY having a Population larger than 100,00.
SELECT COUNT(NAME)
FROM CITY
WHERE POPULATION > 100000;

-- Query the total population of all cities in CITY where District is California.
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

-- Query the average population of all cities in CITY where District is California.
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

-- Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT FLOOR(AVG(POPULATION))
FROM CITY;

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE='JPN';

-- Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(POPULATION)-MIN(POPULATION)
FROM CITY;

-- Given table STATION with following columns
-- (ID, CITY, STATE, LAT_N, LONG_N)(NUMBER, VARCHAR, VARCHAR, NUMBER, NUMBER)
-- =============================================================================================================================

-- Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
FROM STATION;

-- Query the following two values from the STATION table:
-- The sum of all values in LAT_N rounded to a scale of  decimal places.
-- The sum of all values in LONG_W rounded to a scale of  decimal places.
SELECT
    CAST(SUM(LAT_N) AS DECIMAL(7,2)),
    CAST(SUM(LONG_W) AS DECIMAL(7,2))
FROM STATION;

-- Query a list of CITY names from STATION with even ID numbers only. 
-- You may print the results in any order, but must exclude duplicates from your answer.
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;

SELECT DISTINCT CITY
FROM STATION
WHERE ID%2 = 0;

-- Let  be the number of CITY entries in STATION, and let  be the number of distinct CITY names in STATION; 
-- query the value of  from STATION. In other words, find the difference between 
-- the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY
REGEXP "^[AEIOU]";

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY
REGEXP "^[^AEIOU]";

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY
REGEXP "[aeiou]$";

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY
REGEXP "[^aeiou]$";

SELECT DISTINCT CITY
FROM STATION
WHERE CITY
NOT REGEXP "[aeiou]$";

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as
-- both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY
REGEXP "^[AEIOU].*[aeiou]$";

-- Query the list of CITY names from STATION that either do not start with vowels 
-- or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE 
(CITY
REGEXP "^[^AEIOU]" OR CITY REGEXP"[^aeiou]$");

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY
REGEXP "^[^AEIOU].*[^aeiou]$";

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
-- (i.e.: number of characters in the name). If there is more than one smallest or largest city, 
-- choose the one that comes first when ordered alphabetically.
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC,CITY ASC LIMIT 1;
SELECT CITY
,LENGTH
(CITY) FROM STATION ORDER BY LENGTH
(CITY) DESC,CITY DESC LIMIT 1;

-- https://www.hackerrank.com/challenges/the-report/problem
SELECT (CASE WHEN GRADE <8 THEN NULL ELSE name END) name, GRADE, MARKS
FROM STUDENTS, GRADES
WHERE MARKS BETWEEN Min_Mark and Max_Mark
ORDER BY GRADE DESC, name, GRADE, MARKS;

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and 
-- less than 137.2345 Truncate your answer to  decimal places.
SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 
-- Truncate your answer to 4 decimal places.
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 
-- Round your answer to 4 decimal places.
SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880 Round your answer to 4 decimal places.
SELECT ROUND
(LAT_N, 4)
FROM STATION
WHERE LAT_N > 38.7880
ORDER BY LAT_N ASC
LIMIT 1;

-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7880. Round your answer to 4 decimal places.
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N > 38.7880
ORDER BY LAT_N ASC
LIMIT 1;

-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
-- a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points P1 and P1 and round it to a scale of 4 decimal places.
-- The Manhattan distance between two points measured along axes at right angles. In a plane with p1 at (x1, y1) 
-- and p2 at (x2, y2), it is |x1 - x2| + |y1 - y2|.
SELECT ROUND
(ABS
(MIN
(LAT_N) - MAX
(LAT_N)) + ABS
(MIN
(LONG_W) - MAX
(LONG_W)),4) 
FROM STATION;

-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) 
-- and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION
-- Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.
-- Equation is sqrt((a-b)^2 + (c-d)^2)
SELECT ROUND(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N),2)+POWER(MIN(LONG_W)-MAX(LONG_W),2)),4)
FROM STATION;


-- Given table STUDENTS with following columns
-- (ID, NAME, MARKS)(INTEGER, STRING, INTEGER)
-- =============================================================================================================================

-- Query the Name of any student in STUDENTS who scored higher than  Marks. 
-- Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three 
-- characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT
(NAME, 3), ID;

-- Given table Employee with following columns
-- (employee_id, name, months, salary)(Integer, String, Integer, Integer)
-- =============================================================================================================================

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name
FROM Employee
ORDER BY name;

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees 
-- in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. 
-- Sort your result by ascending employee_id.
SELECT name
FROM Employee
WHERE salary > 2000
    AND months < 10;

-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
-- Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with sides 3 of equal length.
-- Isosceles: It's a triangle with sides of 2 equal length.
-- Scalene: It's a triangle with sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
-- Table TRIANGLES(A,B,C)(Integer, Integer, Integer)
SELECT CASE WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN A = B OR A = C OR B = C THEN 'Isosceles'
            ELSE 'Scalene'
        END
FROM TRIANGLES;

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
-- but did not realize her keyboard's 0 key was broken until after completing the calculation. 
-- She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.: actual-miscalculated average monthly salaries), and round it up to the next integer.
SELECT CEIL(AVG(SALARY) - AVG(REPLACE(SALARY,'0','')))
FROM EMPLOYEES;

-- We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings 
-- for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number 
-- of employees who have maximum total earnings. Then print these values as  space-separated integers.
SELECT salary*months as earnings, COUNT(*)
from Employee
GROUP BY earnings
ORDER BY earnings DESC
limit 1;

-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
-- The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
-- Note: Print NULL when there are no more names corresponding to an occupation.
-- The first column is an alphabetically ordered list of Doctor names.
-- The second column is an alphabetically ordered list of Professor names.
-- The third column is an alphabetically ordered list of Singer names.
-- The fourth column is an alphabetically ordered list of Actor names.
-- The empty cell data for columns with less than the maximum number of names per 
-- occupation (in this case, the Professor and Actor columns) are filled with NULL values.
-- Table OCCUPATIONS(NAME. COLUMN)(String, String)


-- Given Table CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION)(NUMBER, VARCHAR, VARCHAR, VARCHAR, NUMBER)
-- Given Table COUNTRY(CODE, NAME, CONTINENT, REGION, SURFACEAREA, INDEPYEAR, POPULATION....)
-- Asian Population https://www.hackerrank.com/challenges/asian-population/problem
-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
SELECT SUM
(CITY.POPULATION)
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT = 'Asia';

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
SELECT CITY.NAME
FROM CITY
    JOIN COUNTRY ON CODE = COUNTRYCODE
WHERE CONTINENT = 'Africa';

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
-- and their respective average city populations (CITY.Population) rounded down to the nearest integer.
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM CITY
    JOIN COUNTRY ON COUNTRYCODE = CODE
GROUP BY CONTINENT;