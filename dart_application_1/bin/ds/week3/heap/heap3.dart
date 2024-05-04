void main() {
  MaxHeap heap = MaxHeap();
  heap.insertion(20);
  heap.insertion(10);
  heap.insertion(22);
  heap.insertion(120);
  heap.insertion(54);
  heap.insertion(2);
  heap.insertion(25);
  heap.insertion(5);
  heap.delete();
  heap.display();
}

class MaxHeap {
  late List heap;

  MaxHeap() {
    heap = [];
  }

  insertion(int value) {
    heap.add(value);
    bubbleup(heap.length - 1);
  }

  bubbleup(int index) {
    int parentIndex = (index - 1) ~/ 2;

    while (index > 0) {
      if (heap[parentIndex] < heap[index]) {
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

  delete() {
    if (heap.isEmpty) {
      return Exception('heap is empty');
    }

    int max = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    Singdown(0);
    return max;
  }

  display() {
    print(heap);
  }

  Singdown(int index) {
    int leftchild = (index * 2) + 1;
    int rightchild = (index * 2) + 2;
    int largest = index;

    if (leftchild < heap.length && heap[leftchild] > heap[largest]) {
      largest = leftchild;
    }

    if (rightchild < heap.length && heap[rightchild] > heap[largest]) {
      largest = rightchild;
    }

    if (largest != index) {
      int temp = heap[index];
      heap[index] = heap[largest];
      heap[largest] = temp;
      Singdown(largest);
    }
  }
}
