void main() {
  List arr = [65, 3, 4, 2, 98, 6, 46, 90];
  Heapsort(arr);
  print(arr);
}

Heapsort(List arr) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }

  for (int i = n - 1; i >= 0; i--) {
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;
    heapify(arr, i, 0);
  }
}

heapify(List arr, int n, int index) {
  int left = (index * 2) + 1;
  int right = (index * 2) + 2;
  int large = index;

  if (left < n && arr[left] > arr[large]) {
    large = left;
  }

  if (right < n && arr[right] > arr[large]) {
    large = right;
  }

  if (large != index) {
    int temp = arr[large];
    arr[large] = arr[index];
    arr[index] = temp;

    heapify(arr, n, large);
  }
}
