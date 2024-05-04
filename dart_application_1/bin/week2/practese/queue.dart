void main() {
  queue q = queue();
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40);
  q.enqueue(50);
  q.enqueue(60);
  // q.addAfter(40, 45);
  q.display();
  print('size: ${q.size}');
  print('mid :${q.mid()}');
}

class Node {
  int? value;
  Node? next;

  Node(this.value, [this.next]);
}

class queue {
  Node? front;
  Node? rear;
  int size = 0;

  // addAfter(pos, value) {
  //   queue tempQueue = queue();
  //   while (front != null && front!.value != pos) {
  //     tempQueue.enqueue(dequeue());
  //   }
  //   if (front != null) { // Check if pos exists in the queue
  //     enqueue(value);
  //   } else {
  //     print("Position not found in the queue.");
  //   }
  //   while (!tempQueue.isEmpty()) {
  //     enqueue(tempQueue.dequeue());
  //   }
  // }

  enqueue(value) {
    Node newnode = Node(value);
    if (rear == null) {
      front = newnode;
      rear = newnode;
      size++;
    } else {
      rear!.next = newnode;
      rear = newnode;
      size++;
    }
  }

  isEmpty() {
    return rear == null;
  }

  dequeue() {
    if (front == null) {
      return null;
    }
    int? val = front!.value;
    front = front!.next;
    size--;
    if (front == null) {
      rear = null;
    }
    return val;
  }

  mid() {
    if (front == null) {
      return null;
    }
    Node? slowPtr = front;
    Node? fastPtr = front;

    while (fastPtr != null && fastPtr.next != null) {
      fastPtr = fastPtr.next!.next;
      slowPtr = slowPtr!.next;
    }
    return slowPtr!.value;
  }

  display() {
    var temp = front;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}
