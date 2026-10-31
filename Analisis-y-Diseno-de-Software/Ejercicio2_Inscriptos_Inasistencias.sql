IF OBJECT_ID('inasistencias') IS NOT NULL
    DROP TABLE inasistencias;

IF OBJECT_ID('inscriptos') IS NOT NULL
    DROP TABLE inscriptos;

CREATE TABLE inscriptos (
    nombre VARCHAR(30),
    documento CHAR(8),
    deporte VARCHAR(15),
    matricula CHAR(1),
    PRIMARY KEY (documento, deporte)
);

CREATE TABLE inasistencias (
    documento CHAR(8),
    deporte VARCHAR(15),
    fecha DATETIME
);

INSERT INTO inscriptos VALUES ('Juan Perez','22222222','tenis','s');
INSERT INTO inscriptos VALUES ('Maria Lopez','23333333','tenis','s');
INSERT INTO inscriptos VALUES ('Agustin Juarez','24444444','tenis','n');
INSERT INTO inscriptos VALUES ('Marta Garcia','25555555','natacion','s');
INSERT INTO inscriptos VALUES ('Juan Perez','22222222','natacion','s');
INSERT INTO inscriptos VALUES ('Maria Lopez','23333333','natacion','n');

INSERT INTO inasistencias VALUES ('22222222','tenis','2006-12-01');
INSERT INTO inasistencias VALUES ('22222222','tenis','2006-12-08');
INSERT INTO inasistencias VALUES ('23333333','tenis','2006-12-01');
INSERT INTO inasistencias VALUES ('24444444','tenis','2006-12-08');
INSERT INTO inasistencias VALUES ('22222222','natacion','2006-12-02');
INSERT INTO inasistencias VALUES ('23333333','natacion','2006-12-02');

SELECT
    i.nombre,
    i.deporte,
    a.fecha
FROM inscriptos AS i
INNER JOIN inasistencias AS a
    ON i.documento = a.documento
    AND i.deporte = a.deporte
ORDER BY i.nombre, i.deporte;

SELECT
    i.nombre,
    i.deporte,
    a.fecha
FROM inscriptos AS i
INNER JOIN inasistencias AS a
    ON i.documento = a.documento
    AND i.deporte = a.deporte
WHERE i.nombre = 'Juan Perez'
    AND i.deporte = 'tenis';

SELECT
    i.nombre,
    i.deporte,
    a.fecha
FROM inscriptos AS i
INNER JOIN inasistencias AS a
    ON i.documento = a.documento
    AND i.deporte = a.deporte
WHERE i.matricula = 's'
ORDER BY i.nombre, i.deporte;
