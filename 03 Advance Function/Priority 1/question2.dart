void countDataTypes(List<dynamic> data) {
  // Inisialisasi variabel untuk menghitung jumlah kemunculan masing-masing tipe data
  int stringCount = 0;
  int intCount = 0;
  int doubleCount = 0;
  int boolCount = 0;

  // Iterasi setiap elemen dalam list data
  for (var element in data) {
    // Periksa tipe data dari elemen dan increment counter yang sesuai
    if (element is String) {
      stringCount++;
    } else if (element is int) {
      intCount++;
    } else if (element is double) {
      doubleCount++;
    } else if (element is bool) {
      boolCount++;
    }
  }

  // Cetak jumlah kemunculan untuk setiap tipe data
  print(
      'String: $stringCount, Int: $intCount, Double: $doubleCount, Boolean: $boolCount');
}

void main() {
  // Contoh list data dengan tipe data dinamis
  List<dynamic> data = ['Aku', 'sayang', 1, 2.0, true, false, 'kamu', 3, 4.5, false];

  // Panggil fungsi countDataTypes dengan list data
  countDataTypes(data);
}
