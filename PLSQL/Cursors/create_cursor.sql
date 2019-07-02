/*
	Konstrukcja KURSORA dzieli sie na 5 etapów:
		- Deklaracja zmiennych
		- Deklaracja kursora
		- Otwarcie kursora
		- Pobieranie wierszy z kursora
		- Zamkniecie kursora

*/
	-- DEKLARACJA ZMIENNYCH
	DECLARE
	zmienna_1 column_name%TYPE;
	zmienna_2 column_name2%TYPE;
	zmienna_3 column_name3%TYPE;

	-- DEKLARACJA KURSORA
	CURSOR name_cursor IS
	SELECT id_product, name_product, price
	FROM products
	ORDER BY id_product;

	--OTWARCIE KURSORA
	OPEN name_cursor;

	--POBIERANIE WIERSZY Z KURSORA
	FETCH name_cursor
	INTO zmienna_1, zmienna_2, zmienna_3

	--ZAMYKANIE KURSORA
	CLOSE name_cursor;



--Przykład kursora pobierającego dane z tabeli products i wyświetlanie ich

SET SERVEROUTPUT ON

DECLARE
  v_product_id products.product_id%TYPE;
  v_name       products.name%TYPE;
  v_price      products.price%TYPE;
  v_zmienna INTEGER := 0;

  CURSOR v_product_cursor IS
    SELECT product_id, name, price
    FROM products;

BEGIN

  OPEN v_product_cursor;

  LOOP
    v_zmienna := v_zmienna+1;
    FETCH v_product_cursor
    INTO v_product_id, v_name, v_price;
  
    EXIT WHEN v_product_cursor%NOTFOUND;
    CONTINUE WHEN v_zmienna < 2;
    
    DBMS_OUTPUT.PUT_LINE(
      v_zmienna || ' Product_id: ' || v_product_id || ', Name: ' || v_name ||
      ', Price: ' || v_price 
    );
  END LOOP;

  CLOSE v_product_cursor;
END;
/
