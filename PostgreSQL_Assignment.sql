-- Active: 1747916960958@@127.0.0.1@5432@conservation_db







----------------------------------------------------------- TABLE CREATION, SAMPLE DATA INSERTION-------------------------------------------------------------------





CREATE TABLE rangers(
    ranger_id INTEGER PRIMARY KEY NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    region VARCHAR(20) NOT NULL
)


insert into rangers( ranger_id, "name", region)
VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King' , 'Mountain Range')



CREATE TABLE species(
    species_id INTEGER PRIMARY KEY,
    common_name VARCHAR(20) NOT NULL,
    scientific_name VARCHAR(30) NOT NULL,
    discovery_date Date NOT NULL,
    conservation_status VARCHAR(20) NOT NULL
)


insert into species(species_id, common_name, scientific_name, discovery_date, conservation_status)
VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda' , 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant' , 'Elephas maximus indicus', '1758-01-01', 'Endangered')



CREATE TABLE sightings(
    sighting_id INTEGER PRIMARY KEY,
    species_id INTEGER REFERENCES species(species_id) ON DELETE CASCADE,
    ranger_id INTEGER REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    "location" VARCHAR(30) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes VARCHAR(50)
)


insert into sightings(sighting_id, species_id, ranger_id, "location", sighting_time, notes)
VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', null)








----------------------------------------------------------- PROBLEMS -------------------------------------------------------------------






-- Problem: 1
INSERT INTO rangers( ranger_id, "name", region)
VALUES (4, 'Derek Fox', 'Coastal Plains')




-- Problem: 2
SELECT COUNT(DISTINCT species_id) as unique_species_count FROM sightings 




-- Problem: 3
SELECT * FROM sightings
WHERE "location" like '%Pass'




-- Problem: 4
SELECT "name", COUNT(sightings.ranger_id) as total_sightings FROM sightings
INNER JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY "name"




-- Problem: 5
SELECT common_name FROM sightings
RIGHT JOIN species ON sightings.species_id = species.species_id
WHERE ranger_id IS NULL




-- Problem: 6
select common_name, sighting_time, "name" FROM sightings
INNER JOIN rangers ON rangers.ranger_id = sightings.ranger_id
INNER JOIN species ON species.species_id = sightings.species_id
ORDER BY sighting_time DESC LIMIT 2




-- Problem: 7
UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800




-- Problem: 8
SELECT sighting_id,
CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
ELSE 'Evening'
END AS time_of_day
FROM sightings





-- Problem: 9
DELETE FROM rangers
WHERE "name" = (
    SELECT "name" FROM sightings
    RIGHT JOIN rangers ON rangers.ranger_id = sightings.ranger_id
    WHERE sightings.ranger_id IS NULL
)




SELECT * FROM rangers

SELECT * FROM species

SELECT * FROM sightings