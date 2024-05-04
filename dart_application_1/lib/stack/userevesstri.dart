void main() {
  stack s = stack();
  String string = 'Helloworld';
  for (var i = 0; i < string.length; i++) {
    s.push(string[i]);
  }

  print(s.reverse());
}

class Node {
  String? value;
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

    String? val = top!.value;
    top = top!.next;
    return val;
  }

  isEmpty() {
    return top == null;
  }

  reverse() {
    stack tempstack = stack();
    String rev = '';

    while (!isEmpty()) {
      String c = pop();
      rev = rev + c;
      tempstack.push(c);
    }
    while (!tempstack.isEmpty()) {
      push(tempstack.pop());
    }
    return rev;
  }
}
