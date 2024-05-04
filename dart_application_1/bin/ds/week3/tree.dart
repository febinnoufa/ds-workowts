import 'dart:collection';

void main() {
  List<int> nodes = [1, 2, 4, -1, -1, 5, -1, -1, 3, -1, 6, -1, -1];

  BinaryTree binaryTree = BinaryTree();
  Node? root = binaryTree.build(nodes);
  // print('pre order');
  // binaryTree.preorder(root);
  // print('in order');
  // binaryTree.inorder(root);
  // print('post order');
  // binaryTree.postorder(root);
  binaryTree.levelorder(root);
}

class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value, [this.left, this.right]);
}

class BinaryTree {
  int index = -1;

  Node? build(List<int> nodes) {
    index++;
    if (index >= nodes.length || nodes[index] == -1) {
      return null;
    }
    Node newNode = Node(nodes[index]);
    newNode.left = build(nodes);
    newNode.right = build(nodes);

    return newNode;
  }

  postorder(Node? root) {
    if (root == null) {
      return;
    }
    postorder(root.left);
    postorder(root.right);
    print(root.value);
  }

  void preorder(Node? root) {
    if (root == null) {
      return;
    }

    print(root.value);
    // Print the value regardless of whether it's a leaf node

    preorder(root.left);
    preorder(root.right);
  }

  inorder(Node? root) {
    if (root == null) {
      return;
    }
    inorder(root.left);
    print(root.value);
    inorder(root.right);
  }

  levelorder(Node? root) {
    if (root == null) {
      return;
    }
    Queue<Node?> queue = Queue();
    queue.add(root);
    queue.add(null);

    while (queue.isNotEmpty) {
      Node? current = queue.removeFirst();
      if (current == null) {
        if (queue.isEmpty) {
          break;
        } else {
          queue.add(null);
        }
      } else {
        print(current.value);
        if (current.left != null) {
          queue.add(current.left);
        }
        if (current.right != null) {
          queue.add(current.right);
        }
      }
    }
  }
}
