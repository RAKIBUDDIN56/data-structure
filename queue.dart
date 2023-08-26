abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => (isEmpty) ? null : _list.first;
  @override
  String toString() => _list.toString();
}

void main() {
  final queue = QueueList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}
/*Queue takes a FIFO strategy: an element added first must also be removed first.
Enqueue adds an element to the back of the queue.
Dequeue removes the element at the front of the queue.
Elements in a list are laid out in contiguous memory blocks, whereas elements in a linked list are more scattered with the potential for cache misses.
A ring-buffer-based implementation is good for queues with a fixed size.
Compared to a single list-based implementation, leveraging two stacks improves the dequeue time complexity to an amortized O(1) operation.
The double-stack implementation beats out linked-list in terms of spatial locality.

 */