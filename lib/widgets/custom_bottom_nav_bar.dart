import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'app_theme.dart';
import '../controllers/cart_controller.dart';
import '../controllers/wishlist_controller.dart';

class CustomBottomNavBar extends ConsumerWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final wishlist = ref.watch(wishlistProvider);

    final int wishlistCount = wishlist.items.length;
    final int cartCount = cart.items.length;

    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: AppColors.navyBlue,
      buttonBackgroundColor: AppColors.lightGreen,
      height: 60,
      animationDuration: const Duration(milliseconds: 300),
      index: selectedIndex,
      items: [
        Icon(
          selectedIndex == 0 ? Icons.home : Icons.home_outlined,
          size: 22,
          color: Colors.white,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              selectedIndex == 1 ? Icons.favorite : Icons.favorite_border,
              size: 22,
              color: Colors.white,
            ),
            if (wishlistCount > 0)
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Center(
                    child: Text(
                      '$wishlistCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              selectedIndex == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined,
              size: 22,
              color: Colors.white,
            ),
            if (cartCount > 0)
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Center(
                    child: Text(
                      '$cartCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Icon(
          selectedIndex == 3 ? Icons.notifications : Icons.notifications_none,
          size: 22,
          color: Colors.white,
        ),
      ],
      onTap: onTap,
    );
  }
}
