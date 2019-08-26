--Ex.1

SELECT 
FROM profiles p INNER JOIN userprofile up
ON p.id = up.id_profile
INNER JOIN account a
ON up.id_login = a.id_login
WHERE p.id = 1018 AND a.login = '@zmienna_1';


--===================================================

CREATE OR REPLACE FUNCTION funkcja1 (
login_name IN VARCHAR)
RETURN VARCHAR as
count_user INTEGER;
resultt VARCHAR(30);

BEGIN
SELECT COUNT(*)
INTO count_user
FROM profiles p INNER JOIN userprofile up
ON p.id = up.id_profile
INNER JOIN account a
ON up.id_login = a.id_login
WHERE p.id = 1018 AND a.login = login_name;

IF count_user = 1 THEN
resultt := 'TAK';
ELSE
resultt := 'NIE';
END IF;

RETURN resultt;
END;

SET SERVEROUTPUT ON;
DECLARE
x VARCHAR2(30) := 'login2';
a VARCHAR2(30);
BEGIN
a := FUNKCJA1(x);
DBMS_OUTPUT.PUT_LINE('Wynik: ' || a);
END;

--=================================================

SET SERVEROUTPUT ON;
DECLARE
count_user INTEGER;
message VARCHAR(5);
BEGIN
SELECT COUNT(*)
INTO count_user
FROM profiles p INNER JOIN userprofile up
ON p.id = up.id_profile
INNER JOIN account a
ON up.id_login = a.id_login
WHERE p.id = 1018 AND a.login = '@zmienna_1';

IF count_user = 1 THEN
message := 'TAK';
ELSE
message := 'NIE';
END IF;
DBMS_OUTPUT.PUT_LINE('Czy dana osoba ma uprawnienia: ' || message);
END;