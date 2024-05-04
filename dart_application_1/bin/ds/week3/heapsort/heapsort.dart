void main() {
  List<int> arr = [6, 7, 5, 4, 9, 2, 3, 1, 56];
  heapSort(arr);
  print(arr);
}

void heapSort(List<int> arr) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapfy(arr, n, i);
  }

  for (int i = n - 1; i >= 0; i--) {
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;
    heapfy(arr, i, 0);
  }
}

void heapfy(List<int> arr, int n, int i) {
  int largest = i;
  int left = (2 * i) + 1;
  int right = (2 * i) + 2;

  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  if (i != largest) {
    int temp = arr[i];
    arr[i] = arr[largest];
    arr[largest] = temp;

    heapfy(arr, n, largest);
  }
}
