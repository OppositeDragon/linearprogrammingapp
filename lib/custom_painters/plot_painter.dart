import 'dart:math';

import 'package:flutter/material.dart';

extension Num on num {
  int length() => toString().length;
}

class PlotPainter extends CustomPainter {
  PlotPainter({required this.theme, required this.limitX, required this.limitY});
  final ThemeData theme;
  final double limitX;
  final double limitY;

  double getRoundedMaxValue(double maximum) {
    double magnitude = (log(maximum) / log(10)).floor().toDouble();
    double roundingFactor = pow(10, magnitude).toDouble();
    double roundedRange = (maximum / roundingFactor).ceil().toDouble();
    double roundedMaximum = roundedRange * roundingFactor;
    print('desiredMaximum: $roundedMaximum');
    return roundedMaximum;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double numerationLimitX = getRoundedMaxValue(301); //(limitX / 100).ceil() * 10;
    final numerationLimitY = (limitY / 10).ceil() * 10;

    final textStyle = theme.textTheme.bodyMedium!.copyWith(fontFamily: 'Computer Modern');

    final textPainterX = TextPainter(
        text: TextSpan(style: textStyle, text: numerationLimitX.toString()), textDirection: TextDirection.ltr)
      ..layout();
    const leftMargin = 30.0;
    final rightMargin = 25.0 + textPainterX.width / 2;
    const topMargin = 30.0;
    const bottomMargin = 30.0;

    const segmentsX = 5;
    const segmentsY = 5;
    //calculate offsets
    final offsetX = (size.width - leftMargin - rightMargin) / segmentsX;

    final paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final rectagle = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawRect(rectagle, paint);
    //y-axis
    canvas.drawLine(
      const Offset(leftMargin, topMargin),
      Offset(leftMargin, size.height - bottomMargin / 1.5),
      paint..color = Colors.yellow,
    );
    //x-axis
    canvas.drawLine(
      Offset(leftMargin / 1.5, size.height - bottomMargin),
      Offset(size.width - rightMargin / 2, size.height - bottomMargin),
      paint..color = Colors.red,
    );

    // var stepX = (numerationLimitX * 1.1 / 10).toDouble();
    // numerationLimitX = (stepX * 10);
    var stepX = numerationLimitX / segmentsX;
    //numerationLimitX = (stepX * 5).ceil().toDouble();
    print('stepX: $stepX, numerationLimitX: $numerationLimitX');
    for (int i = stepX.toInt(); i <= numerationLimitX; i += stepX.toInt()) {
      TextSpan span = TextSpan(style: textStyle, text: i.toString());
      final textPainter = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      )..layout();
      final double dx = ((i) * offsetX / stepX) + leftMargin - textPainter.width / 2;

      textPainter.paint(canvas, Offset(dx, size.height - bottomMargin));
    }
    paint.color = Colors.blue;
    for (int i = 0; i <= numerationLimitX; i += stepX.toInt()) {
      final double dx = ((i) * offsetX / stepX) + leftMargin;
      canvas.drawLine(Offset(dx, size.height - bottomMargin - 5), Offset(dx, size.height - bottomMargin + 5), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
