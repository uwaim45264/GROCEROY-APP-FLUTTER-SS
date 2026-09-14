import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'clay_container.dart';
import 'app_theme.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final IconData? rightIcon;
  final VoidCallback? onRightIconTap;
  final Widget? rightWidget;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.onBackTap,
    this.rightIcon,
    this.onRightIconTap,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showBackButton
              ? GestureDetector(
                  onTap: onBackTap ?? () => Navigator.pop(context),
                  child: const ClayContainer(
                    height: 38,
                    width: 38,
                    borderRadius: 10,
                    child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.navyBlue, size: 16),
                  ),
                )
              : GestureDetector(
                  onTap: () {},
                  child: const ClayContainer(
                    height: 38,
                    width: 38,
                    borderRadius: 10,
                    child: Icon(Icons.menu_rounded, color: AppColors.navyBlue, size: 18),
                  ),
                ),
          if (title != null)
            Text(
              title!.toUpperCase(),
              style: GoogleFonts.orbitron(
                color: AppColors.navyBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          rightWidget ?? 
          GestureDetector(
            onTap: onRightIconTap,
            child: ClayContainer(
              height: 38,
              width: 38,
              borderRadius: 10,
              child: Icon(rightIcon ?? Icons.person_outline_rounded, color: AppColors.navyBlue, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
