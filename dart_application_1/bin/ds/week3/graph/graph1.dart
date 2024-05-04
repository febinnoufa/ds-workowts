void main() {
  Graph graph = Graph();

  graph.addedges(1, 2);
  graph.addedges(1, 3);
  graph.addedges(2, 4);
  graph.addedges(2, 5);
  graph.addedges(3, 4);
  graph.addedges(4, 5);
  graph.printgraph();
  graph.addvertix(7);
  graph.addvertix(6);
  print('bfs :');
  graph.BFStraversal(1);

  print('dfs :');
  graph.DFStraversal(1);
}

class Graph {
  late Map<int, List<int>> adjestencylist;

  Graph() {
    adjestencylist = {};
  }

  void addvertix(vertix) {
    if (!adjestencylist.containsKey(vertix)) {
      adjestencylist[vertix] = [];
    }
  }

  addedges(vertix1, vertix2) {
    if (!adjestencylist.containsKey(vertix1)) {
      addvertix(vertix1);
    }

    if (!adjestencylist.containsKey(vertix2)) {
      addvertix(vertix2);
    }

    adjestencylist[vertix1]!.add(vertix2);
    adjestencylist[vertix2]!.add(vertix1);
  }

  BFStraversal(startvertix) {
    List visited = [];
    List queue = [];

    visited.add(startvertix);
    queue.add(startvertix);

    while (queue.isNotEmpty) {
      var current = queue.removeAt(0);

      List<int>? adjest = adjestencylist[current];
      if (adjest != null) {
        for (var element in adjest) {
          if (!visited.contains(element)) {
            visited.add(element);
            queue.add(element);
          }
        }
      }
    }
    print(visited);
  }

  DFStraversal(startvertix) {
    List visited = [];
    List stack = [];

    stack.add(startvertix);

    while (stack.isNotEmpty) {
      var current = stack.removeLast();

      if (!visited.contains(current)) {
        visited.add(current);
        List<int>? adjest = adjestencylist[current];
        if (adjest != null) {
          for (var element in adjest.reversed) {
            stack.add(element);
          }
        }
      }
    }
    print(visited);
  }

  printgraph() {
    adjestencylist.forEach((key, value) {
      print('$key : $value');
    });
  }
}
