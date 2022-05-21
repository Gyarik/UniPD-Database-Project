SELECT S.citta, SUM(T.saldo) as Guadagni
FROM Transazione as T JOIN Sede as S ON T.id_sede = S.id_sede
GROUP BY T.id_sede
ORDER BY Guadagni;
