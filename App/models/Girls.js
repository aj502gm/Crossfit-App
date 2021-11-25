import Sequelize from 'sequelize';
import db from '../config/db.js';

const Girl = db.define('the_girls', {
    id_girl: {type: Sequelize.NUMBER, primaryKey: true},
    nombre: {type: Sequelize.STRING},
    descripcion: {type: Sequelize.STRING},
}); //TABLA DE ATLETAS CON EL ID


export default Girl;