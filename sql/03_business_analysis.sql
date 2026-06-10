/*
==============================
TOP 10 HIGHEST POVERTY PROVINCES
==============================
*/

SELECT
province,
ROUND(AVG(poverty_rate),2) AS avg_poverty
FROM indonesia_socioeconomic_master
GROUP BY province
ORDER BY avg_poverty DESC
LIMIT 10;

/*
==============================
TOP 10 LOWEST POVERTY PROVINCES
==============================
*/

SELECT
province,
ROUND(AVG(poverty_rate),2) AS avg_poverty
FROM indonesia_socioeconomic_master
GROUP BY province
ORDER BY avg_poverty ASC
LIMIT 10;

/*
==============================
HIGHEST UNEMPLOYMENT PROVINCES
==============================
*/

SELECT
province,
ROUND(AVG(unemployment_rate),2) AS avg_unemployment
FROM indonesia_socioeconomic_master
GROUP BY province
ORDER BY avg_unemployment DESC
LIMIT 10;

SELECT
province,
ROUND(AVG(gdp_per_capita),0) AS avg_gdp,
ROUND(AVG(poverty_rate),2) AS avg_poverty
FROM indonesia_socioeconomic_master
GROUP BY province
ORDER BY avg_gdp DESC
LIMIT 15;

/*
==============================
GDP VS POVERTY ANALYSIS
==============================
*/

SELECT
province,
ROUND(AVG(gdp_per_capita),0) AS avg_gdp,
ROUND(AVG(poverty_rate),2) AS avg_poverty
FROM indonesia_socioeconomic_master
GROUP BY province
ORDER BY avg_gdp DESC;

/*
==============================
POPULATION VS POVERTY
==============================
*/

SELECT
province,
ROUND(AVG(population),0) AS avg_population,
ROUND(AVG(poverty_rate),2) AS avg_poverty
FROM indonesia_socioeconomic_master
GROUP BY province
ORDER BY avg_population DESC;

/*
==============================
POVERTY IMPROVEMENT SINCE 2020
==============================
*/

SELECT
province,
MAX(CASE WHEN year = 2020 THEN poverty_rate END) AS poverty_2020,
MAX(CASE WHEN year = 2025 THEN poverty_rate END) AS poverty_2025,
ROUND(
MAX(CASE WHEN year = 2020 THEN poverty_rate END)
-
MAX(CASE WHEN year = 2025 THEN poverty_rate END)
,2) AS improvement
FROM indonesia_socioeconomic_master
GROUP BY province
ORDER BY improvement DESC;

/*
==============================
UNEMPLOYMENT IMPROVEMENT SINCE 2020
==============================
*/

SELECT
province,
MAX(CASE WHEN year = 2020 THEN unemployment_rate END) AS unemployment_2020,
MAX(CASE WHEN year = 2025 THEN unemployment_rate END) AS unemployment_2025,
ROUND(
MAX(CASE WHEN year = 2020 THEN unemployment_rate END)
-
MAX(CASE WHEN year = 2025 THEN unemployment_rate END)
,2) AS improvement
FROM indonesia_socioeconomic_master
GROUP BY province
ORDER BY improvement DESC;

SELECT
province,
MAX(CASE WHEN year = 2020 THEN poverty_rate END) AS poverty_2020,
MAX(CASE WHEN year = 2025 THEN poverty_rate END) AS poverty_2025,
ROUND(
MAX(CASE WHEN year = 2020 THEN poverty_rate END)
-
MAX(CASE WHEN year = 2025 THEN poverty_rate END)
,2) AS improvement
FROM indonesia_socioeconomic_master
GROUP BY province
HAVING poverty_2020 IS NOT NULL
AND poverty_2025 IS NOT NULL
ORDER BY improvement DESC;