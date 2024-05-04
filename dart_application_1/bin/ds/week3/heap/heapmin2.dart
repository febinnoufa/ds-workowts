void main() {
  Minheap minheap = Minheap();
  minheap.insertion(39);
  minheap.insertion(12);
  minheap.insertion(65);
  minheap.insertion(3);
  minheap.insertion(15);
  minheap.insertion(52);
  minheap.insertion(4);
  minheap.display();
}

class Minheap {
  late List<int> heap;

  Minheap() {
    heap = [];
  }

  insertion(value) {
    heap.add(value);
    bubbleup(heap.length - 1);
  }

  bubbleup(int index) {
    int parentIndex = (index - 1) ~/ 2;

    while (index > 0) {
      if (heap[parentIndex] > heap[index]) {
        int temp = heap[parentIndex];
        heap[parentIndex] = heap[index];
        heap[index] = temp;

        index = parentIndex;
        parentIndex = (index - 1) ~/ 2;
      } else {
        break;
      }
    }
  }

  display() {
    print(heap);
  }

  delete() {
    if (heap.isEmpty) {
      return Exception('empty');
    }

    int min = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    sinkdown(0);
    return min;
  }

  sinkdown(int index) {
    int leftchild = (index * 2) + 1;
    int rightchild = (index * 2) + 2;
    int small = index;

    if (leftchild < heap.length && heap[leftchild] < heap[small]) {
      small = leftchild;
    }

    if (rightchild < heap.length && heap[rightchild] < heap[small]) {
      small = rightchild;
    }

    if (small != index) {
      int temp = heap[small];
      heap[small] = heap[index];
      heap[index] = temp;

      sinkdown(small);
    }
  }
}
