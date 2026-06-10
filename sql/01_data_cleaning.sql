/*
==============================
CONVERT POPULATION TO ACTUAL PEOPLE
==============================
*/

UPDATE indonesia_socioeconomic_master
SET population = population * 1000
WHERE population < 100000;

/*
==============================
CHECK STRUCTURE
==============================
*/

DESCRIBE indonesia_socioeconomic_master;

/*
==============================
CHECK NULL VALUES
==============================
*/

SELECT *
FROM indonesia_socioeconomic_master
WHERE province IS NULL
   OR year IS NULL
   OR poverty_rate IS NULL
   OR unemployment_rate IS NULL
   OR population IS NULL
   OR gdp_per_capita IS NULL;
   
   /*
==============================
CHECK DUPLICATES
==============================
*/

SELECT
province,
year,
COUNT(*) total_rows
FROM indonesia_socioeconomic_master
GROUP BY province, year
HAVING COUNT(*) > 1;

/*
==============================
DATASET OVERVIEW
==============================
*/

SELECT
COUNT(*) total_records,
COUNT(DISTINCT province) total_provinces,
MIN(year) start_year,
MAX(year) end_year
FROM indonesia_socioeconomic_master;