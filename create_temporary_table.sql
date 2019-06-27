------Tworzenie tabeli tymczasowej, dodajemy GLOBAL TEMPORARY
CREATE GLOBAL TEMPORARY TABLE table_name(
id_tablename INTEGER DEFAULT 0 NOT NULL,
name VARCHAR2(30),
date_creat DATE DEFAULT SYSDATE)
ON COMMIT PRESERVE ROWS  -- ON COMMIT DELETE/PRESERVE ROWS - daje informacje do kiedy mają być składowane dane: delete do zakonczenia transakcji a preserve do zakonczenia sesji uzytkownika
/