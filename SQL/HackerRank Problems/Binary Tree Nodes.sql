-- # Node Type Classification in a Binary Search Tree
-- 
-- This SQL query determines the type of each node in a binary tree.
-- The node types are classified as follows:
-- - Root: If the node has no parent (i.e., `P` is NULL).
-- - Leaf: If the node has no children (i.e., no node references it as a parent).
-- - Inner: If the node is neither a root nor a leaf.
-- 
-- ## Table Structure
-- The table `BST` has the following structure:
-- - `N`: Represents the value of the node. 
-- - `P`: Represents the parent node of `N`.

-- ## Sample Input:
-- | N  | P   |
-- |----|-----|
-- | 1  | 8   |
-- | 2  | 5   |
-- | 3  | 8   |
-- | 5  | NULL|
-- | 6  | 2   |
-- | 8  | 5   |
-- | 9  | 8   |

-- ## Expected Output:
-- | N  | Node_Type |
-- |----|-----------|
-- | 1  | Leaf      |
-- | 2  | Inner     |
-- | 3  | Leaf      |
-- | 5  | Root      |
-- | 6  | Leaf      |
-- | 8  | Inner     |
-- | 9  | Leaf      |

-- ## Solution:
SELECT b.n,
    CASE
        WHEN b.p IS NULL THEN 'Root'         -- If parent is NULL, the node is the root.
        WHEN NOT EXISTS (SELECT c.n 
                         FROM BST c 
                         WHERE c.p = b.n) THEN 'Leaf' -- If no node references this node as a parent, it's a leaf.
        ELSE 'Inner'                         -- Otherwise, it's an inner node.
    END AS node_type
FROM BST b
ORDER BY b.n;

-- ## Explanation:
-- 1. **Root Node Detection**:
--    The condition `b.p IS NULL` checks for nodes that have no parent, classifying them as `Root`.
-- 
-- 2. **Leaf Node Detection**:
--    The subquery `SELECT 1 FROM BST c WHERE c.p = b.n` checks if there are any nodes that have `b.n` as their parent.
--    If no such nodes exist, then `b` is classified as `Leaf`.
-- 
-- 3. **Inner Node Detection**:
--    If neither of the above conditions is true, the node is classified as `Inner`.

-- ## Usage:
-- - This query can be used for tree traversal, understanding tree structure, or debugging relationships in hierarchical data.
