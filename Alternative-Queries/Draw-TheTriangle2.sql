--MySQL compliant
SET @TEMP:=0; 
SELECT REPEAT('* ', @TEMP:= @TEMP + 1) FROM INFORMATION_SCHEMA.TABLES LIMIT 20;
