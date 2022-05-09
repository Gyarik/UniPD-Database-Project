DROP TABLE IF EXISTS Transazione;
DROP TYPE IF EXISTS transazione;

CREATE TYPE tipo AS ENUM ('Uscita', 'Entrata', 'Fattura', 'Stipendio');

CREATE TABLE Transazione (
    id_trz INT NOT NULL,
    id_sede INT NOT NULL,
    tipologia tipo NOT NULL,
    saldo INT NOT NULL CHECK (saldo <> 0),
    descrizione VARCHAR (300),
    data_trz DATE NOT NULL,
    PRIMARY KEY (id_trz, id_sede),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede) ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK (((tipologia = 'Uscita' OR tipologia = 'Stipendio') AND saldo < 0) or ((tipologia = 'Entrata' OR tipologia = 'Fattura') and saldo > 0))
);

INSERT INTO Transazione (id_trz, id_sede, tipologia, saldo, descrizione, data_trz)
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
    



