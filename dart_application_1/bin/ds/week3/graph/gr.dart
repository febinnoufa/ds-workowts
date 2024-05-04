void main() {
  Graph graph = Graph();

  graph.addVertex(1);
  graph.addVertex(2);
  graph.addVertex(3);
  graph.addVertex(4);
  graph.addVertex(5);
  graph.addVertex(6); // Adding vertex 6
  graph.addVertex(7); // Adding vertex 7

  graph.addEdges(1, 2);
  graph.addEdges(1, 3);
  graph.addEdges(2, 4);
  graph.addEdges(2, 5);
  graph.addEdges(3, 4);
  graph.addEdges(4, 5);

  // Traverse vertex 6 and 7
  print('Traversing vertex 6:');
  graph.BFStraversal(6);
  print('Traversing vertex 7:');
  graph.BFStraversal(7);
}

class Graph {
  late Map<int, List<int>> adjacencyList;

  Graph() {
    adjacencyList = {};
  }

  void addVertex(vertex) {
    if (!adjacencyList.containsKey(vertex)) {
      adjacencyList[vertex] = [];
    }
  }

  addEdges(vertex1, vertex2) {
    if (!adjacencyList.containsKey(vertex1)) {
      addVertex(vertex1);
    }

    if (!adjacencyList.containsKey(vertex2)) {
      addVertex(vertex2);
    }

    adjacencyList[vertex1]!.add(vertex2);
    adjacencyList[vertex2]!.add(vertex1);
  }

  BFStraversal(startVertex) {
    List visited = [];
    List queue = [];

    visited.add(startVertex);
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      var current = queue.removeAt(0);

      List<int>? adjacent = adjacencyList[current];
      if (adjacent != null) {
        for (var element in adjacent) {
          if (!visited.contains(element)) {
            visited.add(element);
            queue.add(element);
          }
        }
      }
    }
    print(visited);
  }
}
