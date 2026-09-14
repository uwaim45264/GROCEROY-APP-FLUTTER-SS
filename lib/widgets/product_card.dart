import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'clay_container.dart';
import 'favorite_button.dart';
import 'compact_quantity_selector.dart';
import 'app_theme.dart';
import 'warning_dialog.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;
  final int index;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.index,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _selectedQuantity = 1;
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

    int currentStock = _cartController.getAvailableStock(widget.product.id, widget.product.stock);

    return GestureDetector(
      onTap: widget.onTap,
      child: ClayContainer(
        borderRadius: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: (widget.product.bgColor ?? Colors.white).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Hero(
                        tag: 'product_${widget.product.name}',
                        child: Image.asset(
                          widget.product.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: FavoriteButton(product: widget.product),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: currentStock == 0 
                            ? Colors.red.withOpacity(0.9) 
                            : AppColors.navyBlue.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        currentStock == 0 ? "OUT OF STOCK" : "$currentStock IN STOCK",
                        style: GoogleFonts.shareTechMono(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name.toUpperCase(),
                    style: GoogleFonts.orbitron(
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                      color: AppColors.navyBlue,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.product.weight} // UNIT",
                        style: GoogleFonts.shareTechMono(
                          color: AppColors.navyBlue.withOpacity(0.4),
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.product.price,
                        style: GoogleFonts.orbitron(
                          color: AppColors.darkGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 130),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CompactQuantitySelector(
                            max: currentStock,
                            onChanged: (val) {
                              setState(() {
                                _selectedQuantity = val;
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              if (currentStock == 0) {
                                WarningDialog.show(
                                  context,
                                  title: "Unavailable",
                                  message: "This item is currently out of stock.",
                                );
                                return;
                              }
                              
                              if (_selectedQuantity > currentStock) {
                                WarningDialog.show(
                                  context,
                                  title: "Stock Limit",
                                  message: "Only $currentStock items available in stock.",
                                );
                                return;
                              }

                              _cartController.addProduct(widget.product, quantity: _selectedQuantity);
                              setState(() {
                                _selectedQuantity = 1;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.navyBlue,
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 1),
                                  content: Text(
                                    "${widget.product.name.toUpperCase()} ADDED",
                                    style: GoogleFonts.shareTechMono(color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: currentStock == 0 ? Colors.grey : AppColors.darkGreen,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: (currentStock == 0 ? Colors.grey : AppColors.darkGreen).withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.add_shopping_cart_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (200 + (widget.index * 80)).ms).slideY(begin: 0.05, end: 0);
  }
}
