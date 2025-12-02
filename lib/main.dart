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
      // Set initial route
      initialRoute: AppRoutes.home,
      // Use config variables for routing
      routes: AppRoutes.getRoutes(),
    );
  }
}
