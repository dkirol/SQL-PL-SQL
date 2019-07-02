/* ------- PROSTA PETLA - wykonujemy do jawnego zakończenia petli, konstrukcja wygląda tak:
	LOOP
	instrukcja;
	END LOOP;

	Do kończenia petli wykorzystujemy:
	EXIT - komenda natychmiast przerywa petle
	EXIT WHEN - komenda przerywa petle przy wystąpieniu wyznaczonego warunku

	Do konczenia iteracji w petli i przejscia do nastepnej
	CONTINUE - kończy bieżącą iteracje i przechodzi do nastepnej
	CONTINUE WHEN - kończenie bieżącej iteracji w przypadku wystąpienia warunku

	Przykład
*/
zmienna_1=0;
LOOP
	zmienna_1 := zmienna_1 + 1;
	EXIT WHEN zmienna_1 := 1; -- TROLOLOLOLOLOLOLOLO

	IF zmienna_1 > 3 AND zmienna_1 < 8 THEN
	zmienna_1 := zmienna_1 + 1;

	CONTINUE;
	
	ELSEIF zmienna_1 > 10 THEN
	EXIT;

	ELSE
	zmienna_1 := zmienna_1 + 2;
	CONTINOU WHEN zmienna_1 := 10;

END LOOP;

/* ------- PETLA WHILE, konstrukcja wygląda tak:
	WHILE warunek LOOP
	instrukcja
	END LOOP;

	Przykład:
*/

zmienna_1 := 10;
WHILE zmienna_1 >15 LOOP
zmienna_1 := zmienna_1 + 1;
END LOOP;

/* -------- PETLA FOR, konstrukcja wygląda tak:
	FOR zmienna_petli IN (REVERSE) dolna_granica..gorna_granica LOOP
	instrukcja
	END LOOP;

	Przykład:
*/
FOR zmienna_1 := 0 IN 0..10 LOOP
DBMS_OUTPUT.PUT.LINE(zmienna_1);
END LOOP;