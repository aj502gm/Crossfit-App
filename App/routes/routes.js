import express from "express";
import {mainMenu, entrenadoresMenu, horarioMenu, girlsMenu, leaderboardHombres, leaderboardMujeres} from "../controllers/viewsControllers.js";
//objeto ruteador.
const router = express.Router();

//Ruta para pagina index (default)
router.get('/', mainMenu);

//Ruta para pagina de entrenadores.
router.get('/entrenadoresMenu', entrenadoresMenu);

// //Ruta para horarios
router.get('/horarioMenu', horarioMenu);

// //ruta para the girls.
router.get('/girlsMenu', girlsMenu);

//Leaderboard Hombres
router.get('/leaderboardHombres', leaderboardHombres);
//Leaderboard mujeres
router.get('/leaderboardMujeres', leaderboardMujeres);



export default router;