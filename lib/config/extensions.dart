extension IterableX<E> on Iterable<E> {
  Iterable<T> mapI<T>(T Function(E e, int i) toElement) sync* {
    for (var i = 0; i < length; i++) {
      yield toElement(elementAt(i), i);
    }
  }
}
