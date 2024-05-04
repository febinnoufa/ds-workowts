void main() {
  String s = 'Hello world';

  stack stck = stack();

  stck.push(10);
  stck.push(20);
  stck.push(30);
  stck.push(40);
  stck.push(50);
  stck.push(60);
  stck.push(70);
  stck.push(80);
  print('pop :${stck.pop()}');
  print('size ${stck.size()}');
  stck.display();
  print('midval :${stck.findmid()}');
  stck.deletemid();
  stck.afteradd(
      2, 35); // Inserting 35 after position 2 (indexing starts from 0)
  stck.display();
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

  void afteradd(int pos, int value) {
    // If the position is invalid (less than 0 or greater than the size of the stack), do nothing
    if (pos < 0 || pos > size()) {
      print("Invalid position");
      return;
    }

    stack tempstack = stack();

    // Move elements from the original stack to the temporary stack until the desired position is reached
    for (var i = 0; i < pos && top != null; i++) {
      tempstack.push(pop());
    }

    // Add the new value to the original stack
    push(value);

    // Move elements back from the temporary stack to the original stack
    while (tempstack.size() > 0) {
      push(tempstack.pop());
    }
  }

  pop() {
    if (top == null) {
      return null;
    }
    int? val = top!.value;
    top = top!.next;
    return val;
  }

  size() {
    int size = 0;
    var temp = top;
    while (temp != null) {
      size++;
      temp = temp.next;
    }
    return size;
  }

  findmid() {
    stack tempstack = stack();
    int mid = size() ~/ 2;
    for (var i = 0; i < mid; i++) {
      tempstack.push(pop());
    }
    int? midval = top!.value;
    while (tempstack.size() > 0) {
      push(tempstack.pop());
    }
    return midval;
  }

  deletemid() {
    stack tempstack = stack();
    int mid = size() ~/ 2;
    for (var i = 0; i < mid; i++) {
      tempstack.push(pop());
    }
    pop();
    while (tempstack.size() > 0) {
      push(tempstack.pop());
    }
  }

  display() {
    var temp = top;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}
