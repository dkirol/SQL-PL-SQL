/* 
	Funkcja przypomina procedure z tym że Funkcja musi zwracać wartość 
	Przykład:
*/

CREATE OR REPLACE FUNCTION name_function (
 enter_value_product_type_id IN INTEGER ) 
RETURN NUMBER AS
 value_min_product_price NUMBER;
 value_factor NUMBER := 0.75;
BEGIN
 SELECT (AVG(price) * value_factor)
 INTO value_min_product_price
 FROM products
 WHERE product_type_id = enter_value_product_type_id;
 RETURN value_min_product_price;
 END name_function;
 /
