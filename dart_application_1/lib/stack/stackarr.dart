void main() {
  stack stck = stack();

  stck.push(10);
  stck.push(20);
  stck.push(30);
  stck.push(40);
  stck.push(50);
  stck.push(60);
  stck.display();
}

class stack {
  List Stack = [];

  push(value) {
    Stack.add(value);
  }

  pop() {
    if (Stack.isEmpty) {
      return null;
    }
    int val = Stack.last;
    Stack.removeLast();
    return val;
  }

  display() {
    if (Stack.isNotEmpty) {
      for (int i = Stack.length - 1; i >= 0; i--) {
        print(Stack[i]);
      }
    }
  }
}
