import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/products_data_model.dart';
import '../screens/product_detail_screen.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';


class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  static final List<Product> products = [
    Product(id: 'be1', name: "Orange Juice", weight: "1.0 L", price: "Rs 5.99", imagePath: "assets/categories/Beverages Category.png", bgColor: Colors.orange, icon: Icons.local_drink_rounded),
    Product(id: 'be2', name: "Apple Juice", weight: "1.0 L", price: "Rs 4.99", imagePath: "assets/categories/Beverages Category.png", bgColor: Colors.red, icon: Icons.local_drink_rounded),
    Product(id: 'be3', name: "Coconut Water", weight: "500 ml", price: "Rs 3.50", imagePath: "assets/categories/Beverages Category.png", bgColor: Colors.lightBlue, icon: Icons.local_drink_rounded),
    Product(id: 'be4', name: "Iced Coffee", weight: "250 ml", price: "Rs 2.99", imagePath: "assets/categories/Beverages Category.png", bgColor: Colors.brown, icon: Icons.coffee_rounded),
    Product(id: 'be5', name: "Green Tea", weight: "500 ml", price: "Rs 2.49", imagePath: "assets/categories/Beverages Category.png", bgColor: Colors.green, icon: Icons.emoji_food_beverage_rounded),
    Product(id: 'be6', name: "Mineral Water", weight: "1.5 L", price: "Rs 1.99", imagePath: "assets/categories/Beverages Category.png", bgColor: Colors.blue, icon: Icons.water_drop_rounded),
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
                  title: "BEVERAGES",
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
                        "Liquid Selection",
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
