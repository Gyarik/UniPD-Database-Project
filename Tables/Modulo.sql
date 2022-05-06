DROP TABLE IF EXISTS Modulo;

CREATE TABLE Modulo (
	id_modulo INT NOT NULL,
	id_prog INT NOT NULL,
	PRIMARY KEY (id_modulo, id_prog),
	FOREIGN KEY (id_prog) REFERENCES Progetto(id_prog) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Modulo(id_modulo, id_prog)
VALUES
	(92610, 4239),
	(70751, 4239),
	(26517, 4239),
	(60255, 4239),
	(96596, 1028),
	(99282, 1028),
	(43392, 1028),
	(51127, 1028),
	(47610, 3943),
	(30592, 3943),
	(21476, 3943),
	(57608, 3943),
	(85126, 5487),
	(42859, 5487),
	(41940, 5487),
	(34954, 5487),
	(63351, 8912),
	(38568, 8912),
	(11343, 8912),
	(34745, 8912),
	(86161, 9302),
	(82973, 9302),
	(88045, 9302),
	(41202, 9302),
	(43103, 6923),
	(51404, 6923),
	(25447, 6923),
	(96485, 6923),
	(50558, 4942),
	(12900, 4942),
	(88449, 4942),
	(82132, 4942),
	(82194, 9455),
	(65102, 9455),
	(69633, 9455),
	(94768, 9455),
	(69420, 7738),
	(74354, 7738),
	(25401, 7738),
	(65628, 7738);