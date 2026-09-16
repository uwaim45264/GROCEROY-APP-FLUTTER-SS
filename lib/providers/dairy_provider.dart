import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';

final dairyProductsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: 'd1',
      name: "Fresh Milk",
      weight: "1.0 L",
      price: "Rs 3.50",
      imagePath: "assets/categories/Dairy Category.png",
      bgColor: Colors.blue,
      icon: Icons.water_drop_rounded,
    ),
    Product(
      id: 'd2',
      name: "Organic Eggs",
      weight: "12 UNITS",
      price: "Rs 4.99",
      imagePath: "assets/categories/Dairy Category.png",
      bgColor: Colors.amber,
      icon: Icons.egg_rounded,
    ),
    Product(
      id: 'd3',
      name: "Greek Yogurt",
      weight: "500 G",
      price: "Rs 2.99",
      imagePath: "assets/categories/Dairy Category.png",
      bgColor: Colors.lightBlue,
      icon: Icons.icecream_rounded,
    ),
    Product(
      id: 'd4',
      name: "Cheddar Cheese",
      weight: "200 G",
      price: "Rs 5.50",
      imagePath: "assets/categories/Dairy Category.png",
      bgColor: Colors.orange,
      icon: Icons.bakery_dining_rounded,
    ),
    Product(
      id: 'd5',
      name: "Unsalted Butter",
      weight: "250 G",
      price: "Rs 4.25",
      imagePath: "assets/categories/Dairy Category.png",
      bgColor: Colors.yellow,
      icon: Icons.bakery_dining_rounded,
    ),
    Product(
      id: 'd6',
      name: "Sour Cream",
      weight: "250 ML",
      price: "Rs 2.50",
      imagePath: "assets/categories/Dairy Category.png",
      bgColor: Colors.blueGrey,
      icon: Icons.icecream_rounded,
    ),
  ];
});
