void main() {
  stack s = stack();
  s.push(10);
  s.push(20);
  s.push(30);
  s.push(40);
  s.push(50);
  // print(s.pop());
  s.display();
}

class Node {
  int value;
  Node? next;
  Node(this.value, [this.next]);
}

class queue {
  Node? frond;
  Node? rear;

  enqueue(value) {
    Node newnode = Node(value);
    if (frond == null) {
      frond = newnode;
      rear = newnode;
    } else {
      rear!.next = newnode;
      rear = newnode;
    }
  }

  dequeue() {
    if (isEmpty()) {
      return null;
    }
    int? val = frond!.value;
    frond = frond!.next;
    if (frond == null) {
      rear = null;
    }
    return val;
  }

  isEmpty() {
    return rear == null;
  }

  display() {
    queue tempque = queue();

    while (!isEmpty()) {
      int? val = dequeue();
      print(val);
      tempque.enqueue(val);
    }
    while (!tempque.isEmpty()) {
      enqueue(tempque.dequeue());
    }
  }
}

class stack {
  queue q1 = queue();
  queue q2 = queue();

  push(value) {
    while (!q1.isEmpty()) {
      q2.enqueue(q1.dequeue());
    }
    q1.enqueue(value);
    while (!q2.isEmpty()) {
      q1.enqueue(q2.dequeue());
    }
  }

  pop() {
    return q1.dequeue();
  }

  display() {
    q1.display();
  }
}
