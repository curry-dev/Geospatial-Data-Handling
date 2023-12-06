-- CONVEX HULL
SELECT ST_AsText(ST_ConvexHull(
    ST_Collect(
    	ST_GeomFromText('MULTIPOINT(-118.286 34.023,-118.287 34.019,-118.285 34.023,-118.285 34.022,-118.285 34.02,-118.283 34.022,-118.284 34.025,-118.285 34.025,-118.284 34.025,-118.283 34.02,-118.282 34.021,-118.283 34.021,-118.288 34.027)')
    )) );



-- NEAREST NEIGHBOURS
CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
	location_name VARCHAR(15),
    latitude double precision,
    longitude double precision,
    geom_column geometry(Point, 4326)
);

INSERT INTO locations (location_name, latitude, longitude, geom_column)
VALUES ('Cinematic Arts', 34.023, -118.286, ST_SetSRID(ST_MakePoint(-118.286, 34.023), 4326)), 
		('Art and Design', 34.019, -118.287, ST_SetSRID(ST_MakePoint(-118.287, 34.019), 4326)), 
		('Dance Center', 34.023, -118.285, ST_SetSRID(ST_MakePoint(-118.285, 34.023), 4326)), 
		('Bing Theatre', 34.022, -118.285, ST_SetSRID(ST_MakePoint(-118.285, 34.022), 4326)),
		('Tommy Trojan', 34.02, -118.285, ST_SetSRID(ST_MakePoint(-118.285, 34.02), 4326)),
		('Taper Hall', 34.022, -118.283, ST_SetSRID(ST_MakePoint(-118.283, 34.022), 4326)),
		('Dulce', 34.025, -118.284, ST_SetSRID(ST_MakePoint(-118.284, 34.025), 4326)),
		('Kobunga', 34.025, -118.285, ST_SetSRID(ST_MakePoint(-118.285, 34.025), 4326)),
		('Il Giardino', 34.025, -118.284, ST_SetSRID(ST_MakePoint(-118.284, 34.025), 4326)),
		('Doheny', 34.02, -118.283, ST_SetSRID(ST_MakePoint(-118.283, 34.02), 4326)),
		('Leavey', 34.021, -118.282, ST_SetSRID(ST_MakePoint(-118.282, 34.021), 4326)),
		('Uni Library', 34.021, -118.283, ST_SetSRID(ST_MakePoint(-118.283, 34.021), 4326));

SELECT id, location_name, latitude, longitude
FROM locations
ORDER BY ST_Distance(ST_SetSRID(ST_MakePoint(-118.288, 34.027), 4326), geom_column)
LIMIT 4;

SELECT ST_AsKML(ST_MakeLine(
    ST_SetSRID(ST_MakePoint(-118.288, 34.027), 4326),
    geom_column
)) AS kml_line
FROM locations
WHERE id IN (8, 9, 7, 1);

