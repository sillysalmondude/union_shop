import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/config/routes.dart';

void main() {
  group('UnionShopApp Tests', () {
    testWidgets('should create UnionShopApp widget', (tester) async {
      const app = UnionShopApp();
      expect(app, isA<StatelessWidget>());
    });

    test('should generate route for product deep link with two segments', () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      final route = materialApp.onGenerateRoute!(
        const RouteSettings(name: '/product/test-id'),
      );

      expect(route, isNotNull);
      expect(route?.settings.arguments, 'test-id');
    });

    test('should generate route for collection deep link with two segments',
        () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      final route = materialApp.onGenerateRoute!(
        const RouteSettings(name: '/collection/clothes'),
      );

      expect(route, isNotNull);
      expect(route?.settings.arguments, 'clothes');
    });

    test('should return null for invalid route', () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      final route = materialApp.onGenerateRoute!(
        const RouteSettings(name: '/invalid/route'),
      );

      expect(route, isNull);
    });

    test('should return null for product route with single segment', () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      final route = materialApp.onGenerateRoute!(
        const RouteSettings(name: '/product'),
      );

      expect(route, isNull);
    });

    test('should return null for collection route with single segment', () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      final route = materialApp.onGenerateRoute!(
        const RouteSettings(name: '/collection'),
      );

      expect(route, isNull);
    });

    test('should return null for route with too many segments', () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      final route = materialApp.onGenerateRoute!(
        const RouteSettings(name: '/product/id/extra'),
      );

      expect(route, isNull);
    });

    test('should have correct app configuration', () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      expect(materialApp.title, 'Union Shop');
      expect(materialApp.debugShowCheckedModeBanner, false);
      expect(materialApp.theme?.useMaterial3, true);
      expect(materialApp.initialRoute, AppRoutes.home);
      expect(materialApp.routes?.length, 11);
    });

    test('should handle empty route name', () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      final route = materialApp.onGenerateRoute!(
        const RouteSettings(name: ''),
      );

      expect(route, isNull);
    });

    test('should handle null route name', () {
      const app = UnionShopApp();
      final widget = app.build(FakeBuildContext());
      final materialApp = widget as MaterialApp;

      final route = materialApp.onGenerateRoute!(
        const RouteSettings(name: null),
      );

      expect(route, isNull);
    });
  });
}

class FakeBuildContext implements BuildContext {
  @override
  bool get debugDoingBuild => false;

  @override
  bool get mounted => true;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
