-- CODICE SQL RELATIVO ALLA SOFTWARE HOUSE "KeplerSoftware"


--      ELIMINAZIONE DELLE TABELLE SE GIA ESISTENTI     --
DROP TABLE IF EXISTS Test;
DROP TABLE IF EXISTS Assegnazione;
DROP TABLE IF EXISTS Valutazione;
DROP TABLE IF EXISTS Accordo;
DROP TABLE IF EXISTS Contratto;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Retribuzioni;
<<<<<<< HEAD
DROP TABLE IF EXISTS Modulo;
DROP TABLE IF EXISTS Progetto;
DROP TABLE IF EXISTS Dipendente;
DROP TABLE IF EXISTS Transazione;
DROP TABLE IF EXISTS Sede;
















=======
DROP TABLE IF EXISTS Transazione;
DROP TABLE IF EXISTS Modulo;
DROP TABLE IF EXISTS Progetto;
DROP TABLE IF EXISTS Dipendente;
DROP TABLE IF EXISTS Sede;
>>>>>>> 87746a3f6694f1b57290a1f5c51aafe5b0f178d4



--      ELIMINAZIONE DEI TIPI SE GIA ESISTENTI      --
DROP TYPE IF EXISTS tipo_dip;
DROP TYPE IF EXISTS tipo;



--      CREAZIONE DEI TIPI      --
CREATE TYPE tipo_dip AS ENUM ('Direttore', 'Manager Generale', 'Manager Progetto', 'Sviluppatore', 'Tester', 'Addetto Marketing');
CREATE TYPE tipo AS ENUM ('Uscita', 'Entrata', 'Fattura', 'Stipendio');


--      CREAZIONE DELLE TABELLE     --


--TABELLA SEDE
CREATE TABLE Sede (
	id_sede INT NOT NULL,
	n_civico CHAR(5) NOT NULL,
	via VARCHAR(20) NOT NULL,
	citta VARCHAR(20) NOT NULL,
	provincia CHAR(2) NOT NULL,
	cap CHAR(5) NOT NULL,
	PRIMARY KEY (id_sede)
);

--TABELLA DIPENDENTE
CREATE TABLE Dipendente (
    id_dip INT NOT NULL,
    id_sede INT NOT NULL,
    nome VARCHAR (20) NOT NULL,
    cognome VARCHAR (20) NOT NULL,
    tipologia tipo_dip NOT NULL,
    data_nascita DATE NOT NULL,
	UNIQUE (id_dip),
    PRIMARY KEY (id_dip, id_sede),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede) ON UPDATE CASCADE ON DELETE CASCADE
);

--TABELLA PROGETTO
CREATE TABLE Progetto (
	id_prog INT NOT NULL,
	id_manager INT,
	nome_prog VARCHAR(20) NOT NULL,
	descrizione VARCHAR(100),
	data_inizio DATE,
	PRIMARY KEY (id_prog),
	FOREIGN KEY (id_manager) REFERENCES Dipendente(id_dip)
);

--TABELLA MODULO
CREATE TABLE Modulo (
	id_modulo INT NOT NULL,
	id_prog INT NOT NULL,
	UNIQUE (id_modulo),
	PRIMARY KEY (id_modulo, id_prog),
	FOREIGN KEY (id_prog) REFERENCES Progetto(id_prog) ON UPDATE CASCADE ON DELETE CASCADE
);

--TABELLA TRANSAZIONE
CREATE TABLE Transazione (
    id_trz INT NOT NULL,
    id_sede INT NOT NULL,
    tipo_trz tipo NOT NULL,
    saldo INT NOT NULL CHECK (saldo <> 0),
    descrizione VARCHAR (300),
    data_trz DATE NOT NULL,
	UNIQUE (id_trz),
    PRIMARY KEY (id_trz, id_sede),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede) ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK (((tipo_trz = 'Uscita' OR tipo_trz = 'Stipendio') AND saldo < 0) or ((tipo_trz = 'Entrata' OR tipo_trz = 'Fattura') and saldo > 0))
);

--TABELLA RETRIBUZIONI
CREATE TABLE Retribuzioni (
    id_trz INT NOT NULL,
    id_dip INT NOT NULL,
    PRIMARY KEY (id_trz, id_dip),
	FOREIGN KEY (id_trz) REFERENCES Transazione(id_trz),
    FOREIGN KEY (id_dip) REFERENCES Dipendente(id_dip)
);

--TABELLA CLIENTE
CREATE TABLE Cliente (
    p_iva VARCHAR(11) NOT NULL,
    nome_azienda VARCHAR(50) NOT NULL,
    PRIMARY KEY (p_iva)
);

--TABELLA ACCORDO
CREATE TABLE Accordo (
   id_dip INT NOT NULL,
   p_iva VARCHAR(11) NOT NULL, 
   PRIMARY KEY (id_dip, p_iva),
   FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip),
   FOREIGN KEY (p_iva) REFERENCES Cliente (p_iva)
);

--TABELLA VALUTAZIONE
CREATE TABLE Valutazione (
    id_dip INT NOT NULL, 
    id_prog INT NOT NULL,
    esito BOOLEAN,
    PRIMARY KEY (id_dip, id_prog),
    FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip),
    FOREIGN KEY (id_prog) REFERENCES Progetto (id_prog)
);

--TABELLA ASSEGNAZIONE
CREATE TABLE Assegnazione (
    id_dip INT NOT NULL,
    id_modulo INT NOT NULL,
    PRIMARY KEY (id_dip, id_modulo),
    FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip),
    FOREIGN KEY (id_modulo) REFERENCES Modulo (id_modulo)
);

--TABELLA TEST
CREATE TABLE Test (
	id_test INT NOT NULL,
	id_dip INT NOT NULL,
	id_modulo INT NOT NULL,
	UNIQUE (id_test),
	PRIMARY KEY (id_test, id_modulo),
	FOREIGN KEY (id_modulo) REFERENCES Modulo(id_modulo),
	FOREIGN KEY (id_dip) REFERENCES Dipendente(id_dip)
);

--TABELLA CONTRATTO
CREATE TABLE Contratto (
    id_contratto INT NOT NULL,
    p_iva VARCHAR(11) NOT NULL,
    id_dip INT NOT NULL,
    descrizione VARCHAR(200),
    data_firma DATE NOT NULL,
	UNIQUE(id_contratto),
    PRIMARY KEY (id_contratto, p_iva, id_dip),
    FOREIGN KEY (p_iva) REFERENCES Cliente (p_iva),
    FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip)
);



--      INSERIMENTO DEI DATI NELLE TABELLE --

--INSERIMENTO TABELLA SEDE
INSERT INTO Sede(id_sede, n_civico, via, citta, provincia, cap)
VALUES
	(389, '81', 'Via Ospedale Civile', 'Padova', 'PD', '35121'),
	(437, '9', 'Via Tumedei Casalis', 'Carmagnola', 'TO', '10022'),
	(594, '74', 'Via Delle Pianazze', 'La Spezia', 'SP', '19136'),
	(239, '57', 'Via Torelli', 'Prato', 'PO', '59100'),
	(312, '2', 'Via Delle Gagliarde', 'Arezzo', 'AR', '52100');

--INSERIMENTO TABELLA DIPENDENTE
INSERT INTO Dipendente(id_dip, id_sede, nome, cognome, tipologia, data_nascita)
VALUES
    (212, 389, 'Ivan', 'Ocardi', 'Sviluppatore', '1990-4-16'),
    (423, 437, 'Leonardo', 'Gallenzi', 'Manager Generale', '1974-8-20'),
    (675, 594, 'Vanessa', 'Masciangoli', 'Addetto Marketing', '1998-8-29'),
    (764, 239, 'Enrica', 'Semilla', 'Sviluppatore', '1995-2-16'),
    (234, 312, 'Dionigi', 'Neffati', 'Manager Generale', '1994-2-18'),
    (119, 389, 'Ginevra', 'Grandia', 'Sviluppatore', '1992-7-25'),
    (777, 437, 'Maurizio', 'Przypalinski', 'Addetto Marketing',  '1987-2-28'),
    (723, 594, 'Guerino', 'Bonna', 'Sviluppatore',  '1991-1-25'),
    (609, 239, 'Selene', 'Saragni', 'Direttore', '1998-11-11'),
    (420, 312, 'Rosalia', 'Carogioiello', 'Addetto Marketing', '2001-12-3'),
    (690, 389, 'Tobia', 'Galizi', 'Tester', '1992-8-7'),
    (111, 437, 'Candido', 'Berod', 'Tester', '2002-4-14'),
    (309, 594, 'Remigio', 'Cicuzza', 'Direttore', '1977-11-22'),
    (543, 239, 'Telemaco', 'Formenti', 'Manager Progetto', '1986-3-24'),
    (890, 312, 'Geronimo', 'Scicchitano', 'Direttore', '1992-7-19'),
    (333, 389, 'Adriano', 'Polledrotti', 'Tester', '1989-5-23'),
    (677, 437, 'Stella', 'Giangiuli', 'Manager Progetto', '2004-3-23'),
    (334, 594, 'Ilario', 'Angrisano', 'Manager Progetto', '1978-9-3'),
    (124, 239, 'Iole', 'Navazzotti', 'Manager Progetto', '1991-9-8'),
    (999, 312, 'Valente', 'Journo', 'Sviluppatore', '1973-6-30'),
    (173, 389, 'Diodato', 'Cadice', 'Direttore', '1980-7-3'),
    (123, 437, 'Salomone', 'Nevoloso', 'Sviluppatore', '1995-11-5'),
    (432, 594, 'Ulrico', 'Groth', 'Sviluppatore', '1996-12-5'),
    (444, 239, 'Tizio', 'Camesaschi', 'Sviluppatore', '1974-12-25'),
    (998, 312, 'Ludovico', 'Deodati', 'Sviluppatore', '1986-4-3'),
    (787, 389, 'Michele', 'Ballabene', 'Tester', '1998-5-30'),
    (347, 437, 'Massimiliano', 'Sangues', 'Addetto Marketing', '1998-3-7'),
    (789, 594, 'Edmonda', 'Mughini', 'Tester', '1995-6-23'),
    (989, 239, 'Alessio', 'Rigli', 'Manager Generale', '1998-12-24'),
    (979, 312, 'Rosamunda', 'Chizzotti', 'Manager Progetto', '1988-4-9'),
    (595, 389, 'Diogene', 'Schiapelli', 'Tester', '1995-4-2'),
    (238, 437, 'Gaudenzia', 'Stramucci', 'Addetto Marketing', '1984-3-6'),
    (611, 594, 'Gianfranca', 'Orezzoli', 'Sviluppatore', '1994-6-6'),
    (511, 312, 'Gaspare', 'Strazzoso', 'Sviluppatore', '1989-4-17'),
    (281, 389, 'Andriano', 'Pontetti', 'Addetto Marketing', '1981-7-2'),
    (741, 437, 'Giusta', 'Bauer', 'Addetto Marketing', '1972-9-23'),
    (689, 594, 'Pippo', 'Colozzo', 'Addetto Marketing', '1992-7-30'),
    (589, 239, 'Crescenzo', 'Sciannamè', 'Addetto Marketing', '1973-9-24'),
    (699, 312, 'Melania', 'Pagliarello', 'Manager Generale', '1998-5-30'),
    (865, 389, 'Eusebia', 'Sammaritano', 'Manager Generale', '1973-10-13'),
    (698, 437, 'Walter', 'Hdada', 'Manager Generale', '1998-6-30');
	
--INSERIMENTO TABELLA PROGETTO
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

--INSERIMENTO TABELLA MODULO
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

--INSERIMENTO TABELLA TRANSAZIONE
INSERT INTO Transazione (id_trz, id_sede, tipo_trz, saldo, descrizione, data_trz)
VALUES
    --Uscite per la sede 389
    (1, 389, 'Uscita', -1230, 'Manutenzione impianto elettrico reparto amministrazione', '2020-12-1' ),
    (2, 389, 'Uscita', -3234, 'Acquisto due computer per sviluppatori', '2021-4-17' ),
    (3, 389, 'Uscita', -240, 'Rifornimento merende secondo piano', '2022-3-14'),
    (4, 389, 'Uscita', -1221, 'Computer portatile per sviluppatore', '2022-3-14'),
    (5, 389, 'Uscita', -23000, 'Ristrutturazione pavimento piano terzo', '2017-9-21'),
    (6, 389, 'Uscita', -100, 'Macchina del caffè per amministratore piano 2', '2021-7-29'),

    --Entrate per la sede 389
    (7, 389, 'Entrata', 10000, 'Vendita licenza', '2022-1-31'),
    (8, 389, 'Entrata', 3020, 'Vendita piccolo software', '2020-9-29'),
    (9, 389, 'Entrata', 2550, 'Vendita piccolo software', '2019-5-11'),
    (10, 389, 'Entrata', 6700, 'Vendita licenza', '2021-7-15'),
    (11, 389, 'Entrata', 9800, 'Vendita licenza', '2022-3-10'),
    (12, 389, 'Entrata', 29422, 'Vendita licenza', '2022-4-5'),

    --Fatture per la sede 389
    (13, 389, 'Fattura', 350, 'Fattura per consulenza', '2022-5-14'),
    (14, 389, 'Fattura', 1000, 'Fattura per consulenza', '2022-2-19'),
    (15, 389, 'Fattura', 920, 'Fattura per consulenza', '2022-3-27'),
    (16, 389, 'Fattura', 4500, 'Fattura vendita', '2022-4-23'),
    (17, 389, 'Fattura', 1200, 'Fattura computer assemblato', '2022-4-19'),
    (18, 389, 'Fattura', 300, 'Fattura per consulenza', '2022-5-12'),

    --Stipendi per la sede 389
    (19, 389, 'Stipendio', -1500, 'Retribuzione dipendente', '2022-1-1'),
    (20, 389, 'Stipendio', -2000, 'Retribuzione dipendente', '2022-4-1'),
    (21, 389, 'Stipendio', -1250, 'Retribuzione dipendente', '2022-3-15'),
    (22, 389, 'Stipendio', -1220, 'Retribuzione dipendente', '2022-2-19'),
    (23, 389, 'Stipendio', -2500, 'Retribuzione dipendente', '2022-3-11'),
    (24, 389, 'Stipendio', -3500, 'Retribuzione dipendente', '2022-2-2'),

    --Uscite per la sede 437
    (25, 437, 'Uscita', -300, 'Nuovo climatizzatore ufficio incontri', '2021-10-9'),
    (26, 437, 'Uscita', -5700, 'Acquisto nuovi dispositivi', '2020-10-7'),
    (27, 437, 'Uscita', -650, 'Postazione da gaming di prova', '2022-3-4'),
    (28, 437, 'Uscita', -2300, 'Nuove console da testing videogiochi', '2021-6-26'),
    (29, 437, 'Uscita', -4500, 'Nuovi pc per dipendenti', '2020-7-20'),
    (30, 437, 'Uscita', -3000, 'Nuova postazione simulatore', '2021-11-17'),

    --Entrate per la sede 437
    (31, 437, 'Entrata', 5000, 'Vendita piccolo software', '2019-6-20'),
    (32, 437, 'Entrata', 9500, 'Vendita licenza', '2021-12-10'),
    (33, 437, 'Entrata', 15000, 'Vendita licenza', '2022-4-29'),
    (34, 437, 'Entrata', 150, 'Consulenza', '2022-1-23'),
    (35, 437, 'Entrata', 3000, 'Vendita piccolo software', '2021-5-27'),
    (36, 437, 'Entrata', 1000000, 'Vendita licenza', '2022-1-1'),

    --Fatture per la sede 437
    (37, 437, 'Fattura', 400, 'Fattura per consulenza', '2020-05-14'),
    (38, 437, 'Fattura', 350, 'Fattura per consulenza',  '2020-12-13'),
    (39, 437, 'Fattura', 2300, 'Fattura per computer assemblato', '2021-10-13'),
    (40, 437, 'Fattura', 1000, 'Fattura per consulenza', '2021-12-04'),
    (41, 437, 'Fattura', 1500, 'Fattura per computer assemblato', '2022-08-20'),
    (42, 437, 'Fattura', 150, 'Fattura per consulenza', '2020-07-22'),

    --Stipendi per la sede 437
    (43, 437, 'Stipendio', -2000, 'Retribuzione dipendente', '2022-2-4'),
    (44, 437, 'Stipendio', -1750, 'Retribuzione dipendente', '2022-5-5'),
    (45, 437, 'Stipendio', -1300, 'Retribuzione dipendente', '2022-2-21'),
    (46, 437, 'Stipendio', -1200, 'Retribuzione dipendente', '2022-5-8'),
    (47, 437, 'Stipendio', -1350, 'Retribuzione dipendente', '2022-5-13'),
    (48, 437, 'Stipendio', -3500, 'Retribuzione dipendente', '2022-3-24'),

    --Uscite per la sede 594
    (49, 594, 'Uscita', -1300, 'Nuove console da testing videogiochi', '2021-5-23'),
    (50, 594, 'Uscita', -2500, 'Nuovo pc', '2022-3-19'),
    (51, 594, 'Uscita', -3000, 'Nuovo pc per test gaming', '2021-12-29'),
    (52, 594, 'Uscita', -6000, 'Nuove postazioni per riparazione computer e telefoni', '2022-5-14'),
    (53, 594, 'Uscita', -1200, 'Nuove console da testing videogiochi', '2021-8-27'),
    (54, 594, 'Uscita', -3000, 'Componentistica varia', '2021-10-11'),

    --Entrate per la sede 594
    (55, 594, 'Entrata', 19755, 'Vendita licenza', '2020-07-18'),
    (56, 594, 'Entrata', 1000, 'Vendita piccolo software', '2021-04-05'),
    (57, 594, 'Entrata', 750, 'Consulenza a cliente', '2021-07-05'),
    (58, 594, 'Entrata', 13937, 'Vendita licenza', '2021-07-30'),
    (59, 594, 'Entrata', 2000, 'Vendita piccolo software', '2022-05-05'),
    (60, 594, 'Entrata', 3450, 'Vendita computer da gaming', '2022-11-17'),

    --Fatture per la sede 594
    (61, 594, 'Fattura', 1300, 'Fattura per computer da gaming', '2020-04-17'),
    (62, 594, 'Fattura', 500, 'Fattura per consulenza', '2020-07-24'),
    (63, 594, 'Fattura', 350, 'Fattura per consulenza', '2021-01-01'),
    (64, 594, 'Fattura', 1200, 'Fattura per computer da gaming', '2021-01-25'),
    (65, 594, 'Fattura', 1500, 'Fattura per computer da gaming', '2021-03-04'),
    (66, 594, 'Fattura', 400, 'Fattura per consulenza', '2021-04-01'),

    --Stipendi per la sede 594
    (67, 594, 'Stipendio', -1250, 'Retribuzione dipendente', '2022-01-23'),
    (68, 594, 'Stipendio', -1349, 'Retribuzione dipendente', '2022-02-04'),
    (69, 594, 'Stipendio', -2500, 'Retribuzione dipendente', '2022-03-03'),
    (70, 594, 'Stipendio', -3437, 'Retribuzione dipendente', '2022-03-19'),
    (71, 594, 'Stipendio', -2145, 'Retribuzione dipendente', '2022-03-21'),
    (72, 594, 'Stipendio', -1789, 'Retribuzione dipendente', '2022-03-25'),

    --Uscite per la sede 239
    (73, 239, 'Uscita', -1350, 'Nuovo pc', '2020-05-31'),
    (74, 239, 'Uscita', -20000, 'Ampliamento sede piano 4', '2020-07-03'),
    (75, 239, 'Uscita', -6000, 'Nuove postazioni', '2020-12-18'),
    (76, 239, 'Uscita', -850, 'Componentistica', '2021-02-11'),
    (77, 239, 'Uscita', -700, 'Componentistica', '2021-03-29'),
    (78, 239, 'Uscita', -600, 'Spese avvocato', '2021-05-20'), 

    --Entrate per la sede 239
    (79, 239, 'Entrata', 50000, 'Vendita licenza', '2020-08-03'),
    (80, 239, 'Entrata', 3500, 'Vendita pc', '2020-08-23'),
    (81, 239, 'Entrata', 2343, 'Vendita piccolo software', '2021-12-29'),
    (82, 239, 'Entrata', 600, 'Consulenza', '2022-04-16'),
    (83, 239, 'Entrata', 9800, 'Vendita piccola licenza', '2022-05-01'),
    (84, 239, 'Entrata', 12200, 'Vendita licenza', '2022-05-07'),

    --Fatture per la sede 239
    (85, 239, 'Fattura', 400, 'Fattura per consulenza', '2020-10-28'),
    (86, 239, 'Fattura', 1290, 'Fattura per pc', '2021-04-06'),
    (87, 239, 'Fattura', 120, 'Fattura per piccola consulenza', '2021-06-07'),
    (88, 239, 'Fattura', 900, 'Fattura per consulenza', '2021-06-18'),
    (89, 239, 'Fattura', 750, 'Fattura per consulenza', '2021-07-07'),
    (90, 239, 'Fattura', 100, 'Fattura per consulenza', '2021-11-11'),

    --Stipendi per la sede 239
    (91, 239, 'Stipendio', -1256, 'Retribuzione dipendente', '2022-01-16'),
    (92, 239, 'Stipendio', -2300, 'Retribuzione dipendente', '2022-02-27'),
    (93, 239, 'Stipendio', -1800, 'Retribuzione dipendente', '2022-03-07'),
    (94, 239, 'Stipendio', -1450, 'Retribuzione dipendente', '2022-03-26'),
    (95, 239, 'Stipendio', -1275, 'Retribuzione dipendente', '2022-04-03'),
    (96, 239, 'Stipendio', -1900, 'Retribuzione dipendente', '2022-04-27'),

    --Uscite per la sede 312
    (97, 312, 'Uscita', -30000, 'Acquisizione di licenza', '2020-02-22'),
    (98, 312, 'Uscita', -405, 'Spese componentistica', '2020-05-14'),
    (99, 312, 'Uscita', -2100, 'Nuovo computer', '2020-06-25'),
    (100, 312, 'Uscita', -300, 'Componentistica', '2021-06-17'),
    (101, 312, 'Uscita', -450, 'Attrezzatura', '2021-08-13'),
    (102, 312, 'Uscita', -1200, 'Promozione pubblicitaria', '2022-03-11'),

    --Entrate per la sede 312
    (103, 312, 'Entrata', 34000, 'Vendita licenza', '2020-06-18'),
    (104, 312, 'Entrata', 1000, 'Vendita piccolo software', '2020-08-10'),
    (105, 312, 'Entrata', 200, 'Componentistica', '2020-11-03'),
    (106, 312, 'Entrata', 1050, 'Componentistica', '2020-11-26'),
    (107, 312, 'Entrata', 3000, 'Vendita computer', '2021-04-03'),
    (108, 312, 'Entrata', 450, 'Componentistica', '2021-06-06'),

    --Fatture per la sede 312
    (109, 312, 'Fattura', 280, 'Fattura per consulenza', '2020-02-27'),
    (110, 312, 'Fattura', 1200, 'Fattura per software', '2020-03-01'),
    (111, 312, 'Fattura', 560, 'Fattura per consulenza', '2020-06-20'),
    (112, 312, 'Fattura', 800, 'Fattura per piccolo software', '2020-07-06'),
    (113, 312, 'Fattura', 700, 'Fattura per piccolo software', '2021-04-01'),
    (114, 312, 'Fattura', 350, 'Fattura per consulenza', '2021-10-20'),

    --Stipendi per la sede 312
    (115, 312, 'Stipendio', -2900, 'Retribuzione dipendente', '2022-01-02'),
    (116, 312, 'Stipendio', -2000, 'Retribuzione dipendente', '2022-02-18'),
    (117, 312, 'Stipendio', -3500, 'Retribuzione dipendente', '2022-02-27'),
    (118, 312, 'Stipendio', -1340, 'Retribuzione dipendente', '2022-03-07'),
    (119, 312, 'Stipendio', -1670, 'Retribuzione dipendente', '2022-04-03'),
    (120, 312, 'Stipendio', -1254, 'Retribuzione dipendente', '2022-05-10');

--INSERIMENTO TABELLA RETRIBUZIONI
INSERT INTO Retribuzioni (id_trz, id_dip)
VALUES

    --Dipendenti della sede 389 
    (19, 212),
    (20, 119),
    (21, 690),
    (22, 333),
    (23, 787),
    (24, 173),

    --Dipendenti della sede 437
    (43, 423),
    (44, 777),
    (45, 111),
    (46, 677),
    (47, 123),
    (48, 347),

    --Dipendenti della sede 594
    (67, 675),
    (68, 723),
    (69, 309),
    (70, 334),
    (71, 432),
    (72, 789),

    --Dipendenti della sede 239
    (91, 764),
    (92, 609),
    (93, 543),
    (94, 124),
    (95, 444),
    (96, 989),

    --Dipendenti della sede 312
    (115, 234),
    (116, 420),
    (117, 890),
    (118, 999),
    (119, 998), 
    (120, 511);

--INSERIMENTO TABELLA CLIENTE
INSERT INTO Cliente(p_iva, nome_azienda)
VALUES
    ('26585340701', 'Idro Software'),
    ('76630840890', 'Software Guru'),
    ('79833500295', 'Immobili Compatto'),
    ('18727650444', 'Deutch Reporter'),
    ('25811980355', 'Nebula Zurich'),
    ('22337910206', 'Well Food'),
    ('56720480328', 'ACE Chemicals'),
    ('48503850165', 'Super Track'),
    ('70779410680', 'Marte Progetti'),
    ('38481280865', 'Falcone Industries');

--INSERIMENTO TABELLA ACCORDO
INSERT INTO Accordo (id_dip, p_iva)
VALUES
    (675, '26585340701'),
    (589, '18727650444'),
    (589, '22337910206'),
    (420, '48503850165'),
    (281, '56720480328'),
    (281, '25811980355');

--INSERIMENTO TABELLA VALUTAZIONE
INSERT INTO Valutazione (id_dip, id_prog, esito)
VALUES
    (423, 4239, TRUE),
    (234, 1028, TRUE),
    (989, 3943, TRUE),
    (699, 5487, TRUE),
    (865, 8912, TRUE),
    (698, 9302, FALSE),
    (423, 6923, FALSE),
    (234, 4942, FALSE),
    (989, 9455, FALSE),
    (699, 7738, FALSE);

--INSERIMENTO TABELLA ASSEGNAZIONE
INSERT INTO Assegnazione (id_dip, id_modulo)
VALUES
    (543 ,92610),
    (543 ,70751),
    (543, 60255),
    (677, 99282),
    (677, 51127),
    (334, 30592),
    (334, 57608),
    (124, 41940),
    (979, 34745),
    (334, 51404),
    (334, 96485),
    (124, 25447),
    (124, 92610),
    (979, 94768),
    (124, 25401),

    --ASSEGNAZIONE SVILUPPATORI

    (212, 92610),
    (212, 30592),
    (212, 43392),
    (764, 34745),
    (764, 63351),
    (119, 63351),
    (723, 41202),
    (723, 12900),
    (723, 69420),
    (999, 65628),
    (999, 11343),
    (123, 50558),
    (432, 69633),
    (444, 25401),
    (998, 65628),
    (998, 88045),
    (998, 34745),
    (611, 30592),
    (511, 26517);


--INSERIMENTO TABELLA TEST
INSERT INTO Test(id_test, id_dip, id_modulo)
VALUES
	(467466, 690, 92610),
	(636189, 690, 92610),
	(217119, 690, 92610),
	(487006, 690, 70751),
	(199399, 690, 70751),
	(750431, 690, 70751),
	(614922, 690, 26517),
	(585621, 690, 26517),
	(844846, 690, 26517),
	(815604, 690, 60255),
	(100831, 690, 60255),
	(239918, 690, 60255),
	(172797, 690, 96596),
	(478477, 690, 96596),
	(906970, 690, 96596),
	(650279, 690, 99282),
	(651983, 690, 99282),
	(504155, 690, 99282),
	(373964, 690, 43392),
	(903187, 690, 43392),
	(359898, 111, 43392),
	(851818, 111, 51127),
	(705263, 111, 51127),
	(658794, 111, 51127),
	(189554, 111, 47610),
	(658711, 111, 47610),
	(285786, 111, 47610),
	(945489, 111, 30592),
	(273387, 111, 30592),
	(613455, 111, 30592),
	(370863, 111, 21476),
	(284289, 111, 21476),
	(649148, 111, 21476),
	(649638, 111, 57608),
	(721554, 111, 57608),
	(987575, 111, 57608),
	(771646, 111, 85126),
	(893393, 111, 85126),
	(363477, 111, 85126),
	(457752, 111, 42859),
	(494387, 333, 42859),
	(402720, 333, 42859),
	(972750, 333, 41940),
	(686046, 333, 41940),
	(275812, 333, 41940),
	(959515, 333, 34954),
	(878282, 333, 34954),
	(327747, 333, 34954),
	(663395, 333, 63351),
	(282456, 333, 63351),
	(130010, 333, 63351),
	(543720, 333, 38568),
	(655535, 333, 38568),
	(779094, 333, 38568),
	(376876, 333, 11343),
	(668355, 333, 11343),
	(780022, 333, 11343),
	(431098, 333, 34745),
	(681077, 333, 34745),
	(453380, 333, 34745),
	(138165, 787, 86161),
	(627907, 787, 86161),
	(139626, 787, 86161),
	(831458, 787, 82973),
	(966042, 787, 82973),
	(611020, 787, 82973),
	(868749, 787, 88045),
	(833350, 787, 88045),
	(880426, 787, 88045),
	(727645, 787, 41202),
	(313220, 787, 41202),
	(945267, 787, 41202),
	(865631, 787, 43103),
	(158894, 787, 43103),
	(795334, 787, 43103),
	(793201, 787, 51404),
	(615561, 787, 51404),
	(494106, 787, 51404),
	(232271, 787, 25447),
	(961845, 787, 25447),
	(174134, 789, 25447),
	(951196, 789, 96485),
	(266803, 789, 96485),
	(673230, 789, 96485),
	(371148, 789, 50558),
	(514760, 789, 50558),
	(413999, 789, 50558),
	(290703, 789, 12900),
	(623570, 789, 12900),
	(340776, 789, 12900),
	(104667, 789, 88449),
	(904788, 789, 88449),
	(138479, 789, 88449),
	(990545, 789, 82132),
	(323931, 789, 82132),
	(915827, 789, 82132),
	(115658, 789, 82194),
	(964322, 789, 82194),
	(912597, 789, 82194),
	(813952, 789, 65102),
	(307376, 595, 65102),
	(155545, 595, 65102),
	(589341, 595, 69633),
	(396636, 595, 69633),
	(947733, 595, 69633),
	(372498, 595, 94768),
	(997099, 595, 94768),
	(163291, 595, 94768),
	(192817, 595, 69420),
	(367964, 595, 69420),
	(612878, 595, 69420),
	(774929, 595, 74354),
	(496843, 595, 74354),
	(987194, 595, 74354),
	(476794, 595, 25401),
	(866969, 595, 25401),
	(388660, 595, 25401),
	(376659, 595, 65628),
	(875645, 595, 65628),
	(490658, 595, 65628);

--INSERIMENTO TABELLA CONTRATTO
INSERT INTO Contratto (id_contratto, p_iva, id_dip, descrizione, data_firma)
VALUES
    (1, '26585340701', 309, 'Contratto stipulato per la creazione di un sito web e web app', '2019-11-4'),
    (2, '18727650444', 609, 'Contratto firmato dalle due parti per lo sviluppo di un software gestionale', '2022-1-22'),
    (3, '22337910206', 609, 'Contratto di estensione partnership fino al 2024', '2019-5-15'),
    (4, '48503850165', 890, 'Partnership stretta con azienda per 2 anni', '2022-3-2'),
    (5, '56720480328', 173, 'Contratto di produzione silicio per chip', '2009-4-12'),
    (6, '25811980355', 173, 'Contratto per collaborazione sul software gestionale NEXTOR', '2022-1-21');