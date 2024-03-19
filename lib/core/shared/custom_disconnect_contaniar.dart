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
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var path = Path()
      ..moveTo(cornerRadius, 0)
      ..lineTo(size.width - cornerRadius, 0) // Top line
      ..arcToPoint(
        Offset(size.width, cornerRadius),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(size.width, size.height - cornerRadius) // Right line
      ..arcToPoint(
        Offset(size.width - cornerRadius, size.height),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(cornerRadius, size.height) // Bottom line
      ..arcToPoint(
        Offset(0, size.height - cornerRadius),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(0, cornerRadius) // Left line
      ..arcToPoint(
        Offset(cornerRadius, 0),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      );

    // Use PathMetrics to draw the dashed path
    final PathMetrics pathMetrics = path.computeMetrics();
    for (final PathMetric pathMetric in pathMetrics) {
      // final Path extractPath = pathMetric.extractPath(
      //   0.0,
      //   pathMetric.length,
      // );
      final double dashLength = dashWidth + dashSpace;
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double remainingLength = pathMetric.length - distance;
        final double currentDashWidth =
            remainingLength < dashLength ? remainingLength - dashSpace : dashWidth;
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
