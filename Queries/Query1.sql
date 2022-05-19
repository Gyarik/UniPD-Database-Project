SELECT COUNT(*) as moduli, dipendente.id_dip, cognome, nome, citta, provincia
FROM assegnazione JOIN dipendente ON assegnazione.id_dip = dipendente.id_dip
JOIN sede ON dipendente.id_sede = sede.id_sede
WHERE provincia = 'PO'
GROUP BY dipendente.id_dip, cognome, nome, citta, provincia
ORDER BY moduli DESC