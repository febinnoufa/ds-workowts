void main() {
  queue qu = queue();
  qu.enqueue(10);
  qu.enqueue(20);
  qu.enqueue(30);
  qu.enqueue(40);
  qu.enqueue(50);
  print('dequeu :${qu.dequeue()}');
  qu.display();
}

class Node {
  int? value;
  Node? next;

  Node(this.value, [this.next]);
}

class stack {
  Node? top;

  push(value) {
    Node newnode = Node(value);
    newnode.next = top;
    top = newnode;
  }

  pop() {
    if (top == null) {
      return null;
    }
    int? val = top!.value;
    top = top!.next;
    return val;
  }

  isEmpty() {
    return top == null;
  }

  display() {
    var temp = top;

    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

class queue {
  stack s1 = stack();
  stack s2 = stack();

  enqueue(value) {
    while (!s1.isEmpty()) {
      s2.push(s1.pop());
    }
    s1.push(value);
    while (!s2.isEmpty()) {
      s1.push(s2.pop());
    }
  }

  dequeue() {
    int? val = s1.pop();
    return val;
  }

  display() {
    s1.display();
  }
}
