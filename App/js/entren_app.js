const tabla_entrenadores =  document.getElementById('tabla-entrenadores');

const mock_data = [
    {
        'id': 1,
        'nombre': 'Andres',
        'apellido': 'Gonzalez'
    },
    {
        'id': 2,
        'nombre': 'Andres',
        'apellido': 'Gonzalez'
    },
    {
        'id': 3,
        'nombre': 'Andres',
        'apellido': 'Gonzalez'
    },
    {
        'id': 4,
        'nombre': 'Andres',
        'apellido': 'Gonzalez'
    },
    {
        'id': 5,
        'nombre': 'Andres',
        'apellido': 'Gonzalez'
    },
    {
        'id': 6,
        'nombre': 'Andres',
        'apellido': 'Gonzalez'
    },
];

mock_data.forEach((value, index) => {
    let row = tabla_entrenadores.insertRow(1);
    row.insertCell(0).innerHTML = index+1;
    row.insertCell(1).innerHTML = value.id;
    row.insertCell(2).innerHTML = value.nombre;
    row.insertCell(3).innerHTML = value.apellido;
    row.insertCell(4).innerHTML = `
        <input type = "button" class = "btn btn-danger" value = "Eliminar" id = "${value.id}"></input>
       
    `;
})