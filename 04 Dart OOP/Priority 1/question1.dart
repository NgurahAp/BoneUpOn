// Class Hewan
class Hewan {
  // Property berat untuk menyimpan data berat badan hewan
  double berat;
  // Constructor untuk inisialisasi berat badan hewan
  Hewan(this.berat);
}

// Class Mobil
class Mobil {
  // Property kapasitas untuk menyimpan total berat maksimum muatan
  double kapasitas;
  // Property muatan untuk menyimpan list data hewan yang menjadi muatan
  List<Hewan> muatan;

  // Constructor untuk inisialisasi kapasitas dan membuat list muatan kosong
  Mobil(this.kapasitas) : muatan = [];

  // Method tambahMuatan untuk menambah data hewan pada list muatan jika kapasitas mencukupi
  void tambahMuatan(Hewan hewan) {
    // Hitung total berat saat ini
    double totalBeratSaatIni = muatan.fold(0, (sum, item) => sum + item.berat);

    // Periksa apakah muatan baru bisa ditambahkan
    if (totalBeratSaatIni + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print("Hewan dengan berat ${hewan.berat} kg berhasil ditambahkan.");
    } else {
      print(
          "Kapasitas tidak mencukupi untuk menambah hewan dengan berat ${hewan.berat} kg.");
    }
  }
}

void main() {
  // Membuat objek Hewan
  Hewan hewan1 = Hewan(50.0);
  Hewan hewan2 = Hewan(75.0);
  Hewan hewan3 = Hewan(30.0);

  // Membuat objek Mobil dengan kapasitas 120 kg
  Mobil mobil = Mobil(120.0);

  // Menambah hewan ke dalam muatan mobil
  mobil.tambahMuatan(hewan1);
  mobil.tambahMuatan(hewan2);
  mobil.tambahMuatan(hewan3);
}
