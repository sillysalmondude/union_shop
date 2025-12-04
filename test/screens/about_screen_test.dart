import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/screens/about_screen.dart';

void main() {
  group('AboutScreen Tests', () {
    testWidgets('should create AboutScreen widget', (tester) async {
      const screen = AboutScreen();
      expect(screen, isA<StatelessWidget>());
    });

    testWidgets('should display page title', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.text('About us'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display welcome message', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.text('Welcome to the Union Shop!'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display delivery information', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(
        find.text(
            'All online purchases are available for delivery or instore collection!'),
        findsOneWidget,
      );

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display contact information', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(
        find.textContaining('hello@upsu.net'),
        findsOneWidget,
      );

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display closing message', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.text('Happy shopping!'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display team signature', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.text('The Union Shop & Reception Team'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have SingleChildScrollView', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have Scaffold', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have Container widgets', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byType(Container), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have ConstrainedBox', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byType(ConstrainedBox), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display personalisation service link', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.text('personalisation service'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should navigate to print shop when link tapped',
        (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: const AboutScreen(),
          routes: {
            '/print-shop': (context) => const Scaffold(
                  body: Text('Print Shop Screen'),
                ),
          },
        ),
      );

      await tester.tap(find.text('personalisation service'));
      await tester.pumpAndSettle();

      expect(find.text('Print Shop Screen'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have RichText widgets', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byType(RichText), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have GestureDetector for link', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byType(GestureDetector), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have multiple Text widgets', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byType(Text), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have SizedBox widgets for spacing', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byType(SizedBox), findsWidgets);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have correct title font size', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      final titleText = tester.widget<Text>(find.text('About us'));
      expect(titleText.style?.fontSize, 32);
      expect(titleText.style?.fontWeight, FontWeight.bold);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have centered title', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      final titleText = tester.widget<Text>(find.text('About us'));
      expect(titleText.textAlign, TextAlign.center);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should have correct content font size', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      final contentText =
          tester.widget<Text>(find.text('Welcome to the Union Shop!'));
      expect(contentText.style?.fontSize, 16);

      addTearDown(tester.view.resetPhysicalSize);
    });
  });
}
