CREATE DATABASE CrossfitApp;

DROP DATABASE IF EXISTS CrossfitApp;

CREATE TYPE sexo AS ENUM ('Masculino','Femenino');
CREATE TABLE atletas( /*XXXXX*/
    id_atleta SERIAL PRIMARY KEY,
    nombres VARCHAR(40),
    apellidos VARCHAR(40),
    peso FLOAT,
    sexo SEXO,
    categoria VARCHAR(10),
    solvencia BOOLEAN
);

CREATE TYPE especialidades AS ENUM ('AMRAP', 'EMOM', 'FOR TIME', 'TABATA', 'FOR MAX WEIGHT');
CREATE TABLE especialidad( /*XXXXX*/
    id_especialidad SERIAL PRIMARY KEY,
    tipo_especialidad ESPECIALIDADES
);
CREATE TABLE wod( /*XXXXX*/
    id_wod SERIAL PRIMARY KEY,
    nombre_wod VARCHAR(25) NOT NULL,
    descripcion TEXT
);
CREATE TABLE clases( /*XXXX*/
    id_clase SERIAL PRIMARY KEY,
    id_especialidad INT,
    id_wod INT,

    CONSTRAINT fk_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
    CONSTRAINT fk_wod FOREIGN KEY (id_Wod) REFERENCES wod(id_wod)

);
CREATE TABLE movimientos( /*XXXX*/
    id_movimiento SERIAL PRIMARY KEY,
    nombre_ejercicio VARCHAR(25),
    instrucciones TEXT
);
CREATE TABLE movimientos_wods( /*XXX*/
    id_wod INT,
    id_movimiento INT,
    cantidad INT,
    descripcion TEXT,

    PRIMARY KEY (id_wod, id_movimiento),
    CONSTRAINT fk_id_wod FOREIGN KEY (id_wod) REFERENCES wod(id_wod),
    CONSTRAINT fk_id_movimiento FOREIGN KEY (id_movimiento) REFERENCES movimientos(id_movimiento)
);
CREATE TABLE horarios_clase( /*XXXX*/
    id_horario SERIAL PRIMARY KEY,
    hora_inicio TIME,
    hora_final TIME,
    dia DATE,
    id_clase INT,

    CONSTRAINT fk_CLASE FOREIGN KEY (id_clase) REFERENCES clases(id_clase)

);
CREATE TABLE asistencia_clases( /*XXXX*/
    id_clase INT,
    id_atleta INT,
    comentario TEXT,

    PRIMARY KEY (id_clase, id_atleta),
    CONSTRAINT fk_id_clase FOREIGN KEY (id_clase) REFERENCES clases(id_clase),
    CONSTRAINT fk_id_atleta FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta)
);

CREATE TABLE entrenador( /*XXXX*/
    id_entrenador SERIAL PRIMARY KEY,
    salario FLOAT
);
CREATE TABLE atletas_entrenadores(/*XXXX*/
    id_atleta INT,
    id_entrenador INT,
    PRIMARY KEY(id_atleta, id_entrenador),
    CONSTRAINT fk_id_atleta_manyToMany FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT fk_id_entrenador_manyToMany FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador)
);
CREATE TABLE entrenador_clases(/*XXXX*/
    id_entrenador INT,
    id_clase INT,
    PRIMARY KEY(id_entrenador, id_clase),
    CONSTRAINT fk_id_entrenador_clase_manyToMany FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador),
    CONSTRAINT fk_id_clase_clase_manyToMany FOREIGN KEY (id_clase) REFERENCES clases(id_clase)
);

CREATE TABLE especialidad_atletas( /*XXXX*/
    id_atleta INT,
    id_especialidad INT,
    pr FLOAT,
    progreso FLOAT,
    clase_logro INT,
    fecha_logro DATE,

    PRIMARY KEY (id_atleta, id_especialidad),
    CONSTRAINT fk_id_atleta_especialidad FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT fk_id_especialidad_especialidad FOREIGN KEY  (id_especialidad) REFERENCES  especialidad(id_especialidad),
    CONSTRAINT fk_id_claseLogro_idclase FOREIGN KEY (CLASE_LOGRO) REFERENCES CLASES(ID_CLASE)
);

CREATE TABLE leaderboard( /*XXXX*/
    id_leaderboard SERIAL PRIMARY KEY,
    id_especialidad INT,
    id_wod INT,

        CONSTRAINT fk_id_especialidad_leaderboard FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
        CONSTRAINT fk_id_wod_leaderboard FOREIGN KEY (id_wod) REFERENCES wod(id_wod)
);

CREATE TYPE meses AS ENUM ('ENERO', 'FEBRERO' ,'MARZO', 'ABRIL', 'MAYO', 'JUNIO', 'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE');

CREATE TABLE detalles_Top_Hombres( /*XXXX*/
    id_registro_hombres SERIAL PRIMARY KEY,
    id_leaderboard INT,
    id_atleta INT,
    dia INT, /*AGREGAR CONSTRAINT*/
    mes MESES, /*CONSTRAINT*/
    puesto_top INT,

    CONSTRAINT  fk_id_leader_detalles_hombres FOREIGN KEY (id_leaderboard) REFERENCES leaderboard(ID_LEADERBOARD),
    CONSTRAINT fk_id_atleta_detalles_hombres FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT check_dia CHECK (dia >= 1 AND dia <= 31)
);
CREATE TABLE detalles_Top_Mujeres( /*XXXX*/
    id_registro_hombres SERIAL PRIMARY KEY,
    id_leaderboard INT,
    id_atleta INT,
    dia INT, /*AGREGAR CONSTRAINT*/
    mes MESES, /*CONSTRAINT*/
    puesto_top INT,

    CONSTRAINT  fk_id_leader_detalles_mujeres FOREIGN KEY (id_leaderboard) REFERENCES leaderboard(ID_LEADERBOARD),
    CONSTRAINT fk_id_atleta_detalles_mujeres FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT check_dia_mujeres CHECK (dia >= 1 AND dia <= 31)
);

/*THE GIRLS LEADERBOARD*/

CREATE TABLE the_girls( /*XXXX*/
    id_girl SERIAL PRIMARY KEY,
    nombre VARCHAR(25),
    descripcion TEXT
);
CREATE TABLE girls_hombres( /*XXXX*/
    id_leaderboard_girls_hombres SERIAL PRIMARY KEY,
    id_girl INT,
    id_atleta INT,
    dia INT, /*AGREGAR CONSTRAINT*/
    mes MESES, /*CONSTRAINT*/
    puesto_top INT,

    CONSTRAINT  fk_id_girl_hombre FOREIGN KEY (id_girl) REFERENCES the_girls(id_girl),
    CONSTRAINT fk_id_atleta_girl_hombre FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT check_dia_hombres_girls CHECK (dia >= 1 AND dia <= 31)
);
CREATE TABLE girls_mujeres(/*XXXX*/
    id_leaderboard_girls_mujeres SERIAL PRIMARY KEY,
    id_girl INT,
    id_atleta INT,
    dia INT, /*AGREGAR CONSTRAINT*/
    mes MESES, /*CONSTRAINT*/
    puesto_top INT,

    CONSTRAINT  fk_id_girl_mujer FOREIGN KEY (id_girl) REFERENCES the_girls(id_girl),
    CONSTRAINT fk_id_atleta_girl_mujer FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT check_dia_mujer_girls CHECK (dia >= 1 AND dia <= 31)
);

--vista 5
SELECT ATLETAS.ID_ATLETA, nombres, apellidos, ID_CLASE, COMENTARIO, PR, PROGRESO FROM ATLETAS INNER JOIN ASISTENCIA_CLASES AC ON ATLETAS.ID_ATLETA = AC.ID_ATLETA INNER JOIN ESPECIALIDAD_ATLETAS EA ON AC.ID_ATLETA = EA.ID_ATLETA;

--pruebas vistas
SELECT ID_ATLETA FROM ESPECIALIDAD_ATLETAS GROUP BY ID_ATLETA, CLASE_LOGRO;

SELECT ID_ESPECIALIDAD, CLASE_LOGRO FROM ESPECIALIDAD_ATLETAS GROUP BY (CLASE_LOGRO,ID_ESPECIALIDAD);

