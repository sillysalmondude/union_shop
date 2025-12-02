import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'config/routes.dart';

void main() {
  usePathUrlStrategy(); // Use path urls without # prefix
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.getRoutes(),
      // for products to correctly handle deep links
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '/');

        if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'product') {
          return MaterialPageRoute(
            builder: (context) =>
                AppRoutes.getRoutes()[AppRoutes.productDetail]!(context),
            settings: RouteSettings(
              name: settings.name,
              arguments: uri.pathSegments[1],
            ),
          );
        }

        return null;
      },
    );
  }
}
