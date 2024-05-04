void main() {
  String s = 'Helloworld';
  stack st = stack();
  for (var i = 0; i < s.length; i++) {
    st.push(s[i]);
  }
  //st.display();
  print(st.strrev());
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

  isEmpty() {
    return top == null;
  }

  pop() {
    if (top == null) {
      return print('');
    }

    String? val = top!.value;
    top = top!.next;
    return val;
  }

  strrev() {
    stack tempstac = stack();
    String revst = '';
    while (!isEmpty()) {
      String c = pop();
      tempstac.push(c);
      revst = revst + c;
    }

    return revst;
  }

  display() {
    var temp = top;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}
