// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  double? height, width;
  Skeleton({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
