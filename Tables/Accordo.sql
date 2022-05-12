DROP TABLE IF EXISTS Accordo CASCADE;

CREATE TABLE Accordo (
   id_dip INT NOT NULL,
   p_iva VARCHAR(11) NOT NULL, 
   PRIMARY KEY (id_dip, p_iva),
   FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip),
   FOREIGN KEY (p_iva) REFERENCES Cliente (p_iva)
);