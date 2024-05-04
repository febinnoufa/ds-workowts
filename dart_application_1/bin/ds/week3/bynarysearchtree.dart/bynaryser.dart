void main() {
  BinaryTree bst = BinaryTree();

  bst.insert(5);
  bst.insert(3);
  bst.insert(7);
  bst.insert(2);
  bst.insert(4);
  bst.insert(6);
  bst.insert(8);

  print("Inorder traversal before deletion:");
  bst.inorderTraversal(bst.root);

  bst.delete(bst.root, 6); // Example deletion

  print("\nInorder traversal after deletion:");
  bst.inorderTraversal(bst.root);

  print('postorder traversal after deletion ');
  bst.postorder(bst.root);

  print('preorder after delete');
  bst.preorder(bst.root);
}

class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  void insert(int value) {
    root = insertNode(root, value);
  }

  Node insertNode(Node? node, int value) {
    if (node == null) {
      return Node(value);
    }

    if (value < node.value!) {
      node.left = insertNode(node.left, value);
    } else if (value > node.value!) {
      node.right = insertNode(node.right, value);
    }
    return node;
  }

  Node? delete(Node? root, int key) {
    if (root == null) {
      return root;
    }

    if (key < root.value!) {
      root.left = delete(root.left, key);
    } else if (key > root.value!) {
      root.right = delete(root.right, key);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }

      root.value = findMin(root.right);
      root.right = delete(root.right, root.value!);
    }
    return root;
  }

  int findMin(Node? root) {
    int min = root!.value!;
    while (root!.left != null) {
      min = root.left!.value!;
      root = root.left;
    }
    return min;
  }

  void preorder(Node? root) {
    if (root != null) {
      print(root.value);
      preorder(root.left);

      preorder(root.right);
    }
  }

  void postorder(Node? root) {
    if (root != null) {
      postorder(root.left);
      postorder(root.right);
      print(root.value);
    }
  }

  void inorderTraversal(Node? root) {
    if (root != null) {
      inorderTraversal(root.left);
      print(root.value);
      inorderTraversal(root.right);
    }
  }
}
