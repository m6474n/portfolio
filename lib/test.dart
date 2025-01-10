import 'package:flutter/material.dart';

class SwingingRopeScreen extends StatefulWidget {
  const SwingingRopeScreen({super.key});

  @override
  _SwingingRopeScreenState createState() => _SwingingRopeScreenState();
}

class _SwingingRopeScreenState extends State<SwingingRopeScreen> with TickerProviderStateMixin {
  late AnimationController _swingController;
  late Animation<double> _swingAnimation;
  double ropeHeight = 100.0;

  // Initializes the swinging animation
  @override
  void initState() {
    super.initState();
    _swingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);  // Repeats the swing animation back and forth

    // Define the swinging animation (from -30 degrees to 30 degrees)
    _swingAnimation = Tween<double>(begin: -0.4, end: 0.4).animate(CurvedAnimation(
      parent: _swingController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _swingController.dispose();
    super.dispose();
  }

  // Function to start the swinging animation when the rope is pulled
  void startSwinging() {
    _swingController.forward(from: 0);  // Start the swing animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swinging Rope'),
        backgroundColor: Colors.blue,
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          // Only start the swing if the user pulls downward (dragging vertically)
          if (details.localPosition.dy > 0) {
            setState(() {
              ropeHeight = 100.0 + details.localPosition.dy;  // Increase rope height on pull
            });

            // Trigger the swinging animation when pulled enough
            if (ropeHeight > 150.0) {
              startSwinging();
            }
          }
        },
        onPanEnd: (_) {
          setState(() {
            ropeHeight = 100.0;  // Reset rope height when released
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Rope container with swinging animation
              AnimatedBuilder(
                animation: _swingAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _swingAnimation.value,  // Apply rotation to the rope
                    child: Container(
                      width: 5.0,  // Rope thickness
                      height: ropeHeight,  // Rope height changes as the user pulls
                      color: Colors.brown,  // Rope color
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Icon(Icons.arrow_downward, color: Colors.black),  // Icon at the bottom of the rope
              const SizedBox(height: 20),
              Text(
                'Pull to start the swing!',
                style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
