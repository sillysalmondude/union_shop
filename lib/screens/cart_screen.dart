import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/common/app_footer.dart';
import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = CartService();
    final items = cartService.items;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
              child: Column(
                children: [
                  const Text(
                    'Your Cart',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (cartService.isEmpty) const Text('Your cart is empty'),
                  if (!cartService.isEmpty)
                    Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    item.product.asset,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.product.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        if (item.selectedSize != null)
                                          Text('Size: ${item.selectedSize}'),
                                        if (item.selectedColor != null)
                                          Text('Color: ${item.selectedColor}'),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Quantity',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Row(
                                          children: [
                                            if (item.quantity > 1)
                                              IconButton(
                                                onPressed: () {
                                                  cartService.updateQuantity(
                                                      index, item.quantity - 1);
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, '/cart');
                                                },
                                                icon: const Icon(Icons.remove),
                                              ),
                                            if (item.quantity == 1)
                                              IconButton(
                                                onPressed: null,
                                                icon: const Icon(Icons.remove),
                                              ),
                                            Text(
                                              '${item.quantity}',
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                cartService.updateQuantity(
                                                    index, item.quantity + 1);
                                                Navigator.pushReplacementNamed(
                                                    context, '/cart');
                                              },
                                              icon: const Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.subtotalFormatted,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      TextButton(
                                        onPressed: () {
                                          cartService.removeItem(index);
                                          Navigator.pushReplacementNamed(
                                              context, '/cart');
                                        },
                                        child: const Text('Remove'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Subtotal: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              cartService.totalPriceFormatted,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                cartService.clearCart();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Thank you! Your order has now been placed successfully.'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                Navigator.pushReplacementNamed(
                                    context, '/cart');
                              },
                              child: const Text('Checkout'),
                            ),
                          ],
                        ),
                      ],
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
