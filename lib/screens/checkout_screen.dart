import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data_models/cart_data_model.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/app_theme.dart';
import '../widgets/success_dialog.dart';
import '../widgets/warning_dialog.dart';
import '../controllers/cart_controller.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final TextEditingController _addressController = TextEditingController(text: "123 Tech Avenue, Silicon Valley, CA");
  
  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = ref.watch(cartProvider);
    final cartItems = cartController.items;
    final totalValue = cartController.totalValue;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CustomAppBar(
                  title: "CHECKOUT",
                  showBackButton: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildSectionTitle("SHIPPING ADDRESS"),
                        const SizedBox(height: 10),
                        _buildAddressCard(),
                        const SizedBox(height: 30),
                        _buildSectionTitle("ORDER SUMMARY"),
                        const SizedBox(height: 10),
                        _buildOrderSummary(cartItems),
                        const SizedBox(height: 30),
                        _buildSectionTitle("PAYMENT METHOD"),
                        const SizedBox(height: 10),
                        _buildPaymentCard(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                _buildBottomBar(context, cartController, totalValue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.shareTechMono(
        fontSize: 12,
        color: AppColors.lightGreen,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.1);
  }

  Widget _buildAddressCard() {
    return ClayContainer(
      borderRadius: 20,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.location_on_outlined, color: AppColors.darkGreen, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home Address",
                  style: GoogleFonts.orbitron(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _addressController.text,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: AppColors.navyBlue.withOpacity(0.6),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          CustomButton(
            text: "Edit",
            onTap: () {},
            width: 60,
            height: 30,
            color: AppColors.navyBlue.withOpacity(0.05),
            textColor: AppColors.navyBlue,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildOrderSummary(List<CartItem> items) {
    return ClayContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${item.quantity}x ${item.product.name}",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.navyBlue.withOpacity(0.8),
                    ),
                  ),
                ),
                Text(
                  item.product.price,
                  style: GoogleFonts.shareTechMono(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyBlue,
                  ),
                ),
              ],
            ),
          )).toList(),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Fee",
                style: GoogleFonts.poppins(fontSize: 12, color: AppColors.navyBlue.withOpacity(0.6)),
              ),
              Text(
                "Rs 0.00",
                style: GoogleFonts.shareTechMono(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.lightGreen),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _buildPaymentCard() {
    return ClayContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.navyBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.account_balance_wallet_outlined, color: AppColors.navyBlue, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cash on Delivery",
                  style: GoogleFonts.orbitron(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyBlue,
                  ),
                ),
                Text(
                  "Pay when you receive",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: AppColors.navyBlue.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle_rounded, color: AppColors.lightGreen),
        ],
      ),
    ).animate().fadeIn(delay: 600.ms);
  }

  Widget _buildBottomBar(BuildContext context, CartController cartController, double total) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TOTAL AMOUNT",
                style: GoogleFonts.orbitron(
                  fontSize: 10,
                  color: AppColors.navyBlue.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Text(
                "Rs ${total.toStringAsFixed(2)}",
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.navyBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          CustomButton(
            text: "CONFIRM ORDER",
            onTap: () async {
              bool success = await cartController.checkout();
              if (success) {
                if (context.mounted) {
                  SuccessDialog.show(
                    context,
                    title: "Order Successful!",
                    message: "Thank you for your purchase.\nYour order will arrive soon.",
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    if (context.mounted) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  });
                }
              } else {
                if (context.mounted) {
                  WarningDialog.show(
                    context,
                    title: "Order Failed",
                    message: "Something went wrong with your order.",
                  );
                }
              }
            },
            color: AppColors.navyBlue,
            icon: Icons.verified_rounded,
          ),
        ],
      ),
    ).animate().slideY(begin: 0.2, end: 0, duration: 400.ms);
  }
}
