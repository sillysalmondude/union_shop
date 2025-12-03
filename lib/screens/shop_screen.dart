import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../models/product.dart';
import '../widgets/shop/product_card.dart';
import '../utils/product_loader.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String selectedCollection = 'all';

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
                  Row(
                    children: [
                      const Text(
                        'Collection:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        value: selectedCollection,
                        items: const [
                          DropdownMenuItem(
                            value: 'all',
                            child: Text('All'),
                          ),
                          DropdownMenuItem(
                            value: 'accessories',
                            child: Text('Accessories'),
                          ),
                          DropdownMenuItem(
                            value: 'clothes',
                            child: Text('Clothes'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedCollection = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  FutureBuilder<List<Product>>(
                    future: loadProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return const Text('Unable to load products');
                      }

                      final allProducts = snapshot.data!;
                      final products = selectedCollection == 'all'
                          ? allProducts
                          : allProducts
                              .where((product) =>
                                  product.collection == selectedCollection)
                              .toList();

                      if (products.isEmpty) {
                        return const Text('No products found');
                      }

                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount:
                            MediaQuery.of(context).size.width > 768 ? 3 : 1,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 48,
                        children: products.map((product) {
                          return ProductCard(
                            id: product.id,
                            title: product.title,
                            price: product.priceFormatted,
                            imageAsset: product.asset,
                            salePrice: product.salePriceFormatted,
                            isOnSale: product.isOnSale,
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
