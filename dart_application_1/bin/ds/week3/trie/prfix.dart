class TrieNode {
  final Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  final TrieNode _root = TrieNode();

  void insert(String word) {
    TrieNode node = _root;
    for (int i = 0; i < word.length; i++) {
      final char = word[i];
      if (!node.children.containsKey(char)) {
        node.children[char] = TrieNode();
      }
      node = node.children[char]!;
    }
    node.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode? node = _getNode(word);
    return node != null && node.isEndOfWord;
  }

  bool startsWith(String prefix) {
    return _getNode(prefix) != null;
  }

  TrieNode? _getNode(String word) {
    TrieNode node = _root;
    for (int i = 0; i < word.length; i++) {
      final char = word[i];
      if (!node.children.containsKey(char)) {
        return null;
      }
      node = node.children[char]!;
    }
    return node;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("apple");
  trie.insert("app");
  trie.insert("application");

  print(trie.search("apple")); // Output: true
  print(trie.search("app")); // Output: true
  print(trie.search("appl")); // Output: false

  print(trie.startsWith("app")); // Output: true
  print(trie.startsWith("appl")); // Output: true
  print(trie.startsWith("test")); // Output: false
}
