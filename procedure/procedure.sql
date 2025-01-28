--procedura per l'inserimento di un anomalia
CREATE OR REPLACE PROCEDURE  inserimento_anomalia(
    sensore IN SENSORI.codice%TYPE,
    causa IN ANOMALIE.causa%TYPE,
    livello_priorita IN ANOMALIE.livello_priorita%TYPE)
AS
BEGIN
    INSERT INTO ANOMALIE (sensore,data,ora,causa,livello_priorita)
    VALUES(
        sensore,
        TRUNC(SYSDATE),
        SYSTIMESTAMP,
        causa,
        livello_priorita
    );
END;


--procdure per porre in stndby sensori
CREATE OR REPLACE PROCEDURE stand_by_sensore_peggiore(
    input_missione IN MISSIONI.codice%TYPE
)
AS
    codice_sensore_sby SENSORI.codice%TYPE;
    missione_esiste NUMBER := 0; -- Variabile flag per verificare l'esistenza della missione
    codice_inesistente EXCEPTION;
BEGIN
    -- Controlla se la missione esiste nella vista
    SELECT COUNT(*)
    INTO missione_esiste
    FROM view_missioni_in_corso
    WHERE codice_missione = input_missione;

    -- Verifica se la missione è presente
    IF missione_esiste > 0 THEN
        -- Seleziona il sensore con priorità più alta e più vecchio
        SELECT codice_sensore
        INTO codice_sensore_sby
        FROM (
            SELECT codice_sensore, COUNT(*) AS num_anomalie, data_sensore
            FROM view_missioni_in_corso
            WHERE codice_missione = input_missione AND priorita_anomalia > 1
            GROUP BY codice_sensore, data_sensore
            ORDER BY num_anomalie DESC, data_sensore ASC
        )
        WHERE ROWNUM = 1; -- Prende solo la prima riga

        -- Aggiorna lo stato del sensore
        UPDATE SENSORI
        SET stato = 'STANDBY'
        WHERE codice = codice_sensore_sby;

        DBMS_OUTPUT.PUT_LINE('il sensore ' || codice_sensore_sby || ' è in stato standby');

    ELSE
        -- Solleva un'eccezione se la missione non esiste
        RAISE codice_inesistente;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nessun sensore trovato per la missione ' || input_missione);
    WHEN codice_inesistente THEN
        DBMS_OUTPUT.PUT_LINE('Non esiste missione con codice ' || input_missione || ' in corso');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Errore sconosciuto: ' || SQLERRM);
END stand_by_sensore_peggiore;


