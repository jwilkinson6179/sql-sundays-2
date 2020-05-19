-- Given table CITY with following columns
-- (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION)(NUMBER, VARCHAR, VARCHAR, VARCHAR, NUMBER)
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
