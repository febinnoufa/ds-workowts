void main() {
  queue q= queue();

  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40);
  q.enqueue(50);
  print('deque : ${q.dequeue()}');
  q.display();
}

class Node {
  int? value;
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

 int? pop() {
    if (top == null) {
      return null;
    }

    int? val = top!.value;
    top = top!.next;

    return val;
  }

  display() {
    stack tempstack = stack();
    while (!isEmpty()) {
      int? val = pop();
      print(val);
    }

    while (!tempstack.isEmpty()) {
      push(tempstack.pop());
    }
  }
}

class queue {
  stack s1 =stack();
  stack s2 =stack();

  enqueue(value){
    while (!s1.isEmpty()) {
      s2.push(s1.pop());
    }
    s1.push(value);
    while (!s2.isEmpty()) {
      s1.push(s2.pop());
    }
  }



  dequeue(){
    if (s1.isEmpty()) {
      return null;
    }
   return s1.pop();
  }

  display(){
    s1.display();
  }
}
