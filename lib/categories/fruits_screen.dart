import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/products_data_model.dart';
import '../screens/product_detail_screen.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';

class FruitsScreen extends StatelessWidget {
  const FruitsScreen({super.key});

  static final List<Product> products = [
    Product(id: 'f1', name: "Red Apple", weight: "1KG", price: "Rs 4.99", imagePath: "assets/images/2.jpg", bgColor: Colors.red),
    Product(id: 'f2', name: "Organic Banana", weight: "1KG", price: "Rs 2.50", imagePath: "assets/images/3.jpg", bgColor: Colors.yellow),
    Product(id: 'f3', name: "Sweet Orange", weight: "1KG", price: "Rs 3.99", imagePath: "assets/images/4.jpg", bgColor: Colors.orange),
    Product(id: 'f4', name: "Purple Grapes", weight: "500G", price: "Rs 5.50", imagePath: "assets/images/5.jpg", bgColor: Colors.purple),
    Product(id: 'f5', name: "Fresh Strawberry", weight: "250G", price: "Rs 4.50", imagePath: "assets/images/1.jpg", bgColor: Colors.redAccent),
    Product(id: 'f6', name: "Pineapple", weight: "1 UNIT", price: "Rs 6.00", imagePath: "assets/images/2.jpg", bgColor: Colors.amber),
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
                  title: "FRUITS",
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
                        "Fresh Fruits",
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
