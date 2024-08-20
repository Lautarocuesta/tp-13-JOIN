-- Eliminar tablas si existen
DROP TABLE IF EXISTS Partidos;
DROP TABLE IF EXISTS Deporte;
DROP TABLE IF EXISTS Equipos;
DROP TABLE IF EXISTS Integrantes;
DROP TABLE IF EXISTS Copa_Renault;
DROP TABLE IF EXISTS Estadio;

-- Crear tabla Deporte
CREATE TABLE Deporte (
    id_Deporte INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Cantidad_Jugadores INT NOT NULL,
    Reglas TEXT NOT NULL,
    PRIMARY KEY (id_Deporte)
);

-- Crear tabla Equipos
CREATE TABLE Equipos (
    id_Equipo INT NOT NULL AUTO_INCREMENT,
    id_deporte INT NOT NULL,
    escuela VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_Equipo),
    FOREIGN KEY (id_deporte) REFERENCES Deporte(id_Deporte)
);

-- Crear tabla Estadio
CREATE TABLE Estadio (
    id_estadio INT NOT NULL AUTO_INCREMENT,
    deportes_disponibles VARCHAR(255) NOT NULL,
    capacidad INT NOT NULL,
    PRIMARY KEY (id_estadio)
);

-- Crear tabla Partidos
CREATE TABLE Partidos (
    ID_Partido INT NOT NULL AUTO_INCREMENT,
    resultado_partido INT NULL DEFAULT NULL,
    Fecha DATE NOT NULL,
    ID_Estadio INT NOT NULL,
    ID_Seleccion_Local INT NOT NULL,
    ID_Seleccion_Visitante INT NOT NULL,
    equipo_rival INT NULL DEFAULT NULL,
    new_field INT NULL DEFAULT NULL,
    PRIMARY KEY (ID_Partido),
    FOREIGN KEY (ID_Estadio) REFERENCES Estadio(id_estadio),
    FOREIGN KEY (ID_Seleccion_Local) REFERENCES Equipos(id_Equipo),
    FOREIGN KEY (ID_Seleccion_Visitante) REFERENCES Equipos(id_Equipo)
);

-- Crear tabla Integrantes
CREATE TABLE Integrantes (
    id_integrante INT NOT NULL AUTO_INCREMENT,
    dni_integrante VARCHAR(20) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    edad INT NOT NULL,
    PRIMARY KEY (id_integrante)
);

-- Crear tabla Copa_Renault
CREATE TABLE Copa_Renault (
    edicion YEAR NOT NULL,
    id_escuela VARCHAR(255) NOT NULL,
    PRIMARY KEY (edicion, id_escuela)
);

-- Insertar datos de ejemplo en Deporte
INSERT INTO Deporte (Nombre, Cantidad_Jugadores, Reglas) VALUES
('Soccer', 11, 'Juego con un balón en el que se debe marcar un gol en la portería contraria.'),
('Basketball', 5, 'Juego en el que se intenta encestar el balón en el aro del equipo contrario.'),
('Tennis', 1, 'Juego en el que se usa una raqueta para golpear una pelota sobre una red.');

-- Insertar datos de ejemplo en Equipos
INSERT INTO Equipos (id_deporte, escuela) VALUES
(1, 'Monserrat'),
(1, 'San José'),
(2, 'East High'),
(2, 'West Academy'),
(3, 'South School'),
(3, 'North College');

-- Insertar datos de ejemplo en Estadio
INSERT INTO Estadio (deportes_disponibles, capacidad) VALUES
('Soccer, Basketball', 5000),
('Soccer', 3000),
('Basketball', 2000);

-- Insertar datos de ejemplo en Partidos
INSERT INTO Partidos (resultado_partido, Fecha, ID_Estadio, ID_Seleccion_Local, ID_Seleccion_Visitante) VALUES
(2, '2024-08-20', 1, 1, 2),
(75, '2024-08-21', 2, 3, 4);
