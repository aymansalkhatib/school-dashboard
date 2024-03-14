import 'package:flutter/material.dart';

class CustomGridLinePainter extends CustomPainter {
  final int numberVerticalLines;
  final int numberHorizontalLines;
  final double strokeWidth;
  final Color color;

  CustomGridLinePainter(
      {this.numberVerticalLines = 2,
      this.numberHorizontalLines = 2,
      this.strokeWidth = 1.0,
      this.color = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    final double cellWidth = size.width / (numberVerticalLines - 1);
    final double cellHeight = size.height / (numberHorizontalLines - 1);

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < numberHorizontalLines; i++) {
      double y = i * cellHeight;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (int i = 0; i < numberVerticalLines; i++) {
      double x = i * cellWidth;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
