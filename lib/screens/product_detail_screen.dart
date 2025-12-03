import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../models/product.dart';
import '../utils/product_loader.dart';
import '../services/cart_service.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? selectedSize;
  String? selectedColor;
  int quantity = 1;

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

                  // Set default selections
                  if (selectedSize == null && product.sizes.isNotEmpty) {
                    selectedSize = product.sizes.first;
                  }
                  if (selectedColor == null && product.colors.isNotEmpty) {
                    selectedColor = product.colors.first;
                  }

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
                            Row(
                              children: [
                                Text(
                                  product.priceFormatted,
                                  style: TextStyle(
                                    fontSize: 24,
                                    decoration: product.isOnSale
                                        ? TextDecoration.lineThrough
                                        : null,
                                    color: product.isOnSale
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                                if (product.isOnSale) ...[
                                  const SizedBox(width: 16),
                                  Text(
                                    product.salePriceFormatted,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 24),
                            if (product.sizes.isNotEmpty) ...[
                              const Text(
                                'Size',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              DropdownButton<String>(
                                value: selectedSize,
                                isExpanded: true,
                                items: product.sizes.map((size) {
                                  return DropdownMenuItem(
                                    value: size,
                                    child: Text(size),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedSize = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 16),
                            ],
                            if (product.colors.isNotEmpty) ...[
                              const Text(
                                'Color',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              DropdownButton<String>(
                                value: selectedColor,
                                isExpanded: true,
                                items: product.colors.map((color) {
                                  return DropdownMenuItem(
                                    value: color,
                                    child: Text(color),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedColor = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 16),
                            ],
                            const Text(
                              'Quantity',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: quantity > 1
                                      ? () {
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      : null,
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(
                                  '$quantity',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                IconButton(
                                  onPressed: quantity < product.stock
                                      ? () {
                                          setState(() {
                                            quantity++;
                                          });
                                        }
                                      : null,
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {
                                CartService().addItem(
                                  product,
                                  quantity,
                                  selectedSize,
                                  selectedColor,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Added to cart!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
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
