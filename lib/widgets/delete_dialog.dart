import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'app_theme.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onDelete;
  final String deleteText;

  const DeleteDialog({
    super.key,
    this.title = "Delete Item?",
    this.message = "Are you sure you want to delete this item? This action cannot be undone.",
    this.onDelete,
    this.deleteText = "Delete",
  });

  static void show(BuildContext context, {
    String? title,
    String? message,
    VoidCallback? onDelete,
    String? deleteText,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => DeleteDialog(
        title: title ?? "Delete Item?",
        message: message ?? "Are you sure you want to delete this item? This action cannot be undone.",
        onDelete: onDelete,
        deleteText: deleteText ?? "Delete",
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
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.delete_outline_rounded, color: Colors.red, size: 50),
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
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.poppins(
                        color: AppColors.navyBlue.withOpacity(0.4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onDelete != null) onDelete!();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      deleteText,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 600.ms),
          ],
        ),
      ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
    );
  }
}
