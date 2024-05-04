class MinHeap {
  late List<int> _heap;

  MinHeap() {
    _heap = [];
  }

  void insert(int value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1);
  }

  int deleteMin() {
    if (_heap.isEmpty) {
      throw StateError('Heap is empty');
    }

    int min = _heap[0];
    _heap[0] = _heap.last;
    _heap.removeLast();
    _sinkDown(0);
    return min;
  }

  void _bubbleUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (_heap[parentIndex] > _heap[index]) {
        _swap(parentIndex, index);
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  void _sinkDown(int index) {
    int leftChildIdx = 2 * index + 1;
    int rightChildIdx = 2 * index + 2;
    int smallest = index;

    if (leftChildIdx < _heap.length && _heap[leftChildIdx] < _heap[smallest]) {
      smallest = leftChildIdx;
    }

    if (rightChildIdx < _heap.length &&
        _heap[rightChildIdx] < _heap[smallest]) {
      smallest = rightChildIdx;
    }

    if (smallest != index) {
      _swap(index, smallest);
      _sinkDown(smallest);
    }
  }

  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }

  void printHeap() {
    print(_heap);
  }
}

void main() {
  MinHeap minHeap = MinHeap();

  minHeap.insert(39);
  minHeap.insert(12);
  minHeap.insert(65);
  minHeap.insert(3);
  minHeap.insert(15);
   minHeap.insert(52); minHeap.insert(4);

  minHeap.printHeap(); // Output: [5, 10, 15, 30, 20]

  // print('Min element: ${minHeap.deleteMin()}');
  // minHeap.printHeap(); // Output: [10, 20, 15, 30]
}
