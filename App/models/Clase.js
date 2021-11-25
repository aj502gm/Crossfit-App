import sequelize from "sequelize";
import db from '../config/db.js';

export const Clase = db.define('clases',{
    id_clase: {type: sequelize.INTEGER, primaryKey: true},
    id_especialidad: {type: sequelize.INTEGER},
    id_wod: {type: sequelize.INTEGER}
});