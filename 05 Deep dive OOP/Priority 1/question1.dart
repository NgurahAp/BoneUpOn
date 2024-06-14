class BangunRuang {
  int panjang;
  int lebar;
  int tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  int hitungVolume() {
    return panjang * lebar * tinggi;
  }
}

class Balok extends BangunRuang {
  Balok(
    int panjang,
    int lebar,
    int tinggi,
  ) : super(
          panjang,
          lebar,
          tinggi,
        ); // Super berguna untuk mengakses property induk (super class)

  @override
  int hitungVolume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  Kubus(int sisi) : super(sisi, sisi, sisi);

  @override
  int hitungVolume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  Balok balok = Balok(4, 6, 8);
  Kubus kubus = Kubus(5);

  print(balok.hitungVolume());
  print(kubus.hitungVolume());
}
