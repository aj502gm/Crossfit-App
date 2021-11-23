




import Atleta from "../models/Atleta.js";

const mainMenu = (req, res) => {
    res.render("inicio", {
        pagina: 'Inicio'
    });
}
const entrenadoresMenu =  async (req, res) => {
    const entrenadores =  await Atleta.findAll().catch((err) => console.log(err));
    console.log(entrenadores);
    res.render("entrenadores", {
        pagina: 'Entrenadores',
        entrenadores: entrenadores
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