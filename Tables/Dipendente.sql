DROP TABLE IF EXISTS Dipendente;
DROP TYPE IF EXISTS tipo_dip;

CREATE TYPE tipo_dip AS ENUM ('Direttore', 'Manager Generale', 'Manager Progetto', 'Sviluppatore', 'Tester', 'Addetto Marketing');

CREATE TABLE Dipendente (
    id_dip INT NOT NULL,
    id_sede INT NOT NULL,
    nome VARCHAR (20) NOT NULL,
    cognome VARCHAR (20) NOT NULL,
    tipologia tipo_dip NOT NULL,
    data_nascita DATE NOT NULL,
	UNIQUE (id_dip),
    PRIMARY KEY (id_dip, id_sede),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Dipendente(id_dip, id_sede, nome, cognome, tipologia, data_nascita)
VALUES
    (212, 389, 'Ivan', 'Ocardi', 'Sviluppatore', '1990-4-16'),
    (423, 437, 'Leonardo', 'Gallenzi', 'Manager Generale', '1974-8-20'),
    (675, 594, 'Vanessa', 'Masciangoli', 'Addetto Marketing', '1998-8-29'),
    (764, 239, 'Enrica', 'Semilla', 'Sviluppatore', '1995-2-16'),
    (234, 312, 'Dionigi', 'Neffati', 'Manager Generale', '1994-2-18'),
    (119, 389, 'Ginevra', 'Grandia', 'Sviluppatore', '1992-7-25'),
    (777, 437, 'Maurizio', 'Przypalinski', 'Addetto Marketing',  '1987-2-28'),
    (723, 594, 'Guerino', 'Bonna', 'Sviluppatore',  '1991-1-25'),
    (609, 239, 'Selene', 'Saragni', 'Direttore', '1998-11-11'),
    (420, 312, 'Rosalia', 'Carogioiello', 'Addetto Marketing', '2001-12-3'),
    (690, 389, 'Tobia', 'Galizi', 'Tester', '1992-8-7'),
    (111, 437, 'Candido', 'Berod', 'Tester', '2002-4-14'),
    (309, 594, 'Remigio', 'Cicuzza', 'Direttore', '1977-11-22'),
    (543, 239, 'Telemaco', 'Formenti', 'Manager Progetto', '1986-3-24'),
    (890, 312, 'Geronimo', 'Scicchitano', 'Direttore', '1992-7-19'),
    (333, 389, 'Adriano', 'Polledrotti', 'Tester', '1989-5-23'),
    (677, 437, 'Stella', 'Giangiuli', 'Manager Progetto', '2004-3-23'),
    (334, 594, 'Ilario', 'Angrisano', 'Manager Progetto', '1978-9-3'),
    (124, 239, 'Iole', 'Navazzotti', 'Manager Progetto', '1991-9-8'),
    (999, 312, 'Valente', 'Journo', 'Sviluppatore', '1973-6-30'),
    (173, 389, 'Diodato', 'Cadice', 'Direttore', '1980-7-3'),
    (123, 437, 'Salomone', 'Nevoloso', 'Sviluppatore', '1995-11-5'),
    (432, 594, 'Ulrico', 'Groth', 'Sviluppatore', '1996-12-5'),
    (444, 239, 'Tizio', 'Camesaschi', 'Sviluppatore', '1974-12-25'),
    (998, 312, 'Ludovico', 'Deodati', 'Sviluppatore', '1986-4-3'),
    (787, 389, 'Michele', 'Ballabene', 'Tester', '1998-5-30'),
    (347, 437, 'Massimiliano', 'Sangues', 'Addetto Marketing', '1998-3-7'),
    (789, 594, 'Edmonda', 'Mughini', 'Tester', '1995-6-23'),
    (989, 239, 'Alessio', 'Rigli', 'Manager Generale', '1998-12-24'),
    (979, 312, 'Rosamunda', 'Chizzotti', 'Manager Progetto', '1988-4-9');