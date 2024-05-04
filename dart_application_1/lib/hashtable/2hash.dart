void main() {

  Hashtable h =Hashtable(10);
  h.insert('febin', 10);
  h.insert('noufan', 20);
print(  h.serach('febin'));


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

  insert(key,value){
    int index=hash(key);
    if (bucket[index]==null) {
      bucket[index]=[];
    }
    bucket[index]!.add([key,value]);
  }

  delete(key){
    int index=hash(key);
    if (bucket !=null) {
      bucket[index]!.removeWhere((element) => element[0]==key);

    }
  }

  serach(key){
    int index=hash(key);
    if (bucket[index]!=null) {
      for (var element in bucket[index]!) {
        if (element[0]==key) {
          return element[1];
        }
      }
    }
    return null;
  }
}
