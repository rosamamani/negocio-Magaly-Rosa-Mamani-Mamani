const inputPokemon = document.getElementById('pokemonInput');
const btnBuscar = document.getElementById('btnBuscar');
const estadoMensaje = document.getElementById('estadoMensaje');
const resultadoPokemon = document.getElementById('resultadoPokemon');

async function buscarPokemon() {
  const nombre = inputPokemon.value.trim().toLowerCase();


  resultadoPokemon.classList.add('hidden');
  resultadoPokemon.innerHTML = '';

  if (!nombre) {
    estadoMensaje.innerHTML = '<div class="error">Por favor, escribe el nombre de un Pokémon.</div>';
    return;
  }

   
  estadoMensaje.innerHTML = '<div class="loading">Cargando...</div>';

  try {
    const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${encodeURIComponent(nombre)}`);

    // Validar response.ok
    if (!response.ok) {
      if (response.status === 404) {
        throw new Error(`El Pokémon "${nombre}" no existe. Verifica que esté bien escrito.`);
      }
      throw new Error(`Error en el servidor (Código: ${response.status}).`);
    }

    const data = await response.json();

    const pesoKg = (data.weight / 10).toFixed(1);
    const alturaMetros = (data.height / 10).toFixed(2);

    // Extraer tipos
    const tiposHTML = data.types
      .map(t => `<span class="badge">${t.type.name}</span>`)
      .join('');

    // Imagen oficial o sprite frontal
    const imagenUrl =
      data.sprites?.other?.['official-artwork']?.front_default ||
      data.sprites?.front_default;

    // Limpiar mensaje de "Cargando..." y mostrar tarjeta
    estadoMensaje.innerHTML = '';
    resultadoPokemon.innerHTML = `
      <img src="${imagenUrl}" alt="${data.name}">
      <h2 class="pokemon-name">${data.name}</h2>
      <p class="info-item"><strong>Tipos:</strong> ${tiposHTML}</p>
      <p class="info-item"><strong>Peso:</strong> ${pesoKg} kg</p>
      <p class="info-item"><strong>Altura:</strong> ${alturaMetros} m</p>
    `;
    resultadoPokemon.classList.remove('hidden');

  } catch (error) {

    estadoMensaje.innerHTML = `<div class="error">${error.message || 'Error de conexión al consultar la API.'}</div>`;
  }
}


btnBuscar.addEventListener('click', buscarPokemon);
inputPokemon.addEventListener('keydown', (event) => {
  if (event.key === 'Enter') {
    buscarPokemon();
  }
});