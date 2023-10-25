import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linearprogrammingapp/constants/colors.dart';
import 'package:linearprogrammingapp/constants/enums.dart';

typedef PointPair = ({Point p1, Point p2});

class PlotPainter extends CustomPainter {
  PlotPainter({
    required this.theme,
    required this.constraints,
    required this.objective,
    required this.objectiveFunction,
  });
  final ThemeData theme;
  final List<List<double>> constraints;
  final Objectives objective;
  final List<double> objectiveFunction;
  // List<Offset> intersections = [];

  List<Point<double>> findIntersectionsWithAxes() {
    final List<Point<double>> intersections = [];
    for (int i = 0; i < constraints.length; i++) {
      final [x1, x2, ..., x3] = constraints[i];
      if (x1 != 0) {
        final x1Whenx2 = x3 / x1;
        intersections.add(Point(x1Whenx2, 0));
      }
      if (x2 != 0) {
        final x2Whenx1 = x3 / x2;
        intersections.add(Point(0, x2Whenx1));
      }
    }
    return intersections;
  }

  Point<double> findBiggestIntersectionsOnAxes() {
    final intersections = findIntersectionsWithAxes();
    double maxX = 0, maxY = 0;
    for (final intersection in intersections) {
      if (intersection.x > maxX) maxX = intersection.x;
      if (intersection.y > maxY) maxY = intersection.y;
    }
    return Point(maxX, maxY);
  }

  List<PointPair> findIntersectionsBetweenConstraintsAndLimits(double numerationLimitX, double numerationLimitY) {
    List<PointPair> trueIntersections = [];
    for (final eq in constraints) {
      final [first, second, ..., last] = eq;
      trueIntersections.add(findIntersectionConstraintLimit(first, second, last, numerationLimitX, numerationLimitY));
    }
    return trueIntersections;
  }

  PointPair findIntersectionConstraintLimit(
      double x, double y, double z, double numerationLimitX, double numerationLimitY) {
    //offset 1
    double p1x = x == 0 ? 0 : (z - (y * numerationLimitY)) / x;
    if (p1x < 0) {
      p1x = 0;
    }
    double p1y = y == 0 ? 0 : (z - (p1x * x)) / y;
    //offset 2
    double p2y = y == 0 ? numerationLimitY : (z - (x * numerationLimitX)) / y;
    if (p2y < 0) {
      p2y = 0;
    }
    double p2x = x == 0 ? numerationLimitX : (z - (p2y * y)) / x;
    return (p1: Point(p1x, p1y), p2: Point(p2x, p2y));
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
    return roundedNumber * roundingFactor;
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

  Color getColor(int index) {
    assert(colorsOnBlack.length == colorsOnWhite.length, 'colors list must be same lenght');
    final bool isDark = theme.brightness == Brightness.dark;
    if (index == -1) index = colorsOnBlack.length - 1;
    if (isDark) {
      return colorsOnBlack[index];
    }
    return colorsOnWhite[index];
  }

  List<Point<double>> findIntersectionsBetweenCostraints() {
    List<Point<double>> vertices = [];

    for (int i = 0; i < constraints.length - 1; i++) {
      final [a1, b1, ..., c1] = constraints[i];
      for (int j = i + 1; j < constraints.length; j++) {
        final [a2, b2, ..., c2] = constraints[j];

        double determinant = a1 * b2 - a2 * b1;

        if (determinant != 0) {
          double x = (c1 * b2 - c2 * b1) / determinant;
          double y = (a1 * c2 - a2 * c1) / determinant;
          if (x >= 0 && y >= 0) {
            vertices.add(Point(x, y));
          }
        }
      }
    }
    vertices.addAll(findIntersectionsWithAxes());

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

  Path findPathsIntersection(List<Path> paths) {
    if (paths.isEmpty) return Path();
    Path path = paths.first;
    for (var i = 1; i < paths.length; i++) {
      path = Path.combine(PathOperation.intersect, path, paths[i]);
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final limit = findBiggestIntersectionsOnAxes();
    if (limit.x == 0 || limit.y == 0) return;
    final double numerationLimitX = roundToNextMagnitude(limit.x);
    final double numerationLimitY = roundToNextMagnitude(limit.y);
    final trueIntersections = findIntersectionsBetweenConstraintsAndLimits(numerationLimitX, numerationLimitY);

    const int segmentsX = 5;
    const int segmentsY = 5;
    final stepX = numerationLimitX / segmentsX;
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

    List<Path> paths = [
      for (int i = 0; i < trueIntersections.length; i++)
        drawFunctionLine(
          trueIntersections[i],
          leftMargin,
          topMargin,
          availableY,
          unitY,
          availableX,
          canvas,
          unitX,
          paint,
          getColor(i),
          offsetX,
          offsetY,
        )
    ];

    final constraintsIntersections = findIntersectionsBetweenCostraints();
    final feasibleRegion = findPathsIntersection(paths);
    final pointsinFeasibleRegion = [
      for (final intersection in constraintsIntersections)
        if (feasibleRegion.contains(
          Offset(leftMargin + intersection.x * unitX, size.height - topMargin - intersection.y * unitY),
        ))
          intersection
    ];

    //draw feaseable region
    final paint3 = Paint()
      ..color = theme.colorScheme.primary.withOpacity(0.15)
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    canvas.drawPath(feasibleRegion, paint3);
    final centerOfREgion = feasibleRegion.getBounds().centerLeft + Offset(feasibleRegion.getBounds().center.dx / 2, 0);
    final TextSpan span = TextSpan(
        style: textStyle.copyWith(fontFamily: 'CMRomanSerif', fontWeight: FontWeight.w100), text: 'feasible\nregion');
    TextPainter(text: span, textDirection: TextDirection.ltr, textAlign: TextAlign.center)
      ..layout()
      ..paint(canvas, centerOfREgion);
    double xAnswer = -1, yAnswer = -1, zAnswer = -1;
    final [x1, x2, ...] = objectiveFunction;
    for (var (index, point) in pointsinFeasibleRegion.indexed) {
      final double result = x1 * point.x + x2 * point.y;
      if (index == 0) {
        xAnswer = point.x;
        yAnswer = point.y;
        zAnswer = result;
        continue;
      }
      switch (objective) {
        case Objectives.max:
          if (result > zAnswer) {
            xAnswer = point.x;
            yAnswer = point.y;
            zAnswer = result;
          }
          break;
        case Objectives.min:
          if (result > 0 && result < zAnswer) {
            xAnswer = point.x;
            yAnswer = point.y;
            zAnswer = result;
          }
          break;
      }
    }
    final objectiveFunctionIntersection =
        findIntersectionConstraintLimit(x1, x2, zAnswer, numerationLimitX, numerationLimitY);
    final color = getColor(-1);
    drawFunctionLine(objectiveFunctionIntersection, leftMargin, topMargin, availableY, unitY, availableX, canvas, unitX,
        paint, color, offsetX, offsetY);
    canvas.drawCircle(Offset(leftMargin + (xAnswer * unitX), topMargin + availableY - (yAnswer * unitY)), 3,
        paint..color = theme.colorScheme.onSurface);
  }

  Path drawFunctionLine(
    PointPair inter,
    double leftMargin,
    double topMargin,
    double availableY,
    double unitY,
    double availableX,
    Canvas canvas,
    double unitX,
    Paint paint,
    Color color,
    double offsetX,
    double offsetY,
  ) {
    final x1 = leftMargin + (inter.p1.x * unitX);
    final y1 = topMargin + availableY - (inter.p1.y * unitY);
    final x2 = leftMargin + ((inter.p2.x * unitX));
    final y2 = topMargin + availableY - (inter.p2.y * unitY);
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
