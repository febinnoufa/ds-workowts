void main() {
  Trie trie = Trie();
  trie.insert('febin');
  trie.insert('feb');
  trie.insert('febinnoufan');
  trie.insert('vishnu');
  trie.insert('vishnujr');
  trie.insert('vajitha');

  print(trie.search('feb')); // Output: true
}

class Trie {
  Map<String, Trie> children = {};
  bool isEndOfWord = false;

  insert(String word) {
    var currentNode = this;

    for (int i = 0; i < word.length; i++) {
      String s = word[i];

      if (!currentNode.children.containsKey(s)) {
        currentNode.children[s] = Trie();
      }
      currentNode = currentNode.children[s]!;
    }
    currentNode.isEndOfWord = true;
  }

  bool search(String word) {
    var currentNode = this;

    for (var i = 0; i < word.length; i++) {
      String s = word[i];

      if (!currentNode.children.containsKey(s)) {
        return false;
      }
      currentNode = currentNode.children[s]!;
    }
    return currentNode.isEndOfWord;
  }
}
