import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';
import '../widgets/app_theme.dart';

final allProductsProvider = Provider<List<Product>>((ref) {
  return [
    // Fruits
    Product(
      id: 'f1',
      name: "Organic Banana",
      price: "Rs 4.99",
      weight: "1KG",
      imagePath: 'assets/images/2.jpg',
      icon: Icons.eco_rounded,
      bgColor: AppColors.cream,
      stock: 12,
      category: "Fruits",
    ),
    Product(
      id: 'f2',
      name: "Red Apple",
      price: "Rs 2.49",
      weight: "1KG",
      imagePath: 'assets/images/3.jpg',
      icon: Icons.eco_rounded,
      bgColor: Colors.red[50],
      stock: 5,
      category: "Fruits",
    ),
    // Veggies
    Product(
      id: 'v1',
      name: "Fresh Ginger",
      price: "Rs 1.99",
      weight: "1KG",
      imagePath: 'assets/images/4.jpg',
      icon: Icons.eco_rounded,
      bgColor: Colors.orange[50],
      stock: 0,
      category: "Veggies",
    ),
    Product(
      id: 'v2',
      name: "Bell Pepper",
      price: "Rs 3.25",
      weight: "1KG",
      imagePath: 'assets/images/5.jpg',
      icon: Icons.eco_rounded,
      bgColor: Colors.green[50],
      stock: 8,
      category: "Veggies",
    ),
    // Dairy
    Product(
      id: 'd1',
      name: "Fresh Milk",
      price: "Rs 2.50",
      weight: "1L",
      imagePath: 'assets/images/6.jpg',
      icon: Icons.opacity,
      bgColor: Colors.blue[50],
      stock: 15,
      category: "Dairy",
    ),
    Product(
      id: 'd2',
      name: "Greek Yogurt",
      price: "Rs 3.99",
      weight: "500G",
      imagePath: 'assets/images/1.jpg',
      icon: Icons.icecream_rounded,
      bgColor: Colors.blue[50],
      stock: 10,
      category: "Dairy",
    ),
    // Meat
    Product(
      id: 'm1',
      name: "Beef Steak",
      price: "Rs 15.00",
      weight: "500g",
      imagePath: 'assets/images/7.jpg',
      icon: Icons.kebab_dining,
      bgColor: Colors.red[100],
      stock: 4,
      category: "Meat",
    ),
    Product(
      id: 'm2',
      name: "Chicken Breast",
      price: "Rs 8.50",
      weight: "1KG",
      imagePath: 'assets/images/2.jpg',
      icon: Icons.kebab_dining,
      bgColor: Colors.orange[50],
      stock: 12,
      category: "Meat",
    ),
    // Bakery
    Product(
      id: 'b1',
      name: "Whole Grain Bread",
      price: "Rs 3.50",
      weight: "500g",
      imagePath: 'assets/images/1.jpg',
      icon: Icons.bakery_dining,
      bgColor: Colors.brown[50],
      stock: 10,
      category: "Bakery",
    ),
    Product(
      id: 'b2',
      name: "Butter Croissant",
      price: "Rs 2.50",
      weight: "1 UNIT",
      imagePath: 'assets/images/3.jpg',
      icon: Icons.bakery_dining,
      bgColor: Colors.amber[50],
      stock: 20,
      category: "Bakery",
    ),
    // Drinks
    Product(
      id: 'dr1',
      name: "Fresh Orange Juice",
      price: "Rs 5.99",
      weight: "1L",
      imagePath: 'assets/images/2.jpg',
      icon: Icons.local_drink,
      bgColor: Colors.orange[50],
      stock: 20,
      category: "Drinks",
    ),
    Product(
      id: 'dr2',
      name: "Coconut Water",
      price: "Rs 3.50",
      weight: "500ML",
      imagePath: 'assets/images/4.jpg',
      icon: Icons.local_drink,
      bgColor: Colors.lightBlue[50],
      stock: 15,
      category: "Drinks",
    ),
    // beverages
    Product(
      id: 'bv1',
      name: "Coconut Water",
      price: "Rs 3.50",
      weight: "500ML",
      imagePath: 'assets/images/4.jpg',
      icon: Icons.local_drink,
      bgColor: Colors.lightBlue[50],
      stock: 15,
      category: "Beverages",
    ),
  ];
});

final categoryProductsProvider = Provider.family<List<Product>, String>((ref, category) {
  final allProducts = ref.watch(allProductsProvider);
  return allProducts.where((product) => product.category.toLowerCase() == category.toLowerCase()).toList();
});

final popularDealsProvider = Provider<List<Product>>((ref) {
  final products = ref.watch(allProductsProvider);
  return products.take(4).toList();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedProductsProvider = Provider<List<Product>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final products = ref.watch(allProductsProvider);
  
  if (query.isEmpty) return products;
  
  return products.where((product) {
    return product.name.toLowerCase().contains(query);
  }).toList();
});
