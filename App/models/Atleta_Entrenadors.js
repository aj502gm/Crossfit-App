import Sequelize from 'sequelize';
import db from '../config/db.js';


const Atleta_Entrenador = db.define('atletas_entrenadores', {
    id_atleta: {type: Sequelize.NUMBER, primaryKey: true},
    id_entrenador: {type: Sequelize.NUMBER}
});

export default Atleta_Entrenador;