void main() {
  queueu q=queueu();
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40);
  print('deq:${q.dequeue()}');
  q.dispaly();
}

class Node {
  int value;
  Node? next;
  Node(this.value, [this.next]);
}

class stack {
  Node? top;
  
  void push(value) {
    Node newnode = Node(value);
    newnode.next = top;
    top = newnode;
  }

  int? pop() {
    if (top == null) {
      return null;
    }
    int val = top!.value;
    top = top!.next;
    return val;
  }

  bool isEmpty(){
    return top == null;
  }

  void display(){
    stack tempstack = stack();
    while (!isEmpty()) {
      int? va = pop();
      print(va);
      tempstack.push(va);
    }
    while (!tempstack.isEmpty()) {
      push(tempstack.pop());
    }
  }
}


class queueu {
  stack s1=stack();
  stack s2=stack();

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
    return s1.pop();
  }
  dispaly(){
    s1.display();
  }
}
