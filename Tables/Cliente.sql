DROP TABLE IF EXISTS Cliente CASCADE;

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
    ('38481280865', 'Falcone Industries'),
    ('41960260556', 'Mc Albettone'),
    ('54801450153', 'Associazione Perarockers Asd'),
    ('50887600182', 'Fun Bike'),
    ('92031230151', 'A.S.D. Sant ambrogio Parabiago'),
    ('09469971007', 'Associazione Sportiva Guida Sicura'),
    ('01301140552', 'Sistemi Assicurativi E Finanziari Srl'),
    ('09949001003', 'Locim S.R.L.'),
    ('03410440964', 'Desideri Assicurazioni Srl'),
    ('01286971211', 'Stazione Climatica Bianchi Srl'),
    ('01285800189', 'Clinica Veterinaria Croce Azzurra'),
    ('01042950335', 'Assieuropa S.A.S Di Edoardo Agnelli & C');

