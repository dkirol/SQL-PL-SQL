/*
Dodawanie komentarza do tabeli
COMMENT ON TABLE table_name IS 'Komentarz do tabeli';

Dodawanie komentarza do kolumny w tabeli
COMMENT ON COLUMN name_table.name_column IS 'Komentarz do kolumny'
*/


SET VERIFY OFF
COMMENT ON TABLE &name_table IS '&content_comment';

