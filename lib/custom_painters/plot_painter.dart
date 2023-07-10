import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PlotPainter extends CustomPainter {
  PlotPainter({required this.theme, required this.limitX, required this.limitY});
  final ThemeData theme;
  final double limitX;
  final double limitY;
  @override
  void paint(Canvas canvas, Size size) {
    const leftMargin = 30.0;
    const rightMargin = 30.0;
    const topMargin = 30.0;
    const bottomMargin = 30.0;
    final ceilX = (limitX / 10).ceil();
    final numerationLimitX = (limitX / 10).ceil() * 10;
    final numerationLimitY = (limitY / 10).ceil() * 10;
    const segmentsX = 5;
    const segmentsY = 5;
    //calculate offsets
    final hOffset = (size.width - leftMargin - rightMargin) / segmentsX;

    final paragraphStyle = ui.ParagraphStyle(textDirection: TextDirection.ltr, textAlign: TextAlign.center);
    final bodyMedTextStyle = theme.textTheme.bodyMedium!;
    final textStyleBig = ui.TextStyle(color: bodyMedTextStyle.color, fontSize: bodyMedTextStyle.fontSize!);
    final textStyleSmall = theme.textTheme.bodySmall;
    const paragraphContraints = ui.ParagraphConstraints(width: 85);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final pathY = Path()
      ..moveTo(leftMargin, size.height - 20)
      ..lineTo(leftMargin, 20);
    canvas.drawPath(pathY, paint);
    final rectagle = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawRect(rectagle, paint..color = Colors.yellow);
    paint.color = Colors.red;
    final pathX = Path()
      ..moveTo(20, size.height - bottomMargin)
      ..lineTo(size.width - 20, size.height - bottomMargin);

    canvas.drawPath(pathX, paint);
    final stepX = numerationLimitX ~/ 5;
    for (var i = 0; i <= numerationLimitX; i += stepX) {
      final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
        ..pushStyle(textStyleBig)
        ..addText((i).toString());
      final paragraph = paragraphBuilder.build()..layout(paragraphContraints);
      final double dx = ((i) * hOffset / stepX);
      canvas.drawParagraph(paragraph, Offset(dx, size.height - leftMargin));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
