
import { Horario } from '../models/Horario.js';
import { Clase } from '../models/Clase.js';


import Atleta from "../models/Atleta.js";
import Atleta_Entrenador from "../models/Atleta_Entrenadors.js";


const mainMenu = (req, res) => {
    res.render("inicio", {
        pagina: 'Inicio'
    });
}

const entrenadoresMenu = (req, res) => {

const entrenadoresMenu =  async (req, res) => {
    const entrenadores =  await Atleta.findAll().catch((err) => console.log(err));
    const atleta_entrenador = await Atleta_Entrenador.findAll().catch((err) => console.log(err));
    console.log(atleta_entrenador);
    res.render("entrenadores", {
        pagina: 'Entrenadores',
        entrenadores: entrenadores,
        atleta_entrenador: atleta_entrenador
    });
}

const horarioMenu = async (req, res) => {
    const horarios = await Horario.findAll()
        .catch((error) => console.log(error));
    console.log(horarios);

    const clases = await Clase.findAll()
        .catch((error) => console.log(error));
    console.log(clases);

    res.render("horarios", {
        pagina: "Horarios",
        horarios: horarios,
        clases: clases
    });
}

const girlsMenu = (req, res) => {
    res.render("girls", {
        pagina: "Girls"
    });
}
export {mainMenu, entrenadoresMenu, horarioMenu, girlsMenu}