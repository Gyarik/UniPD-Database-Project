DROP TABLE IF EXISTS Retribuzioni;

CREATE TABLE Retribuzioni (
    id_trz INT NOT NULL,
    id_dip INT NOT NULL,
    id_sede INT NOT NULL,
    PRIMARY KEY (id_trz, id_dip, id_sede),
    FOREIGN KEY (id_dip) REFERENCES Dipendente(id_dip),
    FOREIGN KEY (id_trz) REFERENCES Transazione(id_trz),
    FOREIGN KEY (id_sede) REFERENCES Transazione(id_sede),
);