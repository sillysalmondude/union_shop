import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../models/product.dart';
import '../models/collection.dart';
import '../widgets/shop/product_card.dart';
import '../utils/product_loader.dart';
import '../utils/collection_loader.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  String selectedSort = 'none';

  @override
  Widget build(BuildContext context) {
    final String? collectionId =
        ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
              child: FutureBuilder<Collection?>(
                future:
                    collectionId != null ? loadCollection(collectionId) : null,
                builder: (context, collectionSnapshot) {
                  final collection = collectionSnapshot.data;
                  final title = collection?.name ?? 'Collections';

                  return Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        collection!.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 40),
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
                      const SizedBox(height: 40),
                      FutureBuilder<List<Product>>(
                        future: loadProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError || !snapshot.hasData) {
                            return const Text('Unable to load products');
                          }

                          final allProducts = snapshot.data!;
                          var products = collectionId != null
                              ? allProducts
                                  .where((product) =>
                                      product.collection == collectionId)
                                  .toList()
                              : allProducts;

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
                  );
                },
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
