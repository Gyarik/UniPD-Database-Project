DROP TABLE IF EXISTS Sede;

CREATE TABLE Sede (
	id_sede INT NOT NULL,
	n_civico VARCHAR(20) NOT NULL,
	via VARCHAR(20) NOT NULL,
	citta VARCHAR(20) NOT NULL,
	provincia VARCHAR(20) NOT NULL,
	cap CHAR(5) NOT NULL,
	PRIMARY KEY (id_sede)
);

INSERT INTO Sede(id_sede, n_civico, via, citta, provincia, cap)
values
	(1, '81', 'Ospedale Civile', 'Padova', 'Padova', '35121');