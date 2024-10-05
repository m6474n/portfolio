import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/utility/appsettings.dart';

class RotatingContainer extends StatefulWidget {
  @override
  _RotatingContainerState createState() => _RotatingContainerState();
}

class _RotatingContainerState extends State<RotatingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 1,color: AppSettings.borderColor), borderRadius: BorderRadius.circular(500)),
        height: 160,
        width: 160,
        padding: EdgeInsets.all(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
            
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/round-text.png')),

                      // borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                );
              },
            ),
            // Fixed child in the center
            Icon(
              HugeIcons.strokeRoundedArrowDown02,
              size: 42,
              color:
                  isHover ? AppSettings.primaryColor : AppSettings.borderColor,
            )
          ],
        ),
      ),
    );
  }

  void _onHover(bool hover) {
    setState(() {
      isHover = hover;
      if (isHover) {
        _controller.stop();
      } else {
        _controller.repeat();
      }
    });
  }
}
