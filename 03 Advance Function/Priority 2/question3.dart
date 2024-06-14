Future<int> faktorial(int a) {
  return Future.delayed(Duration(seconds: 1), () {
    List<int> number = [];
    for (int i = a; i >= 1; i--) {
      number.add(i);
    }
    int result = number.reduce((value, element) => value * element);
    return result;
  });
}

void main() async {
  int bilangan = 5;
  var hasil = await faktorial(bilangan);
  print(hasil);
}
