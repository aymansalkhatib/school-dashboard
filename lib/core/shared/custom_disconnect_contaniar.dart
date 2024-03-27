import 'dart:ui';
import 'package:flutter/material.dart';

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final double cornerRadius;

  DashedRectPainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.strokeWidth,
    this.cornerRadius = 8.0,
  }) : assert(dashWidth > 0 && dashSpace > 0 && strokeWidth > 0,
            'Values must be greater than 0');

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var path = _createRoundedRectanglePath(size);
    _drawDashedPath(canvas, path, paint);
  }

  /// Creates a path for a rounded rectangle.
  Path _createRoundedRectanglePath(Size size) {
    return Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, size.height),
        topLeft: Radius.circular(cornerRadius),
        topRight: Radius.circular(cornerRadius),
        bottomLeft: Radius.circular(cornerRadius),
        bottomRight: Radius.circular(cornerRadius),
      ));
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final PathMetrics pathMetrics = path.computeMetrics();
    for (final PathMetric pathMetric in pathMetrics) {
      final double dashLength = dashWidth + dashSpace;
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double remainingLength = pathMetric.length - distance;
        final double currentDashWidth = remainingLength < dashLength
            ? remainingLength - dashSpace
            : dashWidth;
        final Path dashPath = pathMetric.extractPath(
          distance,
          distance + currentDashWidth,
        );
        canvas.drawPath(dashPath, paint);
        distance += dashLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
