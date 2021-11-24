




import Atleta from "../models/Atleta.js";
import Atleta_Entrenador from "../models/Atleta_Entrenadors.js";

const mainMenu = (req, res) => {
    res.render("inicio", {
        pagina: 'Inicio'
    });
}
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
const horarioMenu = (req, res) => {
    res.render("horarios", {
        pagina: 'Horarios'
    });
}
const girlsMenu = (req, res) => {
    res.render("girls", {
        pagina: "Girls"
    });
}
export {mainMenu, entrenadoresMenu, horarioMenu, girlsMenu}