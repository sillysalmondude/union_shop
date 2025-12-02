import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../models/product.dart';
import '../utils/product_loader.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              child: FutureBuilder<Product?>(
                future: loadProduct(productId),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading...');
                  }

                  final product = snapshot.data!;
                  return Wrap(
                    spacing: 40,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Image.asset(product.asset),
                      ),
                      SizedBox(
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              product.priceFormatted,
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Add to cart'),
                            ),
                            const SizedBox(height: 24),
                            Text(product.description),
                          ],
                        ),
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
