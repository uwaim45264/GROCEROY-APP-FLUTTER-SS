import 'package:flutter/material.dart';

class BakeryProduct {
  final String id;
  final String name;
  final String price;
  final String weight;
  final String imagePath;
  final IconData icon;
  final Color? bgColor;
  final int stock;

  BakeryProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.imagePath,
    this.icon = Icons.bakery_dining_rounded,
    this.bgColor,
    this.stock = 10,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'weight': weight,
      'imagePath': imagePath,
      'stock': stock,
    };
  }

  factory BakeryProduct.fromMap(Map<String, dynamic> map) {
    return BakeryProduct(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      weight: map['weight'] ?? '',
      imagePath: map['imagePath'] ?? '',
      stock: map['stock'] ?? 10,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BakeryProduct && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
