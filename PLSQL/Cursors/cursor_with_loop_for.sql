--Kursor z użyciem petli FOR, dzieki czemu nie musismy otwierac kursora
--Przykład:

	SET SERVEROUTPUT ON

	DECLARE

	CURSOR name_cursor IS
	SELECT id_product, name, price
	FROM products;

	BEGIN

	FOR zmienna_petli IN name_cursor LOOP
		DBMS_OUTPUT.PUT_LINE (
		'product_id = ' || zmienna_petli.product_id ||
      	', name = ' || zmienna_petli.name ||
      	', price = ' || zmienna_petli.price
    );
	END LOOP;

	END;
	/
