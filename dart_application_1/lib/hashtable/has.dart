void main() {}

class HashTable {
  late List<List<MapEntry<String, dynamic>>> buckets;
  late int size;

  HashTable(int size) {
    List.generate(size, (_) => []);
    this.size = size;
  }

  hash(key) {
    return key.hashCode % size;
  }

  put(String key, dynamic value) {}
}
