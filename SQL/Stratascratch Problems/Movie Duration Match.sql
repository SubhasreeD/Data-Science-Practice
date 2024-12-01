-- Problem Statement:
-- Enhance the in-flight entertainment experience for Amazon's airline partners.
-- Develop a feature that suggests movies from the entertainment catalog 
-- that fit within a given flight's duration.

-- Requirements:
-- Provide a list of movies with 'flight_id', 'movie_id', and 'movie_duration' 
-- for a specific flight where the movie duration is <= the flight duration.

-- Example:
-- For flight_id 101:
-- - Flight duration: 240 minutes

-- Input Tables:
-- Table 1: entertainment_catalog
-- +----------+------------------+----------+
-- | movie_id | title            | duration |
-- +----------+------------------+----------+
-- | 1        | The Great Adventure | 120     |
-- | 2        | Space Journey     | 90       |
-- | 3        | Ocean Mystery     | 60       |
-- | 4        | The Lost City     | 150      |
-- | 5        | Mountain Quest    | 110      |
-- +----------+------------------+----------+

-- Table 2: flight_schedule
-- +----------+----------------+------------+
-- | flight_id | flight_duration | flight_date |
-- +----------+----------------+------------+
-- | 101      | 240            | 2024-01-01 |
-- | 102      | 180            | 2024-01-02 |
-- | 103      | 240            | 2024-01-03 |
-- +----------+----------------+------------+

-- Expected Output:
-- For flight_id = 101, suggest movies with durations <= 240:
-- +----------+----------+----------------+
-- | flight_id | movie_id | movie_duration |
-- +----------+----------+----------------+
-- | 101      | 1        | 120            |
-- | 101      | 2        | 90             |
-- | 101      | 3        | 60             |
-- | 101      | 4        | 150            |
-- | 101      | 5        | 110            |
-- +----------+----------+----------------+

-- SQL Solution using JOIN (Optimized for Performance):
SELECT 
    f.flight_id,
    m.movie_id,
    m.duration AS movie_duration
FROM 
    entertainment_catalog m
JOIN 
    flight_schedule f
ON 
    f.flight_id = 101
WHERE 
    m.duration <= f.flight_duration;

-- Explanation:
-- 1. Joins the movie catalog with the flight schedule.
-- 2. Filters movies whose duration is <= the flight's duration for flight_id 101.
-- 3. Outputs 'flight_id', 'movie_id', and 'movie_duration'.
