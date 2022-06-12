SELECT N,
CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N = (SELECT N WHERE N IN (SELECT P FROM BST)) THEN 'Inner'
    ELSE 'Leaf'
END
FROM BST
ORDER BY N