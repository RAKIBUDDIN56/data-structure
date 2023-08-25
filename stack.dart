class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  void push(E element) => _storage.add(element);
  E pop() => _storage.removeLast();

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.join('\n')}'
        '\n-----------';
  }
}

void main() {
  final stack = Stack<int>();
  stack.push(3);
  stack.push(4);
  stack.push(6);
  stack.push(13);
  print(stack);

  final value = stack.pop();
  print("Popped: $value");
}
