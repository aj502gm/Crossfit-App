const espacioTabla = document.querySelector("#displayTabla");

function buton_Index(){
    window.location.href = "../views/Index.html"
}

function buton(){
    window.location.href = "../views/registro.html"
}

function buton1(){
    window.location.href = "../views/registro.html"
}

function buton_leader(){
    window.location.href = "../views/leaderborad.html"
}


function buton_entren(){
    window.location.href = "../views/entrenadores.html"
}


window.addEventListener("load", function(){
    let tabla = `<table class="table table-striped table-hover">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Día</th>
            <th scope="col">Hora</th>
            <th scope="col">Clase</th>
            <th scope="col">Entrenador</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <th scope="row">1</th>
            <td>Lunes</td>
            <td>9:00 am</td>
            <td>4</td>
            <td>Romeo</td>
            </tr>
            <tr>
            <th scope="row">2</th>
            <td>Martes</td>
            <td>7:00 pm</td>
            <td>6</td>
            <td>Vicente</td>
            </tr>
            <tr>
            <th scope="row">3</th>
            <td>Jueves</td>
            <td>4:00 pm</td>
            <td>3</td>
            <td>Larry</td>
            </tr>
        </tbody>
    </table>`;
    espacioTabla.innerHTML = tabla;
});