-- # BUSINESS PROBLEMS

select top 10 * from [Biodiversity].dbo.observations
select top 10 * from [Biodiversity].dbo.species


--1. Conservation Status Distribution:
--   Count the number of species in each conservation status category.

SELECT conservation_status, COUNT(*) AS species_count
FROM [Biodiversity].dbo.species
WHERE conservation_status != 'Not Evaluated'
GROUP BY conservation_status;



--2. Most Observed Species:
--   Identify the top 10 most observed species across all parks.

select top 10 scientific_name, count(*) as observation_count
from [Biodiversity].dbo.observations
group by scientific_name
order by observation_count desc



--3. Species Diversity in Parks:
--   Determine the number of unique species observed in each park.
select park_name, count(distinct scientific_name) as unique_species
from [Biodiversity].dbo.observations
group by park_name
order by park_name




--4. Observation Frequency Analysis:
--   Analyze how many times each species has been observed, grouped by park.

SELECT park_name, scientific_name, COUNT(*) AS observation_count
FROM [Biodiversity].dbo.observations
GROUP BY park_name, scientific_name
ORDER BY park_name, observation_count DESC;





--5. Missing Species Data:
--   Identify species in the observations table that do not exist in the species info table.

select o.scientific_name
from [Biodiversity].dbo.observations o
left join [Biodiversity].dbo.species s
	on o.scientific_name = s.scientific_name
where s.scientific_name is null
group by o.scientific_name




--6. Conservation Status by Park:
--   Find the conservation status distribution of species for each park.

SELECT o.park_name, s.conservation_status, COUNT(DISTINCT s.scientific_name) AS species_count
FROM [Biodiversity].dbo.observations o
JOIN [Biodiversity].dbo.species s
    ON o.scientific_name = s.scientific_name
GROUP BY o.park_name, s.conservation_status
ORDER BY o.park_name, s.conservation_status;



--7. Top 5 Categories of Species in Each Park:
--   Find the top 5 categories of species for each park based on the number of observations.
WITH SpeciesCategory AS (
    SELECT o.park_name, s.category, COUNT(*) AS observation_count
    FROM [Biodiversity].dbo.observations o
    JOIN [Biodiversity].dbo.species s
        ON o.scientific_name = s.scientific_name
    GROUP BY o.park_name, s.category
)
SELECT *
FROM (
    SELECT 
        park_name, category, observation_count, 
        ROW_NUMBER() OVER (PARTITION BY park_name ORDER BY observation_count DESC) AS rank
    FROM SpeciesCategory
) ranked_categories
WHERE rank <= 5;










--8. Species by Category:
--   Count the number of species in each category (e.g., vascular plants, mammals).
select category, count(distinct scientific_name) as species_count
from [Biodiversity].dbo.species
group by category
order by category


--9. Correlation Between Parks and Species:
--   Analyze which parks have the highest correlation with specific species based on observation counts.

SELECT o.park_name, s.scientific_name, SUM(o.observations) AS total_observations
FROM [Biodiversity].dbo.observations o
JOIN [Biodiversity].dbo.species s
    ON o.scientific_name = s.scientific_name
GROUP BY o.park_name, s.scientific_name
ORDER BY total_observations DESC;





--10. Identifying Endangered Species:
--List all endangered species and the parks where they have been observed.

select s.scientific_name, o.park_name
from [Biodiversity].dbo.species s
join  [Biodiversity].dbo.observations o
	on o.scientific_name = s.scientific_name
where s.conservation_status = 'Endangered'
order by s.scientific_name, o.park_name
