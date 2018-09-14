use BD5B6TP1_KoumaJouanique

DROP TABLE Invite;
DROP TABLE ReservationChambre;
DROP TABLE Client;
DROP TABLE Chambre;
DROP TABLE TypeChambre;

CREATE TABLE TypeChambre(
	NoTypeChambre int not null,
	Description varchar(50),
	PrixHaut Numeric(7,2),
	PrixBas Numeric(7,2),
	PrixMoyen Numeric(7,2),
	CONSTRAINT PK_NoTypeChambre PRIMARY KEY(NoTypeChambre)
)

CREATE TABLE Chambre(
	NoChambre int not null,
	Emplacement varchar(50),
	Decorations varchar(50),
	NoTypeChambre int not null,
	CONSTRAINT PK_NoChambre PRIMARY KEY(NoChambre),
	CONSTRAINT FK_NoTypeChambre FOREIGN KEY (NoTypeChambre) REFERENCES TypeChambre(NoTypeChambre)
)

CREATE TABLE Client(
	NoClient int not null,
	Nom varchar(20),
	Prenom varchar(20),
	Ville varchar(30),
	Pays varchar(20),
	Adresse varchar(50),
	CodePostal varchar(7),
	DateInscription DATETIME,
	CONSTRAINT PK_NoClient PRIMARY KEY (NoClient)
)

CREATE TABLE ReservationChambre(
	NoClient int not null,
	NoChambre int not null,
	DateArrivee DATETIME,
	DateDepart DATETIME,
	NbPersonnes int,
	CONSTRAINT PK_Reservation PRIMARY KEY(NoClient + NoChambre + DateArrivee),
	CONSTRAINT FK_NoClient FOREIGN KEY (NoClient) REFERENCES Client(NoClient),
	CONSTRAINT FK_NoChambre FOREIGN KEY (NoChambre) REFERENCES Chambre(NoChambre)
)
CREATE TABLE Invite(
	NoInvite int not null,
	NomPrenom varchar(50),

)