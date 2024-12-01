-- # Company Hierarchy Summary
-- This SQL script calculates the total number of lead managers, senior managers, managers, 
-- and employees for each company in a hierarchical structure. 
-- 
-- ## Problem Statement:
-- For each company, determine:
-- - Total number of lead managers
-- - Total number of senior managers
-- - Total number of managers
-- - Total number of employees
-- 
-- The output should include the `company_code`, the `founder` name, and the calculated totals. 
-- The result is ordered by `company_code` in ascending order (treated as a string).

-- ## Table Descriptions:
-- - `Company`: Contains the company code and the founder name.
-- - `Lead_Manager`: Contains the lead manager code and the company code.
-- - `Senior_Manager`: Contains the senior manager code, its lead manager code, and the company code.
-- - `Manager`: Contains the manager code, its senior manager code, its lead manager code, and the company code.
-- - `Employee`: Contains the employee code, its manager code, its senior manager code, its lead manager code, and the company code.

-- ## Sample Input:
-- ### Company Table:
-- | company_code | founder    |
-- |--------------|------------|
-- | C1           | Monika     |
-- | C2           | Samantha   |
--
-- ### Lead_Manager Table:
-- | lead_manager_code | company_code |
-- |-------------------|--------------|
-- | LM1               | C1           |
-- | LM2               | C2           |
--
-- ### Senior_Manager Table:
-- | senior_manager_code | lead_manager_code | company_code |
-- |---------------------|-------------------|--------------|
-- | SM1                 | LM1               | C1           |
-- | SM2                 | LM1               | C1           |
-- | SM3                 | LM2               | C2           |
--
-- ### Manager Table:
-- | manager_code | senior_manager_code | lead_manager_code | company_code |
-- |--------------|---------------------|-------------------|--------------|
-- | M1           | SM1                 | LM1               | C1           |
-- | M2           | SM3                 | LM2               | C2           |
-- | M3           | SM3                 | LM2               | C2           |
--
-- ### Employee Table:
-- | employee_code | manager_code | senior_manager_code | lead_manager_code | company_code |
-- |---------------|--------------|---------------------|-------------------|--------------|
-- | E1            | M1           | SM1                 | LM1               | C1           |
-- | E2            | M1           | SM1                 | LM1               | C1           |
-- | E3            | M2           | SM3                 | LM2               | C2           |
-- | E4            | M3           | SM3                 | LM2               | C2           |
--
-- ## Expected Output:
-- | company_code | founder    | total_lead_managers | total_senior_managers | total_managers | total_employees |
-- |--------------|------------|---------------------|-----------------------|----------------|-----------------|
-- | C1           | Monika     | 1                   | 2                     | 1              | 2               |
-- | C2           | Samantha   | 1                   | 1                     | 2              | 2               |

-- ## Solution:
Select 
  c.company_code,
  c.founder,
  count(Distinct lm.lead_manager_code),
  count(Distinct sm.senior_manager_code),
  count(Distinct m.manager_code),
  count(Distinct e.employee_code)
from Company c
join Lead_Manager lm 
 on c.company_code = lm.company_code
join Senior_Manager sm 
 on c.company_code=sm.company_code
join Manager m
 on c.company_code=m.company_code
join Employee e
 on c.company_code=e.company_code
group by c.company_code,c.founder
order by c.company_code;

-- ## Explanation:
-- 1. **`LEFT JOIN` Operations**:
--    - Each table is joined on the `company_code` to ensure all related records are included.
-- 
-- 2. **`COUNT(DISTINCT ...)`**:
--    - Ensures unique counts for each hierarchical level (lead managers, senior managers, managers, employees).
-- 
-- 3. **Grouping**:
--    - Results are grouped by `company_code` and `founder` to aggregate counts for each company.
-- 
-- 4. **Ordering**:
--    - The output is ordered by `company_code` in ascending order as required.
--
-- ## Usage:
-- This query can be used to analyze the hierarchical structure and employee distribution across companies.
