double luasLingkaran(int r) {
  double phi = 3.14;
  double luas = phi * r * r;
  return luas;
}

void main() {
  int r = 10;
  double luas = luasLingkaran(r);
  print(luas);
}