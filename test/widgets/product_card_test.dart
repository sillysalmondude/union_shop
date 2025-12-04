import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  group('ProductCard Widget Tests', () {
    testWidgets('should create ProductCard widget', (tester) async {
      const card = ProductCard(
        id: 'test-001',
        title: 'Test Product',
        price: '£20.00',
        imageAsset: 'assets/hoodies.jpg',
      );
      expect(card, isA<StatelessWidget>());
    });

    testWidgets('should display product title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Hoodie',
                price: '£25.00',
                imageAsset: 'assets/hoodies.jpg',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Hoodie'), findsOneWidget);
    });

    testWidgets('should display product price', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/tshirt.jpg',
              ),
            ),
          ),
        ),
      );

      expect(find.text('£20.00'), findsOneWidget);
    });

    testWidgets('should not display sale price when not on sale',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/cap.jpg',
                isOnSale: false,
              ),
            ),
          ),
        ),
      );

      expect(find.text('£20.00'), findsOneWidget);
      final priceText = tester.widget<Text>(find.text('£20.00'));
      expect(priceText.style?.decoration, isNull);
    });

    testWidgets('should display sale price when on sale', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£30.00',
                imageAsset: 'assets/beanie.jpg',
                salePrice: '£20.00',
                isOnSale: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('£30.00'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
    });

    testWidgets('should strike through original price when on sale',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£30.00',
                imageAsset: 'assets/mugs.jpg',
                salePrice: '£20.00',
                isOnSale: true,
              ),
            ),
          ),
        ),
      );

      final priceText = tester.widget<Text>(find.text('£30.00'));
      expect(priceText.style?.decoration, TextDecoration.lineThrough);
    });

    testWidgets('should display sale price in red', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£30.00',
                imageAsset: 'assets/pen.jpg',
                salePrice: '£20.00',
                isOnSale: true,
              ),
            ),
          ),
        ),
      );

      final salePriceText = tester.widget<Text>(find.text('£20.00'));
      expect(salePriceText.style?.color, Colors.red);
      expect(salePriceText.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('should navigate to product detail when tapped',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/hoodies.jpg',
              ),
            ),
          ),
          routes: {
            '/product/test-001': (context) => const Scaffold(
                  body: Text('Product Detail Screen'),
                ),
          },
        ),
      );

      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();

      expect(find.text('Product Detail Screen'), findsOneWidget);
    });

    testWidgets('should have GestureDetector', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/tshirt.jpg',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('should truncate long title with ellipsis', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title:
                    'This is a very long product title that should be truncated with ellipsis',
                price: '£20.00',
                imageAsset: 'assets/cap.jpg',
              ),
            ),
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text(
          'This is a very long product title that should be truncated with ellipsis'));
      expect(titleText.maxLines, 2);
      expect(titleText.overflow, TextOverflow.ellipsis);
    });

    testWidgets('should have correct text alignment', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/beanie.jpg',
              ),
            ),
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text('Test Product'));
      expect(titleText.textAlign, TextAlign.left);
    });

    testWidgets('should have Column with CrossAxisAlignment.start',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/mugs.jpg',
              ),
            ),
          ),
        ),
      );

      final column = tester.widget<Column>(find.descendant(
        of: find.byType(GestureDetector),
        matching: find.byType(Column),
      ));
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    });

    testWidgets('should have price in grey when not on sale', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/pen.jpg',
              ),
            ),
          ),
        ),
      );

      final priceText = tester.widget<Text>(find.text('£20.00'));
      expect(priceText.style?.color, Colors.grey);
    });

    testWidgets('should handle product with different id', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'different-id-123',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/hoodies.jpg',
              ),
            ),
          ),
          routes: {
            '/product/different-id-123': (context) => const Scaffold(
                  body: Text('Different Product'),
                ),
          },
        ),
      );

      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();

      expect(find.text('Different Product'), findsOneWidget);
    });

    testWidgets('should display both prices when on sale', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Sale Product',
                price: '£50.00',
                imageAsset: 'assets/tshirt.jpg',
                salePrice: '£35.00',
                isOnSale: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('£50.00'), findsOneWidget);
      expect(find.text('£35.00'), findsOneWidget);
    });

    testWidgets('should have correct font sizes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/cap.jpg',
              ),
            ),
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text('Test Product'));
      expect(titleText.style?.fontSize, 14);

      final priceText = tester.widget<Text>(find.text('£20.00'));
      expect(priceText.style?.fontSize, 13);
    });

    testWidgets('should have Row for price display', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/beanie.jpg',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should display title in black color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/mugs.jpg',
              ),
            ),
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text('Test Product'));
      expect(titleText.style?.color, Colors.black);
    });

    testWidgets('should have SizedBox widgets for spacing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              width: 200,
              child: ProductCard(
                id: 'test-001',
                title: 'Test Product',
                price: '£20.00',
                imageAsset: 'assets/pen.jpg',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsWidgets);
    });
  });
}
