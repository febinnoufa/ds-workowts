void main() {}

class graph {
  late Map<int, List<int>> adjestensylist;

  graph() {
    adjestensylist = {};
  }

  addvertix(int vertix) {
    if (!adjestensylist.containsKey(vertix)) {
      adjestensylist[vertix] = [];
    }
  }

  addedges(int vertix1, int vertix2) {
    if (!adjestensylist.containsKey(vertix1)) {
      addvertix(vertix1);
    }

    if (!adjestensylist.containsKey(vertix2)) {
      addvertix(vertix2);
    }

    adjestensylist[vertix1]!.add(vertix2);
    adjestensylist[vertix2]!.add(vertix1);

    
  }
}
