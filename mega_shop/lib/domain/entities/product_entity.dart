import 'package:flutter/material.dart';

class ProductEntity {
  final String image, category, title, description;
  final int price, size, id;

  ProductEntity({
    required this.image,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.id
  });
}
