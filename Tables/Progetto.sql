DROP TABLE IF EXISTS Progetto;

CREATE TABLE Progetto (
	id_prog INT NOT NULL,
	nome_prog VARCHAR(20) NOT NULL,
	descrizione VARCHAR(100),
	data_inizio DATE NOT NULL,
	PRIMARY KEY id_prog
);

INSERT INTO Progetto(id_prog, nome_prog, descrizione, data_inizio)
VALUES
	(4239, 'LWJGL', 'Libreria Java ottimizzata per sviluppo giochi', '2020-10-11'),
	(1028, 'AirScan', 'Software per elaborazione dati condizioni dell''aria', '2020-09-11'),
	(3943, 'ATM Intesa', 'Software ATM per banche Intesa Sanpaolo', '2021-12-16'),
	(5487, 'MedData', 'Server Database + Front-end per ospedali', '2021-05-06'),
	(8912, 'MathGFX', 'Motore grafico per Dip. di Matematica basato su OpenGL', '2020-05-20'),
	(9302, 'EZ Contability', 'Software di contabilita'' per azienda privata', '2022-03-17'),
	(6923, 'Vera Linux', 'Distribuzione Linux basata su kernel LTS', '2021-01-06'),
	(4942, 'KLogs', 'Software di logging interno', '2020-04-27'),
	(9302, 'Bowling Manager', 'Software di amministrazione sale da Bowling', '2021-06-02'),
	(7738, 'Emu32', 'Emulatore applicazioni 32-bit su sistemi a 64-bit', '2020-08-18');