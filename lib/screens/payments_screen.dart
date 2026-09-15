import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

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
                  title: "PAYMENT METHODS",
                  showBackButton: true,
                  rightWidget: SizedBox(width: 38),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildPaymentCard(
                        "Visa Card",
                        "**** **** **** 4242",
                        "Expires 12/24",
                        Icons.credit_card_rounded,
                        true,
                      ),
                      _buildPaymentCard(
                        "MasterCard",
                        "**** **** **** 5555",
                        "Expires 09/25",
                        Icons.payment_rounded,
                        false,
                      ),
                      _buildPaymentCard(
                        "Google Pay",
                        "uwaim@okaxis",
                        "UPI ID",
                        Icons.account_balance_wallet_rounded,
                        false,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: "Add New Method",
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

  Widget _buildPaymentCard(
    String label,
    String detail,
    String subtitle,
    IconData icon,
    bool isSelected,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ClayContainer(
        borderRadius: 22,
        padding: const EdgeInsets.all(20),
        child: Row(
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
                        const Icon(Icons.check_circle_rounded, color: AppColors.lightGreen, size: 18),
                    ],
                  ),
                  Text(
                    detail,
                    style: GoogleFonts.shareTechMono(
                      fontSize: 14,
                      color: AppColors.navyBlue,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
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
}
