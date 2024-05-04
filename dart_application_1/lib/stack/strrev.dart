void main() {
  Stack stc = Stack();
  String s = 'helloworld';
  for (var i = 0; i < s.length; i++) {
    stc.push(s[i]);
  }
  print(stc.reverstr());
}

class Stack {
  List stack = [];

  push(value) {
    stack.add(value);
  }

  pop() {
    if (stack.isEmpty) {
      return null;
    }
    var val = stack.removeLast();
    return val;
  }

  isEmpty() {
    return stack.isEmpty;
  }

  reverstr() {
    Stack tempstack = Stack();
    String rev = '';
    while (stack.isNotEmpty) {
      String str = pop();
      rev = rev + str;
      tempstack.push(str);
    }

    while (!tempstack.isEmpty()) {
      push(tempstack.pop());
    }
    return rev;
  }
}
