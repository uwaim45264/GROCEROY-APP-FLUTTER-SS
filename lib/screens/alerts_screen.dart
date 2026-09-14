import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/app_theme.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const CustomAppBar(
                  title: "ALERTS",
                  showBackButton: true,
                  rightIcon: Icons.done_all_rounded,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SYSTEM // UPDATES",
                        style: GoogleFonts.shareTechMono(
                          fontSize: 10,
                          color: AppColors.lightGreen,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        "Recent Notifications",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.navyBlue,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.05),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return _buildAlertCard(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard(int index) {
    bool isNew = index == 0;
    return ClayContainer(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      borderRadius: 20,
      color: isNew ? Colors.white : Colors.white.withOpacity(0.7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: index % 2 == 0 ? AppColors.skyBlue.withOpacity(0.3) : AppColors.cream.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              index % 2 == 0 ? Icons.local_shipping_rounded : Icons.local_offer_rounded,
              color: index % 2 == 0 ? AppColors.navyBlue : AppColors.darkGreen,
              size: 22,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      index % 2 == 0 ? "ORDER // DELIVERED" : "FLASH // SALE",
                      style: GoogleFonts.orbitron(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: AppColors.navyBlue,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      "2M // AGO",
                      style: GoogleFonts.shareTechMono(
                        color: AppColors.navyBlue.withOpacity(0.4),
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  index % 2 == 0
                      ? "Your order #12345 has been delivered successfully. Enjoy your groceries!"
                      : "Get 50% off on all fresh vegetables today. Limited time offer!",
                  style: GoogleFonts.poppins(
                    color: AppColors.navyBlue.withOpacity(0.6),
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
                if (isNew) ...[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "STATUS // NEW",
                      style: GoogleFonts.shareTechMono(
                        color: AppColors.lightGreen,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (200 + (index * 100)).ms).slideX(begin: 0.1, end: 0);
  }
}
