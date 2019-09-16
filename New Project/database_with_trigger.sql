CREATE TABLE employees (
id_employee INTEGER GENERATED BY DEFAULT AS IDENTITY,
first_name VARCHAR2(40),
last_name VARCHAR2(50),
pesel NUMBER(11),
department VARCHAR2(60),
id_manager INTEGER,
CONSTRAINT c_manager FOREIGN KEY(id_manager) REFERENCES aaaa_employees(id_employee),
CONSTRAINT pk_employees PRIMARY KEY (id_employee)
);

CREATE TABLE contacts (
id_employee INTEGER,
city VARCHAR2(50) NOT NULL,
street VARCHAR2(50) NOT NULL,
num CHAR(10),
phone NUMBER(9),
mail VARCHAR2(40),
CONSTRAINT pk_contacts PRIMARY KEY (id_employee),
CONSTRAINT fk_contact_employees FOREIGN KEY(id_employee) REFERENCES employees (employee_id)
);

CREATE TABLE employment (
id_employee INTEGER,
type_of_employment VARCHAR(30),
salary NUMBER(10, 2),
start_work DATE,
finish_work DATE DEFAULT NULL,
count_free_day NUMBER(4,1),
state_student CHAR(1) DEFAULT 'N',
CONSTRAINT pk_employment PRIMARY KEY (id_employee),
CONSTRAINT check_type_of_employment CHECK(type_of_employment IN ('Umowa Zlecenie', 'Umowa B2B', 'Umowa o Dzielo', 'Umowa o Prace')),
CONSTRAINT fk_employment_employees FOREIGN KEY (id_employee) REFERENCES employees(id_employee)
);

CREATE TABLE holiday (
id_holiday INTEGER GENERATED BY DEFAULT AS IDENTITY,
id_employee INTEGER,
count_holiday INTEGER,
type_of_holiday VARCHAR2(30),
start_holiday DATE,
end_holiday DATE,
confirmed CHAR(1) DEFAULT 'N',
CONSTRAINT pk_holiday PRIMARY KEY(id_holiday),
CONSTRAINT fk_holiday_employees FOREIGN KEY (holiday) REFERENCES employees (employee_id),
CONSTRAINT check_type_of_holiday CHECK (type_of_holiday IN ('Urlop', 'Urlop Macierzynski', 'Chorobowe'))
);

CREATE TABLE hour_in_work (
id_hour_in_work INTEGER GENERATED BY DEFAULT AS IDENTITY,
id_employee INTEGER,
date_work DATE DEFAULT CURRENT_DATE,
hour_in_work NUMBER(5,2),
start_work TIMESTAMP,
finish_work TIMESTAMP,
CONSTRAINT pk_hour_in_work PRIMARY KEY (id_hour_in_work),
CONSTRAINT fk_hour_in_work_employees FOREIGN KEY (id_employee) REFERENCES employees(id_employee)
);

CREATE TABLE task_for_employees (
id_task INTEGER GENERATED BY DEFAULT AS IDENTITY,
id_employee INTEGER,
duration NUMBER(5,2),
stage NUMBER(1),
comment VARCHAR2(500),
CONSTRAINT pk_task_for_employees PRIMARY KEY(id_task),
CONSTRAINT check_stage CHECK(stage IN (1, 2, 3, 4, 5))
);

CREATE TABLE aaaaa_customers (
id_customer INTEGER GENERATED BY DEFAULT AS IDENTITY,
first_name VARCHAR2(30),
last_name VARCHAR2(30),
pesel NUMBER(11),
CONSTRAINT pk_customers PRIMARY KEY (id_customer)
);


CREATE TABLE contacts_customers (
id_customer INTEGER,
city VARCHAR2(50) NOT NULL,
street VARCHAR2(50) NOT NULL,
num CHAR(10),
phone NUMBER(9),
mail VARCHAR2(40),
CONSTRAINT pk_contacts_customers PRIMARY KEY (id_customer),
CONSTRAINT fk_contacts_customers FOREIGN KEY(id_customer) REFERENCES customers(id_customer)
);


CREATE TABLE aaaaa_orders (
id_order INTEGER GENERATED BY DEFAULT AS IDENTITY,
id_customer INTEGER,
id_product INTEGER,
type_pay CHAR(4),
count_part_pay NUMBER(3),
order_date TIMESTAMP,
CONSTRAINT pk_orders PRIMARY KEY (id_order),
CONSTRAINT check_type_pay CHECK (type_pay IN ('full','part')),
CONSTRAINT fk_orders_customer FOREIGN KEY (id_customer) REFERENCES aaaaa_customers(id_customer),
CONSTRAINT fk_orders_products FOREIGN KEY (id_product) REFERENCES aaaaa_products (id_product)
);

CREATE TABLE aaaaa_part_paid (
id_part_paid INTEGER GENERATED BY DEFAULT AS IDENTITY,
id_order INTEGER,
number_of_paid INTEGER,
amount NUMBER(6,2),
end_pay_date DATE,
confirmed CHAR(1) DEFAULT 'N',
CONSTRAINT pk_part_paid PRIMARY KEY (id_part_paid),
CONSTRAINT fk_part_paid_orders FOREIGN KEY (id_order) REFERENCES aaaaa_orders(id_order)
);

CREATE TABLE aaaaa_products(
id_product INTEGER GENERATED BY DEFAULT AS IDENTITY,
product_name VARCHAR2(40),
price NUMBER(10,2),
CONSTRAINT pk_products PRIMARY KEY (id_product)
);

--TRIGGER kt�ry tworzy raty dla danego zakupu(w przypadku wzi�cia raty)

CREATE OR REPLACE TRIGGER part_orders
AFTER INSERT OR UPDATE
ON aaaaa_orders
FOR EACH ROW

DECLARE

v_type_pay aaaaa_orders.type_pay%TYPE := :new.type_pay; -- typ patno�ci
v_count_part_pay aaaaa_orders.count_part_pay%TYPE := :new.count_part_pay; -- liczba rat wybranych
v_id_order aaaaa_orders.id_order%TYPE := :new.id_order; -- numer zam�wienia
v_id_product aaaaa_orders.id_product%TYPE := :new.id_product; -- numer produktu
v_end_pay_date DATE := CURRENT_DATE; -- finalny dzien platnosci
v_amount NUMBER(6,2); -- kwota raty
v_price aaaaa_products.price%TYPE; -- kwota produktu

BEGIN


SELECT price
INTO v_price
FROM aaaaa_products
WHERE id_product = v_id_product;

IF v_type_pay = 'part' THEN
v_amount := (v_price * 1.2) / v_count_part_pay;

FOR i IN 1..v_count_part_pay
LOOP

INSERT INTO aaaaa_part_paid(id_order, number_of_paid, amount, end_pay_date)
VALUES (v_id_order, i, v_amount, ROUND(ADD_MONTHS(v_end_pay_date, i), 'MM') + 10);
END LOOP;


END IF;

END;



/*DECLARE
month_some DATE := CURRENT_DATE;
BEGIN
FOR i IN 1..10
LOOP

DBMS_OUTPUT.PUT_LINE(ROUND(ADD_MONTHS(month_some, i), 'MM')+ 10);
END LOOP;
END;
*/
