void main() {
  Hashtable h = Hashtable(5);
  h.isertioin(1, 20);
  h.isertioin(1, 10);
  h.isertioin(4, 40);
  h.isertioin(2, 30);
  h.isertioin(1, 60);
  h.delete(2);
  print(h.bucket);

  print(h.search(4));
}

class Hashtable {
  late List<List<dynamic>?> bucket;
  int size = 0;

  Hashtable(size) {
    bucket = List<List<dynamic>?>.filled(size, null);
    this.size = size;
  }

  hash(key) {
    return key.hashCode % size;
  }

  isertioin(key, value) {
    int index = hash(key);
    if (bucket[index] == null) {
      bucket[index] = [];
    }
    bucket[index]!.add([key, value]);
  }

  delete(key) {
    int index = hash(key);
    if (bucket[index] != null) {
      bucket[index]!.removeWhere((element) => element[0] == key);
    }
  }

  search(key) {
    int index = hash(key);
    if (bucket[index] != null) {
      for (var element in bucket[index]!) {
        if (element[0] == key) {
          return element[1];
        }
      }
    }
    return null;
  }
}
