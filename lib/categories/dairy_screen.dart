import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/products_data_model.dart';
import '../screens/product_detail_screen.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';


class DairyScreen extends StatelessWidget {
  const DairyScreen({super.key});

  static final List<Product> products = [
    Product(id: 'd1', name: "Fresh Milk", weight: "1.0 L", price: "Rs 3.50", imagePath: "assets/categories/Dairy Category.png", bgColor: Colors.blue, icon: Icons.water_drop_rounded),
    Product(id: 'd2', name: "Organic Eggs", weight: "12 UNITS", price: "Rs 4.99", imagePath: "assets/categories/Dairy Category.png", bgColor: Colors.amber, icon: Icons.egg_rounded),
    Product(id: 'd3', name: "Greek Yogurt", weight: "500 G", price: "Rs 2.99", imagePath: "assets/categories/Dairy Category.png", bgColor: Colors.lightBlue, icon: Icons.icecream_rounded),
    Product(id: 'd4', name: "Cheddar Cheese", weight: "200 G", price: "Rs 5.50", imagePath: "assets/categories/Dairy Category.png", bgColor: Colors.orange, icon: Icons.bakery_dining_rounded),
    Product(id: 'd5', name: "Unsalted Butter", weight: "250 G", price: "Rs 4.25", imagePath: "assets/categories/Dairy Category.png", bgColor: Colors.yellow, icon: Icons.bakery_dining_rounded),
    Product(id: 'd6', name: "Sour Cream", weight: "250 ML", price: "Rs 2.50", imagePath: "assets/categories/Dairy Category.png", bgColor: Colors.blueGrey, icon: Icons.icecream_rounded),
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
                  title: "DAIRY",
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
                        "Dairy Selection",
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
