import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/products_data_model.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/app_theme.dart';
import '../widgets/warning_dialog.dart';
import '../widgets/favorite_button.dart';
import '../controllers/cart_controller.dart';
import '../widgets/clay_container.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final Product? product;

  const ProductDetailScreen({super.key, this.product});

  @override
  ConsumerState<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int quantity = 1;

  void _showImagePopup(BuildContext context, Product product) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: product.imagePath.contains('assets')
                  ? InteractiveViewer(
                      maxScale: 5.0,
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Icon(product.icon, size: 200, color: Colors.white),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.white, size: 36),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final cartController = ref.watch(cartProvider);
    final product = widget.product ?? Product(
      id: 'default',
      name: "Organic Banana",
      price: "Rs 4.99",
      weight: "1KG",
      imagePath: 'assets/images/2.jpg',
      bgColor: AppColors.cream,
      stock: 10,
      category: "Fruits",
    );

    int currentStock = cartController.getAvailableStock(product.id, product.stock);
    final double rawPrice = double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    final String totalPriceString = (rawPrice * quantity).toStringAsFixed(2);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomAppBar(
                  title: "PRODUCT DETAILS",
                  showBackButton: true,
                  rightWidget: FavoriteButton(product: product, size: 22),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 300,
                                height: 260,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: RadialGradient(
                                    colors: [
                                      (product.bgColor ?? AppColors.bgLightGreen).withOpacity(0.3),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                               .scale(begin: const Offset(0.95, 0.95), end: const Offset(1.05, 1.05), duration: 2500.ms, curve: Curves.easeInOut),
                              
                              GestureDetector(
                                onTap: () => _showImagePopup(context, product),
                                child: ClayContainer(
                                  height: 260,
                                  width: 300,
                                  borderRadius: 32,
                                  spread: 12,
                                  depth: 20,
                                  color: colorScheme.surface,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Hero(
                                      tag: 'product_${product.name}',
                                      child: product.imagePath.contains('assets') 
                                        ? Image.asset(
                                            product.imagePath, 
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          )
                                        : Center(
                                            child: Icon(product.icon, size: 100, color: AppColors.lightGreen),
                                          ),
                                    ),
                                  ),
                                ),
                              ).animate().scale(duration: 700.ms, curve: Curves.easeOutBack),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightGreen.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: AppColors.lightGreen.withOpacity(0.2)),
                                    ),
                                    child: Text(
                                      "PRODUCT OVERVIEW",
                                      style: GoogleFonts.shareTechMono(
                                        fontSize: 10,
                                        color: AppColors.darkGreen,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: currentStock == 0 ? Colors.red.withOpacity(0.1) : colorScheme.onBackground.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      currentStock == 0 ? "OUT OF STOCK" : "$currentStock IN STOCK",
                                      style: GoogleFonts.shareTechMono(
                                        fontSize: 10,
                                        color: currentStock == 0 ? Colors.red : colorScheme.onBackground,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ).animate().fadeIn(delay: 200.ms),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name.toUpperCase(),
                                          style: GoogleFonts.orbitron(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: colorScheme.onBackground,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          "${product.weight}",
                                          style: GoogleFonts.shareTechMono(
                                            color: colorScheme.onBackground.withOpacity(0.4),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    product.price,
                                    style: GoogleFonts.orbitron(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.darkGreen,
                                    ),
                                  ),
                                ],
                              ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          "4.8",
                                          style: GoogleFonts.shareTechMono(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.amber[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "(1.2k automated reviews)",
                                    style: GoogleFonts.poppins(
                                      color: colorScheme.onBackground.withOpacity(0.3),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ).animate().fadeIn(delay: 400.ms),
                              const SizedBox(height: 30),
                              Text(
                                "LOGISTICS & SPECIFICATIONS",
                                style: GoogleFonts.shareTechMono(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onBackground.withOpacity(0.8),
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Naturally sourced from sustainable farms. Our ${product.name.toLowerCase()} items are processed for maximum nutrient retention and immaculate fresh preservation.",
                                style: GoogleFonts.poppins(
                                  color: colorScheme.onBackground.withOpacity(0.5),
                                  fontSize: 13,
                                  height: 1.6,
                                ),
                              ).animate().fadeIn(delay: 500.ms),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildInfoCard(Icons.eco_outlined, "100% ORGANIC", context),
                                  _buildInfoCard(Icons.local_shipping_outlined, "FAST DISPATCH", context),
                                  _buildInfoCard(Icons.verified_user_outlined, "QUALITY CHECKED", context),
                                ],
                              ).animate().fadeIn(delay: 600.ms),
                            ],
                          ),
                        ),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 30),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor.withOpacity(0.95),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, -5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: 20),
                          onPressed: () {
                            if (quantity > 1) setState(() => quantity--);
                          },
                        ),
                        Text(
                          quantity.toString(),
                          style: GoogleFonts.orbitron(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, size: 20),
                          onPressed: () {
                            if (quantity < currentStock) {
                              setState(() => quantity++);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Only $currentStock items available in stock"),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: currentStock == 0 
                        ? null 
                        : () {
                            ref.read(cartProvider.notifier).addProduct(product, quantity: quantity);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Added $quantity ${product.name} to cart"),
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: currentStock == 0
                              ? [Colors.grey, Colors.grey.shade700]
                              : [AppColors.lightGreen, AppColors.darkGreen],
                          ),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: (currentStock == 0 ? Colors.grey : AppColors.darkGreen).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            currentStock == 0 ? "OUT OF STOCK" : "ADD TO CART // Rs $totalPriceString",
                            style: GoogleFonts.orbitron(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label, BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: (MediaQuery.of(context).size.width - 70) / 3,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.onBackground.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.lightGreen, size: 24),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.shareTechMono(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
