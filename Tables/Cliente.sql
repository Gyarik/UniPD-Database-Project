DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    p_iva VARCHAR(11) NOT NULL,
    nome_azienda VARCHAR(50) NOT NULL,
    PRIMARY KEY (p_iva)
);

INSERT INTO Cliente(p_iva, nome_azienda)
VALUES
    ('26585340701', 'Idro Software'),
    ('76630840890', 'Software Guru'),
    ('79833500295', 'Immobili Compatto'),
    ('18727650444', 'Deutch Reporter'),
    ('25811980355', 'Nebula Zurich'),
    ('22337910206', 'Well Food'),
    ('56720480328', 'ACE Chemicals'),
    ('48503850165', 'Super Track'),
    ('70779410680', 'Marte Progetti'),
    ('38481280865', 'Falcone Industries');

