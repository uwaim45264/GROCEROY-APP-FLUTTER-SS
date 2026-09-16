import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';

final veggiesProductsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: 'v1',
      name: "Fresh Broccoli",
      weight: "500G",
      price: "Rs 2.99",
      imagePath: "assets/vegetables_images/1.jpeg",
      bgColor: Colors.green,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'v2',
      name: "Organic Carrots",
      weight: "1KG",
      price: "Rs 1.50",
      imagePath: "assets/vegetables_images/2.jpeg",
      bgColor: Colors.orange,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'v3',
      name: "Bell Pepper",
      weight: "1KG",
      price: "Rs 3.25",
      imagePath: "assets/vegetables_images/3.jpeg",
      bgColor: Colors.red,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'v4',
      name: "Baby Spinach",
      weight: "250G",
      price: "Rs 1.99",
      imagePath: "assets/vegetables_images/4.jpeg",
      bgColor: Colors.green,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'v5',
      name: "Cucumber",
      weight: "1 UNIT",
      price: "Rs 0.99",
      imagePath: "assets/vegetables_images/5.jpeg",
      bgColor: Colors.green,
      icon: Icons.eco_rounded,
    ),
    Product(
      id: 'v6',
      name: "Fresh Tomato",
      weight: "1KG",
      price: "Rs 2.49",
      imagePath: "assets/vegetables_images/6.jpeg",
      bgColor: Colors.red,
      icon: Icons.eco_rounded,
    ),
  ];
});
