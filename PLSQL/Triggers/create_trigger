/*
	Wyzwalacz jest procedurą automatyczną uruchamiana w przypadku wystąpienia danej instrukcji DML(insert, update itd)
	Schmeta tworzenia wyzwalacza:
		CREATE OR REPLACE TRIGGER nazwa_wyzwalacza
		BEFORE | AFTER | INSTEAD OF | FOR zdarzenie_wyzwalacza 			-- określamy tutaj kiedy wyzwalacz ma być uruchomiony i po jakiej instrukcji/zdarzeniu
		ON nazwa_tabeli
		FOR EACH ROW													-- informujemy czy  ma być to wyzwalacz dla każdej po kolei wiersza, jeśli użyjemy for each row robimy wyzwalacz poziomu wierszy a nie instrukcji
		FORWARD | REVERSE CROSSEDITION									-- FORWARD CROSSEDITION jest opcją która uruchamia wyzwalacz gdy wykonywane są instukcje DML a aplikacj która korzysta z bazy danych jest aktualizowana bąź poprawiana(ustawienie domyślne)
																		-- REVERSE CROSSEDITION jest opcją ktora uruchamia wyzwalacz po wykoanniu aktualizacji lub poprawek w aplikacji
		FOLLOWS | PRECEDES schemat.inny_wyzwalacz 						-- dana opcja określa czy uruchomienia wyzwalacza odbywa sie przed uruchomieniem schemat.inny_wyzwalacz czy może po
		ENABLE | DISABLE												-- określa czy wzywalacz jest początkowo włączony czy wyłączony (domyślnie jest włączony)
		WHEN warunek_wyzwalacz

		BEGIN

		END;
		/
		Przykład utworzenia wyzwalacza:
*/
		CREATE OR REPLACE TRIGGER wyzwalacz_1
		AFTER INSERT ON products
		FOR EACH ROW
		DECLARE
		nowy_produkt VARCHAR2(50) := products.name;
		BEGIN
		DBMS_OUTPUT.PUT_LINE('Wprowadzono nowy produkt: ');
		INSERT INTO new_products(name_product) VALUES (:new.name); 
		END wyzwalacz_1;
		/