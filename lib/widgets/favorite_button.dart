import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';
import 'app_theme.dart';
import '../controllers/wishlist_controller.dart';

class FavoriteButton extends ConsumerWidget {
  final Product? product;
  final double size;

  const FavoriteButton({
    super.key,
    this.product,
    this.size = 14,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (product == null) {
      return Container();
    }

    final wishlistController = ref.watch(wishlistProvider);
    bool isFavorite = wishlistController.isFavorite(product!.id);

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          wishlistController.toggleFavorite(product!);
        },
        child: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          size: size,
          color: isFavorite ? Colors.redAccent : AppColors.navyBlue.withOpacity(0.2),
        ),
      ),
    );
  }
}
