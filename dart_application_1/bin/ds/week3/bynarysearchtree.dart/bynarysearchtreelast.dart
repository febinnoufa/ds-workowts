void main() {
  bynarysearchtree bst = bynarysearchtree();

  bst.root = bst.insert(bst.root, 20);
  bst.root = bst.insert(bst.root, 10);
  bst.root = bst.insert(bst.root, 45);
  bst.root = bst.insert(bst.root, 43);
  bst.root = bst.insert(bst.root, 13);
  bst.root = bst.insert(bst.root, 2);
  bst.root = bst.insert(bst.root, 30);
  bst.inorder(bst.root);

  bst.delete(bst.root, 43);
  print('after remove');
  bst.inorder(bst.root);
  print('count : ${bst.findcount(bst.root)}');
  print('hight : ${bst.hight(bst.root)}');
}

class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}

class bynarysearchtree {
  var root;

  inorder(Node? root) {
    if (root == null) {
      return;
    }

    inorder(root.left);
    print(root.value);
    inorder(root.right);
  }
  
 hight(Node? root){
  if (root == null) {
    return 0;
  }

  int lefthight=hight(root.left);
  int righthight=hight(root.right);

  return (lefthight > righthight) ? (lefthight+1):(righthight+1);
 }
   
  findcount(Node? root){
    if (root==null) {
      return 0;
    }

    return 1 + findcount(root.left) + findcount(root.right);
  }

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

  delete(Node? root, int value) {
    if (root == null) {
      return Exception('tree is empty');
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
    int min = root!.value!;
    while (root!.left != null) {
      min = root.left!.value!;
      root = root.left;
    }
    return min;
  }
}
