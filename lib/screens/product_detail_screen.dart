import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/app_theme.dart';
import '../widgets/warning_dialog.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product? product;

  const ProductDetailScreen({super.key, this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  final CartController _cartController = CartController();

  @override
  void initState() {
    super.initState();
    _cartController.addListener(_updateState);
  }

  @override
  void dispose() {
    _cartController.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product ?? Product(
      id: 'default',
      name: "Organic Banana",
      price: "Rs 4.99",
      weight: "1KG",
      imagePath: 'assets/images/2.jpg',
      bgColor: AppColors.cream,
      stock: 10,
    );



    // HERE SHOW STOCK AS: Total Stock - Quantity already in Cart THIS COMMENT IS FOR ME TO REMMEBER ....
    int currentStock = _cartController.getAvailableStock(product.id, product.stock);
    final double rawPrice = double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    final String totalPriceString = (rawPrice * quantity).toStringAsFixed(2);

    return Scaffold(
      backgroundColor: Colors.white,
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
                              
                              ClayContainer(
                                height: 260,
                                width: 300,
                                borderRadius: 32,
                                spread: 12,
                                depth: 20,
                                color: Colors.white,
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
                                      color: currentStock == 0 ? Colors.red.withOpacity(0.1) : AppColors.navyBlue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      currentStock == 0 ? "OUT OF STOCK" : "$currentStock IN STOCK",
                                      style: GoogleFonts.shareTechMono(
                                        fontSize: 10,
                                        color: currentStock == 0 ? Colors.red : AppColors.navyBlue,
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
                                            color: AppColors.navyBlue,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          "${product.weight}",
                                          style: GoogleFonts.shareTechMono(
                                            color: AppColors.navyBlue.withOpacity(0.4),
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
                                      color: AppColors.navyBlue.withOpacity(0.3),
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
                                  color: AppColors.navyBlue.withOpacity(0.8),
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Naturally sourced from sustainable farms. Our ${product.name.toLowerCase()} items are processed for maximum nutrient retention and immaculate fresh preservation.",
                                style: GoogleFonts.poppins(
                                  color: AppColors.navyBlue.withOpacity(0.5),
                                  fontSize: 13,
                                  height: 1.6,
                                ),
                              ).animate().fadeIn(delay: 500.ms),
                              
                              const SizedBox(height: 30),
                              

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildInfoCard(Icons.eco_outlined, "100% ORGANIC"),
                                  _buildInfoCard(Icons.local_shipping_outlined, "FAST DISPATCH"),
                                  _buildInfoCard(Icons.verified_user_outlined, "QUALITY CHECKED"),
                                ],
                              ).animate().fadeIn(delay: 600.ms).scaleY(begin: 0.8),
                              
                              const SizedBox(height: 30),
                              

                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.bgLightGreen.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColors.lightGreen.withOpacity(0.1)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "QUANTITY",
                                          style: GoogleFonts.shareTechMono(
                                            color: AppColors.navyBlue.withOpacity(0.4),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        CompactQuantitySelector(
                                          initialValue: quantity,
                                          max: currentStock,
                                          onChanged: (val) => setState(() => quantity = val),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "TOTAL",
                                            style: GoogleFonts.shareTechMono(
                                              color: AppColors.navyBlue.withOpacity(0.4),
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Rs $totalPriceString",
                                            style: GoogleFonts.orbitron(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: AppColors.navyBlue,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ).animate().fadeIn(delay: 700.ms),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                

                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: CustomButton(
                    text: currentStock == 0 ? "OUT OF STOCK" : "ADD TO CART",
                    color: currentStock == 0 ? Colors.grey : AppColors.navyBlue,
                    onTap: () {
                      if (currentStock == 0) {
                        WarningDialog.show(
                          context,
                          title: "Unavailable",
                          message: "This item is currently out of stock.",
                        );
                        return;
                      }

                      if (quantity > currentStock) {
                        WarningDialog.show(
                          context,
                          title: "Stock Limit",
                          message: "Only $currentStock items available in stock.",
                        );
                        return;
                      }

                      _cartController.addProduct(product, quantity: quantity);
                      setState(() {
                        quantity = 1; // Reset quantity after adding to cart THIS IS ONLY FOR ME TO REMEMBER ....
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.navyBlue,
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "ADDED TO CART",
                            style: GoogleFonts.shareTechMono(color: Colors.white),
                          ),
                        ),
                      );
                    },
                    icon: Icons.shopping_cart_outlined,
                  ),
                ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2, end: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.navyBlue.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.lightGreen, size: 20),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.shareTechMono(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: AppColors.navyBlue.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
