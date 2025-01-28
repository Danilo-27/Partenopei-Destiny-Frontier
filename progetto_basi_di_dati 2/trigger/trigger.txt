--trigger per politica on update cascade sui sensori
CREATE TRIGGER trg_update_sensori
AFTER UPDATE ON Sensori
FOR EACH ROW
BEGIN
    UPDATE Impiego_Sensori
    SET sensore = :NEW.codice
    WHERE sensore = :OLD.codice;

    UPDATE RILEVAZIONI
    SET sensore = :NEW.codice
    WHERE sensore = :OLD.codice;

    UPDATE ANOMALIE
    SET sensore = :NEW.codice
    WHERE sensore = :OLD.codice;

END;


--trigger per politica on update cascade sui membri
CREATE TRIGGER trg_update_membri
AFTER UPDATE ON MEMBRI_EQUIPAGGIO
FOR EACH ROW
BEGIN
    UPDATE COINVOLGIMENTI
    SET EQUIPAGGIO = :NEW.codice
    WHERE EQUIPAGGIO = :OLD.codice;

    UPDATE PARTECIPAZIONI
    SET MEMBRO = :NEW.codice
    WHERE MEMBRO = :OLD.codice;
END;


--trigger per politica on update cascade sulle missioni
CREATE OR REPLACE TRIGGER trg_update_missioni
AFTER UPDATE ON MISSIONI
FOR EACH ROW
BEGIN
    UPDATE IMPIEGO_SENSORI
    SET MISSIONE = :NEW.codice
    WHERE MISSIONE = :OLD.codice;

    UPDATE IMPIEGO_ROBOT
    SET MISSIONE = :NEW.codice
    WHERE MISSIONE = :OLD.codice;

    UPDATE PARTECIPAZIONI
    SET MISSIONE = :NEW.codice
    WHERE MISSIONE = :OLD.codice;

    UPDATE REPORT
    SET MISSIONE = :NEW.codice
    WHERE MISSIONE = :OLD.codice;

END;

--creazione_codice_rilevazioni_sequenziali e controllo stato sensore
CREATE OR REPLACE TRIGGER trg_insert_rilevazioni
BEFORE INSERT ON RILEVAZIONI
FOR EACH ROW
DECLARE 
    num_rilevazioni NUMBER;
    stato_sensore  SENSORI.STATO%TYPE;
BEGIN
    SELECT stato INTO stato_sensore
    FROM Sensori
    WHERE codice = :NEW.sensore;
    
    IF stato_sensore = 'STANDBY' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Impossibile inserire rilevazione: il sensore è in standby.');
    END IF;

    SELECT count(*) INTO num_rilevazioni
    FROM RILEVAZIONI
    WHERE sensore = :NEW.sensore;
    
    :NEW.codice := (num_rilevazioni + 1);
END;

CREATE OR REPLACE TRIGGER trg_sensori_codice
BEFORE INSERT ON SENSORI
FOR EACH ROW
BEGIN
    :NEW.codice := seq_cod_sensori.NEXTVAL;
END;


CREATE OR REPLACE TRIGGER trg_membri_codice
BEFORE INSERT ON MEMBRI_EQUIPAGGIO
FOR EACH ROW
BEGIN
    :NEW.codice := seq_cod_membri.NEXTVAL;
END;

--trigger per creazione interventi data un anomalia
CREATE OR REPLACE TRIGGER trg_inserimento_intervento
AFTER INSERT ON ANOMALIE
FOR EACH ROW
DECLARE
    data_intervento INTERVENTI.data_intervento%TYPE;
    descrizione INTERVENTI.descrizione%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data Anomalia Inserita: ' || TO_CHAR(:NEW.data, 'DD/MM/YYYY'));
    
    -- Calcolo della data intervento usando un formato esplicito
    IF :NEW.livello_priorita = '1' THEN
        descrizione := 'Causa: ' || :NEW.causa || ', calibrazione del sensore ';
        -- Usiamo ADD_MONTHS per il caso di 30 giorni
        data_intervento := ADD_MONTHS(:NEW.data, 1);
    ELSIF :NEW.livello_priorita = '2' THEN
        descrizione := 'Causa: ' || :NEW.causa || ', riparazione sul sensore ';
        data_intervento := :NEW.data + 7;
    ELSE
        descrizione := 'Causa: ' || :NEW.causa || ', sostituzione immediata del sensore ';
        data_intervento := :NEW.data + 1;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Data Intervento Calcolata: ' || TO_CHAR(data_intervento, 'DD/MM/YYYY'));
    DBMS_OUTPUT.PUT_LINE('Descrizione -> ' || descrizione);

    
    -- Usiamo TO_DATE per assicurarci che la data sia nel formato corretto
    INSERT INTO INTERVENTI (codice, descrizione, esito, data_intervento, anomalia)
    VALUES (
        :NEW.codice + 1,
        descrizione,
        NULL,
        data_intervento,
        :NEW.codice
    );
    
    
END;


--inserimento anomalia, gestione codice

CREATE OR REPLACE TRIGGER trg_insert_anomalie
BEFORE INSERT ON ANOMALIE
FOR EACH ROW
DECLARE 
    num_anomalie NUMBER;
BEGIN
    select count(*) INTO num_anomalie
	FROM ANOMALIE
	WHERE sensore = :NEW.sensore;
    :NEW.codice := (num_anomalie+1);
END;



