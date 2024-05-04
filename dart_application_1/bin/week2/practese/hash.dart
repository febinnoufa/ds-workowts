void main() {
  Hashtable h = Hashtable(5);
  
  // print(h.bucket);
  // print('after');
  // h.delete(3);

  // print('search : ${h.search(30)}');
  // // print('search : ${h.search(30)}');
  h.insert(10, 1000);
  h.insert(21, 2000);
  h.insert(30, 3000);

  print(h.bucket);
}

class Hashtable {
  late List<List<dynamic>?> bucket;
  late int size;

  Hashtable(size) {
    bucket = List<List<dynamic>?>.filled(size, null);
    this.size = size;
  }

  hash(key) {
    return key.hashCode % size;
  }

  delete(key) {
    int index = hash(key);
    if (bucket[index] != null) {
      bucket[index]!.removeWhere((element) => element[0] == key);
    }
  }

  search(key) {
    int index = hash(key);
    if (bucket[index] != null)
      for (var element in bucket[index]!) {
        if (element[0] == key) {
          return element[1];
        }
      }
    return null;
  }

  insert(key, value) {
    int index = hash(key);
    if (bucket[index] == null) {
      bucket[index] = [];
    }
    bucket[index]!.add([key, value]);
  }
}
