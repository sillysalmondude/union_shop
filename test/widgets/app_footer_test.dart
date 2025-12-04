import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/app_footer.dart';

void main() {
  group('AppFooter Widget Tests', () {
    testWidgets('should display Opening Hours section', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Monday - Friday'), findsOneWidget);
      expect(find.text('10am - 4pm'), findsOneWidget);
      expect(find.text('Purchase online 24/7'), findsOneWidget);
    });

    testWidgets('should display Help and Information section', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Terms & Conditions'), findsOneWidget);
    });

    testWidgets('should display Latest Offers section', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Latest Offers'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Subscribe'), findsOneWidget);
    });

    testWidgets('should have email input field', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      await tester.enterText(textField, 'test@example.com');
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('should show success message for valid email', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.tap(find.text('Subscribe'));
      await tester.pump();

      expect(find.text('Thank you for subscribing!'), findsOneWidget);
    });

    testWidgets('should show error message for invalid email', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'invalid-email');
      await tester.tap(find.text('Subscribe'));
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('should show error message for empty email', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      await tester.tap(find.text('Subscribe'));
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('should have correct background color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(AppFooter),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.color, const Color(0xFFF5F5F5));
    });

    testWidgets('should have Search button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      final searchButton = find.widgetWithText(TextButton, 'Search');
      expect(searchButton, findsOneWidget);

      await tester.tap(searchButton);
      await tester.pump();
    });

    testWidgets('should have Terms & Conditions button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      final termsButton = find.widgetWithText(TextButton, 'Terms & Conditions');
      expect(termsButton, findsOneWidget);

      await tester.tap(termsButton);
      await tester.pump();
    });
  });
}
