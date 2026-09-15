import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/products_data_model.dart';
import '../screens/product_detail_screen.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';

class VeggiesScreen extends StatelessWidget {
  const VeggiesScreen({super.key});

  static final List<Product> products = [
    Product(id: 'v1', name: "Fresh Broccoli", weight: "500G", price: "Rs 2.99", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.green),
    Product(id: 'v2', name: "Organic Carrots", weight: "1KG", price: "Rs 1.50", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.orange),
    Product(id: 'v3', name: "Bell Pepper", weight: "3 UNITS", price: "Rs 3.25", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.red),
    Product(id: 'v4', name: "Baby Spinach", weight: "250G", price: "Rs 1.99", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.green),
    Product(id: 'v5', name: "Cucumber", weight: "1 UNIT", price: "Rs 0.99", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.green),
    Product(id: 'v6', name: "Fresh Tomato", weight: "1KG", price: "Rs 2.49", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.red),
  ];

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
                CustomAppBar(
                  title: "VEGETABLES",
                  showBackButton: true,
                  rightIcon: Icons.shopping_cart_outlined,
                  onRightIconTap: () {},
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SYSTEM // INVENTORY",
                        style: GoogleFonts.shareTechMono(
                          fontSize: 10,
                          color: AppColors.lightGreen,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        "Organic Greens",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.navyBlue,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.05),
                const SizedBox(height: 15),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: products[index],
                        index: index,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(product: products[index]),
                          ),
                        ),
                      );
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
}
