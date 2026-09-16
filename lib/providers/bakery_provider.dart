import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';

final bakeryProductsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: 'b1',
      name: "Croissant",
      weight: "1 UNIT",
      price: "Rs 2.50",
      imagePath: "assets/images/1.jpg",
      bgColor: Colors.brown,
      icon: Icons.bakery_dining_rounded,
    ),
    Product(
      id: 'b2',
      name: "Ciabatta",
      weight: "500G",
      price: "Rs 3.50",
      imagePath: "assets/images/2.jpg",
      bgColor: Colors.orange,
      icon: Icons.bakery_dining_rounded,
    ),
    Product(
      id: 'b3',
      name: "Baguette",
      weight: "1 UNIT",
      price: "Rs 1.99",
      imagePath: "assets/images/3.jpg",
      bgColor: Colors.amber,
      icon: Icons.bakery_dining_rounded,
    ),
    Product(
      id: 'b4',
      name: "Muffin",
      weight: "1 UNIT",
      price: "Rs 2.25",
      imagePath: "assets/images/4.jpg",
      bgColor: Colors.brown,
      icon: Icons.bakery_dining_rounded,
    ),
    Product(
      id: 'b5',
      name: "Garlic Bread",
      weight: "250G",
      price: "Rs 4.50",
      imagePath: "assets/images/5.jpg",
      bgColor: Colors.yellow,
      icon: Icons.bakery_dining_rounded,
    ),
    Product(
      id: 'b6',
      name: "Donut",
      weight: "1 UNIT",
      price: "Rs 1.50",
      imagePath: "assets/images/1.jpg",
      bgColor: Colors.pink,
      icon: Icons.bakery_dining_rounded,
    ),
  ];
});
