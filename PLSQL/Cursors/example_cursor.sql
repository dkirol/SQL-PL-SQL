SET SERVEROUTPUT ON;

DECLARE
name VARCHAR2(30);
surname VARCHAR2(30);
salary NUMBER;
medium_salary NUMBER;

CURSOR info_salary_in_company IS
SELECT first_name, last_name, salary
FROM employees_test
ORDER BY salary;

CURSOR avg_salary IS
SELECT AVG(salary)
FROM employees_test;

BEGIN
OPEN info_salary_in_company;
OPEN  avg_salary;

FETCH avg_salary
INTO medium_salary;

DBMS_OUTPUT.PUT_LINE('Average Salary in company equal: ' || medium_salary);

LOOP
FETCH info_salary_in_company
INTO name, surname, salary;
EXIT WHEN info_salary_in_company%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Name: ' || name || ' ' || surname ||' Salary: ' || salary);
END LOOP;

CLOSE info_salary_in_company;
END;
/