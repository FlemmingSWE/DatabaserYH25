CREATE DATABASE Bokhandel;
USE Bokhandel;


# Skapar tabellen "Böcker"
CREATE TABLE IF NOT EXISTS Bocker(
  ISBN_Nummer VARCHAR(50) PRIMARY KEY,
  Bok_titel VARCHAR(200) NOT NULL,
  Forfattare VARCHAR(200) NOT NULL,
  Pris DECIMAL(10,2) NOT NULL,
  Lagerstatus INT
);

# Infogning av data i tabellen "Böcker"
INSERT INTO bocker(ISBN_Nummer, Bok_titel, Forfattare, Pris, Lagerstatus) VALUES 
("9789178431125", "Mördarens ö", "Camilla Sten", 199.00, 12),
("9789155238879", "Sista arkivet", "Thomas hage", 189.00, 34),
("9780441927312", "The Quantum Orchard", "J.R. Kalmer", 249.00, 8),
("9781603095024", "Vargens Tystnad", "Erika Fahlgren", 175.00, 61),
("9789188942211", "Fragment av stjärnstoft", "Amir Davani", 205.00, 0);

# Visar tabellen böcker och dess inehåll
SELECT * FROM bocker;

# Skapar tabellen med "Kunder"
CREATE TABLE IF NOT EXISTS Kunder(
	Kund_ID INT AUTO_INCREMENT PRIMARY KEY,
	Förnamn VARCHAR(100) NOT NULL,
    Efternamn VARCHAR(100) NOT NULL,
	E_post varchar(100),
	Telefon INT,
	Adress VARCHAR(50)
);

# Infogar data i tabellen med kunder
INSERT INTO kunder(Förnamn, Efternamn, E_post, Telefon, Adress) VALUES
("Anna", "Svensson", "anna.svensson@mail.com", "473264371", "Brovägen 7B"),
("Erik", "Johansson", "erik.johansson@mail.com", "768575827", "Bilvägen 40"),
("Maria", "Lund", "maria.lund@mail.com", "578478943", "Fågelvägen 10"),
("Johan", "Berg", "johan.berg@mail.com", "685986099" ,"Prästgatan 2C");

# Visar tabellen kunder och dess innehåll
SELECT * FROM kunder;

# Skapar tabellen "beställningar"
CREATE TABLE IF NOT EXISTS Bestallningar(
	Ordernummer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Kund_ID INT,
    Datum DATE NOT NULL,
    Totalbelopp DECIMAL(10,2),
    FOREIGN KEY (Kund_ID) REFERENCES Kunder(Kund_ID)
);

# Infogar data i tabellen bestallningar
INSERT INTO bestallningar(Kund_ID, Datum, Totalbelopp) VALUES
(1, "2025-12-01", 438),
(2, "2025-12-01", 205),
(3, "2025-12-01", 199);

# Visar tabellen "Beställningar" och dess innehåll
SELECT * FROM bestallningar;

# Skapar tabellen "Orderrader"
CREATE TABLE IF NOT EXISTS Orderrader(
	Orderad_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Ordernummer_ID INT NOT NULL,
    ISBN_Nummer VARCHAR(50) NOT NULL,
    Antal INT NOT NULL,
    Pris DECIMAL(10,2),
    FOREIGN KEY(Ordernummer_ID) REFERENCES bestallningar(Ordernummer_ID),
    FOREIGN KEY(ISBN_Nummer) REFERENCES bocker(ISBN_Nummer)
);

# Infogar data i tabellen Orderrader
INSERT INTO orderrader(Ordernummer_ID, ISBN_Nummer, Antal, Pris) VALUES
("1", "9789155238879", 1, 189.00),
("1", "9780441927312", 1, 249.00),
("2", "9789188942211", 1, 205.00),
("3", "9789178431125", 1, 199.00);

# Visar tabellen Orderrader och dess innehåll
SELECT * FROM orderrader;


/* Här visar vilken kund som har beställt vad
och antalet böcker av tillgängliga böcker i "biblioteket" 
genom att kombinera olika kolumner från olika tabeller */
SELECT Kun.Förnamn, Kun.Efternamn, O.Antal, bok.Bok_titel
FROM Bestallningar bes
JOIN orderrader o ON o.ordernummer_ID = bes.ordernummer_ID
JOIN Kunder kun ON bes.Kund_ID = Kun.Kund_ID 
JOIN Bocker bok ON O.ISBN_Nummer = Bok.ISBN_Nummer; 

SELECT * FROM orderrader;
SELECT * FROM kunder;
SELECT * FROM bocker;
SELECT * FROM bestallningar;
