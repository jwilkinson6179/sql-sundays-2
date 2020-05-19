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

-- Given table STATION with following columns
-- (ID, CITY, STATE, LAT_N, LONG_N)(NUMBER, VARCHAR, VARCHAR, NUMBER, NUMBER)
-- =============================================================================================================================

-- Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
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
REGEXP "^[aeiou].*";