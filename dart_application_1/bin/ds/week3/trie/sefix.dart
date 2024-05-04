class TrieNode {
  final Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  final TrieNode _root = TrieNode();

  void insert(String word) {
    TrieNode node = _root;
    for (int i = word.length - 1; i >= 0; i--) {
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

  bool endsWith(String suffix) {
    TrieNode? node = _getNode(suffix);
    return node != null;
  }

  TrieNode? _getNode(String word) {
    TrieNode node = _root;
    for (int i = word.length - 1; i >= 0; i--) {
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

  print(trie.search("apple"));     // Output: true
  print(trie.search("app"));       // Output: true
  print(trie.search("ppl"));       // Output: false

  print(trie.endsWith("ple"));     // Output: true
  print(trie.endsWith("ppl"));     // Output: true
  print(trie.endsWith("xyz"));     // Output: false
}
