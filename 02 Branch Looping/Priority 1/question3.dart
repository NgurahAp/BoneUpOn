void main() {
  List<String> fruits = [
    'Apple',
    'Banana',
    'Avocado',
    'Cherry',
    'Mango',
    'Apricot',
    'Bluberry',
    'Acerola',
  ];

  for (String fruit in fruits) {
    if (fruit.startsWith('A')) {
      print(fruit);
    }
  }
}
