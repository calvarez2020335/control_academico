DROP DATABASE IF EXISTS controlAcademico;
CREATE DATABASE IF NOT EXISTS controlAcademico;
USE controlAcademico;

/**********************************************************************
TABLE horario
***********************************************************************/

DROP TABLE IF EXISTS horario;
CREATE TABLE horario(
	horarioId INT NOT NULL AUTO_INCREMENT,
    horarioFinal TIME NOT NULL,
    horarioInicio TIME NOT NULL,
    PRIMARY KEY (horarioId)
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
        REFERENCES carrera_tecnica(codigo_carrera)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        ,
	CONSTRAINT FK_curso_horario
		FOREIGN KEY (horario_id)
		REFERENCES horario (horarioId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        ,
	CONSTRAINT FK_curso_instructor
		FOREIGN KEY (instructor_id)
        REFERENCES instructor (instructor_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        ,
	CONSTRAINT FK_curso_salon
		FOREIGN KEY (salon_id)
        REFERENCES salon (salon_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
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
        REFERENCES alumno (carne)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        ,
	CONSTRAINT FK_asignacion_curso
		FOREIGN KEY (curso_id)
        REFERENCES curso(curso_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/**********************************************************************
DATOS DE PRUEBA
***********************************************************************/

/**********************************************************************
DATOS DE SALON
***********************************************************************/

INSERT INTO salon (capacidad, descripcion, nombre_salon)
VALUES(45, "salon de computacion", "Salon-C1");
INSERT INTO salon (capacidad, descripcion, nombre_salon)
VALUES(30, "salon de matematicas", "Salon-M1");
INSERT INTO salon (capacidad, descripcion, nombre_salon)
VALUES(20, "Salon de Lengua", "Salon-L1");
INSERT INTO salon (capacidad, descripcion, nombre_salon)
VALUES(10, "salon de Biologia", "Salon-B1");
INSERT INTO salon (capacidad, descripcion, nombre_salon)
VALUES(25, "Salon de Artes", "Salon-A1");
select * from salon;

/**********************************************************************
DATOS DE HORARIO
***********************************************************************/

INSERT INTO horario (horarioFinal, horarioInicio)
VALUES ('18:00:00', '13:00:00');
INSERT INTO horario (horarioFinal, horarioInicio)
VALUES ('12:00:00', '6:00:00');
INSERT INTO horario (horarioFinal, horarioInicio)
VALUES ('15:00:00', '9:00:00');
INSERT INTO horario (horarioFinal, horarioInicio)
VALUES ('18:00:00', '6:00:00');
INSERT INTO horario (horarioFinal, horarioInicio)
VALUES ('22:00:00', '18:00:00');
select * from horario;

/**********************************************************************
DATOS DE Carrera tecnica
***********************************************************************/

INSERT INTO carrera_tecnica(codigo_carrera,nombre)
VALUES ("IN5BV","Informatica Vespertina");
INSERT INTO carrera_tecnica(codigo_carrera,nombre)
VALUES ("IN4BM","Informatica Vespertina");
INSERT INTO carrera_tecnica(codigo_carrera,nombre)
VALUES ("DI5AV","Dibujo Vespertina");
INSERT INTO carrera_tecnica(codigo_carrera,nombre)
VALUES ("DI5AM","Dibujo Matutina");
INSERT INTO carrera_tecnica(codigo_carrera,nombre)
VALUES ("ME5AM","Mecanica Matutina");
select * from carrera_tecnica;

/**********************************************************************
DATOS DE Instructor
***********************************************************************/

INSERT INTO instructor(apellidos, nombres, direccion, telefono)
VALUES ("Ortiz", "Santiago", "Guatemala zona 1", "85693265");
INSERT INTO instructor(apellidos, nombres, direccion, telefono)
VALUES ("Martinez", "Mateo", "Guatemala zona 12", "63984620");
INSERT INTO instructor(apellidos, nombres, direccion, telefono)
VALUES ("Silvestre", "Valentina", "Guatemala zona 10", "62485255");
SELECT * FROM instructor;

/**********************************************************************
DATOS DE Curso
***********************************************************************/

INSERT INTO curso(ciclo, cupo_maximo, cupo_minimo, descripcion, codigo_carrera, horario_id, instructor_id, salon_id)
VALUES (1, 30, 10, "Cuarto perito", "IN5BV", 1, 1, 1);
INSERT INTO curso(ciclo, cupo_maximo, cupo_minimo, descripcion, codigo_carrera, horario_id, instructor_id, salon_id)
VALUES (1, 20, 5, "Cuarto Perito", "IN4BM", 1, 1, 1);
INSERT INTO curso(ciclo, cupo_maximo, cupo_minimo, descripcion, codigo_carrera, horario_id, instructor_id, salon_id)
VALUES (1, 50, 30, "Quinto Perito", "DI5AV", 1, 1, 1);
INSERT INTO curso(ciclo, cupo_maximo, cupo_minimo, descripcion, codigo_carrera, horario_id, instructor_id, salon_id)
VALUES (1, 20, 3, "Sexto Perito", "DI5AV", 1, 1, 1);
INSERT INTO curso(ciclo, cupo_maximo, cupo_minimo, descripcion, codigo_carrera, horario_id, instructor_id, salon_id)
VALUES (1, 20, 3, "Sexto Perito", "DI5AV", 1, 1, 1);
SELECT * FROM curso;

/**********************************************************************
DATOS DE ALUMNO
***********************************************************************/
INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020335, "Alvarez Crúz", "Carlos Adolfo ", "calvarez-2020335@kinal.edu.gt");
INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020220, "Cua Tote Chete", "Steven Emanuel", "scua-2020220@kinal.edu.gt");
INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020296, "Marroquín Hernández", "Josué Daniel", "jmarroquin-2020296@kinal.edu.gt");
INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020284, "Picholá Picholá", "César Alexander", "cpichola-2020284@kinal.edu.gt");
INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020390, "de la Cruz Najera", "Alan Eduardo", "adelacruz-2020390@kinal.edu.gt");
INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020325, "Vicente Hernández", "Erwin Esteban", "evicente-2020325@kinal.edu.gt");
INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020394, "Hernández Cholotio", "Diego Enrique", "dhernandez-2020394@kinal.edu.gt");
INSERT INTO alumno(carne, apellidos, nombres, email)
VALUES(2020261, "González Hic", "Carlos Emilio", "cgonzalez-2020261@kinal.edu.gt");
SELECT * FROM alumno;

/**********************************************************************
DATOS DE ASIGNACIONALUMNO
***********************************************************************/

INSERT INTO asignacion_alumno(asignacion_id, carne, curso_id, fecha_asignacion)
VALUES("Alum1", "2020335", 1, current_date());
INSERT INTO asignacion_alumno(asignacion_id, carne, curso_id, fecha_asignacion)
VALUES("Alum2", "2020220", 1, current_date());
INSERT INTO asignacion_alumno(asignacion_id, carne, curso_id, fecha_asignacion)
VALUES("Alum3", "2020296", 1, current_date());
INSERT INTO asignacion_alumno(asignacion_id, carne, curso_id, fecha_asignacion)
VALUES("Alum4", "2020284", 1, current_date());
INSERT INTO asignacion_alumno(asignacion_id, carne, curso_id, fecha_asignacion)
VALUES("Alum5", "2020325", 1, current_date());
INSERT INTO asignacion_alumno(asignacion_id, carne, curso_id, fecha_asignacion)
VALUES("Alum6", "2020394", 1, current_date());
INSERT INTO asignacion_alumno(asignacion_id, carne, curso_id, fecha_asignacion)
VALUES("Alum7", "2020261", 1, current_date());

SELECT * FROM asignacion_alumno;

/**********************************************************************
LOGIN
***********************************************************************/
DROP TABLE IF EXISTS Usuario;
CREATE TABLE IF NOT EXISTS Usuario(
	user VARCHAR(45) not null,
    pass VARCHAR(45) not null,
    PRIMARY KEY(user)
);

INSERT INTO Usuario(user, pass) VALUES ("root","admin");
INSERT INTO Usuario(user, pass) VALUES ("admin","root");
SELECT * FROM Usuario;