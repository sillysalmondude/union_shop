import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/shop_screen.dart';
import '../screens/print_shop_screen.dart';
import '../screens/sale_screen.dart';
import '../screens/about_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/account_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/print_shop_about_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String shop = '/shop';
  static const String printShop = '/print-shop';
  static const String sale = '/sale';
  static const String about = '/about';
  static const String collections = '/collections';
  static const String productDetail = '/product';
  static const String account = '/account';
  static const String cart = '/cart';
  static const String printShopAbout = '/print-shop-about';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      shop: (context) => const ShopScreen(),
      printShop: (context) => const PrintShopScreen(),
      sale: (context) => const SaleScreen(),
      about: (context) => const AboutScreen(),
      productDetail: (context) => const ProductDetailScreen(),
      account: (context) => const AccountScreen(),
      cart: (context) => const CartScreen(),
      printShopAbout: (context) => const PrintShopAboutScreen(),
    };
  }

  static Future<dynamic> navigateTo(BuildContext context, String routeName) {
    return Navigator.pushNamed(context, routeName);
  }

  static Future<dynamic> navigateToAndClear(
      BuildContext context, String routeName) {
    return Navigator.pushNamedAndRemoveUntil(
        context, routeName, (route) => false);
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
