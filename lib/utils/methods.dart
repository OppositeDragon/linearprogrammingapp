import 'package:linearprogrammingapp/utils/extensions.dart';

String toStringWithSign(double number, int i, [bool addEquals = false, bool isRightSide = false]) {
  final equal = addEquals ? '=' : '';
  String sign = number.getSign();
  if (number == 0 || isRightSide) {
    sign = '\\;';
  }
  if (isRightSide) {
    return '$sign${'${number.abs()}'.deleteLastZero()}';
  }
  switch (number) {
    case 0:
      return '\\;$equal';
    case 1 || -1:
      return '${sign}x_{$i}$equal';
    default:
      return '$sign${number.abs().toString().deleteLastZero()}x_{$i}$equal';
  }
}

String combinationsEquation(int variables, int constraints, int factorial) {
  return 'C(n,r) = \\frac{$variables!}{${variables - constraints}!($variables-${variables - constraints})!} = $factorial';
}
