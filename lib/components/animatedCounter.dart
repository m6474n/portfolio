import 'package:flutter/material.dart';



class AnimatedCounterScreen extends StatelessWidget {
  final int endValue = 100; // Set your custom end value here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Counter'),
      ),
      body: Center(
        child: TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: endValue),
          duration: Duration(seconds: 3), // Duration of the animation
          builder: (context, value, child) {
            return Text(
              '$value',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
