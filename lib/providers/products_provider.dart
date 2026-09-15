import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';
import '../widgets/app_theme.dart';


final allProductsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: 'p1',
      name: "Organic Banana",
      price: "Rs 4.99",
      weight: "1KG",
      imagePath: 'assets/images/2.jpg',
      icon: Icons.eco_rounded,
      bgColor: AppColors.cream,
      stock: 12,
    ),
    Product(
      id: 'p2',
      name: "Red Apple",
      price: "Rs 2.49",
      weight: "1KG",
      imagePath: 'assets/images/3.jpg',
      icon: Icons.eco_rounded,
      bgColor: Colors.red[50],
      stock: 5,
    ),
    Product(
      id: 'p3',
      name: "Fresh Ginger",
      price: "Rs 1.99",
      weight: "1KG",
      imagePath: 'assets/images/4.jpg',
      icon: Icons.eco_rounded,
      bgColor: Colors.orange[50],
      stock: 0,
    ),
    Product(
      id: 'p4',
      name: "Bell Pepper",
      price: "Rs 3.25",
      weight: "1KG",
      imagePath: 'assets/images/5.jpg',
      icon: Icons.eco_rounded,
      bgColor: Colors.green[50],
      stock: 8,
    ),
  ];
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
