import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';
import '../services/database_helper.dart';

class WishlistProvider extends ChangeNotifier {
  WishlistProvider() {
    _loadWishlist();
  }

  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  Future<void> _loadWishlist() async {
    final wishlistData = await DatabaseHelper.instance.getWishlistItems();
    _items.clear();
    for (var item in wishlistData) {
      _items.add(Product(
        id: item['id'],
        name: item['name'],
        price: item['price'],
        weight: item['weight'],
        imagePath: item['imagePath'],
        category: item['category'] ?? 'Fruits',
      ));
    }
    notifyListeners();
  }

  Future<void> toggleFavorite(Product product) async {
    await DatabaseHelper.instance.toggleWishlist(product);
    if (_items.any((item) => item.id == product.id)) {
      _items.removeWhere((item) => item.id == product.id);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  Future<void> removeFromWishlist(String productId) async {
    final product = _items.firstWhere((item) => item.id == productId);
    await DatabaseHelper.instance.toggleWishlist(product);
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  Future<void> clearWishlist() async {
    for (var item in _items) {
      await DatabaseHelper.instance.toggleWishlist(item);
    }
    _items.clear();
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _items.any((item) => item.id == productId);
  }
}

final wishlistProvider = ChangeNotifierProvider<WishlistProvider>((ref) {
  return WishlistProvider();
});
