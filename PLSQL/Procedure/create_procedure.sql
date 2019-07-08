/*
	Struktura tworzenia procedury:
	CREATE OR REPLACE PROCEDURE name_procedure (
	name_value IN / OUT / IN OUT type_of_data)
	IS / AS
	BEGIN
	contents_of_procedure
	END name_procedure

	Opis:
	IN - jest wartością domyslną w procedurze, oznacza że wartość paraemtru musi być w momencie uruchamianie procedury
	OUT - oznacza że wartość jest ustawiana w treści procedury
	IN OUT - oznacza że parametr może mieć wartość w momencie uruchamiania procedury i może zostać zmieniona w treści procedury

	Przykład:
*/
CREATE OR REPLACE PROCEDURE procedure_number_1(
	value_product_id IN products.product_id%TYPE,
	value_factor IN NUMBER)
AS
	value_count INTEGER;
BEGIN
	SELECT COUNT(*)
	INTO value_count
	FROM products
	WHERE product_id=value_product_id;

	IF value_count = 1 THEN
	  UPDATE products
	  SET price = price * value_factor
	  WHERE product_id=value_product_id;
	  COMMIT;
	END IF;

	EXCEPTION
	  WHEN OTHERS THEN
	  ROLLBACK;

END procedure_number_1;
/