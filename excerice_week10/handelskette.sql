

CREATE TABLE produkt (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
);

CREATE TABLE lieferung (
	id INTEGER PRIMARY KEY,
	preis TEXT NOT NULL,
	kunde_id INTEGER NOT NULL,
   date DATETIME NOT NULL, 
   FOREIGN KEY (kunde_id)
       REFERENCES kunde (kunde_id)

	product_id INTEGER NOT NULL
   FOREIGN KEY (product_id)
       REFERENCES product (product_id)
	holding_id INTEGER 
   FOREIGN KEY (holding_id)
       REFERENCES holding (holding_id)
	firma_id INTEGER 
   FOREIGN KEY (firma_id)
       REFERENCES firma (firma_id)
	filiale_id INTEGER 
   FOREIGN KEY (filiale_id)
       REFERENCES filiale (filiale_id)
);


CREATE TABLE kunde (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	lieferung_id INTEGER
   FOREIGN KEY (lieferung_id)
       REFERENCES lieferung (lieferung_id)
	holding_id INTEGER 
   FOREIGN KEY (holding_id)
       REFERENCES holding (holding_id)
	firma_id INTEGER 
   FOREIGN KEY (firma_id)
       REFERENCES firma (firma_id)
	filiale_id INTEGER 
   FOREIGN KEY (filiale_id)
       REFERENCES filiale (filiale_id)

);

CREATE TABLE holding (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
   adresse TEXT NOT NULL
);
CREATE TABLE firma (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL
   adresse TEXT NOT NULL,
);
CREATE TABLE filiale (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
   adresse TEXT NOT NULL
);


select * from lieferung where date > '2005-01-12'

select * from lieferung 
   join holding on lieferung.holding_id = holding.id
   where holding.name = "ABC Holding"


select ALL from lieferung 
   join holding on lieferung.holding_id = holding.id
   where holding.name = "ABC Holding"
   UNION ALL 
   WHERE TRUE; 