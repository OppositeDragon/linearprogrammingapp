import 'package:flutter/material.dart';

class PlotPainter extends CustomPainter {
  PlotPainter({required this.theme, required this.limitX, required this.limitY});
  final ThemeData theme;
  final double limitX;
  final double limitY;
  @override
  void paint(Canvas canvas, Size size) {
    final numerationLimitX = (limitX / 10).ceil() * 10;
    final numerationLimitY = (limitY / 10).ceil() * 10;
    final textStyle = theme.textTheme.bodyMedium!.copyWith(fontFamily: 'Computer Modern');

    final textPainterX = TextPainter(
        text: TextSpan(style: textStyle, text: numerationLimitX.toString()), textDirection: TextDirection.ltr)
      ..layout();
    const leftMargin = 30.0;
    final rightMargin = 25.0 + textPainterX.width / 2;
    const topMargin = 30.0;
    const bottomMargin = 30.0;
    final ceilX = (limitX / 10).ceil();

    const segmentsX = 5;
    const segmentsY = 5;
    //calculate offsets
    final hOffset = (size.width - leftMargin - rightMargin) / segmentsX;

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

    for (int i = stepX; i <= numerationLimitX; i += stepX) {
      TextSpan span = TextSpan(style: textStyle, text: i.toString());
      final textPainter = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      )..layout();
      final double dx = ((i) * hOffset / stepX) + leftMargin - textPainter.width / 2;

      textPainter.paint(canvas, Offset(dx, size.height - bottomMargin));
    }
    paint.color = Colors.blue;
    for (int i = 0; i <= numerationLimitX; i += stepX) {
      final double dx = ((i) * hOffset / stepX) + leftMargin;
      canvas.drawLine(Offset(dx, size.height - bottomMargin - 5), Offset(dx, size.height - bottomMargin + 5), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
