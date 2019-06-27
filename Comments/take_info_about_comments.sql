/* 
Pobieranie komentarzy do tabel
SELECT *
FROM user_tab_comments
WHERE table_name = 'table_name';

-- Pobieranie komenatrzy do kolumn
SELECT * 
FROM user_col_comments
WHERE table_name = 'table_name';
*/

SET VERIFY OFF
SET DEFINE '#'
SELECT * 
FROM user_tab_comments
WHERE table_name = '#table_name';
