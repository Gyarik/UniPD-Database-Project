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
	(5634, 979, 'MathSolver', 'Applicazione per risolvere problemi matematici complessi', '2022-05-20'),
	(9183, 677, 'GitPublisher', 'App per creare repository automatiche GitHub', '2019-06-22'),
	(2742, 543, 'PrePost', 'Software per la compilazione automatica di Pre e Post nei codici', '2020-03-12'),
	(2687, 122, 'ProjectAlpha', NULL, '2021-1-12'),
	(3131, 158, 'ProjectBeta', NULL, '2022-3-18'),
	(6609, 520, 'ProjectSigma', NULL, '2021-4-27'),
	(4168, 270, 'ProjectTheta', NULL, '2022-7-23'),
	(9199, 878, 'ProjectUtopia', NULL, '2022-8-10'),
	(4258, 270, 'ProjectA1.0', NULL, '2019-12-4'),
	(6020, 158, 'ProjectB1.4', NULL, '2022-10-23'),
	(9272, 520, 'ProjectX', NULL, '2022-9-19'),
	(3014, 878, 'ProjectB1.2', NULL, '2022-5-5'),
	(3974, 122, 'ProjectB1.0', NULL, '2021-1-9'),
	(7508, NULL, 'A', NULL, NULL),
	(5840, NULL, 'B', NULL, NULL),
	(1742, NULL, 'C', NULL, NULL),
	(1068, NULL, 'D', NULL, NULL),
	(4730, NULL, 'E', NULL, NULL),
	(8150, NULL, 'F', NULL, NULL),
	(8742, NULL, 'F', NULL, NULL),
	(9302, NULL, 'EZ Contability', 'Software di contabilita'' per azienda privata', NULL),
	(6923, NULL, 'Vera Linux', 'Distribuzione Linux basata su kernel LTS', NULL),
	(4942, NULL, 'KLogs', 'Software di logging interno', NULL),
	(9455, NULL, 'Bowling Manager', 'Software di amministrazione sale da Bowling', NULL),
	(7738, NULL, 'Emu32', 'Emulatore applicazioni 32-bit su sistemi a 64-bit', NULL),
	(3473, NULL, 'EmuDS', 'Emulatore ufficiale per nintendo DS', NULL),
	(9832, NULL, 'CountGas', 'Software che tiene conto delle oscillazioni di mercato del carburante', NULL),
	(2811, NULL, 'EasyFork', 'Permette di forkare le repo di github senza notifica', NULL);