import 'products_data_model.dart';

class WishlistItem {
  final Product product;

  WishlistItem({required this.product});

  Map<String, dynamic> toMap() {
    return {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'weight': product.weight,
      'imagePath': product.imagePath,
    };
  }
}
