import 'dart:math';
import 'package:flutter/material.dart';

class CircularTextButton extends StatefulWidget {
  final String text;
  final double size;
  const CircularTextButton({super.key, required this.text, required this.size});
  @override
  _CircularTextButtonState createState() => _CircularTextButtonState();
}

class _CircularTextButtonState extends State<CircularTextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: CustomPaint(
                size: Size(widget.size, widget.size),
                painter: CircularTextPainter(text: widget.text),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CircularTextPainter extends CustomPainter {
  String text;
  CircularTextPainter({required this.text});
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);
    
    final textStyle = TextStyle(color: Colors.black, fontSize: 16);

    for (int i = 0; i < text.length; i++) {
      final angle = (i / text.length) * 2 * pi;
      final offset = Offset(
        radius * cos(angle) + center.dx,
        radius * sin(angle) + center.dy,
      );

      final textPainter = TextPainter(
        text: TextSpan(text: text[i], style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final textOffset = Offset(
        offset.dx - textPainter.width / 2,
        offset.dy - textPainter.height / 2,
      );

      canvas.save();
      canvas.translate(textOffset.dx, textOffset.dy);
      canvas.rotate(angle + pi / 2);
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
