void main() {
  Bynarysearchtree bst = Bynarysearchtree();

  bst.root = bst.insert(bst.root, 30);
  bst.root = bst.insert(bst.root, 32);
  bst.root = bst.insert(bst.root, 2);
  bst.root = bst.insert(bst.root, 65);
  bst.root = bst.insert(bst.root, 8);
  bst.root = bst.insert(bst.root, 10);
  bst.root = bst.insert(bst.root, 300);
  bst.root = bst.insert(bst.root, 22);
  print('min value: ${bst.findmin(bst.root)}');
  print('max value: ${bst.findmax(bst.root)}');
  print('count: ${bst.findcount(bst.root)}');
  int val = 200;
  print('$val contains in the tree : ${bst.contains(bst.root, val)}');

  bst.inorder(bst.root);

 // bst.deletekth(bst.root, 3);
  print('after');
   bst.inorder(bst.root);


}

class Node {
  int? value;
  Node? left;
  Node? right;
  Node(this.value);
}

class Bynarysearchtree {
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

  contains(Node? root, int value) {
    if (root == null) {
      return false;
    }

    if (root.value == value) {
      return true;
    } else if (value < root.value!) {
      return contains(root.left, value);
    } else if (value > root.value!) {
      return contains(root.right, value);
    }
  }

  findcount(Node? root) {
    if (root == null) {
      return 0;
    }
    return 1 + findcount(root.left) + findcount(root.right);
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
  }

  findmin(Node? root) {
    int min = root!.value!;
    while (root!.left != null) {
      min = root.left!.value!;
      root = root.left;
    }
    return min;
  }

  deletekth(Node? root, int k) {
    if (root == null && k < 1) {
      print('k is not valied');
      return root;
    }

    int count = findcount(root!.left) + 1;

    if (k < count) {
      root.left = deletekth(root.left, k);
    } else if (k > count) {
      root.right = deletekth(root.right, k-count);
    } else {
      root =del(root);
    }
  }
  del(Node? root){
    if (root==null) {
      return null;
    }

    if (root.left ==null) {
      return root.right;
    }else if(root.right ==null){
      return root.left;
    }

    root.value=findmax(root.left);
    root.left = deletekth(root.left, root.value!);
    return root;
  }

  findmax(Node? root) {
    int max = root!.value!;
    while (root!.right != null) {
      max = root.right!.value!;
      root = root.right;
    }
    return max;
  }

  inorder(Node? root) {
    if (root == null) {
      return;
    }
    inorder(root.left);
    print(root.value);
    inorder(root.right);
  }
}



int i=0;
