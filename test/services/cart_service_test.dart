import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('CartService Tests', () {
    late CartService cartService;
    late Product testProduct;
    late Product saleProduct;

    setUp(() {
      cartService = CartService();
      cartService.clearCart();

      testProduct = Product(
        id: 'prod-001',
        title: 'Test Product',
        description: 'Test Description',
        price: 20.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 10,
        sizes: ['S', 'M', 'L'],
        colors: ['Red', 'Blue'],
        saleDiscount: 0.0,
      );

      saleProduct = Product(
        id: 'prod-002',
        title: 'Sale Product',
        description: 'On sale',
        price: 100.0,
        asset: 'assets/sale.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 20.0,
      );
    });

    test('should be a singleton instance', () {
      final instance1 = CartService();
      final instance2 = CartService();

      expect(instance1, same(instance2));
    });

    test('should extend ChangeNotifier', () {
      expect(cartService, isA<ChangeNotifier>());
    });

    test('should start with empty cart', () {
      expect(cartService.isEmpty, true);
      expect(cartService.items.length, 0);
      expect(cartService.totalItems, 0);
      expect(cartService.totalPrice, 0.0);
    });

    test('should add item to cart', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');

      expect(cartService.isEmpty, false);
      expect(cartService.items.length, 1);
      expect(cartService.items[0].product.id, 'prod-001');
      expect(cartService.items[0].quantity, 1);
      expect(cartService.items[0].selectedSize, 'M');
      expect(cartService.items[0].selectedColor, 'Red');
    });

    test('should notify listeners when adding item', () {
      var notified = false;
      cartService.addListener(() {
        notified = true;
      });

      cartService.addItem(testProduct, 1, 'M', 'Red');

      expect(notified, true);
    });

    test('should add multiple items to cart', () {
      cartService.addItem(testProduct, 2, 'M', 'Red');
      cartService.addItem(testProduct, 3, 'L', 'Blue');

      expect(cartService.items.length, 2);
    });

    test('should calculate total items correctly', () {
      cartService.addItem(testProduct, 2, 'M', 'Red');
      cartService.addItem(testProduct, 3, 'L', 'Blue');

      expect(cartService.totalItems, 5);
    });

    test('should calculate total price correctly', () {
      cartService.addItem(testProduct, 2, null, null);

      expect(cartService.totalPrice, 40.0);
      expect(cartService.totalPriceFormatted, '£40.00');
    });

    test('should format total price with two decimals', () {
      cartService.addItem(testProduct, 1, null, null);

      expect(cartService.totalPriceFormatted, '£20.00');
    });

    test('should remove item from cart', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');
      cartService.removeItem(0);

      expect(cartService.isEmpty, true);
      expect(cartService.items.length, 0);
    });

    test('should notify listeners when removing item', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');
      var notified = false;
      cartService.addListener(() {
        notified = true;
      });

      cartService.removeItem(0);

      expect(notified, true);
    });

    test('should update item quantity', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');
      cartService.updateQuantity(0, 5);

      expect(cartService.items[0].quantity, 5);
      expect(cartService.totalItems, 5);
    });

    test('should notify listeners when updating quantity', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');
      var notified = false;
      cartService.addListener(() {
        notified = true;
      });

      cartService.updateQuantity(0, 5);

      expect(notified, true);
    });

    test('should remove item when quantity set to zero', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');
      cartService.updateQuantity(0, 0);

      expect(cartService.isEmpty, true);
    });

    test('should remove item when quantity set to negative', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');
      cartService.updateQuantity(0, -5);

      expect(cartService.isEmpty, true);
    });

    test('should clear all items from cart', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');
      cartService.addItem(testProduct, 2, 'L', 'Blue');
      cartService.clearCart();

      expect(cartService.isEmpty, true);
      expect(cartService.items.length, 0);
      expect(cartService.totalItems, 0);
    });

    test('should notify listeners when clearing cart', () {
      cartService.addItem(testProduct, 1, 'M', 'Red');
      var notified = false;
      cartService.addListener(() {
        notified = true;
      });

      cartService.clearCart();

      expect(notified, true);
    });

    test('should add items without variants', () {
      cartService.addItem(testProduct, 2, null, null);

      expect(cartService.items[0].selectedSize, null);
      expect(cartService.items[0].selectedColor, null);
      expect(cartService.items[0].quantity, 2);
    });

    test('should handle sale products correctly', () {
      cartService.addItem(saleProduct, 1, null, null);

      expect(cartService.totalPrice, 80.0);
      expect(cartService.totalPriceFormatted, '£80.00');
    });

    test('should calculate mixed regular and sale products', () {
      cartService.addItem(testProduct, 1, null, null);
      cartService.addItem(saleProduct, 1, null, null);

      expect(cartService.totalPrice, 100.0);
      expect(cartService.totalItems, 2);
    });

    test('should return correct isEmpty status', () {
      expect(cartService.isEmpty, true);

      cartService.addItem(testProduct, 1, null, null);
      expect(cartService.isEmpty, false);

      cartService.clearCart();
      expect(cartService.isEmpty, true);
    });

    test('should maintain cart state across multiple operations', () {
      cartService.addItem(testProduct, 1, 'S', 'Red');
      cartService.addItem(testProduct, 2, 'M', 'Blue');
      cartService.updateQuantity(0, 3);
      cartService.removeItem(1);

      expect(cartService.items.length, 1);
      expect(cartService.items[0].quantity, 3);
      expect(cartService.totalItems, 3);
    });

    test('should handle large quantities', () {
      cartService.addItem(testProduct, 100, null, null);

      expect(cartService.totalItems, 100);
      expect(cartService.totalPrice, 2000.0);
    });

    test('should return immutable items list reference', () {
      cartService.addItem(testProduct, 1, null, null);
      final items = cartService.items;

      expect(items, cartService.items);
    });
  });
}
