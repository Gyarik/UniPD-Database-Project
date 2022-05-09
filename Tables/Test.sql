DROP TABLE IF EXISTS Test CASCADE;

CREATE TABLE Test (
	id_test INT NOT NULL,
	id_dip INT NOT NULL,
	id_modulo INT NOT NULL,
	UNIQUE (id_test),
	PRIMARY KEY (id_test, id_modulo),
	FOREIGN KEY (id_modulo) REFERENCES Modulo(id_modulo),
	FOREIGN KEY (id_dip) REFERENCES Dipendente(id_dip)
);