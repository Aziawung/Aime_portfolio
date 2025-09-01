SELECT * FROM us_household.us_household_income;

SELECT * FROM us_household.us_household_income_statistics;

ALTER TABLE us_household.us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`;
SELECT COUNT(id)
FROM us_household.us_household_income;
SELECT  COUNT(id)
FROM us_household.us_household_income_statistics;

SELECT id,COUNT(id)
FROM us_household.us_household_income
GROUP BY  id 
HAVING COUNT(id)>1;

DELETE FROM us_household_income
WHERE row_id IN 
 (SELECT row_id
FROM(
    SELECT row_id,
    id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
	FROM us_household.us_household_income) duplicates
    WHERE row_num > 1)
;


SELECT id,COUNT(id)
FROM us_household.us_household_income_statistics
GROUP BY  id 
HAVING COUNT(id)>1;

SELECT DISTINCT(State_Name)
FROM us_household_income
ORDER BY State_Name;

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

SELECT * 
FROM us_household_income
WHERE Place = 'Autauga County';

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County' AND 
City = 'Vinemont';

SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY 1;

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';

SELECT ALand,AWater
FROM us_household_income
WHERE  (ALand = 0 OR ALand ='' OR ALand IS NULL);
