
-- EXAMEN PRACTICO - BLOQUE 1
-- PARTE C: 10 CONSULTAS SQL


-- CONSULTA 1: Lista de contactos
-- Nombre y correo de todos los estudiantes

SELECT nombre, correo
FROM estudiantes;


-- CONSULTA 2: Filtro por edad
-- Estudiantes mayores de 20 años

SELECT *
FROM estudiantes
WHERE edad > 20;


-- CONSULTA 3: Cursos extensos
-- Cursos con mas de 30 horas

SELECT nombre, duracion_horas
FROM cursos
WHERE duracion_horas > 30;


-- CONSULTA 4: Detalle de inscripciones
-- Estudiantes y sus cursos

SELECT
    e.nombre AS estudiante,
    c.nombre AS curso
FROM inscripciones i
INNER JOIN estudiantes e
    ON i.id_estudiante = e.id_estudiante
INNER JOIN cursos c
    ON i.id_curso = c.id_curso
ORDER BY e.nombre, c.nombre;


-- CONSULTA 5: Demanda de cursos
-- Cantidad de estudiantes inscritos por curso

SELECT
    c.nombre AS curso,
    COUNT(i.id_estudiante) AS total_estudiantes
FROM cursos c
LEFT JOIN inscripciones i
    ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre
ORDER BY total_estudiantes DESC, c.nombre;


-- CONSULTA 6: Edad promedio
-- Promedio de edad de los estudiantes

SELECT
    ROUND(AVG(edad), 2) AS edad_promedio
FROM estudiantes;


-- CONSULTA 7: Ranking de duracion
-- Cursos de mayor a menor duracion

SELECT nombre, duracion_horas
FROM cursos
ORDER BY duracion_horas DESC;


-- CONSULTA 8: Estudiantes especificos
-- Inscritos en Bases de Datos

SELECT
    e.nombre AS estudiante,
    e.correo
FROM estudiantes e
INNER JOIN inscripciones i
    ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos c
    ON i.id_curso = c.id_curso
WHERE c.nombre = 'Bases de Datos';


-- CONSULTA 9: Cursos activos
-- Cursos con al menos un estudiante inscrito

SELECT DISTINCT
    c.nombre AS curso
FROM cursos c
INNER JOIN inscripciones i
    ON c.id_curso = i.id_curso
ORDER BY c.nombre;


-- CONSULTA 10: Total de registros
-- Cantidad total de inscripciones

SELECT
    COUNT(*) AS total_inscripciones
FROM inscripciones;
