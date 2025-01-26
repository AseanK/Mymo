import 'package:flutter/material.dart';
import 'dart:math';

class AnalogClockProgress extends StatelessWidget {
  final double currentValue;
  final double totalValue;

  const AnalogClockProgress({super.key, required this.currentValue, required this.totalValue});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: ClockProgressPainter(currentValue: currentValue, totalValue: totalValue),
    );
  }
}

class ClockProgressPainter extends CustomPainter {
  final double currentValue;
  final double totalValue;

  ClockProgressPainter({required this.currentValue, required this.totalValue});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    Paint handPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.5;

    // Draw the clock circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 4, paint);

    // Draw the total value (12 o'clock)
    TextSpan totalText = TextSpan(
      text: totalValue.toString(),
      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    );
    TextPainter totalPainter = TextPainter(
      text: totalText,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    totalPainter.layout();
    totalPainter.paint(canvas, Offset(size.width / 2 - totalPainter.width / 2, 10));

    // Draw half of total value (6 o'clock)
    TextSpan halfTotalText = TextSpan(
      text: (totalValue / 2).toString(),
      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    );
    TextPainter halfTotalPainter = TextPainter(
      text: halfTotalText,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    halfTotalPainter.layout();
    halfTotalPainter.paint(canvas, Offset(size.width / 2 - halfTotalPainter.width / 2, size.height - halfTotalPainter.height - 10));

    // Calculate the angle of the hand based on current value
    double angle = (2 * pi) * (currentValue / totalValue) - pi / 2;

    // Draw the hand (current value pointer)
    double handLength = size.width / 4;
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset handEnd = Offset(
      center.dx + handLength * cos(angle),
      center.dy + handLength * sin(angle),
    );

    canvas.drawLine(center, handEnd, handPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
