void main() {
  Stack st = Stack();
  st.push(54);
  st.push(4);
  st.push(44);
  st.push(59);
  st.push(5);
  
  List<int> sortedArray = st.sorted();
  print(sortedArray);
}

class Node {
  int? value;
  Node? next;

  Node(this.value, [this.next]);
}

class Stack {
  Node? top;
  int size = 0;

  bool isEmpty() {
    return top == null;
  }

  void push(int value) {
    Node newnode = Node(value);
    newnode.next = top;
    top = newnode;
    size++;
  }

  int? pop() {
    if (top == null) {
      return null;
    }
    int? val = top!.value;
    top = top!.next;
    size--;
    return val;
  }

  List<int> sorted() {
    List<int> array = [];
    Stack tempstack = Stack();

    while (!isEmpty()) {
      int? val = pop();
      array.add(val!);
      tempstack.push(val);
    }
    while (!tempstack.isEmpty()) {
      push(tempstack.pop()!);
    }

    for (int i = 0; i < array.length; i++) {
      for (int j = 0; j < array.length - i - 1; j++) {
        if (array[j] > array[j + 1]) {
          int temp = array[j];
          array[j] = array[j + 1];
          array[j + 1] = temp;
        }
      }
    }
    return array;
  }
}
