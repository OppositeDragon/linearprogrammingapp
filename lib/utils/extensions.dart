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
