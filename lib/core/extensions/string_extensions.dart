extension StringExtensions on String? {
  bool isEmptyOrNull() {
    if (this == null) {
      return true;
    }
    if (this!.isEmpty) {
      return true;
    }
    return false;
  }

  bool isNotEmptyOrNull() {
    if (this == null) {
      return false;
    }
    if (this!.isEmpty) {
      return false;
    }
    return true;
  }
}

extension ListExtensions<T> on List<T>? {
  bool isNotEmptyOrNull() {
    if (this == null) {
      return false;
    }
    if (this!.isEmpty) {
      return false;
    }
    return true;
  }

  bool get isNullOrEmpty {
    if (this == null) return true;

    if (this!.isEmpty) return true;

    return false;
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  T? get firstOrNull {
    if (isNotNullOrEmpty) return this!.first;
    return null;
  }

  T? firstWhereOrNull(bool Function(T) test) {
    if (isNullOrEmpty) return null;

    for (final e in this!) {
      if (test(e)) {
        return e;
      }
    }
    return null;
  }

  bool isNotNull(int index) {
    if (isNullOrEmpty) return false;

    if (index < 0) return false;

    return true;
  }

  T? lastWhereOrNull(bool Function(T) test) {
    if (isNullOrEmpty) return null;

    List<T> list = List.empty(growable: true);

    for (final e in this!) {
      if (test(e)) {
        list.add(e);
      }
    }

    if (list.isNullOrEmpty) return null;

    return list.last;
  }

  bool constantIndex(int i) {
    if (isNullOrEmpty) return false;

    if (i < 0) return false;

    if (i > this!.length - 1) {
      return false;
    }

    return true;
  }
}
