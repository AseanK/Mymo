import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mymo/components/constants.dart';

class AnalogProgressIndicator extends StatelessWidget {
  final double progress; // Progress value between 0.0 to 1.0 (0% to 100%)
  final String label;
  final String value;

  const AnalogProgressIndicator(
      {super.key,
      required this.progress,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(label),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(value),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/3.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: CustomPaint(
                  size: const Size(double.infinity,
                      double.infinity), // Adjust the size as needed
                  painter: ClockHandPainter(progress),
                ),
              ),
            ],
          ),
        ),
      ],
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
    final clockFacePaint = Paint()
      ..color = kFourthColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawCircle(center, 1, clockFacePaint);

    // Calculate the angle for the hand
    final double angle = (2 * pi * progress) - (pi / 2);

    // Draw clock hand
    final handPaint = Paint()
      ..color = kFourthColor
      ..strokeWidth = 3.0
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
