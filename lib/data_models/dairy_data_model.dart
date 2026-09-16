import 'package:flutter/material.dart';

class DairyProduct {
  final String id;
  final String name;
  final String price;
  final String weight;
  final String imagePath;
  final IconData icon;
  final Color? bgColor;
  final int stock;

  DairyProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.imagePath,
    this.icon = Icons.water_drop_rounded,
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

  factory DairyProduct.fromMap(Map<String, dynamic> map) {
    return DairyProduct(
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
      other is DairyProduct && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
