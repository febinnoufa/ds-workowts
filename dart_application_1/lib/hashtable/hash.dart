void main() {

  HashTable hashTable =HashTable(10);

  hashTable.put('febin', 18);
  hashTable.put('noufan', 19);
  hashTable.put('nishad', 23);
  hashTable.put('nived', 17);

  print('age of nishad :${hashTable.get('nishad')}');

  hashTable.remove('nived');

  print(
      'Does the hashtable contain? ${hashTable.get('nived') != null}');


}

class HashTable {
  late List<List<MapEntry<String, dynamic>>> buckets;
  late int size;

  HashTable(int size) {
    buckets = List.generate(size, (_) => []);
   this. size = size;
  }

  hash(String key) {
    return key.hashCode % size;
  }

  put(String key, dynamic value) {
    int index = hash(key);
    for (var entry in buckets[index]) {
      if (entry.key == key) {
        buckets[index].remove(entry);
        break;
      }
    }
    buckets[index].add(MapEntry(key, value));
  }

  get(key) {
    int index = hash(key);
    for (var entry in buckets[index]) {
      if (entry.key == key) {
        return entry.value;
      }
    }
    return null;
  }

  remove(key){
    int index=hash(key);
    buckets[index].removeWhere((element) => element.key==key);
  }
}


