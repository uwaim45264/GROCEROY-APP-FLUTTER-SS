import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/cart_data_model.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/app_theme.dart';
import '../widgets/warning_dialog.dart';
import '../widgets/confirmation_dialog.dart';
import '../controllers/cart_controller.dart';
import 'checkout_screen.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartController = ref.watch(cartProvider);
    final cartItems = cartController.items;

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
                  title: "MY CART",
                  rightIcon: Icons.delete_outline_rounded,
                  onRightIconTap: () {
                    if (cartItems.isNotEmpty) {
                      ConfirmationDialog.show(
                        context,
                        title: "Clear Cart?",
                        message: "Are you sure you want to remove all items from your cart?",
                        confirmText: "Clear All",
                        icon: Icons.delete_sweep_rounded,
                        iconColor: Colors.redAccent,
                        onConfirm: () {
                          cartController.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.navyBlue,
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 1),
                              content: Text(
                                "CART CLEARED",
                                style: GoogleFonts.shareTechMono(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "INVENTORY",
                        style: GoogleFonts.shareTechMono(
                          fontSize: 10,
                          color: AppColors.lightGreen,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        "Cart Overview",
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
                  child: cartItems.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart_outlined,
                                  size: 64,
                                  color: AppColors.navyBlue.withOpacity(0.1)),
                              const SizedBox(height: 16),
                              Text(
                                "YOUR CART IS EMPTY",
                                style: GoogleFonts.orbitron(
                                  color: AppColors.navyBlue.withOpacity(0.3),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          physics: const BouncingScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            return _buildCartItem(
                                cartController, cartItems[index], index);
                          },
                        ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: ClayContainer(
                    borderRadius: 25,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TOTAL VALUE",
                              style: GoogleFonts.orbitron(
                                fontSize: 10,
                                color: AppColors.navyBlue.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              "Rs ${cartController.totalValue.toStringAsFixed(2)}",
                              style: GoogleFonts.orbitron(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: AppColors.navyBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          text: "CHECKOUT NOW",
                          onTap: () {
                            if (cartItems.isEmpty) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutScreen(),
                              ),
                            );
                          },
                          color: AppColors.navyBlue,
                          icon: Icons.arrow_forward_rounded,
                        ),
                      ],
                    ),
                  ),
                ).animate().slideY(begin: 0.2, end: 0, duration: 400.ms),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(
      CartController cartController, CartItem item, int index) {
    int currentStock =
        cartController.getStock(item.product.id, item.product.stock);

    return Dismissible(
      key: ValueKey("dismiss_${item.product.id}"),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        bool result = false;
        await showDialog(
          context: context,
          builder: (context) => ConfirmationDialog(
            title: "Remove Item?",
            message: "Do you want to remove ${item.product.name} from your cart?",
            confirmText: "Remove",
            icon: Icons.delete_outline_rounded,
            iconColor: Colors.redAccent,
            onConfirm: () {
              result = true;
            },
          ),
        );
        return result;
      },
      onDismissed: (direction) {
        cartController.removeProduct(item.product.id);
      },
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 25),
        child: const Icon(Icons.delete_sweep_rounded, color: Colors.redAccent, size: 28)
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 1200.ms, color: Colors.white24)
            .shake(hz: 4, curve: Curves.easeInOut),
      ),
      child: ClayContainer(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        borderRadius: 20,
        child: Row(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: (item.product.bgColor ?? AppColors.lightGreen)
                    .withOpacity(0.08),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  item.product.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name.toUpperCase(),
                    style: GoogleFonts.orbitron(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: AppColors.navyBlue,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${item.product.weight} // UNIT",
                    style: GoogleFonts.shareTechMono(
                      color: AppColors.navyBlue.withOpacity(0.4),
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "STOCK: $currentStock Avail",
                    style: GoogleFonts.shareTechMono(
                      color:
                          currentStock == 0 ? Colors.red : AppColors.lightGreen,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.product.price,
                    style: GoogleFonts.orbitron(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppColors.darkGreen,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            CompactQuantitySelector(
              initialValue: item.quantity,
              max: currentStock,
              onChanged: (qty) {
                if (qty > currentStock) {
                  WarningDialog.show(
                    context,
                    title: "Stock Limit",
                    message: "Only $currentStock items available in stock.",
                  );
                  return;
                }
                if (qty == 0) {
                  ConfirmationDialog.show(
                    context,
                    title: "Remove Item?",
                    message: "Do you want to remove ${item.product.name} from your cart?",
                    confirmText: "Remove",
                    icon: Icons.delete_outline_rounded,
                    iconColor: Colors.redAccent,
                    onConfirm: () {
                      cartController.updateQuantity(item.product.id, 0);
                    },
                  );
                  return;
                }
                cartController.updateQuantity(item.product.id, qty);
              },
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (100 + (index * 80)).ms)
        .slideX(begin: 0.05, end: 0);
  }
}
