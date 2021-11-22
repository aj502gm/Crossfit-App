const mainMenu = (req, res) => {
    res.render("inicio", {
        pagina: 'Inicio'
    });
}
const entrenadoresMenu = (req, res) => {
    res.render("entrenadores", {
        pagina: 'Entrenadores'
    });
}
const horarioMenu = (req, res) => {
    res.render("horarios", {
        pagina: 'Horarios'
    });
}

export {mainMenu, entrenadoresMenu, horarioMenu}