import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linearprogrammingapp/constants/colors.dart';

import '../models/graphic_data_model.dart';

class GraphicProcessPainter extends CustomPainter {
  GraphicProcessPainter({required this.theme, required this.answerData});
  final ThemeData theme;
  final GraphicDataModel answerData;

  @override
  void paint(Canvas canvas, Size size) {
    const int segmentsX = 5;
    const int segmentsY = 5;
    final stepX = answerData.xLimit / segmentsX;
    final stepY = answerData.yLimit / segmentsY;
    final marksNumX = List.generate(segmentsX, (index) => stepX * (index + 1));
    final marksStrX = List.generate(
        marksNumX.length,
        (index) => marksNumX[index] % 1 == 0
            ? marksNumX[index].toInt().toString()
            : deleteLastZero(
                marksNumX[index].toStringAsFixed(countLeadingZeros(marksNumX[index]) + 2)));
    final marksNumY = List.generate(segmentsY, (index) => stepY * (index + 1));
    final marksStrY = List.generate(
        marksNumY.length,
        (index) => marksNumY[index] % 1 == 0
            ? marksNumY[index].toInt().toString()
            : deleteLastZero(
                marksNumY[index].toStringAsFixed(countLeadingZeros(marksNumY[index]) + 2)));
    final longestNumberY =
        marksStrY.reduce((value, element) => value.length > element.length ? value : element);
    final textStyle = theme.textTheme.bodyLarge!
        .copyWith(fontFamily: 'CMRomanSerif', fontWeight: FontWeight.bold);

    final textPainterX = TextPainter(
      text: TextSpan(style: textStyle, text: answerData.xLimit.toString()),
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
    final unitX = availableX / answerData.xLimit;
    final unitY = availableY / answerData.yLimit;

    final paint = Paint()
      ..color = theme.colorScheme.onBackground
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Offset scaleTranslateToCanvas(Point intersection) {
      final x1 = leftMargin + (intersection.x * unitX);
      final y1 = topMargin + availableY - (intersection.y * unitY);
      return Offset(x1, y1);
    }

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
      textPainter.paint(
          canvas, Offset(dx - (textPainter.width / 2), size.height - bottomMargin + 4));
      canvas.drawLine(Offset(dx, size.height - bottomMargin - 1),
          Offset(dx, size.height - bottomMargin + 4), paint);
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
      textPainter.paint(
          canvas, Offset(leftMargin - textPainter.width - 5, dy - textPainterY.height / 2));
      canvas.drawLine(Offset(leftMargin - 1, dy), Offset(leftMargin + 4, dy), paint);
    }
    for (var (i, line) in answerData.restrictions.indexed) {
      canvas.drawLine(
        scaleTranslateToCanvas(line.p1),
        scaleTranslateToCanvas(line.p2),
        paint..color = getColor(i),
      );
    }
    //optimal answer line
    drawLineDashed(
      canvas,
      scaleTranslateToCanvas(answerData.objectiveFunctionIntersections.p2),
      scaleTranslateToCanvas(answerData.objectiveFunctionIntersections.p1),
      paint
        ..color = getColor(-1)
        ..strokeWidth = 2,
      dashLength: 10,
      gapLength: 8,
    );

    //draw feaseable region
    final paint3 = Paint()
      ..color = theme.colorScheme.primary.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    final Path feasibleRegionPath = findPathsIntersection(
      pointsMatrix: answerData.feasibleRegionMatrixPoints,
      leftMargin: leftMargin,
      topMargin: topMargin,
      availableX: availableX,
      availableY: availableY,
      unitX: unitX,
      unitY: unitY,
    );
    canvas.drawPath(feasibleRegionPath, paint3);
    if (answerData.compliantIntersections.length > 2) {
      final TextSpan span = TextSpan(
          style: textStyle.copyWith(fontFamily: 'CMRomanSerif', fontWeight: FontWeight.w100),
          text: 'feasible\nregion');
      final TextPainter tPFR =
          TextPainter(text: span, textDirection: TextDirection.ltr, textAlign: TextAlign.center)
            ..layout();
      final Offset centerOfREgion = feasibleRegionPath.getBounds().center;
      tPFR.paint(canvas,
          Offset(centerOfREgion.dx - (tPFR.width / 2), centerOfREgion.dy - (tPFR.height / 2)));
    }
    //draw points of posssible answers
    for (final compliantPoint in answerData.compliantIntersections) {
      canvas.drawCircle(
        scaleTranslateToCanvas(compliantPoint),
        2.5,
        paint
          ..color = theme.colorScheme.onSurface
          ..style = PaintingStyle.fill,
      );
    }
    //draw point of optimal answer.
    final offsetRect = scaleTranslateToCanvas(answerData.answer);
    canvas.drawCircle(
      offsetRect,
      5.5,
      paint
        ..color = theme.colorScheme.surface
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      offsetRect,
      4,
      paint
        ..color = theme.colorScheme.onSurface
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant GraphicProcessPainter oldDelegate) {
    return answerData != oldDelegate.answerData;
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
    assert(colorsOnBlack.length == colorsOnWhite.length, 'colors list must be same length');
    final bool isDark = theme.brightness == Brightness.dark;
    if (index == -1) index = colorsOnBlack.length - 1;
    if (isDark) {
      return colorsOnBlack[index];
    }
    return colorsOnWhite[index];
  }

  Path findPathsIntersection({
    required List<List<Point<double>>> pointsMatrix,
    required double leftMargin,
    required double topMargin,
    required double availableX,
    required double availableY,
    required double unitX,
    required double unitY,
  }) {
    List<Path> paths = [];
    for (var i = 0; i < pointsMatrix.length; i++) {
      int j = 0;
      final Path path = Path();
      final double x = leftMargin + (pointsMatrix[i][j].x * unitX);
      final double y = topMargin + availableY - (pointsMatrix[i][j].y * unitY);
      if (pointsMatrix[i].isNotEmpty) {
        path.moveTo(x, y);
      }
      for (j = 1; j < pointsMatrix[i].length; j++) {
        final double x = leftMargin + (pointsMatrix[i][j].x * unitX);
        final double y = topMargin + availableY - (pointsMatrix[i][j].y * unitY);
        path.lineTo(x, y);
      }
      paths.add(path);
    }
    if (paths.isEmpty) return Path();
    Path feasibleRegionPath = paths.first;
    for (var i = 1; i < paths.length; i++) {
      feasibleRegionPath = Path.combine(PathOperation.intersect, feasibleRegionPath, paths[i]);
    }
    return feasibleRegionPath;
  }

  void drawLineDashed(
    Canvas canvas,
    Offset start,
    Offset end,
    Paint paint, {
    double dashLength = 5,
    double gapLength = 5,
  }) {
    final double stride = dashLength + gapLength;
    double distance = (end - start).distance;
    while (distance > 0) {
      final remaining = end - start;
      final direction = remaining / remaining.distance;
      final next = start + (direction * dashLength);
      canvas.drawLine(start, next, paint);
      start += (direction * stride);
      distance -= stride;
    }
  }
}
