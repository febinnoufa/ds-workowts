class Graph {
  late Map<String, List<String>> _adjacencyList;

  Graph() {
    _adjacencyList = {};
  }

  void addVertex(String vertex) {
    if (!_adjacencyList.containsKey(vertex)) {
      _adjacencyList[vertex] = [];
    }
  }

  void addEdge(String vertex1, String vertex2) {
    if (!_adjacencyList.containsKey(vertex1)) {
      addVertex(vertex1);
    }
    if (!_adjacencyList.containsKey(vertex2)) {
      addVertex(vertex2);
    }
    _adjacencyList[vertex1]!.add(vertex2); 
    _adjacencyList[vertex2]!
        .add(vertex1);
  }

  void printGraph() { 
    _adjacencyList.forEach((key, value) {
      print("$key : $value");
    });
  }
}

void main() {
  var graph = Graph();

  graph.addEdge('A', 'B');
  graph.addEdge('A', 'C');
  graph.addEdge('B', 'D');
  graph.addEdge('C', 'E');
  graph.addEdge('D', 'E');
  graph.addEdge('D', 'F');
  graph.addEdge('E', 'F');

  graph.printGraph();
}
