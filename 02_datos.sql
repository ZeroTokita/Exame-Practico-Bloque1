-- EXAMEN PRACTICO - BLOQUE 1
-- Parte B: Insercion de datos (DML)
-- Academia de cursos en linea - MySQL / Clever Cloud
--
-- Requisitos: tablas estudiantes, cursos e inscripciones creadas.
-- Selecciona en Workbench la base asignada por Clever Cloud antes de ejecutar.
-- Ejecutar UNA SOLA VEZ sobre las tablas vacias.

-- 1. Insertar 5 estudiantes
INSERT INTO estudiantes (nombre, correo, edad)
VALUES
    ('Ana Torres', 'ana@mail.com', 22),
    ('Luis Paredes', 'luis@mail.com', 19),
    ('Maria Lopez', 'maria@mail.com', 24),
    ('Carlos Ruiz', 'carlos@mail.com', 21),
    ('Sofia Vega', 'sofia@mail.com', 20);

-- 2. Insertar 4 cursos
INSERT INTO cursos (nombre, duracion_horas)
VALUES
    ('Bases de Datos', 40),
    ('Python', 30),
    ('SQL', 36),
    ('MongoDB', 25);

-- 3. Insertar 8 inscripciones
-- Las claves foraneas se resuelven mediante correo y nombre del curso,
-- por lo que no se presupone que los identificadores comiencen en 1.
INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion)
SELECT e.id_estudiante, c.id_curso, d.fecha_inscripcion
FROM (
    SELECT 'ana@mail.com' AS correo, 'Bases de Datos' AS curso, '2026-10-01' AS fecha_inscripcion
    UNION ALL SELECT 'ana@mail.com', 'SQL', '2026-10-01'
    UNION ALL SELECT 'luis@mail.com', 'Python', '2026-10-02'
    UNION ALL SELECT 'maria@mail.com', 'Bases de Datos', '2026-10-02'
    UNION ALL SELECT 'maria@mail.com', 'MongoDB', '2026-10-03'
    UNION ALL SELECT 'carlos@mail.com', 'SQL', '2026-10-03'
    UNION ALL SELECT 'sofia@mail.com', 'MongoDB', '2026-10-04'
    UNION ALL SELECT 'sofia@mail.com', 'Bases de Datos', '2026-10-04'
) AS d
INNER JOIN estudiantes AS e ON e.correo = d.correo
INNER JOIN cursos AS c ON c.nombre = d.curso;

-- 4. Verificar las cantidades insertadas
SELECT
    (SELECT COUNT(*) FROM estudiantes) AS total_estudiantes,
    (SELECT COUNT(*) FROM cursos) AS total_cursos,
    (SELECT COUNT(*) FROM inscripciones) AS total_inscripciones;

-- 5. Comprobar las relaciones
SELECT e.nombre AS estudiante,
       c.nombre AS curso,
       i.fecha_inscripcion
FROM inscripciones AS i
INNER JOIN estudiantes AS e ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos AS c ON c.id_curso = i.id_curso
ORDER BY e.nombre, c.nombre;
