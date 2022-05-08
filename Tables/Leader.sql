DROP TABLE IF EXISTS Leader;

CREATE TABLE Leader (
	id_prog INT NOT NULL,
	id_manager INT NOT NULL,
	PRIMARY KEY (id_prog, id_manager),
	FOREIGN KEY (id_prog) REFERENCES Progetto(id_prog) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (id_manager) REFERENCES Dipendente(id_dip) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Leader(id_prog, id_manager)
VALUES
	(4239, 543),
	(1028, 677),
	(3943, 334),
	(5487, 124),
	(8912, 979);