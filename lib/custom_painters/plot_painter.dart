import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linearprogrammingapp/constants/enums.dart';

class PlotPainter extends CustomPainter {
  PlotPainter({
    required this.theme,
    required this.constraints,
    required this.objective,
    required this.objectiveFunction,
  });
  final ThemeData theme;
  final List<List<double>> constraints;
  Objectives objective;
  List<double> objectiveFunction;
  double limitX = 0;
  double limitY = 0;
  List<({Offset offset1, Offset offset2})> trueintersection = [];
  late List<({double x, double y})> intersections = [];

  void interceptions2() {
    for (final eq in constraints) {
      final [first, second, ..., last] = eq;
      final double intX = first == 0 ? 0 : last / first;
      final double intY = second == 0 ? 0 : last / second;
      intersections.add((x: intX, y: intY));
    }
    for (var inter in intersections) {
      if (inter.x > limitX) limitX = inter.x;
      if (inter.y > limitY) limitY = inter.y;
    }
  }

  void interceptions(double numerationLimitX, double numerationLimitY) {
    for (final eq in constraints) {
      final [first, second, ..., last] = eq;
      // intersections.add(intersection(first, second, last));
      trueintersection.add(intersection2(first, second, last, numerationLimitX, numerationLimitY));
    }
  }

  ({double x, double y}) intersection(double x, double y, double z) {
    final double intX = x == 0 ? 0 : z / x;
    final double intY = y == 0 ? 0 : z / y;
    return (x: intX, y: intY);
  }

  ({Offset offset1, Offset offset2}) intersection2(double x, double y, double z, double maxX, double maxY) {
//offset 1
    double o1x = x == 0 ? 0 : (z - (y * maxY)) / x;
    if (o1x < 0) {
      o1x = 0;
    }
    double o1y = y == 0 ? 0 : (z - (o1x * x)) / y;
//offset 2
    double o2y = y == 0 ? maxY : (z - (x * maxX)) / y;
    if (o2y < 0) {
      o2y = 0;
    }
    double o2x = x == 0 ? maxX : (z - (o2y * y)) / x;
    return (offset1: Offset(o1x, o1y), offset2: Offset(o2x, o2y));
  }

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

  List<Offset> findIntersectionsBetweenCostraints() {
    List<Offset> vertices = [];

    for (int i = 0; i < constraints.length - 1; i++) {
      for (int j = i + 1; j < constraints.length; j++) {
        final [a1, b1, ..., c1] = constraints[i];
        final [a2, b2, ..., c2] = constraints[j];

        double determinant = a1 * b2 - a2 * b1;

        if (determinant != 0) {
          double x = (c1 * b2 - c2 * b1) / determinant;
          double y = (a1 * c2 - a2 * c1) / determinant;
          if (x >= 0 && y >= 0) {
            vertices.add(Offset(x, y));
          }
        }
      }
    }
    return vertices;
  }

  List<Offset> findIntersectionsBetweenCostraintsAndPath() {
    List<Offset> vertices = [];

    for (int i = 0; i < constraints.length - 1; i++) {
      for (int j = i + 1; j < constraints.length; j++) {
        final [a1, b1, ..., c1] = constraints[i];
        final [a2, b2, ..., c2] = constraints[j];

        double determinant = a1 * b2 - a2 * b1;

        if (determinant != 0) {
          double x = (c1 * b2 - c2 * b1) / determinant;
          double y = (a1 * c2 - a2 * c1) / determinant;
          if (x >= 0 && y >= 0) {
            vertices.add(Offset(x, y));
          }
        }
      }
    }
    return vertices;
  }

  Path findIntersectionsOfPaths(List<Path> paths) {
    Path path = paths[0];
    for (var i = 1; i < paths.length; i++) {
      path = Path.combine(PathOperation.intersect, path, paths[i]);
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    interceptions2();
    double numerationLimitX = roundToNextMagnitude(limitX); //(limitX / 100).ceil() * 10;
    double numerationLimitY = roundToNextMagnitude(limitY);
    interceptions(numerationLimitX, numerationLimitY);

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
    final unitX = availableX / numerationLimitX;
    final unitY = availableY / numerationLimitY;

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

    List<Path> paths = [];
    for (int i = 0; i < trueintersection.length; i++) {
      final path = drawFunction2(trueintersection[i], leftMargin, topMargin, availableY, unitY, availableX, canvas,
          paths, unitX, paint, getColorFromHSL(i, trueintersection.length), offsetX, offsetY);
      paths.add(path);
    }
//draw feaseable region
    final paint3 = Paint()
      ..color = theme.colorScheme.primary.withOpacity(0.2)
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    final intercs = findIntersectionsBetweenCostraints();
    final points = [
      for (final point in intercs) Offset(leftMargin + point.dx * unitX, size.height - topMargin - point.dy * unitY)
    ];
    final feasibleRegion = findIntersectionsOfPaths(paths);
    final pointsContained = [
      for (int i = 0; i < points.length; i++)
        if (feasibleRegion.contains(points[i])) intercs[i]
    ];
    debugPrint('pointsContained: $pointsContained');
    //  final computed = feasibleRegion.computeMetrics().toList();
    canvas.drawPath(feasibleRegion, paint3);
    final centerOfREgion = feasibleRegion.getBounds().centerLeft + Offset(feasibleRegion.getBounds().center.dx / 2, 0);
    final TextSpan span = TextSpan(style: textStyle.copyWith(fontFamily: 'CMRomanSerif'), text: 'feasible\nregion');
    TextPainter(text: span, textDirection: TextDirection.ltr, textAlign: TextAlign.center)
      ..layout()
      ..paint(canvas, centerOfREgion);
    double xAnswer = -1, yAnswer = -1, zAnswer = -1;
    final [first, seccond, ...] = objectiveFunction;
    if (objective == Objectives.max) {
      for (var point in pointsContained) {
        if (first * point.dx + seccond * point.dy > zAnswer) {
          xAnswer = point.dx;
          yAnswer = point.dy;
          zAnswer = first * point.dx + seccond * point.dy;
        }
      }
    }
    final objFuncItersection = intersection2(first, seccond, zAnswer, numerationLimitX, numerationLimitY);
    drawFunction2(objFuncItersection, leftMargin, topMargin, availableY, unitY, availableX, canvas, paths, unitX, paint,
        getColorFromHSL(trueintersection.length + 1, trueintersection.length + 1), offsetX, offsetY);
    canvas.drawCircle(Offset(leftMargin + (xAnswer * unitX), topMargin + availableY - (yAnswer * unitY)), 3,
        paint..color = theme.colorScheme.onSurface);
  }

  Path drawFunction2(
      ({Offset offset1, Offset offset2}) inter,
      double leftMargin,
      double topMargin,
      double availableY,
      double unitY,
      double availableX,
      Canvas canvas,
      List<Path> paths,
      double unitX,
      Paint paint,
      Color color,
      double offsetX,
      double offsetY) {
    final x1 = leftMargin + (inter.offset1.dx * unitX);
    final y1 = topMargin + availableY - (inter.offset1.dy * unitY);
    final x2 = leftMargin + ((inter.offset2.dx * unitX));
    final y2 = topMargin + availableY - (inter.offset2.dy * unitY);
    canvas.drawLine(
      Offset(x1, y1),
      Offset(x2, y2),
      paint..color = color,
    );
    if (x1 == x2) {
      return Path()
        ..moveTo(x1, y1)
        ..lineTo(x1, y2)
        ..lineTo(leftMargin, y2)
        ..lineTo(leftMargin, y1);
    } else if (y1 == y2) {
      return Path()
        ..moveTo(x1, y1)
        ..lineTo(x2, y1)
        ..lineTo(x2, availableY + topMargin)
        ..lineTo(x1, availableY + topMargin);
    } else {
      return Path()
        ..moveTo(x1, y1)
        ..lineTo(x2, y2)
        ..lineTo(leftMargin, y2)
        ..lineTo(leftMargin, y1);
    }
  }
	
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
