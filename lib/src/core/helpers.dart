class Helpers {
  static List<T?> defaultNulls<T>(int count) {
    return Iterable<T?>.generate(count, (_) => null).toList();
  }
}
