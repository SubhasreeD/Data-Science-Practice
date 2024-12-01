-- # Triangle Type Identification
-- This SQL script identifies the type of triangle or determines if the given sides do not form a valid triangle.
-- 
-- ## Problem Statement:
-- Given a table `TRIANGLES` with columns `A`, `B`, and `C` representing the side lengths of a triangle:
-- - Determine if the values form a valid triangle.
-- - If valid, classify the triangle as:
--   - `Equilateral`: All three sides are equal.
--   - `Isosceles`: Two sides are equal.
--   - `Scalene`: All sides are of different lengths.
-- - If not valid, output `Not A Triangle`.
--
-- ## Input Format:
-- The table `TRIANGLES` is defined as:
-- | A   | B   | C   |
-- |-----|-----|-----|
-- | int | int | int |
--
-- ## Sample Input:
-- | A   | B   | C   |
-- |-----|-----|-----|
-- | 3   | 3   | 5   |
-- | 5   | 5   | 5   |
-- | 7   | 8   | 10  |
-- | 1   | 1   | 3   |
--
-- ## Expected Output:
-- | triangle_type   |
-- |-----------------|
-- | Isosceles       |
-- | Equilateral     |
-- | Scalene         |
-- | Not A Triangle  |
--
-- ## Solution:

SELECT 
    CASE 
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle' -- Check triangle inequality rule.
        WHEN A = B AND B = C THEN 'Equilateral'                          -- All sides are equal.
        WHEN A = B OR B = C OR C = A THEN 'Isosceles'                    -- Two sides are equal.
        ELSE 'Scalene'                                                   -- All sides are different.
    END AS triangle_type
FROM TRIANGLES;

-- ## Explanation:
-- 1. **Triangle Inequality Validation**:
--    - For valid triangles, the sum of any two sides must be greater than the third side.
-- 
-- 2. **Classification**:
--    - **Equilateral**: All three sides are equal (`A = B = C`).
--    - **Isosceles**: Two sides are equal (`A = B OR B = C OR C = A`).
--    - **Scalene**: All sides are different (falling into the `ELSE` condition).
-- 
-- ## Usage:
-- This query helps to validate and classify triangles based on their side lengths.

