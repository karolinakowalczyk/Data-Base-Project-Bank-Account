
CREATE TABLE Adres (
Id_adresu INT,
Kod_pocztowy VARCHAR2 (6),
Ulica VARCHAR2 (50),
Nr_lokalu SMALLINT,
Nr_mieszkania SMALLINT,
Miejscowosc VARCHAR2 (40),

PRIMARY KEY (Id_adresu)
);

CREATE TABLE Wlasciciel (
Id_wlasciciela INT,
Id_adresu INT,
Imie_wlasciciela VARCHAR2(20),
Nazwisko_wlasciciela VARCHAR2(20),
Plec_wlasciciela CHAR,
PESEL_wlasciciela VARCHAR2(9) NOT NULL UNIQUE,

PRIMARY KEY (Id_wlasciciela),
CONSTRAINT Id_adresu FOREIGN KEY (Id_adresu)
REFERENCES Adres(Id_adresu)
);


CREATE TABLE Rachunek (
Id_rachunku INT,
Id_wlasciciela INT,
Data_zalozenia DATE,
Saldo NUMBER DEFAULT 0,
Nr_rachunku VARCHAR2 (40) UNIQUE,

PRIMARY KEY (Id_rachunku),
CONSTRAINT Id_wlasciciela FOREIGN KEY (Id_wlasciciela)
REFERENCES Wlasciciel(Id_wlasciciela)

);

CREATE TABLE Oddzialy (
Id_oddzialu INT,
Nazwa_oddzialu VARCHAR2(40),
Id_adresu_oddzialu INT,


PRIMARY KEY (Id_oddzialu),
CONSTRAINT Id_adresu_oddzialu FOREIGN KEY (Id_adresu_oddzialu)
REFERENCES Adres(Id_adresu)
);

CREATE TABLE Czas (
Id_czasu INT,
Rok VARCHAR2(4),
Miesiac VARCHAR2(2),
Dzien   VARCHAR2(2),
Godzina VARCHAR2(2),
Minuty  VARCHAR2(2),
PRIMARY KEY (Id_czasu) 
);

CREATE TABLE Rodzaj_operacji(
Id_rodzaju_operacji SMALLINT,
Rodzaj_operacji VARCHAR2(40) DEFAULT 'Zwykla',
Oplata NUMBER DEFAULT 0,

PRIMARY KEY (Id_rodzaju_operacji)
);

CREATE TABLE Transakcje (
Id_transakcji INT,
Id_rachunku_nadawcy INT,
Id_oddzialu INT,
Id_rodzaju_operacji SMALLINT,
Id_czasu INT,
Id_rachunku_odbiorcy INT,
Kwota NUMBER NOT NULL,

PRIMARY KEY (Id_transakcji),

CONSTRAINT Id_rachunku_nadawcy FOREIGN KEY (Id_rachunku_nadawcy)
REFERENCES Rachunek(Id_rachunku),

CONSTRAINT Id_oddzialu FOREIGN KEY (Id_oddzialu)
REFERENCES Oddzialy(Id_oddzialu),

CONSTRAINT Id_rodzaju_operacji FOREIGN KEY (Id_rodzaju_operacji)
REFERENCES Rodzaj_operacji(Id_rodzaju_operacji),

CONSTRAINT Id_czasu FOREIGN KEY (Id_czasu)
REFERENCES Czas(Id_czasu),

CONSTRAINT Id_rachunku_odbiorcy FOREIGN KEY (Id_rachunku_odbiorcy)
REFERENCES Rachunek(Id_rachunku)
);
