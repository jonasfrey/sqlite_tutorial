
CREATE TABLE liferant (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
);


CREATE TABLE warenhaus (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
);

CREATE TABLE artikel (
	id INTEGER PRIMARY KEY,
	price FLOAT NOT NULL,
	name UNIQUE TEXT NOT NULL,
);
CREATE TABLE warenhaus_artikel (
	warenhaus_id INTEGER NOT NULL,
	artikel_id INTEGER NOT NULL,
    bestandesmenge INTEGER NOT NULL
    FOREIGN KEY (warenhaus_id)
       REFERENCES warenhaus (warenhaus_id)
    FOREIGN KEY (artikel_id)
       REFERENCES artikel (artikel_id) 
);

-- extension

CREATE TABLE verkauf (
	id INTEGER PRIMARY KEY,
	price FLOAT NOT NULL,
	warenhaus_id INTEGER NOT NULL,
	artikel_id INTEGER NOT NULL,
    FOREIGN KEY (warenhaus_id)
       REFERENCES warenhaus (warenhaus_id)
    FOREIGN KEY (artikel_id)
       REFERENCES artikel (artikel_id)
);

CREATE TABLE versand (
	id INTEGER PRIMARY KEY,
	verkauf_id FLOAT NOT NULL,
    FOREIGN KEY (verkauf_id)
       REFERENCES verkauf (verkauf_id)
);
