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
  String selectedSort = 'none';

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
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Sort by:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 16),
                          DropdownButton<String>(
                            value: selectedSort,
                            items: const [
                              DropdownMenuItem(
                                value: 'none',
                                child: Text('None'),
                              ),
                              DropdownMenuItem(
                                value: 'name_asc',
                                child: Text('A-Z'),
                              ),
                              DropdownMenuItem(
                                value: 'name_desc',
                                child: Text('Z-A'),
                              ),
                              DropdownMenuItem(
                                value: 'price_low',
                                child: Text('Price: Low to High'),
                              ),
                              DropdownMenuItem(
                                value: 'price_high',
                                child: Text('Price: High to Low'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedSort = value!;
                              });
                            },
                          ),
                        ],
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
                      var products = selectedCollection == 'all'
                          ? allProducts
                          : allProducts
                              .where((product) =>
                                  product.collection == selectedCollection)
                              .toList();

                      // Apply sorting
                      if (selectedSort == 'name_asc') {
                        products.sort((a, b) => a.title.compareTo(b.title));
                      } else if (selectedSort == 'name_desc') {
                        products.sort((a, b) => b.title.compareTo(a.title));
                      } else if (selectedSort == 'price_low') {
                        products.sort((a, b) => a.price.compareTo(b.price));
                      } else if (selectedSort == 'price_high') {
                        products.sort((a, b) => b.price.compareTo(a.price));
                      }

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
