function getRandomResourceId(resources) {
  if (!resources || resources.length === 0) {
    karate.log(' No hay recursos disponibles');
    return null;
  }

  var randomIndex = Math.floor(Math.random() * resources.length);
  var selected = resources[randomIndex];

  karate.log(' ID aleatorio seleccionado:', selected.id);
  return { id: selected.id, data: selected };
}