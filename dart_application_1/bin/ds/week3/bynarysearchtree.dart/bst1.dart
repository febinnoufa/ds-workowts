void main() {
  bYnarysearchtree bst = bYnarysearchtree();
  bst.root = bst.insertion(bst.root, 14);
  bst.root = bst.insertion(bst.root, 24);
  bst.root = bst.insertion(bst.root, 4);
  bst.root = bst.insertion(bst.root, 145);
  bst.root = bst.insertion(bst.root, 23);
  bst.root = bst.insertion(bst.root, 3);
  bst.root = bst.insertion(bst.root, 10);
  bst.root = bst.insertion(bst.root, 16);

   bst.delete(bst.root, 43);
     bst.inorder(bst.root);
  
 // print('max elment :${bst.findmax(bst.root)}');
 // print('min elment :${bst.findmin(bst.root)}');
}

class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}

class bYnarysearchtree {
  Node? root;

  insertion(Node? root, int value) {
    if (root == null) {
      return Node(value);
    }

    if (value < root.value!) {
      root.left = insertion(root.left, value);
    } else if (value > root.value!) {
      root.right = insertion(root.right, value);
    }
    return root;
  }

  delete(Node? root, int value) {
    if (root == null) {
      return print('empty');
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
  }

  inorder(Node? root) {
    if (root == null) {
      return;
    }
    inorder(root.left);
    print(root.value);
    inorder(root.right);
  }

  findmin(Node? root) {
    int min = root!.value!;
    while (root!.left != null) {
      min = root.left!.value!;
      root = root.left;
    }
    return min;
  }

  findmax(Node? root) {
    int max = root!.value!;
    while (root!.right != null) {
      max = root.right!.value!;
      root = root.right;
    }
    return max;
  }
}
