void main() {
  List array = [4, 5, 3, 2, 7, 8, 9, 11, 2, 1];
  print('orginal array : $array');
//  insertion1(array);
//bubb1(array);
//selection1(array);
  mergesort1(array);
//quickSort(array, 0, array.length-1);
  print('sorted array :$array');
}

bubb1(List array) {
  for (int i = 0; i < array.length; i++) {
    for (int j = 1; j < array.length - i; j++) {
      if (array[j] < array[j - 1]) {
        int temp = array[j];
        array[j] = array[j - 1];
        array[j - 1] = temp;
      }
    }
  }
}

insertion1(List array) {
  for (int i = 0; i < array.length; i++) {
    int key = array[i];
    int j = i - 1;
    while (j >= 0 && array[j] > key) {
      array[j + 1] = array[j];
      j--;
    }
    array[j + 1] = key;
  }
}

selection1(array) {
  for (int i = 0; i < array.length; i++) {
    int min = i;
    for (int j = i + 1; j < array.length; j++) {
      if (array[j] < array[min]) {
        min = j;
      }
    }
    int temp = array[i];
    array[i] = array[min];
    array[min] = temp;
  }
}

void quickSort(List array, int low, int high) {
  if (low < high) {
    int partitionIndex = partition(array, low, high);
    quickSort(array, low, partitionIndex - 1);
    quickSort(array, partitionIndex + 1, high);
  }
}

int partition(List array, int low, int high) {
  int pivot = array[low];
  int left = low + 1;
  int right = high;

  while (left <= right) {
    while (left <= right && array[left] <= pivot) {
      left++;
    }
    while (left <= right && array[right] > pivot) {
      right--;
    }
    if (left < right) {
      swap(array, left, right);
    }
  }
  swap(array, low, right);
  return right;
}

void swap(List array, int i, int j) {
  var temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}

mergesort1(List array) {
  if (array.length <= 1) {
    return;
  }

  int mid = array.length ~/ 2;
  List left = array.sublist(0, mid);
  List right = array.sublist(mid);
  mergesort1(left);
  mergesort1(right);
  merge(array, left, right);
}

merge(List array, List left, List right) {
  int i = 0, j = 0, k = 0;

  while (left.length > i && right.length > j) {
    if (left[i] < right[j]) {
      array[k] = left[i];
      i++;
      k++;
    } else {
      array[k] = right[j];
      j++;
      k++;
    }
  }

  while (left.length > i) {
    array[k] = left[i];
    k++;
    i++;
  }

  while (right.length > j) {
    array[k] = right[j];
    j++;
    k++;
  }
}
