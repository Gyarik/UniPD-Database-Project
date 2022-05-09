DROP TABLE IF EXISTS Retribuzioni;

CREATE TABLE Retribuzioni (
    id_trz INT NOT NULL,
    id_dip INT NOT NULL,
    id_sede INT NOT NULL,
    PRIMARY KEY (id_trz, id_dip, id_sede),
	FOREIGN KEY (id_trz) REFERENCES Transazione(id_trz),
    FOREIGN KEY (id_dip) REFERENCES Dipendente(id_dip),
    FOREIGN KEY (id_sede) REFERENCES Transazione(id_sede)
);

INSERT INTO Retribuzioni (id_trz, id_dip, id_sede)
VALUES

    --Dipendenti della sede 389 
    (19, 212, 389),
    (20, 119, 389),
    (21, 690, 389),
    (22, 333, 389),
    (23, 787, 389),
    (24, 173, 389),

    --Dipendenti della sede 437
    (43, 423, 437),
    (44, 777, 437),
    (45, 111, 437),
    (46, 677, 437),
    (47, 123, 437),
    (48, 347, 437),

    --Dipendenti della sede 594
    (67, 675, 594),
    (68, 723, 594),
    (69, 309, 594),
    (70, 334, 594),
    (71, 432, 594),
    (72, 789, 594),

    --Dipendenti della sede 239
    (91, 764, 239),
    (92, 609, 239),
    (93, 543, 239),
    (94, 124, 239),
    (95, 444, 239),
    (96, 989, 239),

    --Dipendenti della sede 312
    (115, 234, 312),
    (116, 420, 312),
    (117, 890, 312),
    (118, 999, 312),
    (119, 998, 312), 
    (120, 511, 312);
