CREATE OR REPLACE PROCEDURE example_procedure(
old_value_data_create INTEGER,
new_value_data_create IN DATE)
IS
BEGIN
UPDATE products
SET data_create = new_value_data_create
WHERE EXTRACT(YEAR FROM data_create) = old_value_data_create;
END;

CALL example_procedure (2018, SYSDATE);