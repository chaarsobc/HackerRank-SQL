--MySQL compliant
SELECT W.id, WP.age, W.coins_needed, W.power
FROM Wands W
INNER JOIN Wands_Property WP ON W.code = WP.code
WHERE WP.is_evil = 0
AND W.coins_needed = (
    SELECT MIN(Wa.coins_needed)
    FROM Wands Wa
    INNER JOIN Wands_Property WaP ON Wa.code = WaP.code
    WHERE WaP.age = WP.age
    AND Wa.power = W.power)
ORDER BY W.power DESC, WP.age DESC
