import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';

final fruitsProductsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: 'f1',
      name: "Red Apple",
      weight: "1KG",
      price: "Rs 4.99",
      imagePath: "assets/fruits_images/1.jpeg",
      bgColor: Colors.red,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'f2',
      name: "Organic Banana",
      weight: "1KG",
      price: "Rs 2.50",
      imagePath: "assets/fruits_images/2.jpeg",
      bgColor: Colors.yellow,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'f3',
      name: "Sweet Orange",
      weight: "1KG",
      price: "Rs 3.99",
      imagePath: "assets/fruits_images/3.jpeg",
      bgColor: Colors.orange,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'f4',
      name: "Purple Grapes",
      weight: "500G",
      price: "Rs 5.50",
      imagePath: "assets/fruits_images/4.jpeg",
      bgColor: Colors.purple,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'f5',
      name: "Fresh Strawberry",
      weight: "250G",
      price: "Rs 4.50",
      imagePath: "assets/fruits_images/5.jpeg",
      bgColor: Colors.redAccent,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'f6',
      name: "Pineapple",
      weight: "1 UNIT",
      price: "Rs 6.00",
      imagePath: "assets/fruits_images/6.jpeg",
      bgColor: Colors.amber,
      icon: Icons.eco_rounded,
    ),
  ];
});
