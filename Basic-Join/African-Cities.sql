--MySQL compliant
SELECT CITY.NAME
FROM CITY, COUNTRY
WHERE COUNTRY.CONTINENT = 'Africa' AND COUNTRY.CODE = CITY.COUNTRYCODE;