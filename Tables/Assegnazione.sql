DROP TABLE IF EXISTS Assegnazione CASCADE;

CREATE TABLE Assegnazione (
    id_dip INT NOT NULL,
    id_modulo INT NOT NULL,
    PRIMARY KEY (id_dip, id_modulo),
    FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip),
    FOREIGN KEY (id_modulo) REFERENCES Modulo (id_modulo)
);

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
