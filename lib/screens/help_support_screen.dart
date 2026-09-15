import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CustomAppBar(
                  title: "HELP & SUPPORT",
                  showBackButton: true,
                  rightWidget: SizedBox(width: 38),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How can we help you?",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: AppColors.navyBlue,
                          ),
                        ).animate().fadeIn(),
                        const SizedBox(height: 20),
                        _buildSupportOption(
                          context,
                          "Chat with us",
                          "Real-time support with our experts",
                          Icons.chat_bubble_outline_rounded,
                        ),
                        _buildSupportOption(
                          context,
                          "Call support",
                          "Available 24/7 for urgent queries",
                          Icons.call_outlined,
                        ),
                        _buildSupportOption(
                          context,
                          "FAQs",
                          "Find answers to common questions",
                          Icons.quiz_outlined,
                        ),
                        _buildSupportOption(
                          context,
                          "Send us an email",
                          "Get a response within 24 hours",
                          Icons.email_outlined,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Common Topics",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navyBlue,
                          ),
                        ),
                        const SizedBox(height: 15),
                        _buildTopicTile("Refund Policy"),
                        _buildTopicTile("Delivery Issues"),
                        _buildTopicTile("Payment Security"),
                        _buildTopicTile("Account Settings"),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportOption(BuildContext context, String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ClayContainer(
        borderRadius: 20,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.lightGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: AppColors.navyBlue, size: 24),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppColors.navyBlue,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.navyBlue.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn().slideX(begin: 0.1, end: 0);
  }

  Widget _buildTopicTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.navyBlue.withOpacity(0.7),
            ),
          ),
          Icon(Icons.add_rounded, size: 18, color: AppColors.lightGreen),
        ],
      ),
    );
  }
}
