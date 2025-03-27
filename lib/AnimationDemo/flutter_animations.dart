import 'package:flutter/material.dart';

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key});

  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 5), // Animation duration
      vsync: this, // TickerProvider
    );

    // Define the Tween to animate from 0 to the screen width (right side)
    _animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // Start the animation automatically when the widget is initialized
    _controller.forward();
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Animation")),
      body: Center(
        child: Stack(
          // Add a Stack widget as the parent
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  left:
                      _animation
                          .value, // Move the box horizontally using the animation value
                  top:
                      MediaQuery.of(context).size.height / 2 -
                      50, // Keep the box vertically centered
                  child: child!,
                );
              },
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
