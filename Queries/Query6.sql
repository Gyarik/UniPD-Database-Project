--nome e cognome dei dipendenti che hanno valutato positivamente piu di un progetto o negativamente piu di tre

SELECT v.esito , d.id_dip, d.nome, d.cognome
FROM Dipendente as d JOIN Valutazione as v ON d.id_dip = v.id_dip
GROUP BY v.esito, d.id_dip, d.nome, d.cognome
HAVING v.esito = 'FALSE' AND COUNT(d.id_dip) > 3
UNION 
SELECT v.esito, d.id_dip, d.nome, d.cognome
FROM Dipendente as d JOIN Valutazione as v ON d.id_dip = v.id_dip
GROUP BY v.esito,d.id_dip, d.nome, d.cognome
HAVING v.esito = 'TRUE' AND COUNT(d.id_dip) > 1;