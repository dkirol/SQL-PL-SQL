/* WIĘZY: 
	- CHECK - musi spełniać określony warunek
	- NOT NULL
	- PRIMARY/FOREIGN KEY
	- UNIQUE
	- CHECK OPTION
	- READ ONLY
*/
--Więzy CHECK
ALTER TABLE table_name
ADD CONSTRAINT name_constraint CHECK(column_name BETWEEN 0 AND 6);

--Więzy UNIQUE
ALTER TABLE table_name
ADD CONSTRAINT name_constraint UNIQUE(column_name)

--Więzy NOT NULL
ALTER TABLE table_name
MODIFY column_name CONSTRAINT name_constraint NOT NULL

-- Więzy FOREIGN KEY z funkcją ON DELETE CASCADE(gdy usuwamy wiersz w tabeli nadrzędnej to jest również użuwane w podrzednej) ALBO ON DELETE SET NULL(w podrzędnej będzie wartość null)
ALTER TABLE table_temp
ADD CONSTRAINT fk_table_temp
id_tabtemp REFERENCES employees(employee_id) ON DELETE CASCADE;