CREATE VIEW view_missioni_in_corso AS
SELECT M.codice AS codice_missione,M.stato AS stato_missione,
        S.codice AS codice_sesnore,s.stato AS stato_sensore,s.data_installazione AS data_sensore,
        AN.codice AS codice_anomalia,AN.livello_priorita AS  priorita_anomalia
FROM MISSIONI M JOIN IMPIEGO_SENSORI ISE ON M.codice=ISE.missione
JOIN SENSORI S ON S.codice=ISE.sensore
JOIN ANOMALIE AN ON AN.sensore=S.codice
WHERE M.stato = 'INCORSO'