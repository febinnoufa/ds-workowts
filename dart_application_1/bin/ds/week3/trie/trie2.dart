void main() {
  trie tr = trie();

}

class trie {
  Map<String, trie> children = {};

  bool isEndOfWord = false;

  insert(String word) {
    trie current = this;

    for (var i = 0; i < word.length; i++) {
      String s = word[i];

      if (!current.children.containsKey(s)) {
        current.children[s] = trie();
      }
      current = current.children[s]!;
    }
    current.isEndOfWord = true;
  }

  search(String word) {
    trie curent = this;

    for (var i = 0; i < word.length; i++) {
      String s = word[i];

      if (!curent.children.containsKey(s)) {
        return false;
      }
      curent = curent.children[s]!;
    }

    return curent != null && curent.isEndOfWord;
  }
}
