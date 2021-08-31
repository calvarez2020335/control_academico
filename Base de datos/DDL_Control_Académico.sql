DROP DATABASE IF EXISTS controlAcademico;
CREATE DATABASE IF NOT EXISTS controlAcademico;
USE controlAcademico;

/**********************************************************************
TABLE horario
***********************************************************************/

DROP TABLE IF EXISTS horario;
CREATE TABLE horario(
	horario_id INT NOT NULL AUTO_INCREMENT,
    horario_final TIME NOT NULL,
    horario_inicio TIME NOT NULL,
    PRIMARY KEY (horario_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/**********************************************************************
TABLE salon
***********************************************************************/

DROP TABLE IF EXISTS salon;
CREATE TABLE salon(
	salon_id INT NOT NULL AUTO_INCREMENT,
    capacidad INT,
    descripcion VARCHAR(255),
    nombre_salon varchar(255),
    PRIMARY KEY (salon_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/**********************************************************************
TABLE carrera_tecnica
***********************************************************************/

DROP TABLE IF EXISTS carrera_tecnica;
CREATE TABLE carrera_tecnica(
	codigo_carrera VARCHAR(128) NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY(codigo_carrera)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/**********************************************************************
TABLE instructor
***********************************************************************/

DROP TABLE IF EXISTS instructor;
CREATE TABLE instructor(
	instructor_id INT NOT NULL AUTO_INCREMENT,
    apellidos VARCHAR(45),
    nombres VARCHAR(45),
    direccion VARCHAR(45),
    telefono VARCHAR(45),
    PRIMARY KEY(instructor_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/**********************************************************************
TABLE curso
***********************************************************************/

DROP TABLE IF EXISTS curso;
CREATE TABLE curso(
	curso_id INT NOT NULL AUTO_INCREMENT,
    ciclo INT,
    cupo_maximo INT,
    cupo_minimo INT, 
    descripcion VARCHAR(255),
    codigo_carrera VARCHAR(128),
    horario_id INT,
    instructor_id INT,
    salon_id INT,
    PRIMARY KEY (curso_id),
	CONSTRAINT FK_curso_carrera
        FOREIGN KEY (codigo_carrera)
        REFERENCES carrera_tecnica(codigo_carrera),
	CONSTRAINT FK_curso_horario
		FOREIGN KEY (horario_id)
		REFERENCES horario (horario_id),
	CONSTRAINT FK_curso_instructor
		FOREIGN KEY (instructor_id)
        REFERENCES instructor (instructor_id),
	CONSTRAINT FK_curso_salon
		FOREIGN KEY (salon_id)
        REFERENCES salon (salon_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/**********************************************************************
TABLE alumno
***********************************************************************/

DROP TABLE IF EXISTS alumno;
CREATE TABLE alumno(
	carne VARCHAR(16) NOT NULL,
    apellidos VARCHAR(45),
    nombres VARCHAR(45),
    email VARCHAR(32),
    PRIMARY KEY(carne)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/**********************************************************************
TABLE asignacion_alumno
***********************************************************************/

DROP TABLE IF EXISTS asignacion_alumno;

CREATE TABLE asignacion_alumno(
	asignacion_id VARCHAR(45) NOT NULL,
    carne VARCHAR(16),
    curso_id INT,
    fecha_asignacion DATETIME,
    PRIMARY KEY (asignacion_id),
	CONSTRAINT FK_asignacion_carne
		FOREIGN KEY (carne)
        REFERENCES alumno (carne),
	CONSTRAINT FK_asignacion_curso
		FOREIGN KEY (curso_id)
        REFERENCES curso(curso_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/**********************************************************************
DATOS DE PRUEBA
***********************************************************************/

INSERT INTO horario (horario_final, horario_inicio)
VALUES (current_time(), current_time());
select * from horario;

INSERT INTO salon (capacidad, descripcion, nombre_salon)
VALUES(1, "a", "a");
select * from salon;

INSERT INTO carrera_tecnica(codigo_carrera,nombre)
VALUES ("IN5BV","b");
select * from carrera_tecnica;

INSERT INTO instructor(apellidos, nombres, direccion, telefono)
VALUES ("a", "b", "c", "11");
SELECT * FROM instructor;

INSERT INTO curso(ciclo, cupo_maximo, cupo_minimo, descripcion, codigo_carrera, horario_id, instructor_id, salon_id)
VALUES (1, 2, 3, "a", "IN5BV", 1, 1, 1);
SELECT * FROM curso;

INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020335, "a", "b", "calvarez-2020335@kinal.edu.gt");
SELECT * FROM alumno;

INSERT INTO asignacion_alumno(asignacion_id, carne, curso_id, fecha_asignacion)
VALUES("a", "2020335", 1, current_date());
SELECT * FROM asignacion_alumno;