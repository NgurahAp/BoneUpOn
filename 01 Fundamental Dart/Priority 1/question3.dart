  void main() {
  // Variabel non-nullable harus diinisialisasi saat dideklarasikan
  int notNullSafety = 42;

  // Variabel nullable bisa dideklarasikan tanpa nilai awal
  int? nullSafety;

//   nullSafety = 22;

  // Contoh penggunaan variabel nullable
  if (nullSafety != null) {
    print(nullSafety + 1); // Aman digunakan karena dicek null
  } else {
    print('nullSafety is null');
  }

  // Mengubah nilai variabel nullable
  nullSafety = 100;
  if (nullSafety != null) {
    print(nullSafety + 1); // Sekarang nullSafety tidak null
  }
}
