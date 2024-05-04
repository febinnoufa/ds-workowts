void main() {
  stack s = stack();
  s.push(10);
  s.push(20);
  s.push(30);
  s.push(40);
  s.push(50);
  s.push(60);
  print('top val :${s.pop()}');
  print('mid : ${s.midle()}');
  s.addafter(40, 45);
  s.display();
  print('size :${s.size}');
}

class Node {
  int? value;
  Node? next;

  Node(this.value, [this.next]);
}

class stack {
  Node? top;
  int size = 0;

  push(value) {
    Node newnode = Node(value);

    newnode.next = top;
    top = newnode;
    size++;
  }

  pop() {
    if (top == null) {
      return null;
    }
    int? val = top!.value;
    top = top!.next;
    size--;
    return val;
  }

  display() {
    Node? temp = top;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  bool isEmpty() {
    return top == null;
  }

  midle() {
    stack tempstack = stack();
    for (var i = 0; i < size ~/ 2; i++) {
      tempstack.push(pop());
    }
    int? val = pop();
    while (!tempstack.isEmpty()) {
      push(tempstack.pop());
    }
    return val;
  }

  addafter(pos, value) {
    stack tempstack = stack();
    while (top != null && top!.value != pos) {
      tempstack.push(pop());
    }
    push(value);
    while (!tempstack.isEmpty()) {
      push(tempstack.pop());
    }
  }
}
