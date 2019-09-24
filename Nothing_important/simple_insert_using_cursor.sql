CREATE TABLE aaaaa_simple2 (
id INTEGER,
val CHAR(1));

CREATE TABLE aaaaa_simple (
id INTEGER,
val CHAR(1));

INSERT INTO aaaaa_simple VALUES(1,'a');
INSERT INTO aaaaa_simple VALUES(2,'b');
INSERT INTO aaaaa_simple VALUES(3,'c');
INSERT INTO aaaaa_simple VALUES(4,'d');
INSERT INTO aaaaa_simple VALUES(5,'e');
INSERT INTO aaaaa_simple VALUES(6,'f');


DECLARE
	 CURSOR C1 IS
     SELECT id, val FROM aaaaa_simple;
BEGIN
FOR I IN C1 LOOP
		 INSERT INTO aaaaa_simple2 (id, val)VALUES( I.id, I.val);         
END LOOP;
END;

