1. Estado Actual de un Partido entre Dos Colegios Específicos
SELECT 
    p.resultado_partido, 
    e1.escuela AS escuela_local, 
    e2.escuela AS escuela_visitante
FROM 
    Partidos p
    JOIN Equipos e1 ON p.ID_Seleccion_Local = e1.id_Equipo
    JOIN Equipos e2 ON p.ID_Seleccion_Visitante = e2.id_Equipo
WHERE 
    e1.escuela = 'Monserrat' 
    AND e2.escuela = 'San José';

2. Partidos de un Deporte Específico
SELECT 
    p.ID_Partido, 
    p.resultado_partido, 
    p.Fecha, 
    e1.escuela AS escuela_local, 
    e2.escuela AS escuela_visitante
FROM 
    Partidos p
    JOIN Equipos e1 ON p.ID_Seleccion_Local = e1.id_Equipo
    JOIN Equipos e2 ON p.ID_Seleccion_Visitante = e2.id_Equipo
    JOIN Deporte d ON e1.id_deporte = d.id_Deporte
WHERE 
    d.Nombre = 'Soccer';

3. Estado Actual de un Colegio en Particular
SELECT 
    e.escuela,
    d.Nombre AS deporte,
    p.Fecha AS fecha_partido,
    p.resultado_partido
FROM 
    Equipos e
    JOIN Deporte d ON e.id_deporte = d.id_Deporte
    LEFT JOIN Partidos p ON (e.id_Equipo = p.ID_Seleccion_Local OR e.id_Equipo = p.ID_Seleccion_Visitante)
WHERE 
    e.escuela = 'Monserrat';

4. Datos de las Compras en Cantina de un Producto Específico
SELECT 
    p.name AS producto, 
    p.description, 
    p.price
FROM 
    Products p
WHERE 
    p.name = 'Pizza';

5. Información de una Cancha en Particular
SELECT 
    p.ID_Partido, 
    p.resultado_partido, 
    e1.escuela AS escuela_local, 
    e2.escuela AS escuela_visitante
FROM 
    Partidos p
    JOIN Equipos e1 ON p.ID_Seleccion_Local = e1.id_Equipo
    JOIN Equipos e2 ON p.ID_Seleccion_Visitante = e2.id_Equipo
WHERE 
    p.ID_Estadio = (SELECT id_estadio FROM Estadio WHERE deportes_disponibles LIKE '%Soccer%' AND capacidad >= 3000);
