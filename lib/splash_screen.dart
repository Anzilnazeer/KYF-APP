import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyf/view/widgets/animated_splash.dart';
import 'package:kyf/view/presentation/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => Get.offAll(const Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RightToCenterAnimation(),
    );
  }
}
