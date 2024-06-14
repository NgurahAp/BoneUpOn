Future<List<int>> hitung(int pengali, List<int> number) async {
  return await Future.wait(number.map((n) async {
    return n * pengali;
  }));
}

void main() async {
  List<int> bilangan = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  List<int> hasil = await hitung(10, bilangan);
  print(hasil);
}
