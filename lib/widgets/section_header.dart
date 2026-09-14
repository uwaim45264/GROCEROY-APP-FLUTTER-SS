import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toUpperCase(),
          style: GoogleFonts.orbitron(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.navyBlue,
            letterSpacing: 1,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText.toUpperCase(),
            style: GoogleFonts.shareTechMono(
              fontSize: 10,
              color: AppColors.lightGreen,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
