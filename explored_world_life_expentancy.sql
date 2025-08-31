SELECT * 
FROM world_life_expectancy;

SELECT Country,
MIN(`Life expectancy`),
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`)-MIN(`Life expectancy`),1) AS Life_increase_over_15_years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) != 0
AND MAX(`Life expectancy`) != 0
ORDER BY Life_increase_over_15_years DESC;

SELECT Year,ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
WHERE `Life expectancy`!= 0
GROUP BY Year
ORDER BY Year;

SELECT Country,ROUND(AVG(`Life expectancy`),2) AS Life_Exp,ROUND(AVG(GDP),2) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp >  0 
AND GDP > 0
ORDER BY GDP ;

SELECT 
SUM( CASE WHEN GDP > 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP > 1500 THEN `Life expectancy` ELSE NULL END) High_GDP_life_exp,
SUM( CASE WHEN GDP < 1500 THEN 1 ELSE 0 END) low_GDP_Count,
AVG(CASE WHEN GDP < 1500 THEN `Life expectancy` ELSE NULL END) low_GDP_life_exp
FROM world_life_expectancy;


SELECT Status,ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY Status;

SELECT Status,COUNT(DISTINCT(Country)),ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY Status;

SELECT Country,ROUND(AVG(`Life expectancy`),2) AS Life_Exp,ROUND(AVG(BMI),2) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp >  0 
AND BMI > 0
ORDER BY BMI  ;

SELECT Country,
Year,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_total
FROM world_life_expectancy
WHERE Country LIKE '%United%';