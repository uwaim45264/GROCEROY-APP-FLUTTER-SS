import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'app_theme.dart';

class BackgroundBlobs extends StatelessWidget {
  const BackgroundBlobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -60,
          right: -40,
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cream.withOpacity(0.3),
            ),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scale(end: const Offset(1.1, 1.1), duration: 4.seconds),
        ),
        Positioned(
          bottom: 200,
          left: -80,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.skyBlue.withOpacity(0.15),
            ),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true)).moveX(end: 30, duration: 6.seconds),
        ),
      ],
    );
  }
}
