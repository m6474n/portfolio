import 'package:flutter/material.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/utility/appsettings.dart';

class AnimatedCounter extends StatelessWidget {
  final int endValue; 
  final String title; 
 const AnimatedCounter({super.key, required this.endValue, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder<int>(
        tween: IntTween(begin: 0, end: endValue),
        duration: Duration(seconds: 3), // Duration of the animation
        builder: (context, value, child) {
          return Container(
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1, color: AppSettings.borderColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
           
                Text(
                    '$value+',
                    style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: AppSettings.primaryColor, height: 1),textAlign: TextAlign.center,
                  ),
              
                Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w200,
                      color: AppSettings.whiteColor, letterSpacing: 3),textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
