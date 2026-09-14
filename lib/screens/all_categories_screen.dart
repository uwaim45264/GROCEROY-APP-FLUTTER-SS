import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/app_theme.dart';
import '../categories/fruits_screen.dart';
import '../categories/veggies_screen.dart';
import '../categories/dairy_screen.dart';
import '../categories/meat_screen.dart';
import '../categories/bakery_screen.dart';
import '../categories/beverages_screen.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

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
                  title: "CATEGORIES",
                  showBackButton: true,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SYSTEM // SELECTION",
                        style: GoogleFonts.shareTechMono(
                          fontSize: 10,
                          color: AppColors.lightGreen,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        "All Departments",
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
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.95,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildCompactCategoryItem(context, "Fruits", "assets/categories/Fruits Category.png", AppColors.cream, const FruitsScreen(), 0),
                      _buildCompactCategoryItem(context, "Veggies", "assets/categories/Vegetables Category.png", AppColors.skyBlue, const VeggiesScreen(), 1),
                      _buildCompactCategoryItem(context, "Dairy", "assets/categories/Dairy Category.png", const Color(0xFFE1F5FE), const DairyScreen(), 2),
                      _buildCompactCategoryItem(context, "Meat", "assets/categories/Meat Category.png", const Color(0xFFFFEBEE), const MeatScreen(), 3),
                      _buildCompactCategoryItem(context, "Bakery", "assets/categories/Bakery Category.png", const Color(0xFFF3E5F5), const BakeryScreen(), 4),
                      _buildCompactCategoryItem(context, "Drinks", "assets/categories/Beverages Category.png", const Color(0xFFE0F7FA), const BeveragesScreen(), 5),
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

  Widget _buildCompactCategoryItem(BuildContext context, String name, String imagePath, Color accentColor, Widget screen, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
      child: ClayContainer(
        borderRadius: 22,
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.35),
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Hero(
                  tag: 'category_$name',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name.toUpperCase(),
              style: GoogleFonts.orbitron(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlue,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 2,
              width: 15,
              decoration: BoxDecoration(
                color: AppColors.lightGreen.withOpacity(0.6),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (100 + (index * 80)).ms).scale(begin: const Offset(0.95, 0.95));
  }
}
