import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Model Tests', () {
    test('should create product from JSON', () {
      final json = {
        'id': 'prod-001',
        'title': 'Test Hoodie',
        'description': 'A comfortable hoodie',
        'price': 25.99,
        'asset': 'assets/hoodie.jpg',
        'collection': 'clothes',
        'stock': 10,
        'sizes': ['S', 'M', 'L'],
        'colors': ['Red', 'Blue'],
        'saleDiscount': 0.0,
      };

      final product = Product.fromJson(json);

      expect(product.id, 'prod-001');
      expect(product.title, 'Test Hoodie');
      expect(product.description, 'A comfortable hoodie');
      expect(product.price, 25.99);
      expect(product.asset, 'assets/hoodie.jpg');
      expect(product.collection, 'clothes');
      expect(product.stock, 10);
      expect(product.sizes, ['S', 'M', 'L']);
      expect(product.colors, ['Red', 'Blue']);
      expect(product.saleDiscount, 0.0);
    });

    test('should convert product to JSON', () {
      final product = Product(
        id: 'prod-002',
        title: 'Test T-Shirt',
        description: 'A cool t-shirt',
        price: 15.50,
        asset: 'assets/tshirt.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: ['M', 'L'],
        colors: ['White'],
        saleDiscount: 10.0,
      );

      final json = product.toJson();

      expect(json['id'], 'prod-002');
      expect(json['title'], 'Test T-Shirt');
      expect(json['description'], 'A cool t-shirt');
      expect(json['price'], 15.50);
      expect(json['asset'], 'assets/tshirt.jpg');
      expect(json['collection'], 'clothes');
      expect(json['stock'], 5);
      expect(json['sizes'], ['M', 'L']);
      expect(json['colors'], ['White']);
      expect(json['saleDiscount'], 10.0);
    });

    test('should format price correctly', () {
      final product = Product(
        id: 'prod-003',
        title: 'Test Product',
        description: 'Test',
        price: 20.5,
        asset: 'assets/test.jpg',
        collection: 'accessories',
        stock: 1,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      expect(product.priceFormatted, '£20.50');
    });

    test('should check if product is in stock', () {
      final inStockProduct = Product(
        id: 'prod-004',
        title: 'In Stock',
        description: 'Test',
        price: 10.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      final outOfStockProduct = Product(
        id: 'prod-005',
        title: 'Out of Stock',
        description: 'Test',
        price: 10.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 0,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      expect(inStockProduct.isInStock, true);
      expect(outOfStockProduct.isInStock, false);
    });

    test('should check if product has variants', () {
      final productWithSizes = Product(
        id: 'prod-006',
        title: 'With Sizes',
        description: 'Test',
        price: 10.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: ['S', 'M'],
        colors: [],
        saleDiscount: 0.0,
      );

      final productWithColors = Product(
        id: 'prod-007',
        title: 'With Colors',
        description: 'Test',
        price: 10.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: ['Red'],
        saleDiscount: 0.0,
      );

      final productWithoutVariants = Product(
        id: 'prod-008',
        title: 'Without Variants',
        description: 'Test',
        price: 10.0,
        asset: 'assets/test.jpg',
        collection: 'accessories',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      expect(productWithSizes.hasVariants, true);
      expect(productWithColors.hasVariants, true);
      expect(productWithoutVariants.hasVariants, false);
    });

    test('should check if product is on sale', () {
      final saleProduct = Product(
        id: 'prod-009',
        title: 'Sale Product',
        description: 'Test',
        price: 100.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 20.0,
      );

      final regularProduct = Product(
        id: 'prod-010',
        title: 'Regular Product',
        description: 'Test',
        price: 100.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      expect(saleProduct.isOnSale, true);
      expect(regularProduct.isOnSale, false);
    });

    test('should calculate sale price correctly', () {
      final product = Product(
        id: 'prod-011',
        title: 'Test Product',
        description: 'Test',
        price: 100.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 25.0,
      );

      expect(product.salePrice, 75.0);
      expect(product.salePriceFormatted, '£75.00');
    });

    test('should handle zero sale discount', () {
      final product = Product(
        id: 'prod-012',
        title: 'Test Product',
        description: 'Test',
        price: 50.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 0.0,
      );

      expect(product.salePrice, 50.0);
      expect(product.isOnSale, false);
    });

    test('should handle integer price values from JSON', () {
      final json = {
        'id': 'prod-013',
        'title': 'Integer Price',
        'description': 'Test',
        'price': 20,
        'asset': 'assets/test.jpg',
        'collection': 'clothes',
        'stock': 5,
        'sizes': [],
        'colors': [],
        'saleDiscount': 0,
      };

      final product = Product.fromJson(json);

      expect(product.price, 20.0);
      expect(product.saleDiscount, 0.0);
    });

    test('should handle 50% discount correctly', () {
      final product = Product(
        id: 'prod-014',
        title: '50% Off Product',
        description: 'Test',
        price: 80.0,
        asset: 'assets/test.jpg',
        collection: 'clothes',
        stock: 5,
        sizes: [],
        colors: [],
        saleDiscount: 50.0,
      );

      expect(product.salePrice, 40.0);
      expect(product.salePriceFormatted, '£40.00');
      expect(product.isOnSale, true);
    });

    test('should preserve data through JSON round trip', () {
      final original = Product(
        id: 'prod-015',
        title: 'Round Trip',
        description: 'Testing serialization',
        price: 35.99,
        asset: 'assets/test.jpg',
        collection: 'accessories',
        stock: 7,
        sizes: ['One Size'],
        colors: ['Black', 'White'],
        saleDiscount: 15.0,
      );

      final json = original.toJson();
      final restored = Product.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.title, original.title);
      expect(restored.description, original.description);
      expect(restored.price, original.price);
      expect(restored.asset, original.asset);
      expect(restored.collection, original.collection);
      expect(restored.stock, original.stock);
      expect(restored.sizes, original.sizes);
      expect(restored.colors, original.colors);
      expect(restored.saleDiscount, original.saleDiscount);
    });
  });
}
