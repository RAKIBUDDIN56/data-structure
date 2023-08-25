/*
A linked list is a chain of nodes
Nodes have two responsibilies
1. Hold a value
2. Hold a reference to the next node unlesss it does not have a node
 */



class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return "$value";
    return "$value -> ${next.toString()}";
  }
}

void main() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;

  print(node1);
  print(node2);
  print(node3);

  final list = LinkedList<int>();
  list.push(13);
  list.push(12);
  list.push(11);

  print(list);

  list.append(1);
  list.append(2);
  list.append(3);

  print(list);

  print('Before: $list');

  final poppedValue = list.pop();

  print('After:  $list');
  print('Popped value: $poppedValue');
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  final removedValue = list.removeLast();

  print('After:  $list');
  print('Removed value: $removedValue');
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;
//push value to linkedList
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  //append to last
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }
  E? removeLast() {
    // 1
    if (head?.next == null) return pop();

    // 2
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    // 3
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }



  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}
