import 'package:flutter/material.dart';
import 'app_theme.dart';

class ClayContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;
  final Color color;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double depth;
  final double spread;

  const ClayContainer({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 20,
    this.color = Colors.white,
    this.child,
    this.padding,
    this.margin,
    this.depth = 10,
    this.spread = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: color == Colors.white
                ? AppColors.navyBlue.withOpacity(0.08)
                : color.withOpacity(0.35),
            offset: Offset(depth / 2, depth / 2),
            blurRadius: spread * 2,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.85),
            offset: Offset(-depth / 2, -depth / 2),
            blurRadius: spread * 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
