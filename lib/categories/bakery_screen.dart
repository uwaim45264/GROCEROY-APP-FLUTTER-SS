import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/products_data_model.dart';
import '../screens/product_detail_screen.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';

class BakeryScreen extends StatelessWidget {
  const BakeryScreen({super.key});

  static final List<Product> products = [
    Product(id: 'b1', name: "Croissant", weight: "1 UNIT", price: "Rs 2.50", imagePath: "assets/images/1.jpg", bgColor: Colors.brown, icon: Icons.bakery_dining_rounded),
    Product(id: 'b2', name: "Ciabatta", weight: "500G", price: "Rs 3.50", imagePath: "assets/images/2.jpg", bgColor: Colors.orange, icon: Icons.bakery_dining_rounded),
    Product(id: 'b3', name: "Baguette", weight: "1 UNIT", price: "Rs 1.99", imagePath: "assets/images/3.jpg", bgColor: Colors.amber, icon: Icons.bakery_dining_rounded),
    Product(id: 'b4', name: "Muffin", weight: "1 UNIT", price: "Rs 2.25", imagePath: "assets/images/4.jpg", bgColor: Colors.brown, icon: Icons.bakery_dining_rounded),
    Product(id: 'b5', name: "Garlic Bread", weight: "250G", price: "Rs 4.50", imagePath: "assets/images/5.jpg", bgColor: Colors.yellow, icon: Icons.bakery_dining_rounded),
    Product(id: 'b6', name: "Donut", weight: "1 UNIT", price: "Rs 1.50", imagePath: "assets/images/1.jpg", bgColor: Colors.pink, icon: Icons.bakery_dining_rounded),
  ];

  @override
  Widget build(BuildContext context) {
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
                  title: "BAKERY",
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
                        "Freshly Baked",
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
