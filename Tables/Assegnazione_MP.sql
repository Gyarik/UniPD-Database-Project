DROP TABLE IF EXISTS Assegnazione_MP CASCADE;

CREATE TABLE Assegnazione_MP (
    id_dip INT NOT NULL,
    id_modulo INT NOT NULL,
    PRIMARY KEY (id_dip, id_modulo),
    FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip),
    FOREIGN KEY (id_modulo) REFERENCES Modulo (id_modulo)
);

INSERT INTO Assegnazione_MP (id_dip, id_modulo)
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
    (124, 25401);