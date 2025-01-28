CREATE TABLE Missioni (
    codice NUMBER,
    obiettivo VARCHAR2(250) NULL,
    data_inizio DATE,
    data_fine DATE,
    stato VARCHAR2(50),
    CONSTRAINT PK_MISSIONI PRIMARY KEY(codice),
    CONSTRAINT CK_STATO_MISSIONE CHECK(stato='INCORSO' OR stato='PIANIFICATA' OR stato='COMPLETATA' OR stato='ANNULLATA')
);

-- Tabella Sensori
CREATE TABLE Sensori (
    codice NUMBER,
    stato VARCHAR2(50) NOT NULL,
    data_installazione DATE NOT NULL,
    tipologia VARCHAR2(50) NOT NULL,
    data_ultimo_controllo DATE,
    longitudine DECIMAL(10, 7),
    latitudine DECIMAL(10, 7),
    altitudine NUMBER(6, 2),
    CONSTRAINT PK_SENSORI PRIMARY KEY(codice),
    CONSTRAINT CK_TIPOLOGIA_SENSORI CHECK(tipologia='TEMPERATURA' OR tipologia='PRESSIONE' OR tipologia='GAS' OR tipologia='RADIAZIONI' OR tipologia='GEOLOGIA'),
    CONSTRAINT CK_STATO_SENSORI CHECK(stato='ATTIVO' OR stato='MANUTENZIONE' OR stato='MALFUNZIONANTE' OR stato='DISATTIVO' OR stato='STANDBY')
);

-- Tabella Robot
CREATE TABLE Robot (
    codice NUMBER,
    tipo VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_ROBOT PRIMARY KEY(codice)
);

-- Tabella Membri
CREATE TABLE Membri_Equipaggio (
    codice NUMBER,
    nome VARCHAR2(20) NOT NULL,
    cognome VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_MEMBRI_EQUIPAGGIO PRIMARY KEY(codice)
);

-- Tabella Partecipazioni
CREATE TABLE Partecipazioni (
    ruolo VARCHAR2(50),
    missione NUMBER,
    membro NUMBER,
    CONSTRAINT PK_PARTECIPAZIONI PRIMARY KEY(ruolo, missione, membro)
);

-- Tabella Impiego_Sensori
CREATE TABLE Impiego_Sensori (
    missione NUMBER,
    sensore NUMBER,
    CONSTRAINT PK_IMPIEGO_SENSORI PRIMARY KEY(missione, sensore)
);

-- Tabella Impiego_Robot
CREATE TABLE Impiego_Robot (
    missione NUMBER,
    robot NUMBER,
    CONSTRAINT PK_IMPIEGO_ROBOT PRIMARY KEY(missione, robot)
);

-- Tabella Report
CREATE TABLE Report (
    codice NUMBER,
    missione NUMBER NOT NULL,
    membro NUMBER NOT NULL,
    stato VARCHAR2(200),
    CONSTRAINT PK_REPORT PRIMARY KEY(codice)
);

-- Tabella Rilevazioni
CREATE TABLE Rilevazioni (
    codice NUMBER,
    sensore NUMBER,
    data DATE NOT NULL,
    ora TIMESTAMP NOT NULL,
    valore DECIMAL(10,7),
    CONSTRAINT PK_RILEVAZIONI PRIMARY KEY(codice,sensore)
);

-- Tabella Anomalie
CREATE TABLE Anomalie (
    codice NUMBER,
    sensore NUMBER NOT NULL,
    data DATE NOT NULL,
    ora TIMESTAMP NOT NULL,
    causa VARCHAR2(255),
    livello_priorita NUMBER,
    CONSTRAINT PK_ANOMALIE PRIMARY KEY(codice)

);

-- Creazione della tabella Coinvolgimenti
CREATE TABLE Coinvolgimenti (
    equipaggio NUMBER,
    intervento NUMBER,
    CONSTRAINT PK_COINVOLGIMENTI PRIMARY KEY(equipaggio, intervento)
);

-- Tabella Interventi
CREATE TABLE Interventi (
    codice NUMBER,
    descrizione VARCHAR2(100) NOT NULL,
    esito VARCHAR2(50),
    data_intervento DATE NOT NULL,
    anomalia NUMBER UNIQUE,
    CONSTRAINT PK_INTERVENTI PRIMARY KEY(codice)
);

-- Aggiunta delle foreign key
ALTER TABLE Partecipazioni 
ADD CONSTRAINT FK_PARTECIPAZIONI_MISSIONI FOREIGN KEY(missione) REFERENCES Missioni(codice) ON DELETE CASCADE;

ALTER TABLE Partecipazioni 
ADD CONSTRAINT FK_PARTECIPAZIONI_MEMBRI_EQUIPAGGIO FOREIGN KEY(membro) REFERENCES Membri_Equipaggio(codice) ON DELETE SET NULL;

ALTER TABLE Impiego_Sensori 
ADD CONSTRAINT FK_IMPIEGO_SENSORI_MISSIONI FOREIGN KEY(missione) REFERENCES Missioni(codice) ON DELETE CASCADE;

ALTER TABLE Impiego_Sensori 
ADD CONSTRAINT FK_IMPIEGO_SENSORI_SENSORI FOREIGN KEY(sensore) REFERENCES Sensori(codice) ON DELETE CASCADE;

ALTER TABLE Impiego_Robot 
ADD CONSTRAINT FK_IMPIEGO_ROBOT_MISSIONI FOREIGN KEY(missione) REFERENCES Missioni(codice) ON DELETE CASCADE;

ALTER TABLE Impiego_Robot 
ADD CONSTRAINT FK_IMPIEGO_ROBOT_ROBOT FOREIGN KEY(robot) REFERENCES Robot(codice) ON DELETE CASCADE;

ALTER TABLE Report 
ADD CONSTRAINT FK_REPORT_MISSIONI FOREIGN KEY(missione) REFERENCES Missioni(codice) ON DELETE CASCADE;

ALTER TABLE Rilevazioni 
ADD CONSTRAINT FK_RILEVAZIONI_SENSORI FOREIGN KEY(sensore) REFERENCES Sensori(codice) ON DELETE CASCADE;

ALTER TABLE Anomalie 
ADD CONSTRAINT FK_ANOMALIE_SENSORI FOREIGN KEY(sensore) REFERENCES Sensori(codice) ON DELETE CASCADE;

ALTER TABLE Interventi 
ADD CONSTRAINT FK_INTERVENTI_ANOMALIE FOREIGN KEY(anomalia) REFERENCES Anomalie(codice) ON DELETE CASCADE;

ALTER TABLE Coinvolgimenti
ADD CONSTRAINT FK_COINVOLGIMENTI_MEMBRI FOREIGN KEY(equipaggio) REFERENCES Membri_Equipaggio(codice) ON DELETE SET NULL;

ALTER TABLE Coinvolgimenti
ADD CONSTRAINT FK_COINVOLGIMENTI_INTERVENTI FOREIGN KEY(intervento) REFERENCES Interventi(codice) ON DELETE CASCADE;