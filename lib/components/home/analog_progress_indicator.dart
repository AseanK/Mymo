import 'package:flutter/material.dart';
import 'dart:math';

class AnalogProgressIndicator extends StatelessWidget {
  final double progress; // Progress value between 0.0 to 1.0 (0% to 100%)

  const AnalogProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/3.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: CustomPaint(
        size: const Size(200, 200), // Adjust the size as needed
        painter: ClockHandPainter(progress),
      ),
    );
  }
}

class ClockHandPainter extends CustomPainter {
  final double progress;

  ClockHandPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    // Draw clock face
    // final clockFacePaint = Paint()
    //   ..color = Colors.black12
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2.0;
    //
    // canvas.drawCircle(center, radius, clockFacePaint);

    // Calculate the angle for the hand
    final double angle = (2 * pi * progress) - (pi / 2);

    // Draw clock hand
    final handPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    final handLength = radius * 0.8;
    final handEnd = Offset(
      center.dx + handLength * cos(angle),
      center.dy + handLength * sin(angle),
    );

    canvas.drawLine(center, handEnd, handPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Redraw every time progress changes
  }
}
