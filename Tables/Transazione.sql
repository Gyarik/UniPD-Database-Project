DROP TABLE IF EXISTS Transazione;
DROP TYPE IF EXISTS transazione;

CREATE TYPE transazione AS ENUM ('Uscita', 'Entrata', 'Fattura', 'Stipendio');

CREATE TABLE Transazione (
    id_trz SERIAL NOT NULL,
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
    (389, 'Uscita', -1230, 'Manutenzione impianto elettrico reparto amministrazione', '2020-12-1' ),
    (389, 'Uscita', -3234, 'Acquisto due computer per sviluppatori', '2021-4-17' ),
    (389, 'Uscita', -240, 'Rifornimento merende secondo piano', '2022-3-14'),
    (389, 'Uscita', -1221, 'Computer portatile per sviluppatore', '2022-3-14'),
    (389, 'Uscita', -23000, 'Ristrutturazione pavimento piano terzo', '2017-9-21'),
    (389, 'Uscita', -100, 'Macchina del caffè per amministratore piano 2', '2021-7-29'),

    --Entrate per la sede 389
    (389, 'Entrata'),
    (389, 'Entrata'),
    (389, 'Entrata'),
    (389, 'Entrata'),
    (389, 'Entrata'),
    (389, 'Entrata'),

    --Fatture per la sede 389
    (389, 'Fattura'),
    (389, 'Fattura'),
    (389, 'Fattura'),
    (389, 'Fattura'),
    (389, 'Fattura'),
    (389, 'Fattura'),

    --Stipendi per la sede 389
    (389, 'Stipendio'),
    (389, 'Stipendio'),
    (389, 'Stipendio'),
    (389, 'Stipendio'),
    (389, 'Stipendio'),
    (389, 'Stipendio'),

    --Uscite per la sede 437
    (437, 'Uscita'),
    (437, 'Uscita'),
    (437, 'Uscita'),
    (437, 'Uscita'),
    (437, 'Uscita'),
    (437, 'Uscita'),

    --Entrate per la sede 437
    (437, 'Entrata'),
    (437, 'Entrata'),
    (437, 'Entrata'),
    (437, 'Entrata'),
    (437, 'Entrata'),
    (437, 'Entrata'),

    --Fatture per la sede 437
    (437, 'Fattura'),
    (437, 'Fattura'),
    (437, 'Fattura'),
    (437, 'Fattura'),
    (437, 'Fattura'),
    (437, 'Fattura'),

    --Stipendi per la sede 437
    (437, 'Stipendio'),
    (437, 'Stipendio'),
    (437, 'Stipendio'),
    (437, 'Stipendio'),
    (437, 'Stipendio'),
    (437, 'Stipendio'),

    --Uscite per la sede 594
    (594, 'Uscita'),
    (594, 'Uscita'),
    (594, 'Uscita'),
    (594, 'Uscita'),
    (594, 'Uscita'),
    (594, 'Uscita'),

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
    



