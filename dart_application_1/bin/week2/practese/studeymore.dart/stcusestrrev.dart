void main() {
  String s = 'helloworld';
  Stack st = Stack();

  for (var i = 0; i < s.length; i++) {
    st.push(s[i]);
  }

  print(st.reverse());
}

class Stack {
  List stack = [];

  push(value) {
    stack.add(value);
  }

  isEmpty() {
    return stack.isEmpty;
  }

  pop() {
    if (stack.isEmpty) {
      return null;
    } else {
      return stack.removeLast();
    }
  }

  reverse() {
    Stack tempstack = Stack();
    String rev = '';
    while (stack.isNotEmpty) {
      String s = pop();
      rev = rev + s;
      tempstack.push(s);
    }
    while (!tempstack.isEmpty()) {
      push(tempstack.pop());
    }
    return rev;
  }
}
