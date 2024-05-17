import 'dart:math';

extension ListExtensions<T> on List<T> {
  T randomItem() {
    return this[Random().nextInt(length)];
  }

  bool hasItem(T item) {
    for (var i = 0; i < length; i++) {
      if (this[i] == item) {
        return true;
      }
    }
    return false;
  }
}
