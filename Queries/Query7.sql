--classifica delle sedi che hanno le uscite maggiori, identificate da id_sede, via, citta e rispettivamente lo stipendio 
--più alto

DROP VIEW IF EXISTS stipendi_uscite;
DROP VIEW IF EXISTS max_stipendio_per_sede;
CREATE VIEW max_stipendio_per_sede as
    SELECT t.id_sede, MIN(t.saldo) as massimo_saldo
    FROM Transazione as t JOIN Retribuzioni as r ON t.id_trz = r.id_trz
    GROUP BY t.id_sede, t.tipo_trz
	HAVING t.tipo_trz = 'Stipendio';


CREATE VIEW stipendi_uscite as
    SELECT t.id_sede, s.via, s.citta, SUM(t.saldo) as Uscite_Totali, -1* ms.massimo_saldo as Stipendio_Massimo
    FROM max_stipendio_per_sede as ms JOIN Transazione as t ON ms.id_sede = t.id_sede
        JOIN Sede as s ON s.id_sede = t.id_sede
    GROUP BY t.id_sede, s.via, s.citta, t.tipo_trz, ms.massimo_saldo
	HAVING t.tipo_trz = 'Uscita'
	ORDER BY SUM(t.saldo);

