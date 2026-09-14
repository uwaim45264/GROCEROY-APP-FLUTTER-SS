import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'app_theme.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;

  const SuccessDialog({
    super.key,
    this.title = "Success!",
    this.message = "Your account has been\nsuccessfully created.",
  });

  static void show(BuildContext context, {String? title, String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: title ?? "Success!",
        message: message ?? "Your account has been\nsuccessfully created.",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded, color: Colors.green, size: 50),
            ).animate().scale(duration: 600.ms, curve: Curves.elasticOut).shake(delay: 600.ms),
            const SizedBox(height: 25),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlue,
                decoration: TextDecoration.none,
              ),
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.navyBlue.withOpacity(0.6),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2, end: 0),
          ],
        ),
      ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
    );
  }
}
