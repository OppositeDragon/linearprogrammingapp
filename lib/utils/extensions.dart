import 'dart:math';

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
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String deleteLastZero() {
    String str = this;
    if (str == 'NaN') {
      return 'indefinido';
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
