DROP TABLE IF EXISTS Team_Sviluppo;
DROP TYPE IF EXISTS sviluppo;

CREATE TYPE sviluppo AS ENUM ('Manager Progetto', 'Sviluppatore', 'Tester', 'Analista Software');

CREATE TABLE Team_Sviluppo (
	id_dip INT NOT NULL,
    id_sede INT NOT NULL,
	tipologia sviluppo NOT NULL,
	PRIMARY KEY (id_dip, id_sede),
	FOREIGN KEY (id_dip, id_sede) REFERENCES Dipendente(id_dip, id_sede) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Team_Sviluppo(id_dip, id_sede, tipologia)
VALUES
	(543, 239, 'Manager Progetto'),
	(333, 389, 'Manager Progetto'),
	(677, 437, 'Manager Progetto'),
	(334, 594, 'Manager Progetto'),
	(124, 239, 'Manager Progetto'),
	(999, 312, 'Sviluppatore'),
	(123, 437, 'Sviluppatore'),
	(432, 594, 'Sviluppatore'),
	(444, 239, 'Sviluppatore'),
	(998, 312, 'Sviluppatore');