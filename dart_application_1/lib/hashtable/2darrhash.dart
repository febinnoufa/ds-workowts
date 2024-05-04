void main() {
  Hashtable h = Hashtable(10);
  h.insert('savan', 14);
  h.insert('vashnu', 23);
  h.insert('febin', 14);
  h.insert('akshay', 17);

  print(h.bucket);
}

class Hashtable {
  late List<List<dynamic>?> bucket;
  late int size;

  Hashtable(int size) {
    bucket = List<List<dynamic>?>.filled(size, null);
    this.size = size;
  }

  int calculateHash(key) {
    return key.hashCode % size;
  }

  void insert(dynamic key, dynamic value) {
    int index = calculateHash(key);
    if (bucket[index] == null) {
      bucket[index] = [];
    }
    bucket[index]!.add([key, value]);
  }

  void delete(dynamic key) {
    int index = calculateHash(key);
    if (bucket[index] != null) {
      bucket[index]!.removeWhere((element) => element[0] == key);
    }
  }

  dynamic search(dynamic key) {
    int index = calculateHash(key);
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
