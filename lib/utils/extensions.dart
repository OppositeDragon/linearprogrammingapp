import 'dart:math';

import 'package:decimal/decimal.dart';

extension IntExtension<T extends num> on T {
  String getSign() {
    return this < 0 ? '-' : '+';
  }

  int factorial() {
    if (this is int) {
      int number = this as int;
      if (number == 0) {
        return 1;
      }
      int result = number;
      number--;
      while (number > 1) {
        result *= number;
        number--;
      }
      return result;
    }
    throw Exception('must be int');
  }
}

extension DoubleExtension on double {
  double roundToNextMagnitude() {
    int magnitude;
    if (abs() > 1) {
      magnitude = (log(abs()) / ln10 - 1).floor();
    } else {
      magnitude = (log(abs()) / ln10).floor();
    }
    double roundingFactor = pow(10, magnitude).toDouble();
    double roundedNumber = (this / roundingFactor).ceilToDouble();
    return roundedNumber * roundingFactor;
  }

  Decimal toDecimal() {
    return Decimal.parse(toString());
  }
}

extension ListExtension<T extends num> on List<T> {
  List<T> operator *(T other) {
    return [for (var i = 0; i < length; i++) this[i] == 0 ? this[i] : this[i] * other as T];
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String deleteLastZero() {
    String str = this;
    if (str == 'NaN') {
      return 'undefined';
    }
    while ((str.endsWith('0') || str.endsWith('.')) && str.length > 1) {
      if (str.endsWith('.')) {
        str = str.substring(0, str.length - 1);
        break;
      }
      str = str.substring(0, str.length - 1);
    }
    return str;
  }
}

extension MatrixExtension<T> on List<List<T>> {
  List<List<T>> transpose() {
    List<List<T>> transposed = [];
    for (var i = 0; i < this[0].length; i++) {
      List<T> aux = [];
      for (var j = 0; j < length; j++) {
        aux.add(this[j][i]);
      }
      transposed.add(aux);
    }
    return transposed;
  }

  String toStringMatrix() {
    String str = '[\n';
    for (var i = 0; i < length; i++) {
      str += '\t${this[i]}\n';
    }
    str += ']';
    return str;
  }
}
