import 'package:flutter/material.dart';
import '../../config/routes.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  void placeholderCallbackForButtons() {
    // tbd
  }

  void navigateToHome(BuildContext context) {
    AppRoutes.navigateToAndClear(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    navigateToHome(context);
                  },
                  child: Image.network(
                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                    height: 18,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        width: 18,
                        height: 18,
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.grey, size: 12),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                      onPressed: () =>
                          AppRoutes.navigateTo(context, AppRoutes.shop),
                      child: const Text('Shop'),
                    ),
                    TextButton(
                      onPressed: () =>
                          AppRoutes.navigateTo(context, AppRoutes.printShop),
                      child: const Text('Print Shop'),
                    ),
                    TextButton(
                      onPressed: () =>
                          AppRoutes.navigateTo(context, AppRoutes.sale),
                      child: const Text('Sale'),
                    ),
                    TextButton(
                      onPressed: () =>
                          AppRoutes.navigateTo(context, AppRoutes.about),
                      child: const Text('About'),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 18,
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  onPressed: placeholderCallbackForButtons,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person_outline,
                    size: 18,
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  onPressed: placeholderCallbackForButtons,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 18,
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  onPressed: placeholderCallbackForButtons,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 18,
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  onPressed: placeholderCallbackForButtons,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
