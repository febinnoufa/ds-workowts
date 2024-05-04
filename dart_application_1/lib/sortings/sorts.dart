void main() {
  List array = [5, 6, 3, 2, 4, 8, 9, 1, 2, 9];
  print('orginalarray :${array}');
  //bubblesortf(array);
  //insertion(array);
  // selectionsf(array);
 // quicksort(array, 0, array.length - 1);
 mergesortsf(array);
  print(array);
}

bubblesortf(List array) {
  for (int i = 0; i < array.length; i++) {
    for (int j = 1; j < array.length - i; j++) {
      if (array[j] < array[j - 1]) {
        int temp = array[j];
        array[j] = array[j - 1];
        array[j - 1] = temp;
      }
    }
  }

  print('Bubble :${array}');
}

insertion(List array) {
  for (int i = 0; i < array.length; i++) {
    int key = array[i];
    int j = i - 1;
    while (j >= 0 && array[j] > key) {
      array[j + 1] = array[j];
      j--;
    }
    array[j + 1] = key;
  }
  print('inserton$array');
}

selectionsf(List array) {
  for (int i = 0; i < array.length; i++) {
    int min = i;
    for (int j = i; j < array.length; j++) {
      if (array[j] < array[min]) {
        min = j;
      }
    }

    int temp = array[i];
    array[i] = array[min];
    array[min] = temp;
  }

  print('selection :$array');
}

void quicksort(List array, int low, int high) {
  if (low < high) {
    int partitionIndex = partition(array, low, high);
    quicksort(array, low, partitionIndex - 1);
    quicksort(array, partitionIndex + 1, high);
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
      swaps(array, left, right);
    }
  }

  swaps(array, low, right);
  return right;
}

void swaps(List array, int i, int j) {
  var temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}

mergesortsf(List array) {
  if (array.length <= 1) {
    return;
  }
  int mid = array.length ~/ 2;
  List left = array.sublist(0, mid);
  List right = array.sublist(mid);

  mergesortsf(left);
  mergesortsf(right);
  mergef(array, left, right);
}

mergef(List array, List left, List right) {
  int i = 0, j = 0, k = 0;
  while (left.length > i && right.length > j) {
    if (left[i] < right[j]) {
      array[k] = left[i];
      i++;
      k++;
    } else {
      array[k] = right[j];
      k++;
      j++;
    }
  }
  while (left.length > i) {
    array[k] = left[i];
    i++;
    k++;
  }

  while (right.length > j) {
    array[k] = right[j];
    j++;
    k++;
  }
}
