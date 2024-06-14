int faktorial(int a) {
  List<int> number = [];
  for (int i = a; i >= 1; i--) {
    number.add(i);
  }
  int result = number.reduce((value, element) => value * element);
  return result;
}

void main() {
  print(faktorial(5));
}
