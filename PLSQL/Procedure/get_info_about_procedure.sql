--Zapytanie do tabeli aby uzyskać informacje o procedurze

SELECT object_name, procedure_name, aggreagate, impltypewowner, parallel
FROM user_procedures
WHERE object_name = 'PROCEDURE_NUMBER_1';