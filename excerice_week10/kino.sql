
CREATE TABLE kino (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
);


CREATE TABLE saal (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
    kino_id INTEGER NOT NULL
    FOREIGN KEY (kino_id)
       REFERENCES kino (kino_id)
);


CREATE TABLE film (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
 	length_min REAL NOT NULL,
);

CREATE TABLE vorfuehrung (
	id INTEGER PRIMARY KEY,
    film_id INTEGER NOT NULL
    FOREIGN KEY (film_id)
       REFERENCES film (film_id)
    sprache_id INTEGER NOT NULL
    FOREIGN KEY (sprache_id)
       REFERENCES sprache (sprache_id)
    saal_id INTEGER NOT NULL
    FOREIGN KEY (saal_id)
       REFERENCES saal (saal_id)
    start_ts_sec INTEGER NOT NULL
);

CREATE TABLE ticket (
	id INTEGER PRIMARY KEY,
	price REAL NOT NULL,
    vorfuehrung_id INTEGER NOT NULL
    FOREIGN KEY (vorfuehrung_id)
       REFERENCES vorfuehrung (vorfuehrung_id)
);

CREATE TABLE sprache (
	id INTEGER PRIMARY KEY,
	iso_code TEXT NOT NULL,
);

CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
);