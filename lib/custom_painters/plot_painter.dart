import 'dart:math';

import 'package:flutter/material.dart';

class PlotPainter extends CustomPainter {
  PlotPainter({
    required this.theme,
    required this.limitX,
    required this.limitY,
    required this.intersections,
  });
  final ThemeData theme;
  final double limitX;
  final double limitY;
  final List<({double x, double y})> intersections;

  double roundToNextMagnitude(double number) {
    int magnitude;
    if (number.abs() > 1) {
      magnitude = (log(number.abs()) / ln10 - 1).floor();
    } else {
      magnitude = (log(number.abs()) / ln10).floor();
    }
    double roundingFactor = pow(10, magnitude).toDouble();
    double roundedNumber = (number / roundingFactor).ceilToDouble();
    double result = roundedNumber * roundingFactor;
    return result;
  }

  int countLeadingZeros(double value) {
    String valueString = value.toString();
    int decimalIndex = valueString.indexOf('.');
    String decimalPart = valueString.substring(decimalIndex + 1);
    RegExp regex = RegExp('^0+');
    final match = regex.firstMatch(decimalPart);
    int count = match?.group(0)?.length ?? 0;
    return count;
  }

  String deleteLastZero(String str) {
    while (str.endsWith('0')) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  Color getColorFromHSL(int index, int length) {
    final double value = theme.brightness == Brightness.dark ? 0.75 : 0.45;
    return HSLColor.fromAHSL(
      1,
      index * 0.95 * 360 / length,
      1,
      ((index % 4 == 3 ? 1 : 0) / -4) + value,
    ).toColor();
  }

  @override
  void paint(Canvas canvas, Size size) {
    double numerationLimitX = roundToNextMagnitude(limitX); //(limitX / 100).ceil() * 10;
    final numerationLimitY = roundToNextMagnitude(limitY);

    const int segmentsX = 5;
    const int segmentsY = 5;

    var stepX = numerationLimitX / segmentsX;
    final stepY = numerationLimitY / segmentsY;
    final marksNumX = List.generate(segmentsX, (index) => stepX * (index + 1));
    final marksStrX = List.generate(
        marksNumX.length,
        (index) => marksNumX[index] % 1 == 0
            ? marksNumX[index].toInt().toString()
            : deleteLastZero(marksNumX[index].toStringAsFixed(countLeadingZeros(marksNumX[index]) + 2)));
    final marksNumY = List.generate(segmentsY, (index) => stepY * (index + 1));
    final marksStrY = List.generate(
        marksNumY.length,
        (index) => marksNumY[index] % 1 == 0
            ? marksNumY[index].toInt().toString()
            : deleteLastZero(marksNumY[index].toStringAsFixed(countLeadingZeros(marksNumY[index]) + 2)));
    final longestNumberY = marksStrY.reduce((value, element) => value.length > element.length ? value : element);
    final textStyle = theme.textTheme.bodyLarge!.copyWith(fontFamily: 'CMRomanSerif', fontWeight: FontWeight.bold);

    final textPainterX = TextPainter(
      text: TextSpan(style: textStyle, text: numerationLimitX.toString()),
      textDirection: TextDirection.ltr,
    )..layout();
    final textPainterY = TextPainter(
      text: TextSpan(style: textStyle, text: longestNumberY),
      textDirection: TextDirection.ltr,
    )..layout();

    //calculate margins
    final leftMargin = 15.0 + textPainterY.width;
    final rightMargin = 25.0 + textPainterX.width / 2;
    const topMargin = 30.0;
    const bottomMargin = 30.0;

    //calculate avalable space and offsets
    final availableX = (size.width - leftMargin - rightMargin);
    final availableY = (size.height - topMargin - bottomMargin);
    final offsetX = availableX / segmentsX;
    final offsetY = availableY / segmentsY;

    final paint = Paint()
      ..color = theme.colorScheme.onBackground
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final rectagle = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawRect(rectagle, paint);
    //y-axis line
    canvas.drawLine(
      Offset(leftMargin, topMargin / 2),
      Offset(leftMargin, size.height - bottomMargin + 12),
      paint,
    );
    //y-axis arrow
    final Path arrowPathY = Path()
      ..moveTo(leftMargin, topMargin / 2)
      ..lineTo(leftMargin - 5, topMargin / 2 + 4)
      ..lineTo(leftMargin, topMargin / 2 - 8)
      ..lineTo(leftMargin + 5, topMargin / 2 + 4)
      ..lineTo(leftMargin, topMargin / 2);
    canvas.drawPath(arrowPathY, paint..style = PaintingStyle.fill);
    //x-axis line
    canvas.drawLine(
      Offset(leftMargin - 12, size.height - bottomMargin),
      Offset(size.width - rightMargin / 2, size.height - bottomMargin),
      paint,
    );
    //x-axis arrow
    final arrowPosition = size.width - rightMargin / 2;
    final Path arrowPathX = Path()
      ..moveTo(arrowPosition, size.height - bottomMargin)
      ..lineTo(arrowPosition - 4, size.height - bottomMargin - 5)
      ..lineTo(arrowPosition + 8, size.height - bottomMargin)
      ..lineTo(arrowPosition - 4, size.height - bottomMargin + 5)
      ..lineTo(arrowPosition, size.height - bottomMargin);
    canvas.drawPath(arrowPathX, paint);
    //numbers and marks on x-axis
    double dx = leftMargin;
    for (int i = 0; i < marksStrX.length; i++) {
      dx += offsetX;
      final TextSpan span = TextSpan(style: textStyle, text: marksStrX[i]);
      final textPainter = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(canvas, Offset(dx - (textPainter.width / 2), size.height - bottomMargin + 4));
      canvas.drawLine(Offset(dx, size.height - bottomMargin - 1), Offset(dx, size.height - bottomMargin + 4), paint);
    }
    //numbers and marks on y-axis
    double dy = size.height - bottomMargin;
    for (int i = 0; i < marksStrY.length; i++) {
      dy -= offsetY;
      final TextSpan span = TextSpan(style: textStyle, text: marksStrY[i]);
      final textPainter = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(canvas, Offset(leftMargin - textPainter.width - 5, dy - textPainterY.height / 2));
      canvas.drawLine(Offset(leftMargin - 1, dy), Offset(leftMargin + 4, dy), paint);
    }

    final unitX = availableX / numerationLimitX;
    final unitY = availableY / numerationLimitY;

    for (int i = 0; i < intersections.length; i++) {
      final inter = intersections[i];
      final color = getColorFromHSL(i, intersections.length);

      if (inter.x == 0) {
        final paint1 = Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;
        canvas.drawLine(
          Offset(leftMargin, topMargin + availableY - (unitY * inter.y)),
          Offset(leftMargin + availableX, topMargin + availableY - (unitY * inter.y)),
          paint1,
        );
        continue;
      } else if (inter.y == 0) {
        final paint2 = Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;
        canvas.drawLine(
          Offset(leftMargin + unitX * inter.x, topMargin),
          Offset(leftMargin + unitX * inter.x, topMargin + availableY),
          paint2,
        );
        continue;
      } else {
        canvas.drawLine(
          Offset(leftMargin, topMargin + availableY - (unitY * inter.y)),
          Offset(leftMargin + unitX * inter.x, topMargin + availableY),
          paint..color = color,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
