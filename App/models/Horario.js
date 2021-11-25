import sequelize from "sequelize";
import db from '../config/db.js';

export const Horario = db.define('horarios_clase',{
    id_horario: {type: sequelize.INTEGER, primaryKey: true},
    hora_inicio: {type: sequelize.TIME},
    hora_final: {type: sequelize.TIME},
    dia: {type: sequelize.DATEONLY},
    id_clase: {type: sequelize.INTEGER},

});
