import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('CartItem Model Tests', () {
    late Product testProduct;

    setUp(() {
      testProduct = Product(
        id: 'prod-001',
        title: 'Test Hoodie',
        description: 'A comfortable hoodie',
        price: 25.00,
        asset: 'assets/hoodie.jpg',
        collection: 'clothes',
        stock: 10,
        sizes: ['S', 'M', 'L'],
        colors: ['Red', 'Blue'],
        saleDiscount: 0.0,
      );
    });

    test('should create cart item with all properties', () {
      final cartItem = CartItem(
        product: testProduct,
        quantity: 2,
        selectedSize: 'M',
        selectedColor: 'Red',
      );

      expect(cartItem.product, testProduct);
      expect(cartItem.quantity, 2);
      expect(cartItem.selectedSize, 'M');
      expect(cartItem.selectedColor, 'Red');
    });

    test('should create cart item without optional properties', () {
      final cartItem = CartItem(
        product: testProduct,
        quantity: 1,
      );

      expect(cartItem.product, testProduct);
      expect(cartItem.quantity, 1);
      expect(cartItem.selectedSize, null);
      expect(cartItem.selectedColor, null);
    });

    test('should calculate subtotal correctly', () {
      final cartItem = CartItem(
        product: testProduct,
        quantity: 3,
      );

      expect(cartItem.subtotal, 75.00);
    });

    test('should format subtotal correctly', () {
      final cartItem = CartItem(
        product: testProduct,
        quantity: 2,
      );

      expect(cartItem.subtotalFormatted, '£50.00');
    });

    test('should calculate subtotal with sale price', () {
      final saleProduct = Product(
        id: 'prod-002',
        title: 'Sale Item',
        description: 'On sale',
        price: 100.00,
        asset: 'assets/sale.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 20.0,
      );

      final cartItem = CartItem(
        product: saleProduct,
        quantity: 2,
      );

      expect(cartItem.subtotal, 160.00);
      expect(cartItem.subtotalFormatted, '£160.00');
    });

    test('should handle quantity of 1', () {
      final cartItem = CartItem(
        product: testProduct,
        quantity: 1,
      );

      expect(cartItem.subtotal, 25.00);
      expect(cartItem.subtotalFormatted, '£25.00');
    });

    test('should copyWith all properties', () {
      final original = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Blue',
      );

      final newProduct = Product(
        id: 'prod-003',
        title: 'New Product',
        description: 'Different',
        price: 30.00,
        asset: 'assets/new.jpg',
        collection: 'accessories',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      final copied = original.copyWith(
        product: newProduct,
        quantity: 5,
        selectedSize: 'L',
        selectedColor: 'Red',
      );

      expect(copied.product, newProduct);
      expect(copied.quantity, 5);
      expect(copied.selectedSize, 'L');
      expect(copied.selectedColor, 'Red');
      expect(original.quantity, 1);
    });

    test('should copyWith only quantity', () {
      final original = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Blue',
      );

      final copied = original.copyWith(quantity: 3);

      expect(copied.product, testProduct);
      expect(copied.quantity, 3);
      expect(copied.selectedSize, 'M');
      expect(copied.selectedColor, 'Blue');
    });

    test('should copyWith only size', () {
      final original = CartItem(
        product: testProduct,
        quantity: 2,
        selectedSize: 'S',
        selectedColor: 'Red',
      );

      final copied = original.copyWith(selectedSize: 'XL');

      expect(copied.product, testProduct);
      expect(copied.quantity, 2);
      expect(copied.selectedSize, 'XL');
      expect(copied.selectedColor, 'Red');
    });

    test('should copyWith only color', () {
      final original = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Blue',
      );

      final copied = original.copyWith(selectedColor: 'Green');

      expect(copied.product, testProduct);
      expect(copied.quantity, 1);
      expect(copied.selectedSize, 'M');
      expect(copied.selectedColor, 'Green');
    });

    test('should handle large quantities', () {
      final cartItem = CartItem(
        product: testProduct,
        quantity: 100,
      );

      expect(cartItem.subtotal, 2500.00);
      expect(cartItem.subtotalFormatted, '£2500.00');
    });

    test('should handle decimal prices correctly', () {
      final product = Product(
        id: 'prod-004',
        title: 'Decimal Price',
        description: 'Test',
        price: 15.99,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 10,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      final cartItem = CartItem(
        product: product,
        quantity: 3,
      );

      expect(cartItem.subtotal, 47.97);
      expect(cartItem.subtotalFormatted, '£47.97');
    });

    test('should maintain independence when copying', () {
      final original = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Blue',
      );

      final copied = original.copyWith(quantity: 5);

      expect(original.quantity, 1);
      expect(copied.quantity, 5);
      expect(original.product, copied.product);
    });

    test('should handle cart item with no variants selected', () {
      final product = Product(
        id: 'prod-005',
        title: 'No Variants',
        description: 'Test',
        price: 10.00,
        asset: 'assets/test.jpg',
        collection: 'accessories',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      final cartItem = CartItem(
        product: product,
        quantity: 2,
      );

      expect(cartItem.selectedSize, null);
      expect(cartItem.selectedColor, null);
      expect(cartItem.subtotal, 20.00);
    });
  });
}
