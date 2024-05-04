void main() {
  BinarySearch bst = BinarySearch();
  bst.root = bst.insert(bst.root, 40);
  bst.root = bst.insert(bst.root, 20);
  bst.root = bst.insert(bst.root, 14);
  bst.root = bst.insert(bst.root, 20);
  bst.root = bst.insert(bst.root, 12);
  bst.root = bst.insert(bst.root, 4);
  bst.root = bst.insert(bst.root, 87);
  bst.root = bst.insert(bst.root, 1);
  bst.root = bst.insert(bst.root, 43);
  bst.root = bst.insert(bst.root, 21);
  bst.root = bst.delete(bst.root, 12);
  bst.inorder(bst.root);
  print('count: ${bst.count(bst.root)}');
  print('hight : ${bst.Hight(bst.root)}');
}

class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinarySearch {
  Node? root;

  Node? insert(Node? root, int value) {
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

  Node? delete(Node? root, int value) {
    if (root == null) {
      // Decide on appropriate error handling here
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

      root.value = findMin(root.right);
      root.right = delete(root.right, root.value!);
    }

    return root;
  }
  
  Hight(Node? root){
    if (root==null) {
      return 0;
    }else{
      int lefthight=Hight(root.left);
      int righthight=Hight(root.right);

      return (lefthight> righthight) ? (lefthight+1) : (righthight+1);
    }
  }
  count(Node? root) {
    if (root == null) {
      return 0;
    }
    return 1 + count(root.left) + count(root.right);
  }

  int findMin(Node? root) {
    int? min = root!.value;

    while (root!.left != null) {
      min = root.left!.value;
      root = root.left;
    }
    return min!;
  }

  void inorder(Node? root) {
    if (root == null) {
      return;
    }

    inorder(root.left);
    print(root.value);
    inorder(root.right);
  }
}
