import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/products_data_model.dart';
import '../screens/product_detail_screen.dart';
import '../widgets/product_card.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';

class VeggiesScreen extends ConsumerWidget {
  const VeggiesScreen({super.key});

  static final List<Product> products = [
    Product(id: 'v1', name: "Fresh Broccoli", weight: "500G", price: "Rs 3.50", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.green, icon: Icons.eco_rounded),
    Product(id: 'v2', name: "Carrots", weight: "1KG", price: "Rs 2.00", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.orange, icon: Icons.eco_rounded),
    Product(id: 'v3', name: "Organic Spinach", weight: "250G", price: "Rs 1.80", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.greenAccent, icon: Icons.eco_rounded),
    Product(id: 'v4', name: "Red Tomatoes", weight: "1KG", price: "Rs 3.00", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.red, icon: Icons.eco_rounded),
    Product(id: 'v5', name: "Cucumbers", weight: "1KG", price: "Rs 2.20", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.lightGreen, icon: Icons.eco_rounded),
    Product(id: 'v6', name: "Red Bell Pepper", weight: "500G", price: "Rs 4.00", imagePath: "assets/categories/Vegetables Category.png", bgColor: Colors.redAccent, icon: Icons.eco_rounded),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
                          color: colorScheme.onBackground,
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
