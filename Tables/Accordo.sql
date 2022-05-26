DROP TABLE IF EXISTS Accordo CASCADE;

CREATE TABLE Accordo (
   id_dip INT NOT NULL,
   p_iva VARCHAR(11) NOT NULL, 
   PRIMARY KEY (id_dip, p_iva),
   FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip),
   FOREIGN KEY (p_iva) REFERENCES Cliente (p_iva)
);


INSERT INTO Accordo (id_dip, p_iva)
VALUES
    (675, '26585340701'),
    (589, '18727650444'),
    (589, '22337910206'),
    (420, '48503850165'),
    (281, '56720480328'),
    (281, '25811980355'),
    (777, '38481280865'),
    (777, '41960260556'),
    (347, '54801450153'),
    (238, '09949001003'),
    (238, '01301140552'),
    (741, '03410440964'),
    (689, '01042950335');