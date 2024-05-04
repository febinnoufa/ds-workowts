bool isValid(String s) {
  // Create a stack to store opening brackets
  List<String> stack = [];

  // Map to store mapping of opening to closing brackets
  Map<String, String> mappings = {
    ")": "(",
    "}": "{",
    "]": "[",
  };

  // Iterate through each character in the input string
  for (int i = 0; i < s.length; i++) {
    String char = s[i];

    // If the current character is an opening bracket, push it onto the stack
    if (mappings.containsValue(char)) {
      stack.add(char);
    }
    // If the current character is a closing bracket
    else {
      // If the stack is empty or the corresponding opening bracket doesn't match, return false
      if (stack.isEmpty || stack.last != mappings[char]) {
        return false;
      }
      // Otherwise, pop the corresponding opening bracket from the stack
      else {
        stack.removeLast();
      }
    }
  }

  // If the stack is empty, all brackets are properly matched
  return stack.isEmpty;
}

void main() {
  String input1 = "()";
  String input2 = "()[]{}";
  String input3 = "(]";

  print('Input: $input1, Output: ${isValid(input1)}'); // Output: true
  print('Input: $input2, Output: ${isValid(input2)}'); // Output: true
  print('Input: $input3, Output: ${isValid(input3)}'); // Output: false
}
