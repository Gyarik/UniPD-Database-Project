DROP TABLE IF EXISTS Progetto CASCADE;

CREATE TABLE Progetto (
	id_prog INT NOT NULL,
	id_manager INT,
	nome_prog VARCHAR(20) NOT NULL,
	descrizione VARCHAR(100),
	data_inizio DATE,
	PRIMARY KEY (id_prog),
	FOREIGN KEY (id_manager) REFERENCES Dipendente(id_dip)
);

INSERT INTO Progetto(id_prog, id_manager, nome_prog, descrizione, data_inizio)
VALUES
	(4239, 543, 'LWJGL', 'Libreria Java ottimizzata per sviluppo giochi', '2020-10-11'),
	(1028, 677, 'AirScan', 'Software per elaborazione dati condizioni dell''aria', '2020-09-11'),
	(3943, 334, 'ATM Intesa', 'Software ATM per banche Intesa Sanpaolo', '2021-12-16'),
	(5487, 124, 'MedData', 'Server Database + Front-end per ospedali', '2021-05-06'),
	(8912, 979, 'MathGFX', 'Motore grafico per Dip. di Matematica basato su OpenGL', '2020-05-20'),
	(9302, NULL, 'EZ Contability', 'Software di contabilita'' per azienda privata', NULL),
	(6923, NULL, 'Vera Linux', 'Distribuzione Linux basata su kernel LTS', NULL),
	(4942, NULL, 'KLogs', 'Software di logging interno', NULL),
	(9455, NULL, 'Bowling Manager', 'Software di amministrazione sale da Bowling', NULL),
	(7738, NULL, 'Emu32', 'Emulatore applicazioni 32-bit su sistemi a 64-bit', NULL);