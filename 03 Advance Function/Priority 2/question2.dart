void average(List<int> numbers) {
  var total = 0;

  for (var number in numbers) {
    total += number;
  }

  var average = total / numbers.length;
  var roundedAverage = average.ceil();

  print(roundedAverage);
}

void main() {
  List<int> values = [7, 5, 3, 5, 2, 1];
  average(values);
}
