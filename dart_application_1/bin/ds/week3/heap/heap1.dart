import '../../../week2/practese/bubble.dart';

void main() {}

class Heap {
  late List<int> heap;

  Heap() {
    heap = [];
  }

  insertion(int value) {
    heap.add(value);
    bubbleup(heap.length - 1);
  }

  bubbleup(int index) {
    while (index > 0) {
      int parentindex = (index - 1) ~/ 2;

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

  delete() {
    if (heap == null) {
      return Exception('empty');
    }

    int max = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    sinkdown(0);
  }

  sinkdown(index) {
    int leftChildIdx = (index * 2) + 1;
    int rightChildIdx = (index * 2) + 2;
    int small = index;

    if (leftChildIdx < heap.length && heap[leftChildIdx] < heap[small]) {
      small = leftChildIdx;
    }
    if (rightChildIdx < heap.length && heap[leftChildIdx] < heap[small]) {
      small = leftChildIdx;
    }

    if (small != index) {
      swap(heap, small, index);
      sinkdown(small);
    }
  }
}
