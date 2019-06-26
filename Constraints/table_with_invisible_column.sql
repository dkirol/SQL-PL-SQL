CREATE TABLE table_with_default_null{
	id_table INTEGER NOT NULL,
	price NUMBER(6,2),
	title VARCHAR2(30) VISIBLE,
	id_category CHAR(1) INVISIBLE,
	CONSTRAINT pk_table_inivisible PRIMARY KEY (id_table),
	CONSTRAINT fk_category FOREIGN KEY (id_category) REFERENCES category(id_category)
}
/*Aby zobaczyż kolumny niewidoczne, trzeba użyc komendy: SET COLINVISIBLE ON */
/
