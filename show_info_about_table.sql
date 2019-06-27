/*
Uzyskiwanie informacji o całej tabeli, możemy dodać klauzule WHERE dzięki której zfiltrujemy dane do wyznaczonej tabeli
SELECT table_name, tablespace_name, temporary
FROM user_tables

Uzyskiwanie informacji o kolumnach w tabeli
SELECT column_name, data_type, data_length, data_precision, data_scale
FROM user_tab_columns
WHERE table_name = 'name_table'
*/

SELECT table_name, tablespace_name, temporary
FROM user_tables
WHERE table_name = '#table_name';