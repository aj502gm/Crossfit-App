import Sequelize from 'sequelize';
import db from '../config/db.js';


const Leader_Mujer = db.define('detalles_Top_Mujeres', {
    id_registro_mujeres: {type: Sequelize.NUMBER, primaryKey: true},
    id_leaderboard: {type: Sequelize.NUMBER},
    id_atleta: {type: Sequelize.NUMBER},
    dia: {type: Sequelize.NUMBER},
    mes: {type: Sequelize.NUMBER},
    puesto_top: {type: Sequelize.NUMBER},
}); //ATLETA ENTRENADOR POSEE UNA FK

export default Leader_Mujer;