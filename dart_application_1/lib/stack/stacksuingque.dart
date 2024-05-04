void main() {
  Stack st = Stack();
  st.push(10);
  st.push(20);
  st.push(30);
  st.push(40);
  st.push(50);
  print('pop :${st.pop()}');
  st.display();
}

class Node {
  int value;
  Node? next;

  Node(this.value, [this.next]);
}

class Queue {
  Node? front;
  Node? rear;

  void enqueue(int value) {
    Node newNode = Node(value);

    if (rear == null) {
      front = newNode;
      rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  bool isEmpty() {
    return rear == null;
  }

  int? dequeue() {
    if (isEmpty()) {
      return null;
    }
    int value = front!.value;
    front = front!.next;

    if (front == null) {
      rear = null;
    }
    return value;
  }

  void display() {
    var temp = front;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

class Stack {
  Queue q1 = Queue();
  Queue q2 = Queue();

  void push(int value) {
    while (!q1.isEmpty()) {
      q2.enqueue(q1.dequeue()!);
    }
    q1.enqueue(value);
    while (!q2.isEmpty()) {
      q1.enqueue(q2.dequeue()!);
    }
  }

  pop() {
    return q1.dequeue();
  }

  void display() {
    q1.display();
  }
}
