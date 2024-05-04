class HashTable {
  late List<List<MapEntry<String, dynamic>>> _buckets;
  late int _size;

  HashTable(int size) {
    _buckets = List.generate(size, (_) => []);
    _size = size;
  }

  int _hash(String key) {
    return key.hashCode % _size;
  }

  void put(String key, dynamic value) {
    int index = _hash(key);
    for (var entry in _buckets[index]) {
      if (entry.key == key) {
        _buckets[index].remove(entry);
        break;
      }
    }
    _buckets[index].add(MapEntry(key, value));
  }

  dynamic get(String key) {
    int index = _hash(key);
    for (var entry in _buckets[index]) {
      if (entry.key == key) {
        return entry.value;
      }
    }
    return null;
  }

  void remove(String key) {
    int index = _hash(key);
    _buckets[index].removeWhere((entry) => entry.key == key);
  }
}

void main() {
  HashTable hashtable = HashTable(10); // Create a hashtable with size 10

  // Insert key-value pairs
  hashtable.put('apple', 10);
  hashtable.put('banana', 20);
  hashtable.put('orange', 15);

  // Retrieve values
  print('Number of apples: ${hashtable.get('apple')}');
  print('Number of bananas: ${hashtable.get('banana')}');
  print('Number of oranges: ${hashtable.get('orange')}');

  // Update value
  hashtable.put('apple', 5);

  // Remove a key-value pair
  hashtable.remove('orange');

  // Check if key exists
  print(
      'Does the hashtable contain "banana"? ${hashtable.get('banana') != null}');
  print(
      'Does the hashtable contain "orange"? ${hashtable.get('orange') != null}');
}
