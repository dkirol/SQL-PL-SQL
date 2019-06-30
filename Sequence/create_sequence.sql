/*
CREATE SEQUENCE nazwa_sekwencji
START WITH liczba_pocz
INCREMENT BY liczba_inkr
MINVALUE liczba_min  Albo NOMINVALUE(ustawienia domyślne)
MAXVALUE liczba_max  Albo NOMAXVALUE(ustawienia domyślne)
CYCLE - nie kończy / NOCYCLE - kończy sekwencje po ukończeniu całego cyklu
CACHE liczba_w_buforz / NOCACHE - brak przechowywania w pamięci podręcznej
ORDER / NOORDER

Przykład:
*/
CREATE SQUENCE sequence_name
START WITH 1 INCREMENT BY 2
MINVALUE 0 MAXVALUE 100
CYCLE CACHE 30 ORDER;
/
