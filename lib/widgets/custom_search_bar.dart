import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'clay_container.dart';
import 'app_theme.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search inventory...",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClayContainer(
            height: 46,
            borderRadius: 12,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(color: AppColors.navyBlue.withOpacity(0.3), fontSize: 12),
                prefixIcon: const Icon(Icons.search_rounded, color: AppColors.lightGreen, size: 18),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const ClayContainer(
          height: 46,
          width: 46,
          borderRadius: 12,
          color: AppColors.navyBlue,
          child: Icon(Icons.tune_rounded, color: Colors.white, size: 18),
        ),
      ],
    );
  }
}
