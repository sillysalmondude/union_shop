import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../models/product.dart';
import '../utils/product_loader.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? productId =
        ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: FutureBuilder<Product?>(
                future: loadProduct(productId ?? ''),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Product not found');
                  }

                  final product = snapshot.data!;
                  return Text(product.title);
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
