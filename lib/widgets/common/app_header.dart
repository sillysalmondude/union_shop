import 'package:flutter/material.dart';
import '../../config/routes.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  void placeholderCallbackForButtons() {
    //
  }

  void navigateToHome(BuildContext context) {
    AppRoutes.navigateToAndClear(context, AppRoutes.home);
  }

  Widget buildNavButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => AppRoutes.navigateTo(context, route),
      child: Text(label),
    );
  }

  Widget buildNavItem(BuildContext context, String label, String route) {
    return ListTile(
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
        AppRoutes.navigateTo(context, route);
      },
    );
  }

  void showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildNavItem(context, 'Home', AppRoutes.home),
              buildNavItem(context, 'Shop', AppRoutes.shop),
              buildNavItem(context, 'Print Shop', AppRoutes.printShop),
              buildNavItem(context, 'Sale', AppRoutes.sale),
              buildNavItem(context, 'About', AppRoutes.about),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: Text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => navigateToHome(context),
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
                if (!isMobile) ...[
                  buildNavButton(context, 'Home', AppRoutes.home),
                  buildNavButton(context, 'Shop', AppRoutes.shop),
                  buildNavButton(context, 'Print Shop', AppRoutes.printShop),
                  buildNavButton(context, 'Sale', AppRoutes.sale),
                  buildNavButton(context, 'About', AppRoutes.about),
                  const Spacer(),
                ],
                IconButton(
                  icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                  onPressed: placeholderCallbackForButtons,
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline,
                      size: 18, color: Colors.grey),
                  onPressed: () =>
                      AppRoutes.navigateTo(context, AppRoutes.account),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined,
                      size: 18, color: Colors.grey),
                  onPressed: placeholderCallbackForButtons,
                ),
                if (isMobile)
                  IconButton(
                    icon: const Icon(Icons.menu, size: 18, color: Colors.grey),
                    onPressed: () => showMobileMenu(context),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
