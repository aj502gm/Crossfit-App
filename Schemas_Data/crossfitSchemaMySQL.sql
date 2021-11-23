CREATE DATABASE CrossfitApp;
DROP DATABASE CrossfitApp;
USE CrossfitApp;

CREATE TABLE atletas( /*XXXXX*/
    id_atleta INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(40),
    apellidos VARCHAR(40),
    peso FLOAT,
    categoria VARCHAR(10),
    solvencia BOOLEAN
);
CREATE TABLE especialidad( /*XXXXX*/
    id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    tipo_especialidad ENUM('AMRAP', 'EMOM', 'FOR TIME', 'TABATA', 'FOR MAX WEIGHT')
);
CREATE TABLE wod( /*XXXXX*/
    id_wod INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_wod VARCHAR(25) NOT NULL,
    descripcion TEXT
);
CREATE TABLE rx(
    id_rx INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rx VARCHAR(10) NOT NULL,
    descripcion TEXT,
    requisitos TEXT
);

CREATE TABLE clases( /*XXXX*/
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    id_especialidad INT,
    id_wod INT,

    CONSTRAINT fk_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
    CONSTRAINT fk_wod FOREIGN KEY (id_Wod) REFERENCES wod(id_wod)

);
CREATE TABLE movimientos( /*XXXX*/
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
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
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    hora_inicio TIME,
    hora_final TIME,
    dia DATE,
    id_clase INT,

    CONSTRAINT fk_CLASE FOREIGN KEY (id_clase) REFERENCES clases(id_clase)

);
CREATE TABLE asistencia_clases( /*XXXXX*/
    id_clase INT,
    id_atleta INT,
    comentario TEXT,

    PRIMARY KEY (id_clase, id_atleta),
    CONSTRAINT fk_id_clase FOREIGN KEY (id_clase) REFERENCES clases(id_clase),
    CONSTRAINT fk_id_atleta FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta)
);

CREATE TABLE entrenador( /*XXXX*/
    id_entrenador INT PRIMARY KEY AUTO_INCREMENT,
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
    CONSTRAINT fk_id_claseLogro_idclase FOREIGN KEY (clase_logro) REFERENCES clases(id_clase)
);

CREATE TABLE leaderboard( /*XXXX*/
    id_leaderboard INT PRIMARY KEY AUTO_INCREMENT,
    id_especialidad INT,
    id_wod INT,
    id_rx INT,
        CONSTRAINT fk_id_especialidad_leaderboard FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
        CONSTRAINT fk_id_wod_leaderboard FOREIGN KEY (id_wod) REFERENCES wod(id_wod),
        CONSTRAINT fk_id_rx_leaderboard FOREIGN KEY (id_rx) REFERENCES  rx(id_rx)

);

CREATE TABLE detalles_Top_Hombres( /*XXXX*/
    id_registro_hombres INT PRIMARY KEY AUTO_INCREMENT,
    id_leaderboard INT,
    id_atleta INT,
    dia INT, /*AGREGAR CONSTRAINT*/
    mes INT, /*CONSTRAINT*/
    puesto_top INT,

    CONSTRAINT  fk_id_leader_detalles_hombres FOREIGN KEY (id_leaderboard) REFERENCES leaderboard(id_leaderboard),
    CONSTRAINT fk_id_atleta_detalles_hombres FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT check_mes CHECK (mes >= 1 AND mes <= 12),
    CONSTRAINT check_dia CHECK (dia >= 1 AND dia <= 31)
);
CREATE TABLE detalles_Top_Mujeres( /*XXXX*/
    id_registro_mujeres INT PRIMARY KEY AUTO_INCREMENT,
    id_leaderboard INT,
    id_atleta INT,
    dia INT, /*AGREGAR CONSTRAINT*/
    mes INT, /*CONSTRAINT*/
    puesto_top INT,

    CONSTRAINT  fk_id_leader_detalles_mujeres FOREIGN KEY (id_leaderboard) REFERENCES leaderboard(id_leaderboard),
    CONSTRAINT fk_id_atleta_detalles_mujeres FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT check_mes CHECK (mes >= 1 AND mes <= 12),
    CONSTRAINT check_dia_mujeres CHECK (dia >= 1 AND dia <= 31)
);

/*THE GIRLS LEADERBOARD*/

CREATE TABLE the_girls( /*XXXX*/
    id_girl INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    descripcion TINYTEXT
);
CREATE TABLE girls_hombres( /*XXXX*/
    id_leaderboard_girls_hombres INT PRIMARY KEY AUTO_INCREMENT,
    id_girl INT,
    id_atleta INT,
    dia INT, /*AGREGAR CONSTRAINT*/
    mes INT, /*CONSTRAINT*/
    puesto_top INT,

    CONSTRAINT  fk_id_girl_hombre FOREIGN KEY (id_girl) REFERENCES the_girls(id_girl),
    CONSTRAINT fk_id_atleta_girl_hombre FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT check_mes CHECK (mes >= 1 AND mes <= 12),
    CONSTRAINT check_dia_hombres_girls CHECK (dia >= 1 AND dia <= 31)
);
CREATE TABLE girls_mujeres(/*XXXX*/
    id_leaderboard_girls_mujeres INT PRIMARY KEY AUTO_INCREMENT,
    id_girl INT,
    id_atleta INT,
    dia INT, /*AGREGAR CONSTRAINT*/
    mes INT, /*CONSTRAINT*/
    puesto_top INT,

    CONSTRAINT  fk_id_girl_mujer FOREIGN KEY (id_girl) REFERENCES the_girls(id_girl),
    CONSTRAINT fk_id_atleta_girl_mujer FOREIGN KEY (id_atleta) REFERENCES atletas(id_atleta),
    CONSTRAINT check_mes CHECK (mes >= 1 AND mes <= 12),
    CONSTRAINT check_dia_mujer_girls CHECK (dia >= 1 AND dia <= 31)
);

##vista 1
##TABLA DE HOMBRES
SELECT * FROM DETALLES_TOP_HOMBRES INNER JOIN LEADERBOARD L ON L.ID_LEADERBOARD = DETALLES_TOP_HOMBRES.ID_LEADERBOARD ORDER BY ID_RX;
##TABLA DE MUJERES
SELECT * FROM DETALLES_TOP_MUJERES INNER JOIN LEADERBOARD L ON L.ID_LEADERBOARD = DETALLES_TOP_MUJERES.ID_LEADERBOARD ORDER BY ID_RX;

#vista 2
CREATE VIEW atletas_solventes AS SELECT * FROM atletas where solvencia = false;

##vista 3
CREATE VIEW PRsAtletas AS SELECT ID_ATLETA, ID_ESPECIALIDAD, PR, FECHA_LOGRO FROM ESPECIALIDAD_ATLETAS ORDER BY ID_ATLETA;

##vista 4
##TABLA DE HOMBRES
CREATE VIEW TopGirsHombres AS SELECT * FROM GIRLS_HOMBRES ORDER BY PUESTO_TOP LIMIT 10;
##TABLA DE MUJERES
CREATE VIEW TopGirsMujeres AS SELECT * FROM GIRLS_MUJERES ORDER BY PUESTO_TOP LIMIT 10;
##VISTA 5
CREATE VIEW InfoAtleta AS SELECT ATLETAS.ID_ATLETA, nombres, apellidos, ID_CLASE, COMENTARIO, PR, PROGRESO FROM ATLETAS INNER JOIN ASISTENCIA_CLASES AC ON ATLETAS.ID_ATLETA = AC.ID_ATLETA INNER JOIN ESPECIALIDAD_ATLETAS EA ON AC.ID_ATLETA = EA.ID_ATLETA;


SELECT * FROM DETALLES_TOP_HOMBRES INNER JOIN LEADERBOARD L ON L.ID_LEADERBOARD = DETALLES_TOP_HOMBRES.ID_LEADERBOARD ORDER BY ID_RX;
SELECT * FROM DETALLES_TOP_MUJERES INNER JOIN LEADERBOARD L ON L.ID_LEADERBOARD = DETALLES_TOP_MUJERES.ID_LEADERBOARD ORDER BY ID_RX;
SELECT * FROM ATLETAS_SOLVENTES;
SELECT * FROM PRSATLETAS;
SELECT * FROM TOPGIRSHOMBRES;
SELECT * FROM TOPGIRSMUJERES;
SELECT * FROM INFOATLETA;