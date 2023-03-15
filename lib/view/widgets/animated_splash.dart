// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RightToCenterAnimation extends StatefulWidget {
  const RightToCenterAnimation({super.key});

  @override
  _RightToCenterAnimationState createState() => _RightToCenterAnimationState();
}

class _RightToCenterAnimationState extends State<RightToCenterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 2),
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: SlideTransition(
          position: _animation,
          child: Image.asset(
            'assets/logo.png',
            height: 220,
          ),
        ),
      ),
    );
  }
}
