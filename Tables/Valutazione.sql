DROP TABLE IF EXISTS Valutazione;

CREATE TABLE Valutazione (
    id_dip INT NOT NULL, 
    id_prog INT NOT NULL,
    esito BOOLEAN,
    PRIMARY KEY (id_dip, id_prog),
    FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip),
    FOREIGN KEY (id_prog) REFERENCES Progetto (id_prog)
);

INSERT INTO Valutazione (id_dip, id_prog, esito)
VALUES
    (423, 4239, TRUE),
    (234, 1028, TRUE),
    (989, 3943, TRUE),
    (699, 5487, TRUE),
    (865, 8912, TRUE),
    (989, 5634, TRUE),
    (677, 9183, TRUE),
    (677, 2742, TRUE),
    (698, 9302, FALSE),
    (423, 6923, FALSE),
    (234, 4942, FALSE),
    (989, 9455, FALSE),
    (699, 7738, FALSE),
    (423, 3473, FALSE),
    (423, 9832, FALSE),
    (423, 2811, FALSE);