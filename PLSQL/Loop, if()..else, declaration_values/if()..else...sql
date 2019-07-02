/*
	LOGIKA WARUNKOWA:

	IF warunek THEN
		wykonywany_kod;

	ELSEIF warunek THEN
		wykonywany_kod;

	ELSE
		wykonywany_kod;

	ENDIF
*/

--Przykład
IF zmienna_1 > 10 THEN
	zmienna_2 := zmienna_2 - 1;

	IF zmienna_2 < 10 THEN
	zmienna_2 := zmienna_2 +1

ELSEIF zmienna_1 < 10 THEN
	zmienna_2:= zmienna_2 + 1;

	IF zmienna_2 > 10 THEN
		zmienna_2 := zmienna_2 - 1;

ELSE
zmienna_2 := 0;

ENDIF;

