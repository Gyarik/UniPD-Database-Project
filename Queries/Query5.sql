--stipendi medi per ruolo ordinate 

SELECT d.tipologia, -1* ROUND(AVG(t.saldo), 2) AS "Stipendio medio per ruolo"
FROM Dipendente as d JOIN Retribuzioni as r ON d.id_dip = r.id_dip
    JOIN Transazione as t ON t.id_trz = r.id_trz
GROUP BY d.tipologia;