import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/products_data_model.dart';

final beveragesProductsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: 'be1',
      name: "Orange Juice",
      weight: "1.0 L",
      price: "Rs 5.99",
      imagePath: "assets/categories/Beverages Category.png",
      bgColor: Colors.orange,
      icon: Icons.local_drink_rounded,
    ),
    Product(
      id: 'be2',
      name: "Apple Juice",
      weight: "1.0 L",
      price: "Rs 4.99",
      imagePath: "assets/categories/Beverages Category.png",
      bgColor: Colors.red,
      icon: Icons.local_drink_rounded,
    ),
    Product(
      id: 'be3',
      name: "Coconut Water",
      weight: "500 ml",
      price: "Rs 3.50",
      imagePath: "assets/categories/Beverages Category.png",
      bgColor: Colors.lightBlue,
      icon: Icons.local_drink_rounded,
    ),
    Product(
      id: 'be4',
      name: "Iced Coffee",
      weight: "250 ml",
      price: "Rs 2.99",
      imagePath: "assets/categories/Beverages Category.png",
      bgColor: Colors.brown,
      icon: Icons.coffee_rounded,
    ),
    Product(
      id: 'be5',
      name: "Green Tea",
      weight: "500 ml",
      price: "Rs 2.49",
      imagePath: "assets/categories/Beverages Category.png",
      bgColor: Colors.green,
      icon: Icons.emoji_food_beverage_rounded,
    ),
    Product(
      id: 'be6',
      name: "Mineral Water",
      weight: "1.5 L",
      price: "Rs 1.99",
      imagePath: "assets/categories/Beverages Category.png",
      bgColor: Colors.blue,
      icon: Icons.water_drop_rounded,
    ),
  ];
});
