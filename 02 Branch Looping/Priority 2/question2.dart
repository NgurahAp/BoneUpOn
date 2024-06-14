void main() {
  var bintang = '*';
  var spasi = ' ';

  for (int i = 4; i > 1; i--) {
    print(spasi * (4 - i) + bintang * (i + i - 1));
  }

  for (int i = 1; i < 5; i++) {
    print(spasi * (4 - i) + bintang * (i + i - 1));
  }
}
