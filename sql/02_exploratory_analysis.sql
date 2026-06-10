/*
==============================
OVERALL POVERTY ANALYSIS
==============================
*/

SELECT
MIN(poverty_rate) AS min_poverty,
MAX(poverty_rate) AS max_poverty,
AVG(poverty_rate) AS avg_poverty
FROM indonesia_socioeconomic_master;

/*
==============================
OVERALL UNEMPLOYMENT ANALYSIS
==============================
*/

SELECT
MIN(unemployment_rate) AS min_unemployment,
MAX(unemployment_rate) AS max_unemployment,
AVG(unemployment_rate) AS avg_unemployment
FROM indonesia_socioeconomic_master;

/*
==============================
POVERTY TREND BY YEAR
==============================
*/

SELECT
year,
ROUND(AVG(poverty_rate),2) AS avg_poverty_rate
FROM indonesia_socioeconomic_master
GROUP BY year
ORDER BY year;

/*
==============================
UNEMPLOYMENT TREND BY YEAR
==============================
*/

SELECT
year,
ROUND(AVG(unemployment_rate),2) AS avg_unemployment_rate
FROM indonesia_socioeconomic_master
GROUP BY year
ORDER BY year;

