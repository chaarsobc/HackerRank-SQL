--MySQL compliant
SELECT H.hacker_id, H.name, COUNT(C.challenge_id) AS Cnt
FROM Hackers H
LEFT JOIN Challenges C
ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING Cnt
    = (
        SELECT COUNT(C.challenge_id) CntMAX
        FROM Challenges C
        GROUP BY C.hacker_id
        ORDER BY CntMAX DESC LIMIT 1
        )
    OR
    Cnt IN
    (SELECT DISTINCT CntOTHERS
     FROM (SELECT H.hacker_id, H.name, COUNT(challenge_id) AS CntOTHERS
           FROM Hackers H
           JOIN Challenges C
           ON C.hacker_id = H.hacker_id
           GROUP BY H.hacker_id, H.name) Custom
     GROUP BY CntOTHERS
     HAVING COUNT(CntOTHERS) = 1)
ORDER BY COUNT(C.challenge_id) DESC, H.hacker_id
