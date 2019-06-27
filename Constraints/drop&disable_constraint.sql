--Usuwanie Więzów
ALTER TABLE table_name
DROP CONSTRAINT name_constraint

--Włączanie/Wyłączanie Więzów
ALTER TABLE table_name
DISABLE/ENABLE CONSTRAINT name_constraint

-- Utworzenie więzów wyłączonych
ALTER TABLE table_name
ADD CONSTRAINT constraint_name CHECK(name_column IN ('Widoczny', 'Niewidoczny', 'Niedostępny')) DISABLE
