DROP TABLE IF EXISTS Dipendente;

CREATE TABLE Dipendente (
    id_dip INT NOT NULL,
    id_sede INT NOT NULL,
    nome VARCHAR (20) NOT NULL,
    cognome VARCHAR (20) NOT NULL,
    data_nascita DATE NOT NULL,
    PRIMARY KEY (id_dip, id_sede),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Dipendente(id_dip, id_sede, nome, cognome, data_nascita)
VALUES
    (212, '389', 'Ivan', 'Ocardi', '1990-4-16'),
    (423, '437', 'Leonardo', 'Gallenzi', '1974-8-20'),
    (675, '594', 'Vanessa', 'Masciangoli', '1998-8-29'),
    (764, '239', 'Enrica', 'Semilla', '1995-2-16'),
    (234, '312', 'Dionigi', 'Neffati', '1994-2-18'),
    (119, '389', 'Ginevra', 'Grandia', '1992-7-25'),
    (777, '437', 'Maurizio', 'Przypalinski', '1987-2-28'),
    (723, '594', 'Guerino', 'Bonna', '1991-1-25'),
    (609, '239', 'Selene', 'Saragni', '1998-11-11'),
    (420, '312', 'Rosalia', 'Carogioiello', '2001-12-3'),
    (690, '389', 'Tobia', 'Galizi', '1992-8-7'),
    (111, '437', 'Candido', 'Berod', '2002-4-14'),
    (309, '594', 'Remigio', 'Cicuzza', '1977-11-22'),
    (543, '239', 'Telemaco', 'Formenti', '1986-3-24'),
    (890, '312', 'Geronimo', 'Scicchitano', '1992-7-19'),
    (333, '389', 'Adriano', 'Polledrotti', '1989-5-23'),
    (677, '437', 'Stella', 'Giangiuli', '2004-3-23'),
    (334, '594', 'Ilario', 'Angrisano', '1978-9-3'),
    (124, '239', 'Iole', 'Navazzotti', '1991-9-8'),
    (999, '312', 'Valente', 'Journo', '1973-6-30'),
    (173, '389', 'Diodato', 'Cadice', '1980-7-3'),
    (123, '437', 'Salomone', 'Nevoloso', '1995-11-5'),
    (432, '594', 'Ulrico', 'Groth', '1996-12-5'),
    (444, '239', 'Tizio', 'Camesaschi', '1974-12-25'),
    (998, '312', 'Ludovico', 'Deodati', '1986-4-3');