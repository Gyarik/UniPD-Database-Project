DROP TABLE IF EXISTS Team_Marketing;
DROP TYPE IF EXISTS marketing;

CREATE TYPE marketing AS ENUM ('Addetto alle Vendite', 'Addetto alle Prozione', 'Analista di Mercato');

CREATE TABLE Team_Marketing (
    id_dip INT NOT NULL,
    id_sede INT NOT NULL,
    tipologia marketing NOT NULL,
    PRIMARY KEY (id_dip, id_sede),
    FOREIGN KEY (id_dip, id_sede) REFERENCES Dipendente(id_dip, id_sede) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Team_Marketing (id_dip, id_sede, tipologia)
VALUES
    (212, 389, 'Addetto alle Vendite'),
    (423, 437, 'Addetto alle Vendite'),
    (675, 594, 'Addetto alle Vendite'),
    (764, 239, 'Addetto alle Vendite'),
    (234, 312, 'Addetto alle Promozioni'),
    (119, 389, 'Addetto alle Promozioni'),
    (777, 437, 'Addetto alle Promozioni'),
    (723, 594, 'Addetto alle Promozioni'),
    (420, 312, 'Analista di Mercato'),
    (690, 389, 'Analista di Mercato'),
    (111, 437, 'Analista di Mercato'),
    (998, 312, 'Analista di Mercato');



