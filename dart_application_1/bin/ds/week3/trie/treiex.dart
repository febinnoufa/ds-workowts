void main() {
  Trie trie = Trie();
  trie.insert('febin');
  trie.insert('faisal');
  trie.insert('noufan');
  print(trie.Search('febin'));
  print(trie.Search('fe'));
}

class Trie {
  Map<String, Trie> children = {};
  bool isEndOfWord = false;

  void insert(String word) {
    Trie currentNode = this;

    for (int i = 0; i < word.length; i++) {
      String char = word[i];

      if (!currentNode.children.containsKey(char)) {
        currentNode.children[char] = Trie();
      }
      currentNode = currentNode.children[char]!;
    }
    currentNode.isEndOfWord = true;
  }

  bool Search(String word) {
    Trie? curent = this;

    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!curent!.children.containsKey(char)) {
        return false;
      }
      curent = curent.children[char];
    }
    return curent != null && curent.isEndOfWord;
  }
}
