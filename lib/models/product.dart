import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String weight;
  final String imagePath;
  final IconData icon;
  final Color? bgColor;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.imagePath,
    this.icon = Icons.eco_rounded,
    this.bgColor,
    this.stock = 10, // Default stock THIS ONLY FOR ME TO REMEBER UWAIM
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
