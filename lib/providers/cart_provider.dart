import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/cart_data_model.dart';
import '../data_models/products_data_model.dart';

import '../services/database_helper.dart';

class CartProvider extends ChangeNotifier {
  CartProvider() {
    _loadCart();
  }

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  double get totalValue {
    double total = 0.0;
    for (var item in _items) {
      final double price = double.tryParse(item.product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
      total += price * item.quantity;
    }
    return total;
  }

  Future<void> _loadCart() async {
    final cartData = await DatabaseHelper.instance.getCartItems();
    _items.clear();
    for (var item in cartData) {
      _items.add(CartItem(
        product: Product(
          id: item['id'],
          name: item['name'],
          price: item['price'],
          weight: item['weight'],
          imagePath: item['imagePath'],
        ),
        quantity: item['quantity'],
      ));
    }
    notifyListeners();
  }

  Future<void> addProduct(Product product, {int quantity = 1}) async {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += quantity;
      await DatabaseHelper.instance.addToCart(product, _items[index].quantity);
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
      await DatabaseHelper.instance.addToCart(product, quantity);
    }
    notifyListeners();
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
        await DatabaseHelper.instance.removeFromCart(productId);
      } else {
        _items[index].quantity = quantity;
        await DatabaseHelper.instance.addToCart(_items[index].product, quantity);
      }
      notifyListeners();
    }
  }

  Future<void> removeProduct(String productId) async {
    _items.removeWhere((item) => item.product.id == productId);
    await DatabaseHelper.instance.removeFromCart(productId);
    notifyListeners();
  }

  Future<void> clearCart() async {
    for (var item in _items) {
      await DatabaseHelper.instance.removeFromCart(item.product.id);
    }
    _items.clear();
    notifyListeners();
  }

  int getQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    return index >= 0 ? _items[index].quantity : 0;
  }
}

final cartProvider = ChangeNotifierProvider<CartProvider>((ref) => CartProvider());
