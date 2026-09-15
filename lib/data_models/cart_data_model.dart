import 'products_data_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'weight': product.weight,
      'imagePath': product.imagePath,
      'quantity': quantity,
    };
  }
}
