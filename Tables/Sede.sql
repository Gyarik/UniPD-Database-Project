DROP TABLE IF EXISTS Sede;

CREATE TABLE Sede (
	id_sede INT NOT NULL,
	n_civico CHAR(5) NOT NULL,
	via VARCHAR(20) NOT NULL,
	citta VARCHAR(20) NOT NULL,
	provincia CHAR(2) NOT NULL,
	cap CHAR(5) NOT NULL,
	PRIMARY KEY (id_sede)
);

INSERT INTO Sede(id_sede, n_civico, via, citta, provincia, cap)
values
	(389, '81', 'Via Ospedale Civile', 'Padova', 'PD', '35121'),
	(437, '9', 'Via Tumedei Casalis', 'Carmagnola', 'TO', '10022'),
	(594, '74', 'Via Delle Pianazze', 'La Spezia', 'SP', '19136'),
	(239, '57', 'Via Torelli', 'Prato', 'PO', '59100'),
	(312, '2', 'Via Delle Gagliarde', 'Arezzo', 'AR', '52100');