void main() {
  BynarySearchTree bst = BynarySearchTree();

  bst.root = bst.insert(bst.root, 32);
  bst.root = bst.insert(bst.root, 13);
  bst.root = bst.insert(bst.root, 54);
  bst.root = bst.insert(bst.root, 2);
  bst.root = bst.insert(bst.root, 3);
  bst.root = bst.insert(bst.root, 324);
  bst.root = bst.insert(bst.root, 332);
  bst.root = bst.insert(bst.root, 43);
  bst.inorder(bst.root);
  print('after');
  bst.delete(bst.root, 54);
  bst.inorder(bst.root);
}

class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BynarySearchTree {
  var root;

  insert(Node? root, int value) {
    if (root == null) {
      return Node(value);
    }
    if (value < root.value!) {
      root.left = insert(root.left, value);
    } else if (value > root.value!) {
      root.right = insert(root.right, value);
    }

    return root;
  }

  inorder(Node? root) {
    if (root == null) {
      return;
    }

    inorder(root.left);
    print(root.value);
    inorder(root.right);
  }

  delete(Node? root, int value) {
    if (root == null) {
      return null;
    }

    if (value < root.value!) {
      root.left = delete(root.left, value);
    } else if (value > root.value!) {
      root.right = delete(root.right, value);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      root.value = findmin(root.right);
      root.right = delete(root.right, root.value!);
    }
    return root;
  }

  findmin(Node? root) {
    int? min = root!.value;
    while (root!.left != null) {
      min = root.left!.value;
      root = root.left;
    }
    return min;
  }
}
