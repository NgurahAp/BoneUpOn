void main() {
  // Membuat list dengan elemen berupa list yang terdiri dari 2 sub-elemen
  List<List<dynamic>> dataList = [
    ['Nama', 'John Doe'],
    ['Usia', 30],
    ['Pekerjaan', 'Software Engineer'],
    ['Negara', 'Indonesia']
  ];

  // Membuat map dari list tersebut
  Map<String, dynamic> dataMap = {
    for (var element in dataList) element[0]: element[1]
  };

  // Cetak map untuk memverifikasi hasil
  print(dataMap);
}
