void main() {
  List array = ['nihal', 'vishnu', 'yazim', 'akshay'];
//  bubble(array);
 // insertion(array);
 selection(array);
}

bubble(List array) {
  for (int i = 0; i < array.length; i++) {
    for (int j = 0; j < array.length - i - 1; j++) {
      if (array[j].compareTo(array[j + 1]) > 0) {
        var temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
  print(array);
}

insertion(List array) {
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

selection(List array) {
  for (int i = 0; i < array.length; i++) {
    int main = i;
    for (int j = i + 1; j < array.length; j++) {
      if (array[j].compareTo(array[main]) < 0) {
        main = j;
      }
    }
    String temp=array[i];
    array[i]=array[main];
    array[main]=temp;
  }
  print(array);
}
