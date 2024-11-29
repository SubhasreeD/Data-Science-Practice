#Stratscratch problems
-- **************************************************************
-- Problem: Summarize Customer Activity
-- **************************************************************
-- Objective:
-- Summarize the activity of each customer by calculating:
-- 1. Total number of interactions (unique interactions)
-- 2. Total number of content items created (unique content items)

-- Tables:
-- 1. customer_interactions
-- +------------------+--------------+------------------+------------------+
-- | interaction_id   | customer_id  | interaction_type | interaction_date |
-- +------------------+--------------+------------------+------------------+
-- | 1                | 101          | view             | 2024-11-01       |
-- | 2                | 102          | click            | 2024-11-02       |
-- | 3                | 101          | purchase         | 2024-11-03       |
-- +------------------+--------------+------------------+------------------+

-- 2. user_content
-- +------------+--------------+--------------+-------------------+
-- | content_id | customer_id  | content_type | content_text      |
-- +------------+--------------+--------------+-------------------+
-- | 1          | 101          | review       | "Great product!"  |
-- | 2          | 102          | comment      | "Thanks for the info." |
-- | 3          | 101          | post         | "My new blog post"|
-- +------------+--------------+--------------+-------------------+

-- Expected Output:
-- +--------------+--------------------+--------------------------+
-- | customer_id  | total_interactions | total_content_items      |
-- +--------------+--------------------+--------------------------+
-- | 101          | 2                  | 2                        |
-- | 102          | 1                  | 1                        |
-- +--------------+--------------------+--------------------------+

-- **************************************************************
Solution:
-- **************************************************************
  SELECT
    ci.customer_id,
    COUNT(Distinct ci.interaction_id), 
    COUNT(Distinct u.content_id) 
  FROM customer_interactions ci LEFT JOIN user_content u 
  ON ci.customer_id = u.customer_id 
  GROUP BY ci.customer_id;

-- **************************************************************
-- Explanation:
-- **************************************************************
/*
1. `ci.customer_id`: Fetch the unique ID of each customer.
2. `COUNT(DISTINCT ci.interaction_id)`: Counts the total unique interactions for each customer.
3. `COUNT(DISTINCT u.content_id)`: Counts the total unique content items created by each customer.
4. The `JOIN` operation links `customer_interactions` and `user_content` tables on `customer_id`.
5. `GROUP BY ci.customer_id`: Groups the output by customer ID to summarize their activity.
*/
