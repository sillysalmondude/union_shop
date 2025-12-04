import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/config/routes.dart';

void main() {
  group('AppRoutes Tests', () {
    test('should have all route constants defined', () {
      expect(AppRoutes.home, '/');
      expect(AppRoutes.shop, '/shop');
      expect(AppRoutes.printShop, '/print-shop');
      expect(AppRoutes.sale, '/sale');
      expect(AppRoutes.about, '/about');
      expect(AppRoutes.collections, '/collections');
      expect(AppRoutes.collection, '/collection');
      expect(AppRoutes.productDetail, '/product');
      expect(AppRoutes.account, '/account');
      expect(AppRoutes.cart, '/cart');
      expect(AppRoutes.printShopAbout, '/print-shop-about');
    });

    test('should return map with all routes', () {
      final routes = AppRoutes.getRoutes();

      expect(routes.containsKey('/'), true);
      expect(routes.containsKey('/shop'), true);
      expect(routes.containsKey('/print-shop'), true);
      expect(routes.containsKey('/sale'), true);
      expect(routes.containsKey('/about'), true);
      expect(routes.containsKey('/collections'), true);
      expect(routes.containsKey('/collection'), true);
      expect(routes.containsKey('/product'), true);
      expect(routes.containsKey('/account'), true);
      expect(routes.containsKey('/cart'), true);
      expect(routes.containsKey('/print-shop-about'), true);
    });

    test('should have correct number of routes', () {
      final routes = AppRoutes.getRoutes();
      expect(routes.length, 11);
    });

    test('should return WidgetBuilder for each route', () {
      final routes = AppRoutes.getRoutes();

      for (var route in routes.values) {
        expect(route, isNotNull);
      }
    });
  });
}
