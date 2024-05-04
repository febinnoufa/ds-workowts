void main() {
  queue que = queue();
  que.enqueue(10);
  que.enqueue(20);
  que.enqueue(30);
  que.enqueue(40);
  que.enqueue(50);
  print('dequeue :${que.dequeue()}');
  que.display();
  print('size : ${que.size()}');
  print('find mid :${que.findmid()}');
}

class Node {
  int? value;
  Node? next;
  Node(this.value, [this.next]);
}

class queue {
  Node? front;
  Node? rear;

  enqueue(value) {
    Node newnode = Node(value);
    if (rear == null) {
      front = newnode;
      rear = newnode;
    } else {
      rear!.next = newnode;
      rear = newnode;
    }
  }

  int size() {
    var temp = front;
    int size = 0;
    while (temp != null) {
      size++;
      temp = temp.next;
    }
    return size;
  }

  int? findmid() {
    int mid = size() ~/ 2;
    Node? temp = front;
    for (var i = 0; i < mid; i++) {
      temp = temp!.next;
    }
    return temp?.value;
  }

  dequeue() {
    if (front == null) {
      return null;
    }
    int? val = front!.value;
    front = front!.next;
    if (front == null) {
      rear = null;
    }
    return val;
  }

  display() {
    var temp = front;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}
