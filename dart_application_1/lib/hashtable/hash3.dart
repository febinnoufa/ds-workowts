void main() {
  Hashtable h = Hashtable(5);
  h.insert(10, 1);
  h.insert(20, 2);
  h.insert(30, 3);
  h.insert('hel', 5);
  print(h.search(30));
  h.delete(10);

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

  insert(key, value) {
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

  dynamic search(key) {
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
