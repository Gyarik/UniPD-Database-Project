DROP TABLE IF EXISTS Retribuzioni;

CREATE TABLE Retribuzioni (
    id_trz INT NOT NULL,
    id_dip INT NOT NULL,
    PRIMARY KEY (id_trz, id_dip),
	FOREIGN KEY (id_trz) REFERENCES Transazione(id_trz),
    FOREIGN KEY (id_dip) REFERENCES Dipendente(id_dip)
);

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
