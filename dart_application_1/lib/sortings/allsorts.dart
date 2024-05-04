void main() {
  List array = [5, 6, 4, 3, 7, 8, 9, 2, 1, 20, 3];
  mergesort(array);
  print('qiuck sort :$array');
  //qiucksort(array, 0, array.length - 1);
  // selection(array);
  // insertion(array);
  // bubblesort(array);
}

bubblesort(List array) {
  for (int i = 0; i < array.length; i++) {
    for (int j = 1; j < array.length - i; j++) {
      if (array[j] < array[j - 1]) {
        int temp = array[j];
        array[j] = array[j - 1];
        array[j - 1] = temp;
      }
    }
  }
  print("bubblesort : ${array}");
}

insertion(List array) {
  for (int i = 1; i < array.length; i++) {
    int key = array[i];
    int j = i - 1;

    while (j >= 0 && array[j] > key) {
      array[j + 1] = array[j];
      j--;
    }
    array[j + 1] = key;
  }
  print('insertion :${array}');
}

selection(List array) {
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
  print('selection sort :${array}');
}

qiucksort(List array, int low, int high) {
  if (low < high) {
    int partisionindex = partision(array, low, high);
    qiucksort(array, low, partisionindex - 1);
    qiucksort(array, partisionindex + 1, high);
  }
}

partision(List array, int low, int high) {
  int pevoit = array[low];
  int left = low + 1;
  int right = high;

  while (left < right) {
    while (left <= right && array[left] <= pevoit) {
      left++;
    }
    while (left <= right && array[right] > pevoit) {
      right--;
    }
    if (left <= right) {
      swap(array, left, right);
    }
  }
  swap(array, low, right);
  return right;
}

swap(List array, int i, j) {
  int temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}

mergesort(List array) {
  if (array.length <= 1) {
    return;
  }
  int mid = array.length ~/ 2;
  List left = array.sublist(0, mid);
  List right = array.sublist(mid);

  mergesort(left);
  mergesort(right);
  sortandmerge(array, left, right);
}

sortandmerge(List array, left, right) {
  int i = 0, j = 0, k = 0;

  while (left.length > i && right.length > j) {
    if (left[i] < right[j]) {
      array[k] = left[i];
      k++;
      i++;
    } else {
      array[k] = right[j];
      k++;
      j++;
    }
  }
  while (left.length > i) {
    array[k] = left[i];
    k++;
    i++;
  }
  while (right.length > j) {
    array[k] = right[j];
    k++;
    j++;
  }
}
