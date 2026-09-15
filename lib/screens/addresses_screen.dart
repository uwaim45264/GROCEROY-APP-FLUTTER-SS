import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

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
                  title: "MY ADDRESSES",
                  showBackButton: true,
                  rightWidget: SizedBox(width: 38),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildAddressCard(
                        context,
                        "Home",
                        "24/B, Emerald Street, Green Valley",
                        "Primary Address",
                        Icons.home_rounded,
                        true,
                      ),
                      _buildAddressCard(
                        context,
                        "Office",
                        "Suite 405, Tech Hub Tower, Business Bay",
                        "Work Address",
                        Icons.work_rounded,
                        false,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: "Add New Address",
                        onTap: () {},
                        color: AppColors.navyBlue.withOpacity(0.8),
                      ).animate().fadeIn(delay: 400.ms),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(
    BuildContext context,
    String label,
    String address,
    String type,
    IconData icon,
    bool isSelected,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ClayContainer(
        borderRadius: 22,
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.lightGreen.withOpacity(0.1) : AppColors.cream,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: AppColors.navyBlue, size: 22),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.navyBlue,
                        ),
                      ),
                      if (isSelected)
                        Text(
                          "DEFAULT",
                          style: GoogleFonts.shareTechMono(
                            fontSize: 10,
                            color: AppColors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.navyBlue.withOpacity(0.6),
                      height: 1.4,
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
}
