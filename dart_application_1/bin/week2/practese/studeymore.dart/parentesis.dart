// bool isBalanced(String expression) {
//   List<String> stack = [];

//   for (int i = 0; i < expression.length; i++) {
//     String char = expression[i];
//     if (char == '(') {
//       stack.add(char);
//     } else if (char == ')') {
//       if (stack.isEmpty || stack.last != '(') {
//         return false; // Unbalanced parentheses
//       }
//       stack.removeLast(); // Matching pair found, remove opening parenthesis from stack
//     }
//   }

//   // If the stack is empty, all parentheses are balanced
//   return stack.isEmpty;
// }

isBalanced(String str) {
  List stack = [];

  for (var i = 0; i < str.length; i++) {
    String c = str[i];
    if (c == '(') {
      stack.add(c);
    } else if (c == ')') {
      if (stack.isEmpty || stack.last != '(') {
        return false;
      }
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}

void main() {
  String expression1 = "(())";
  String expression2 = "((()))";
  String expression3 = "(()";
  String expression4 = "())";

  print(isBalanced(expression1)); // Output: true
  print(isBalanced(expression2)); // Output: true
  print(isBalanced(expression3)); // Output: false
  print(isBalanced(expression4)); // Output: false
}
