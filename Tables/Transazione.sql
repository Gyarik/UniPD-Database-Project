DROP TABLE IF EXISTS Transazione;
DROP TYPE IF EXISTS transazione;

CREATE TYPE transazione AS ENUM ('Uscita', 'Entrata', 'Fattura', 'Stipendio');

CREATE TABLE Transazione (
    id_trz INT NOT NULL,
    id_sede INT NOT NULL,
    tipologia transazione NOT NULL,
    saldo DECIMAL (7,2) NOT NULL CHECK (saldo <> 0),
    descrizione VARCHAR (300),
    data_trz DATE NOT NULL,
    PRIMARY KEY (id_trz, id_sede),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede) ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK (((tipologia = 'Uscita' OR tipologia = 'Stipendio') AND saldo < 0) or ((tipologia = 'Entrata' OR tipologia = 'Fattura') and saldo > 0))
);

INSERT INTO Transazione (id_sede, tipologia, saldo, descrizione, data_trz)
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
    (37, 437, 'Fattura', 400, 'Fattura per consulenza'),
    (38, 437, 'Fattura', 350, 'Fattura per consulenza'),
    (39, 437, 'Fattura', 2300, 'Fattura per computer assemblato'),
    (40, 437, 'Fattura', 1000, 'Fattura per consulenza'),
    (41, 437, 'Fattura', 1500, 'Fattura per computer assemblato'),
    (42, 437, 'Fattura', 150, 'Fattura per consulenza'),

    --Stipendi per la sede 437
    (43, 437, 'Stipendio', -2000, 'Retribuzione dipendente', '2022-2-4'),
    (44, 437, 'Stipendio', -1750, 'Retribuzione dipendente', '2022-5-5'),
    (45, 437, 'Stipendio', -1300, 'Retribuzione dipendente', '2022-2-21'),
    (46, 437, 'Stipendio', -1200, 'Retribuzione dipendente', '2022-5-8'),
    (47, 437, 'Stipendio', -1350, 'Retribuzione dipendente', '2022-5-13'),
    (48, 437, 'Stipendio', -3500, 'Retribuzione dipendente', '2022-3-24'),

    --Uscite per la sede 594
    (594, 'Uscita', -1300, 'Nuove console da testing videogiochi'),
    (594, 'Uscita', -2500, 'Nuovo pc '),
    (594, 'Uscita', -3000,),
    (594, 'Uscita', -6000,),
    (594, 'Uscita', -1200, 'Nuove console da testing videogiochi'),
    (594, 'Uscita', -3000,),

    --Entrate per la sede 594
    (594, 'Entrata'),
    (594, 'Entrata'),
    (594, 'Entrata'),
    (594, 'Entrata'),
    (594, 'Entrata'),
    (594, 'Entrata'),

    --Fatture per la sede 594
    (594, 'Fattura'),
    (594, 'Fattura'),
    (594, 'Fattura'),
    (594, 'Fattura'),
    (594, 'Fattura'),
    (594, 'Fattura'),

    --Stipendi per la sede 594
    (594, 'Stipendio'),
    (594, 'Stipendio'),
    (594, 'Stipendio'),
    (594, 'Stipendio'),
    (594, 'Stipendio'),
    (594, 'Stipendio'),

    --Uscite per la sede 239
    (239, 'Uscita'),
    (239, 'Uscita'),
    (239, 'Uscita'),
    (239, 'Uscita'),
    (239, 'Uscita'),
    (239, 'Uscita'), 

    --Entrate per la sede 239
    (239, 'Entrata'),
    (239, 'Entrata'),
    (239, 'Entrata'),
    (239, 'Entrata'),
    (239, 'Entrata'),
    (239, 'Entrata'),

    --Fatture per la sede 239
    (239, 'Fattura'),
    (239, 'Fattura'),
    (239, 'Fattura'),
    (239, 'Fattura'),
    (239, 'Fattura'),
    (239, 'Fattura'),

    --Stipendi per la sede 239
    (239, 'Stipendio'),
    (239, 'Stipendio'),
    (239, 'Stipendio'),
    (239, 'Stipendio'),
    (239, 'Stipendio'),
    (239, 'Stipendio'),

    --Uscite per la sede 312
    (312, 'Uscita'),
    (312, 'Uscita'),
    (312, 'Uscita'),
    (312, 'Uscita'),
    (312, 'Uscita'),
    (312, 'Uscita'),

    --Entrate per la sede 312
    (312, 'Entrata'),
    (312, 'Entrata'),
    (312, 'Entrata'),
    (312, 'Entrata'),
    (312, 'Entrata'),
    (312, 'Entrata'),

    --Fatture per la sede 312
    (312, 'Fattura'),
    (312, 'Fattura'),
    (312, 'Fattura'),
    (312, 'Fattura'),
    (312, 'Fattura'),
    (312, 'Fattura'),

    --Stipendi per la sede 312
    (312, 'Stipendio'),
    (312, 'Stipendio'),
    (312, 'Stipendio'),
    (312, 'Stipendio'),
    (312, 'Stipendio'),
    (312, 'Stipendio');
    



