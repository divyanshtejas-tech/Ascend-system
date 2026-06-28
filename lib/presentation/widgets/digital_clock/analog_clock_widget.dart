import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'clock_model.dart';

/// Analog Clock Widget
class AnalogClockWidget extends StatefulWidget {
  final TimeZoneModel timeZone;
  final DateTime currentTime;

  const AnalogClockWidget({
    Key? key,
    required this.timeZone,
    required this.currentTime,
  }) : super(key: key);

  @override
  State<AnalogClockWidget> createState() => _AnalogClockWidgetState();
}

class _AnalogClockWidgetState extends State<AnalogClockWidget> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.currentTime;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            const Color(0xFF2D3561),
            const Color(0xFF1A1F3A),
          ],
        ),
        border: Border.all(
          color: widget.timeZone.color,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.timeZone.color.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Clock face
          CustomPaint(
            painter: ClockPainter(
              time: _currentTime,
              color: widget.timeZone.color,
            ),
            size: const Size(200, 200),
          ),
          // Center dot
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.timeZone.color,
              boxShadow: [
                BoxShadow(
                  color: widget.timeZone.color.withOpacity(0.5),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for analog clock
class ClockPainter extends CustomPainter {
  final DateTime time;
  final Color color;

  ClockPainter({
    required this.time,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw clock face numbers
    _drawNumbers(canvas, center, radius);

    // Draw hour markers
    _drawHourMarkers(canvas, center, radius);

    // Calculate angles
    final seconds = time.second;
    final minutes = time.minute;
    final hours = time.hour % 12;

    final secondAngle = (seconds * 6 - 90) * pi / 180;
    final minuteAngle = (minutes * 6 + seconds * 0.1 - 90) * pi / 180;
    final hourAngle = (hours * 30 + minutes * 0.5 - 90) * pi / 180;

    // Draw hands
    _drawHand(canvas, center, secondAngle, radius * 0.7, 2, color.withOpacity(0.6));
    _drawHand(canvas, center, minuteAngle, radius * 0.55, 4, color);
    _drawHand(canvas, center, hourAngle, radius * 0.4, 5, color);
  }

  void _drawNumbers(Canvas canvas, Offset center, double radius) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int i = 1; i <= 12; i++) {
      final angle = (i * 30 - 90) * pi / 180;
      final x = center.dx + radius * 0.8 * cos(angle);
      final y = center.dy + radius * 0.8 * sin(angle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: i.toString(),
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }
  }

  void _drawHourMarkers(Canvas canvas, Offset center, double radius) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    for (int i = 0; i < 60; i++) {
      final angle = (i * 6) * pi / 180;
      final start = Offset(
        center.dx + radius * 0.9 * cos(angle),
        center.dy + radius * 0.9 * sin(angle),
      );
      final end = Offset(
        center.dx + radius * (i % 5 == 0 ? 0.85 : 0.88) * cos(angle),
        center.dy + radius * (i % 5 == 0 ? 0.85 : 0.88) * sin(angle),
      );
      canvas.drawLine(start, end, paint);
    }
  }

  void _drawHand(
    Canvas canvas,
    Offset center,
    double angle,
    double length,
    double width,
    Color handColor,
  ) {
    final paint = Paint()
      ..color = handColor
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    final end = Offset(
      center.dx + length * cos(angle),
      center.dy + length * sin(angle),
    );

    canvas.drawLine(center, end, paint);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    return oldDelegate.time != time || oldDelegate.color != color;
  }
}
