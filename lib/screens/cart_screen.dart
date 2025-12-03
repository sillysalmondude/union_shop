import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = CartService();

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
                    'Cart',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (cartService.isEmpty)
                    const Text('Your cart is empty')
                  else ...[
                    for (var item in cartService.items) ...[
                      Text(item.product.title),
                      Text('Quantity: ${item.quantity}'),
                      Text('Price: ${item.subtotalFormatted}'),
                      const SizedBox(height: 16),
                    ],
                    const SizedBox(height: 24),
                    Text(
                      'Total: ${cartService.totalPriceFormatted}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
