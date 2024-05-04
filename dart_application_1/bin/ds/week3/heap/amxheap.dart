void main() {
  Maxheap mxh = Maxheap();
  mxh.insert(53);
  mxh.insert(30);
  mxh.insert(42);
  mxh.insert(40);
  mxh.insert(2);
  mxh.insert(6);
  mxh.insert(21);
  mxh.delelet();
  mxh.display();
}

class Maxheap {
  late List<int> heap;

  Maxheap() {
    heap = [];
  }

  insert(value) {
    heap.add(value);
    bubbleup(heap.length - 1);
  }

  bubbleup(index) {
    int parentindex = (index - 1) ~/ 2;
    while (index > 0) {
      if (heap[parentindex] < heap[index]) {
        int temp = heap[parentindex];
        heap[parentindex] = heap[index];
        heap[index] = temp;

        index = parentindex;
      } else {
        break;
      }
    }
  }

  delelet() {
    if (heap.isEmpty) {
      return print('empty');
    }

    int max = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    sinkdouwn(0);
    return max;
  }

  sinkdouwn(int index) {
    int leftChildIdx = (2 * index) + 1;
    int rightChildIdx = (2 * index) + 2;

    int largest = index;

    if (leftChildIdx < heap.length && heap[leftChildIdx] > heap[largest]) {
      largest = leftChildIdx;
    }

    if (rightChildIdx < heap.length && heap[rightChildIdx] > heap[largest]) {
      largest = rightChildIdx;
    }

    if (largest != index) {
      int temp = heap[largest];
      heap[largest] = heap[index];
      heap[index] = temp;

      sinkdouwn(largest);
    }
  }

  display() {
    print(heap);
  }
}
