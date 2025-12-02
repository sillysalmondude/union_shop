import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/product.dart';

Future<List<Product>> loadProducts() async {
  final String jsonString = await rootBundle.loadString('data/products.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Product.fromJson(json)).toList();
}

Future<Product?> loadProduct(String productId) async {
  final products = await loadProducts();
  for (var product in products) {
    if (product.id == productId) {
      return product;
    }
  }
  return null;
}
