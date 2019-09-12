SET SERVEROUTPUT ON
SET FEEDBACK ON

<<OUTER_BLOCK>>
DECLARE
v_table_count INTEGER;
var_id INTEGER;

BEGIN

SELECT COUNT(*)
INTO v_table_count
FROM aaa_simple_table;

<<INNER_BLOCK>>
DECLARE
TYPE array_t IS VARRAY(v_table_count) of VARCHAR2(50);
ex_array array_t;

BEGIN
ex_array := array_t('Wynik1', 'Wynik2', 'Wynik3', 'Wynik4', 'Wynik5');

FOR i IN 1..v_table_count
LOOP
    SELECT id
    INTO var_id
    FROM aaa_simple_table
    WHERE ID = i;
    DBMS_OUTPUT.PUT_LINE(ex_array(i)||' : '||var_id);
END LOOP;

END;
END;



CREATE TABLE aaa_simple_table (
id INTEGER,
CONSTRAINT pk_simple_table PRIMARY KEY (id));
INSERT INTO aaa_simple_table VALUES(1);
INSERT INTO aaa_simple_table VALUES(2);
INSERT INTO aaa_simple_table VALUES(3);
INSERT INTO aaa_simple_table VALUES(4);
INSERT INTO aaa_simple_table VALUES(5);

drop table aaa_simple_table;


DECLARE
TYPE low_price_car IS TABLE OF (NUMBER(15,2), NUMBER(15,2)) INDEX BY VARCHAR2(30);
TYPE high_price_car IS TABLE OF NUMBER(15,2) INDEX BY VARCHAR2(30);
currently_low__price_car low_price_car;
currently_high__price_car high_price_car;
i VARCHAR2(50);

BEGIN

currently_low__price_car('BMW')  := 2000;
currently_low__price_car('VW')     := 750000;
city_population('MERCEDES') := 1000000;
city_population('Toyota') := 1000000;
city_population('Huyndai') := 1000000;
i := city_population.FIRST;
WHILE i IS NOT NULL
LOOP
DBMS_OUTPUT.PUT_LINE (i);
DBMS_Output.PUT_LINE(TO_CHAR((city_population(i))));
i := city_population.NEXT(i);
END LOOP;
END;

