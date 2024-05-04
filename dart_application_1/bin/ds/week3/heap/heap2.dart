void main() {
  Heap heap = Heap();
  heap.insertion(20);
  heap.insertion(2);
  heap.insertion(43);
  heap.insertion(60);
  heap.insertion(23);
  heap.insertion(15);
  heap.insertion(28);
  heap.delete();
  heap.diaplay();
}

class Heap {
  late List<int> heap;

  Heap() {
    heap = [];
  }

  insertion(value) {
    heap.add(value);
    bubbleup(heap.length - 1);
  }

  bubbleup(int index) {
    int parentindex = (index - 1) ~/ 2;

    while (index > 0) {
      if (heap[parentindex] < heap[index]) {
        int temp = heap[parentindex];
        heap[parentindex] = heap[index];
        heap[index] = temp;

        index = parentindex;
        parentindex = (index - 1) ~/ 2;
      } else {
        break;
      }
    }
  }

  diaplay() {
    print(heap);
  }

  delete() {
    if (heap.isEmpty) {
      throw Exception('empty');
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

    if (rightchild < heap.length - 1 && heap[rightchild] > heap[large]) {
      large = rightchild;
    }

    if (index != large) {
      int temp = heap[index];
      heap[index] = heap[large];
      heap[large] = temp;
      sinkdown(large);
    }
  }
}
