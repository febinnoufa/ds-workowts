void main() {
  bst bynarysearchtree = bst();

  bynarysearchtree.root = bynarysearchtree.insert(bynarysearchtree.root, 20);
  bynarysearchtree.root = bynarysearchtree.insert(bynarysearchtree.root, 15);
  bynarysearchtree.root = bynarysearchtree.insert(bynarysearchtree.root, 13);
  bynarysearchtree.root = bynarysearchtree.insert(bynarysearchtree.root, 24);
  bynarysearchtree.root = bynarysearchtree.insert(bynarysearchtree.root, 26);
  bynarysearchtree.root = bynarysearchtree.insert(bynarysearchtree.root, 12);
  bynarysearchtree.root = bynarysearchtree.insert(bynarysearchtree.root, 6);

  bynarysearchtree.preorder(bynarysearchtree.root);
}

class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}

class bst {
  Node? root;

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

  delete(Node? root, int? value) {
    if (root == null) {
      return root;
    }

    if (value! < root.value!) {
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
      root.right = delete(root.right, root.value);
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

  preorder(Node? root) {
    if (root == null) {
      return;
    }
    print(root.value);
    inorder(root.left);

    inorder(root.right);
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
