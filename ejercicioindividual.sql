DROP DATABASE IF EXISTS JuegoSO;
CREATE DATABASE JuegoSO;
USE JuegoSO;

CREATE TABLE Jugadors(
	Identificador INTEGER PRIMARY KEY NOT NULL,
	UserName TEXT NOT NULL,
	Password TEXT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Partides(
	Identificador INTEGER PRIMARY KEY NOT NULL,
	Fecha TEXT NOT NULL,
	Duracion INTEGER NOT NULL,  
	Ganador TEXT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE PlayersGames(
	Jugador INTEGER NOT NULL,
	Partida INTEGER NOT NULL,
	Posicion INTEGER NOT NULL,
	Puntuacion INTEGER NOT NULL,
	FOREIGN KEY (Jugador) REFERENCES Jugadors(Identificador),
	FOREIGN KEY (Partida) REFERENCES Partides(Identificador)
)ENGINE = InnoDB;						   

INSERT INTO Jugadors VALUES (1, 'Julia', 01);
INSERT INTO Jugadors VALUES (2, 'Asier', 02);
INSERT INTO Jugadors VALUES (3, 'Pedro', 03);

INSERT INTO Partides VALUES (1, '04/5/23/14/05', 30, 'Asier');
INSERT INTO Partides VALUES (2, '04/5/23/18/10', 40, 'Julia');
INSERT INTO Partides VALUES (3, '04/5/23/20/30', 45, 'Asier');

INSERT INTO PlayersGames VALUES (1, 1, 2, 20);
INSERT INTO PlayersGames VALUES (1, 2, 1, 200);
INSERT INTO PlayersGames VALUES (1, 3, 2, 43);
INSERT INTO PlayersGames VALUES (2, 1, 1, 100);
INSERT INTO PlayersGames VALUES (2, 2, 2, 50);
INSERT INTO PlayersGames VALUES (2, 3, 1, 175);
INSERT INTO PlayersGames VALUES (3, 1, 3, 15);
INSERT INTO PlayersGames VALUES (3, 2, 3, 40);
INSERT INTO PlayersGames VALUES (3, 3, 3, 5);