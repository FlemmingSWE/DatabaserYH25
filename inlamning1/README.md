Inlämning 1: ER-diagram och relationsmodell

README Bokhandel

av Flamur Mehmeti - YH25:

Syftet med inlämningen var att skapa en databas för en enkel bokhandel.



Bokhandeln består av följande delar:

* Kunder
* Böcker
* Beställningar
* Orderrader


En kund ska ha möjligheten att göra flera beställningar. En beställning kan därmed innehålla en eller flera böcker.
Orderraderns syfte är alltså att beskriva vilken bok som tillhör vems beställning.

ER-diagrammet finns i mappen "/images" och går under namnet "ER\_diagram\_inlämning1.png"



ER-diagrammet:


Kunder (Entitet)
* Kund_ID (PK) (Attribut)
* Förnamn (Attribut)
* Efternamn (Attribut)
* E_post (Attribut)
* Telefon (Attribut)
* Adress (Attribut)


Bocker (Entitet)
* ISBN_Nummer (PK) (Attribut)
* Bok_titel (Attribut)
* Författare (Attribut)
* Pris (Attribut)
* Lagerstatus (Attribut)


Bestallningar (Entitet)
* Ordernummer_ID (PK) (Attribut)
* Kund_ID (FK ---> Kunder.Kund_ID) (Attribut)
* Datum (Attribut)
* Totalbelopp (Attribut)


Orderrader (entitet)
* Orderrad_ID (PK) (Attribut)
* Ordernummer_ID (FK ---> Bestallningar.Ordernummer_ID) (Attribut)
* ISBN_Nummer (FK ---> Bocker.ISBN_Nummer) (Attribut)
* Antal (Attribut)
* Pris (Attribut)



Relationer i databasen:


Kunder --- Bestallningar: En kund kan göra flera beställningar [1---M]


Bestallningar --- Orderrader: En beställning kan bestå av flera orderrader [1---M]


Bok --- orderrader: En och samma bok kan förekomma i flera ordar [1---M]



Relationsmodell:

Kunder (KundID, Förnamn, Efternamn, E_post, Telefon, Adress)
Bocker (ISBN_Nummer, Bok_titel, Författare, Pris, Lagerstatus)
Bestallningar (Ordernummer_ID, Kund_ID, Datum, Totalbelopp)
Orderrader (Orderrad_ID, Ordernummer_ID, ISBN_Nummer, Antal, Pris)



SQL-koden finns i filen "inlamning1.sql"

I SQL filen ingår följande:
*CREATE DATABASE
*CREATE TABLE för alla tabeller (entiteter)
*INSERT INTO för infogning av data
*SELECT för visning av data





