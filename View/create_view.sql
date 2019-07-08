/*
Tworzenie perspektywy
FORCE: oznacza że widok zostanie utworzony jeżeli tabele wykorzystane w perpsektywie nie istnieją / NOFORCE przeciwieństwo
WITH CHECK OPTION: oznacza że modyfikowane, wstawiane, usuwane będą jedynie takie wiersze które może pobrać perspektywa
WITH READ ONLY: oznacza że wiersze mogą być jedynie odczytywane
*/
CREATE [OR REPLACE] VIEW [FORCE/NOFORCE] VIEW nazwa_perspektywy
(nazwa aliasu) AS podzapytanie
WITH [CHECK OPTION | READ ONLY] CONSTRAINT nazwa_wiezow

--Przykład prosty
CREATE VIEW view_example AS 
SELECT product_id,name, description

--Przykład perspektywy z więzami CHECK OPTION
CREATE VIEW view_number2 AS
SELECT id, name
FROM table_name
WHERE id > 10
WITH CHECK OPTION CONSTRAINT constraint_check_option;



--Odczytywanie perspektyw polega na wrzucenie jej nazwy w klauzule FROM traktujemy perspektywe jako tabele
--Tak samo przy dodawaniu wartości traktujemy to jako tabele czyli po insercie wstawiamy

/