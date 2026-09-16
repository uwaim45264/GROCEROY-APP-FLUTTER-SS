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
    Product(id: 'm1', name: "Beef Steak", weight: "1KG", price: "Rs 15.99", imagePath: "assets/categories/Meat Category.png", bgColor: Colors.red, icon: Icons.kebab_dining_rounded),
    Product(id: 'm2', name: "Chicken Breast", weight: "1KG", price: "Rs 8.50", imagePath: "assets/categories/Meat Category.png", bgColor: Colors.orange, icon: Icons.kebab_dining_rounded),
    Product(id: 'm3', name: "Salmon Fillet", weight: "500G", price: "Rs 12.99", imagePath: "assets/categories/Meat Category.png", bgColor: Colors.pink, icon: Icons.set_meal_rounded),
    Product(id: 'm4', name: "Lamb Chops", weight: "1KG", price: "Rs 18.50", imagePath: "assets/categories/Meat Category.png", bgColor: Colors.brown, icon: Icons.kebab_dining_rounded),
    Product(id: 'm5', name: "Pork Ribs", weight: "1KG", price: "Rs 10.99", imagePath: "assets/categories/Meat Category.png", bgColor: Colors.redAccent, icon: Icons.kebab_dining_rounded),
    Product(id: 'm6', name: "Fresh Shrimp", weight: "500G", price: "Rs 9.99", imagePath: "assets/categories/Meat Category.png", bgColor: Colors.orangeAccent, icon: Icons.set_meal_rounded),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
