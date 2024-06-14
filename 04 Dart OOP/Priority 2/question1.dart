class Calculator {
  int penjumlahan(int a, int b) {
    return a + b;
  }

  int pengurangan(int a, int b) {
    return a - b;
  }

  int perkalian(int a, int b) {
    return a * b;
  }

  double pembagian(int a, int b) {
    return a / b;
  }
}

void main() {
  var calculator = Calculator();

  var tambah = calculator.penjumlahan(2, 4);
  print(tambah);

  var kurang = calculator.pengurangan(4, 2);
  print(kurang);

  var kali = calculator.perkalian(4, 2);
  print(kali);

  var bagi = calculator.pembagian(4, 2);
  print(bagi);
}
