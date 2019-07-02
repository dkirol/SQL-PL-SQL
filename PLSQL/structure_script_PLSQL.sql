/* 
	DECLARE
		instrukcja_deklarujaca
	BEGIN
		instrukcja_wykonywana
	EXCEPTION
		instrukcja_obsługująca_wyjątki
	END;
	/
*/
--Przykład kodu PL/SQL
SET SERVEROUTPUT ON --Komenda która daje możliwość wyświetlania napisów na ekranie za pomocą komendy DBMS_OUTPUT.PUT_LINE
DECLARE
	zmienna_1 VARCHAR2(30) := 'zmienna_1';
	zmienna_2 INTEGER := 10;
	zmienna_3 INTEGER := 15;
	zmienna_4 INTEGER;
BEGIN
 zmienna_4 := zmienna_2 / zmienna_3;
 DBMS_OUTPUT.PUT_LINE('Wynik zmiennej o nazwie ' || zmienna_1 || ' = ' || zmienna_4);
END;
/