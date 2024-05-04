void main() {
  stack st = stack();
  String s = 'Helloworld';
  for (var i = 0; i < s.length; i++) {
    st.push(s[i]);
  }
  print(st.revers());
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
    var val = Stack.removeLast();

    return val;
  }

  revers() {
    stack temps = stack();
    String rev = '';
    while (Stack.isNotEmpty) {
      String c = pop();
      rev = rev + c;
    }
    return rev;
  }
}
