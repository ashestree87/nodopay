import 'package:flutter/material.dart';
import 'dart:math';
import 'package:nodopay/widgets/qr_code_display.dart';

class CircularQrCode extends StatelessWidget {
  final String amount;
  final Color color;

  CircularQrCode({required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(240, 240),
          painter: CircularQrPatternPainter(),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110),
            color: Colors.black,
          ),
          height: 200,
          width: 200,
          child: Center(
            child: QrCodeDisplay(amount: amount, color: color),
          ),
        ),
      ],
    );
  }
}

class CircularQrPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final double radius = min(size.width, size.height) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    const int segments = 30;
    const double segmentAngle = 2 * pi / segments;
    final double segmentLength = radius * 0.15;

    for (int i = 0; i < segments; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(segmentAngle * i);

      final int subSegments = 2 + Random().nextInt(4);
      for (int j = 0; j < subSegments; j++) {
        final double segmentWidth = segmentLength / subSegments;
        canvas.drawRect(
          Rect.fromLTWH(-segmentWidth / 2, radius - segmentWidth * (j + 1),
              segmentWidth, segmentWidth),
          paint,
        );
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
