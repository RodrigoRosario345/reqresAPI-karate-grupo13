function getRandomColorName() {
  var names = ["Red", "Green", "Blue", "Yellow", "Orange", "Purple", "Cyan", "Magenta", "Black", "White"];
  var index = Math.floor(Math.random() * names.length);
  return names[index];
}