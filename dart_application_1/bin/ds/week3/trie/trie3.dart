void main() {
  Trie trie = Trie();
  trie.insertion('abcd');
  trie.insertion('abce');
  trie.insertion('ab');
  trie.insertion('fghi');
  trie.insertion('fguy');
  trie.insertion('klmn');

  print(trie.search('a'));
}

class Trie {
  Map<String, Trie> children = {};
  bool isEndOfWord = false;

  insertion(String word) {
    var curent = this;
    for (int i = 0; i < word.length; i++) {
      String s = word[i];
      if (!curent.children.containsKey(s)) {
        curent.children[s] = Trie();
      }
      curent = curent.children[s]!;
    }
    isEndOfWord = true;
  }

  search(String word) {
    var curent = this;
    for (int i = 0; i < word.length; i++) {
      String s = word[i];
      if (!curent.children.containsKey(s)) {
        return false;
      }
      curent = curent.children[s]!;
    }
    return curent != null && isEndOfWord;
  }
}
