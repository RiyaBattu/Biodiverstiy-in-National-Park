select distinct count( *)
from [Biodiversity].[dbo].[species]




---# DATA CLEANING



-- to check for duplicates
select scientific_name, count(*)
from [Biodiversity].[dbo].[species]
group by scientific_name
having count(*) >1



SELECT *
FROM [Biodiversity].[dbo].[species]
WHERE scientific_name IN (
    SELECT scientific_name
    FROM [Biodiversity].[dbo].[species]
    GROUP BY scientific_name
    HAVING COUNT(*) > 1
)
ORDER BY scientific_name;



-- delete duplicates rows
DELETE FROM [Biodiversity].[dbo].[species]
WHERE category IS NULL
  AND common_names IS NULL
  AND conservation_status IS NULL;



WITH CTE_Duplicates AS (
    SELECT scientific_name, 
           ROW_NUMBER() OVER (PARTITION BY scientific_name ORDER BY scientific_name) AS rn
    FROM [Biodiversity].[dbo].[species]
)
DELETE FROM CTE_Duplicates
WHERE rn > 1;




SELECT * 
FROM [Biodiversity].[dbo].[observations]
WHERE scientific_name IS NULL OR park_name IS NULL;


WITH CTE AS (
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY park_name, scientific_name ORDER BY (SELECT NULL)) AS row_num
    FROM [Biodiversity].dbo.observations
)
DELETE FROM CTE
WHERE row_num > 1;





SELECT park_name, scientific_name, COUNT(*) AS occurrences
FROM [Biodiversity].dbo.observations
GROUP BY park_name, scientific_name
HAVING COUNT(*) > 1;



UPDATE [Biodiversity].dbo.species
SET conservation_status = 'Not Evaluated'
WHERE conservation_status IS NULL;

