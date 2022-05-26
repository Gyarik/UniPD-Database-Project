DROP TABLE IF EXISTS Contratto;

CREATE TABLE Contratto (
    id_contratto INT NOT NULL,
    p_iva VARCHAR(11) NOT NULL,
    id_dip INT NOT NULL,
    descrizione VARCHAR(200),
    data_firma DATE NOT NULL,
	UNIQUE(id_contratto),
    PRIMARY KEY (id_contratto, p_iva, id_dip),
    FOREIGN KEY (p_iva) REFERENCES Cliente (p_iva),
    FOREIGN KEY (id_dip) REFERENCES Dipendente (id_dip)
);

INSERT INTO Contratto (id_contratto, p_iva, id_dip, descrizione, data_firma)
VALUES
    (1, '26585340701', 309, 'Contratto stipulato per la creazione di un sito web e web app', '2019-11-4'),
    (2, '18727650444', 609, 'Contratto firmato dalle due parti per lo sviluppo di un software gestionale', '2022-1-22'),
    (3, '22337910206', 609, 'Contratto di estensione partnership fino al 2024', '2019-5-15'),
    (4, '48503850165', 890, 'Partnership stretta con azienda per 2 anni', '2022-3-2'),
    (5, '56720480328', 173, 'Contratto di produzione silicio per chip', '2009-4-12'),
    (6, '25811980355', 173, 'Contratto per collaborazione sul software gestionale NEXTOR', '2022-1-21'),
    (7, '38481280865', 890, 'Contratto creazione software', '2022-3-10'),
    (8, '41960260556', 173, 'Contratto partnership', '2021-10-23'),
    (9, '54801450153', 609, 'Contratto di estensione partnership', '2019-6-17'),
    (10, '09949001003', 890, 'Partnership stretta con azienda per 5 anni', '2020-8-10'),
    (11, '01301140552', 609, 'Contratto per la creazione applicazione web', '2018-4-19'),
    (12, '03410440964', 309, 'Contratto per la produzione di codici applicativi', '2022-7-8'),
    (13, '01042950335', 309, 'Partnership stretta per 3 anni', '2022-8-27');
