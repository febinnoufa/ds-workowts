void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.insert(10);
  maxHeap.insert(43);
  maxHeap.insert(45);
  maxHeap.insert(1);
  maxHeap.insert(100);
  maxHeap.insert(13);
  maxHeap.delete();
  maxHeap.display();
}

class MaxHeap {
  late List<int> heap;

  MaxHeap() {
    heap = [];
  }

  insert(int value) {
    heap.add(value);
    bubbleup(heap.length - 1);
  }

  bubbleup(int index) {
    int parentindex = (index - 1) ~/ 2;
    while (index > 0) {
      if (heap[parentindex] < heap[index]) {
        int temp = heap[index];
        heap[index] = heap[parentindex];
        heap[parentindex] = temp;

        index = parentindex;
        parentindex = (index - 1) ~/ 2;
      } else {
        break;
      }
    }
  }

  delete() {
    if (heap.isEmpty) {
      return Exception('empty');
    }

    int max = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    sinkdown(0);
    return max;
  }

  sinkdown(int index) {
    int leftchild = (index * 2) + 1;
    int rightchild = (index * 2) + 2;
    int large = index;

    if (leftchild < heap.length && heap[leftchild] > heap[large]) {
      large = leftchild;
    }
    if (rightchild < heap.length && heap[rightchild] > heap[large]) {
      large = index;
    }

    if (index != large) {
      int temp = heap[large];
      heap[large] = heap[index];
      heap[index] = temp;

      sinkdown(large);
    }
  }

  display() {
    print(heap);
  }
}
