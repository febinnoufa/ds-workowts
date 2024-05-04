// void main(){

// }

// class Node {
//   int? value;
//   Node? left;
//   Node? right;

//   Node(this.value);
// }


// class BynarySearchTree {
  

//   insertion(Node? root,int value){
//     if (root ==null) {
//       return Node(value);
//     }

//     if (value < root.value!) {
//       root.left= insertion(root.left, value);
//     }else if(value > root.value!){
//       root.right =insertion(root.right, value);
//     }

//     return root;
//   }
// }



// class Trie {
//   Map <String,Trie> children ={};
//   bool isEndOfWord =false;


//   indert(String word){
//     var current =this;

//     for(int i=0;i<word.length;i++){
//       String s=word[i];
//       if (!current.children.containsKey(s)) {
//         current.children[s]=Trie();
//       }
//       current=current.children[s]!;
//     }
//     current.isEndOfWord =true;
//   }


// }



// delete(){

//   if (heap.isEmpty) {
//     return print('empty');
//   }
//   int max =heap[0];
//   heap[0]=heap.last;
//   heap.removeLast();
//   sinkdown(0);
//   return max;

// }

// sinkdown(int Index){

//   int leftChildIdx= (index *2) +1;
//   int rightChildIdx =(Index *2)+2;
//   int large=index;

//   if (leftChildIdx< heap.length && heap[leftChildIdx]> heap[large]) {
//     large=leftChildIdx;
//   }

//   if (rightChildIdx<heap.length && heap[rightChildIdx]>heap[large]) {
//     large=rightChildIdx;
//   }

//   if (Index != large) {
//     int temp=heap[index];
//     heap[index]=heap[large];
//     heap[large ]=temp;

//     sinkdown(large);
//   }

// }