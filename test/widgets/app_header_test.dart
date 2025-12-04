import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/app_header.dart';

void main() {
  group('AppHeader Widget Tests', () {
    testWidgets('should create AppHeader widget', (tester) async {
      const header = AppHeader();
      expect(header, isA<StatelessWidget>());
    });

    testWidgets('should display sale banner', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(
        find.text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have correct banner color', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      final banner = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(AppHeader),
              matching: find.byType(Container),
            )
            .at(1),
      );

      expect(banner.color, const Color(0xFF4d2963));

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display logo with error handler', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display search icon', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display account icon', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byIcon(Icons.person_outline), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display cart icon', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display desktop navigation on wide screen',
        (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('Print Shop'), findsOneWidget);
      expect(find.text('Sale'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display menu icon on mobile', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byIcon(Icons.menu), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should not display desktop nav on mobile', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.widgetWithText(TextButton, 'Home'), findsNothing);
      expect(find.widgetWithText(TextButton, 'Shop'), findsNothing);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should open mobile menu when menu icon tapped',
        (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(ListTile, 'Home'), findsOneWidget);
      expect(find.widgetWithText(ListTile, 'Shop'), findsOneWidget);
      expect(find.widgetWithText(ListTile, 'Collections'), findsOneWidget);
      expect(find.widgetWithText(ListTile, 'Print Shop'), findsOneWidget);
      expect(find.widgetWithText(ListTile, 'Print Shop About'), findsOneWidget);
      expect(find.widgetWithText(ListTile, 'Sale'), findsOneWidget);
      expect(find.widgetWithText(ListTile, 'About'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have Collections popup menu', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.text('Collections'), findsWidgets);
      expect(find.byType(PopupMenuButton<String>), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have Print Shop popup menu', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.text('Print Shop'), findsWidgets);
      expect(find.byType(PopupMenuButton<String>), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should navigate to account when account icon tapped',
        (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: AppHeader(),
          ),
          routes: {
            '/account': (context) => const Scaffold(
                  body: Text('Account Screen'),
                ),
          },
        ),
      );

      await tester.tap(find.byIcon(Icons.person_outline));
      await tester.pumpAndSettle();

      expect(find.text('Account Screen'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should navigate to cart when cart icon tapped',
        (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: AppHeader(),
          ),
          routes: {
            '/cart': (context) => const Scaffold(
                  body: Text('Cart Screen'),
                ),
          },
        ),
      );

      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      expect(find.text('Cart Screen'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have white background color', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      final outerContainer = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(AppHeader),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(outerContainer.color, Colors.white);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have correct header height', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      final navContainer = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(AppHeader),
              matching: find.byType(Container),
            )
            .at(2),
      );

      expect(navContainer.constraints?.maxHeight, 60);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should navigate from mobile menu item', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: AppHeader(),
          ),
          routes: {
            '/shop': (context) => const Scaffold(
                  body: Text('Shop Screen'),
                ),
          },
        ),
      );

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ListTile, 'Shop'));
      await tester.pumpAndSettle();

      expect(find.text('Shop Screen'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display all icons on mobile', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should close mobile menu after navigation', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: AppHeader(),
          ),
          routes: {
            '/about': (context) => const Scaffold(
                  body: Text('About Screen'),
                ),
          },
        ),
      );

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(ListTile, 'About'), findsOneWidget);

      await tester.tap(find.widgetWithText(ListTile, 'About'));
      await tester.pumpAndSettle();

      expect(find.text('About Screen'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have GestureDetector for logo', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have IconButton widgets', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byType(IconButton), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });
  });
}
