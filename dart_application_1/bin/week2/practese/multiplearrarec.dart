void main() {
  List<int> arr = [2, 3, 4, 5];
  print(multiple(arr, 0));
}

multiple(List array, int index) {
  if (index >= array.length) {
    return 1;
  }

  return array[index] * multiple(array, index + 1);
}
