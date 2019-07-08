ALTER SESSION SET nls_date_format = 'DD/MM/YYYY';
ALTER TABLE products
ADD data_creat DATE;
COMMIT;

CREATE OR REPLACE VIEW view_example AS
SELECT product_id, name, description, price
from products
where (price BETWEEN 15 AND 50) AND data_create BETWEEN '01/01/2019' AND '31/12/2019';