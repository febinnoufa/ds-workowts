void main() {
  Stack stack = Stack();
  String strin = 'Hello world';
  print('reverse: ${stack.reverse(strin)}');
}

class Stack {
  List<String> stack = [];

  void push(String value) {
    stack.add(value);
  }

  bool isEmpty() => stack.isEmpty;

  String pop() {
    if (isEmpty()) {
      return '';
    }
    String val = stack.last;
    stack.removeLast();
    return val;
  }

  String reverse(String s) {
    Stack revStack = Stack();
    for (var i in s.split('')) {
      revStack.push(i);
    }
    String rev = '';
    while (!revStack.isEmpty()) {
      rev += revStack.pop();
    }
    return rev;
  }
}
