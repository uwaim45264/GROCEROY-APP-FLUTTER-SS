import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'clay_container.dart';
import 'app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final double? width;
  final double height;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = AppColors.navyBlue,
    this.textColor = Colors.white,
    this.width,
    this.height = 50,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        height: height,
        width: width ?? double.infinity,
        color: color,
        borderRadius: 15,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: textColor, size: 18),
                const SizedBox(width: 8),
              ],
              Text(
                text.toUpperCase(),
                style: GoogleFonts.orbitron(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
