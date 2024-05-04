void main() {
  List arr=[3,5,4,2,1,6,7,8,9];
  heapsort(arr);
  print(arr);
}

heapsort(List arr) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapfy(arr, n, i);
  }

  for (int i = n - 1; i >= 0; i--) {
    int temp = arr[i];
    arr[i] = arr[0];
    arr[0] = temp;
    heapfy(arr, i, 0);
  }
}

heapfy(List arr, int n, int index) {
  int leftchild = (index * 2) + 1;
  int rightchild = (index * 2) + 2;
  int large = index;

  if (leftchild < n && arr[leftchild] > arr[large]) {
    large = leftchild;
  }

  if (rightchild < n && arr[rightchild] > arr[large]) {
    large = rightchild;
  }

  if (index != large) {
    int temp = arr[large];
    arr[large] = arr[index];
    arr[index] = temp;

    heapfy(arr, n, large);
  }
}
