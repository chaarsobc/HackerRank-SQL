--MySQL compliant
UPDATE STUDENTS
SET NAME = NULL
WHERE MARKS < 70;
SELECT STUDENTS.NAME, GRADES.GRADE, STUDENTS.MARKS
FROM STUDENTS, GRADES
WHERE MIN_MARK <= MARKS AND MAX_MARK >= MARKS
ORDER BY GRADE DESC, NAME
