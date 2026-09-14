import 'package:flutter/material.dart';
import 'app_theme.dart';
import '../models/product.dart';
import '../controllers/wishlist_controller.dart';

class FavoriteButton extends StatefulWidget {
  final Product? product;
  final double size;

  const FavoriteButton({
    super.key,
    this.product,
    this.size = 14,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final WishlistController _wishlistController = WishlistController();

  @override
  void initState() {
    super.initState();
    _wishlistController.addListener(_updateState);
  }

  @override
  void dispose() {
    _wishlistController.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.product == null) {
      return Container();
    }

    bool isFavorite = _wishlistController.isFavorite(widget.product!.id);

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          _wishlistController.toggleFavorite(widget.product!);
        },
        child: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          size: widget.size,
          color: isFavorite ? Colors.redAccent : AppColors.navyBlue.withOpacity(0.2),
        ),
      ),
    );
  }
}
