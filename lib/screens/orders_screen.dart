import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

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
                  title: "MY ORDERS",
                  showBackButton: true,
                  rightWidget: SizedBox(width: 38),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _buildOrderCard(index);
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

  Widget _buildOrderCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ClayContainer(
        borderRadius: 22,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ORDER #GRC-98${index + 1}",
                      style: GoogleFonts.orbitron(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.navyBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Oct 2${index + 1}, 2023",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: AppColors.navyBlue.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: index == 0 ? AppColors.lightGreen.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    index == 0 ? "DELIVERED" : "IN TRANSIT",
                    style: GoogleFonts.shareTechMono(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: index == 0 ? AppColors.lightGreen : Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 30),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.cream,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.shopping_basket_outlined, color: AppColors.navyBlue),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fresh Vegetable Bundle & 4 more",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: AppColors.navyBlue,
                        ),
                      ),
                      Text(
                        "Total: Rs 1,450.00",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 12, color: AppColors.navyBlue.withOpacity(0.3)),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (index * 150).ms).slideY(begin: 0.1, end: 0);
  }
}
