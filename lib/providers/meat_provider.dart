import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';

final meatProductsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: 'm1',
      name: "Beef Steak",
      weight: "1KG",
      price: "Rs 15.99",
      imagePath: "assets/categories/Meat Category.png",
      bgColor: Colors.red,
      icon: Icons.kebab_dining_rounded,
    ),
    Product(
      id: 'm2',
      name: "Chicken Breast",
      weight: "1KG",
      price: "Rs 8.50",
      imagePath: "assets/categories/Meat Category.png",
      bgColor: Colors.orange,
      icon: Icons.kebab_dining_rounded,
    ),
    Product(
      id: 'm3',
      name: "Salmon Fillet",
      weight: "500G",
      price: "Rs 12.99",
      imagePath: "assets/categories/Meat Category.png",
      bgColor: Colors.pink,
      icon: Icons.set_meal_rounded,
    ),
    Product(
      id: 'm4',
      name: "Lamb Chops",
      weight: "1KG",
      price: "Rs 18.50",
      imagePath: "assets/categories/Meat Category.png",
      bgColor: Colors.brown,
      icon: Icons.kebab_dining_rounded,
    ),
    Product(
      id: 'm5',
      name: "Pork Ribs",
      weight: "1KG",
      price: "Rs 10.99",
      imagePath: "assets/categories/Meat Category.png",
      bgColor: Colors.redAccent,
      icon: Icons.kebab_dining_rounded,
    ),
    Product(
      id: 'm6',
      name: "Fresh Shrimp",
      weight: "500G",
      price: "Rs 9.99",
      imagePath: "assets/categories/Meat Category.png",
      bgColor: Colors.orangeAccent,
      icon: Icons.set_meal_rounded,
    ),
  ];
});
