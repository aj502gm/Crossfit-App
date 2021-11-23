import Sequelize from 'sequelize';
import db from '../config/db.js';

const Atleta = db.define('atletas', {
    id_atleta: {type: Sequelize.NUMBER, primaryKey: true},
    nombres: {type: Sequelize.STRING},
    apellidos: {type: Sequelize.STRING},
    peso: {type: Sequelize.FLOAT},
    categoria: {type: Sequelize.STRING},
    solvencia: {type: Sequelize.TINYINT}
});

export default Atleta;