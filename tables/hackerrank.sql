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
ORDER BY RIGHT(NAME, 3), ID;

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
