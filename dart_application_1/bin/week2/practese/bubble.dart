void main() {
  List array = [7, 8, 4, 54, 3, 0, 9, 1];
  mergesort(array);
  //qucks2(array, 0, array.length - 1);
  // List sarr = ['fevib', 'helo', 'nihal'];
  print(array);

  // print('mult : ${multiple(array, 0)}');

// i=0
// min=1
// j=2
  // insertion(sarr);
  //selection(array);
}

selection(List array) {
  for (int i = 0; i < array.length; i++) {
    var min = i;
    for (int j = i + 1; j < array.length; j++) {
      if (array[j] < array[min]) {
        min = j;
      }
    }
    var temp = array[i];
    array[i] = array[min];
    array[min] = temp;
  }
  print(array);
}

void insertion(List array) {
  for (int i = 1; i < array.length; i++) {
    String key = array[i];
    int j = i - 1;
    while (j >= 0 && array[j].compareTo(key) > 0) {
      array[j + 1] = array[j];
      j--;
    }
    array[j + 1] = key;
  }
  print(array);
}

// bubble(List array){
//   for(int i=0;i<array.length;i++){
//     for(int j=0;j<array.length-i-1;j++){
//       if (array[j]>array[j+1]) {
//         int temp =array[j];
//         array[j]=array[j+1];
//         array[j+1]=temp;
//       }
//     }
//   }
//   print(array);
// }

qucks2(List array, int low, int high) {
  if (low < high) {
    int partisionindex = partision(array, low, high);
    qucks2(array, low, partisionindex - 1);
    qucks2(array, partisionindex + 1, high);
  }
}

// multiple(List array, int index) {
//   if (index >= array.length) {
//     return 1;
//   }

//   return array[index] * multiple(array, index + 1);
// }

partision(List array, int low, int high) {
  int pevoit = array[low];
  int left = low + 1;
  int right = high;

  while (left <= right) {
    while (left <= right && array[left] <= pevoit) {
      left++;
    }
    while (left <= right && array[right] > pevoit) {
      right--;
    }
    if (left < right) {
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
  mergeandsoert(array, left, right);
}

mergeandsoert(List array, List left, List right) {
  int i = 0, j = 0, k = 0;

  while (left.length > i && right.length > j) {
    if (left[i] < right[j]) {
      array[k] = left[i];
      k++;
      i++;
    } else {
      array[k] = right[j];
      j++;
      k++;
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
