CREATE DATABASE CrossfitApp;

USE CrossfitApp;

CREATE TABLE atletas(
    id_atleta INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(40),
    apellidos VARCHAR(40),
    peso FLOAT,
    categoria VARCHAR(10),
    solvencia BOOLEAN
);
CREATE TABLE especialidad(
    id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    tipo_especialidad ENUM('AMRAP', 'EMOM', 'FOR TIME', 'TABATA', 'FOR MAX WEIGHT')
);
CREATE TABLE clases(
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    id_especialidad INT,
    id_wod INT,

    CONSTRAINT fk_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
    CONSTRAINT fk_wod FOREIGN KEY (id_Wod) REFERENCES wod(id_wod)

);

CREATE TABLE wod(
    id_wod INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_wod VARCHAR(25) NOT NULL,
    descripcion TEXT
);
CREATE TABLE movimientos_wods(
    id_wod INT,
    id_movimiento INT,
    cantidad INT,
    descripcion TEXT,

    PRIMARY KEY (id_wod, id_movimiento),
    CONSTRAINT fk_id_wod FOREIGN KEY (id_wod) REFERENCES wod(id_wod),
    CONSTRAINT fk_id_movimiento FOREIGN KEY (id_movimiento) REFERENCES movimientos(id_movimiento)
);
CREATE TABLE movimientos(
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_ejercicio VARCHAR(25),
    instrucciones TEXT
);

CREATE TABLE horarios_clase(
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    hora_inicio TIME,
    hora_final TIME,
    dia DATE,
    id_clase INT,

    CONSTRAINT fk_CLASE FOREIGN KEY (id_clase) REFERENCES clases(id_clase)

);

CREATE TABLE asistencia_clases(
    id_clase INT,
    id_atleta INT,
    comentario TEXT,

    PRIMARY KEY (id_clase, id_atleta),
    CONSTRAINT fk_id_clase FOREIGN KEY (id_clase) REFERENCES clases(id_clase),
    CONSTRAINT fk_id_atleta FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta)
);

CREATE TABLE entrenador(
    id_entrenador INT PRIMARY KEY AUTO_INCREMENT,
    salario FLOAT
);
CREATE TABLE atletas_entrenadores(
    id_atleta INT,
    id_entrenador INT,
    PRIMARY KEY(id_atleta, id_entrenador),
    CONSTRAINT fk_id_atleta_manyToMany FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT fk_id_entrenador_manyToMany FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador)
);
CREATE TABLE entrenador_clases(
    id_entrenador INT,
    id_clase INT,
    PRIMARY KEY(id_entrenador, id_clase),
    CONSTRAINT fk_id_entrenador_clase_manyToMany FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador),
    CONSTRAINT fk_id_clase_clase_manyToMany FOREIGN KEY (id_clase) REFERENCES clases(id_clase)
);

CREATE TABLE especialidad_atletas(
    id_atleta INT,
    id_especialidad INT,
    pr FLOAT,
    progreso FLOAT,
    clase_logro INT,

    PRIMARY KEY (id_atleta, id_especialidad),
    CONSTRAINT fk_id_atleta_especialidad FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT fk_id_especialidad_especialidad FOREIGN KEY  (id_especialidad) REFERENCES  especialidad(id_especialidad)
);
