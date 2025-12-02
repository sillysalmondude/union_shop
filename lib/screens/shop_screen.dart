import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../models/product.dart';
import '../widgets/shop/product_card.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  Future<List<Product>> loadProducts() async {
    final String jsonString = await rootBundle.loadString('data/products.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
              child: Column(
                children: [
                  const Text(
                    'Shop',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  FutureBuilder<List<Product>>(
                    future: loadProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return const Text('Unable to load products');
                      }

                      final products = snapshot.data!;
                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount:
                            MediaQuery.of(context).size.width > 768 ? 3 : 1,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 48,
                        children: products.map((product) {
                          return ProductCard(
                            title: product.title,
                            price: product.priceFormatted,
                            imageAsset: product.asset,
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
