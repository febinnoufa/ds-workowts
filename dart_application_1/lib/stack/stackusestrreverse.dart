void main() {
  stack stck = stack();
  String s = 'Febin Noufan';
  for (var i = 0; i < s.length; i++) {
    stck.push(s[i]);
  }
  // stck.display();
  print('reversed string : ${stck.reverse()}');
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
      return print('');
    }

    String? val = top!.value;
    top = top!.next;
    return val;
  }

  reverse() {
    var temp = top;
    String newstring = '';
    while (temp != null) {
      newstring += pop();
      temp = temp.next;
    }
    return newstring;
  }

  display() {
    var temp = top;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}
