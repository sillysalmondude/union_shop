import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collection.dart';

void main() {
  group('Collection Model Tests', () {
    test('should create collection with all properties', () {
      final collection = Collection(
        id: 'col-001',
        name: 'Clothes',
        description: 'All clothing items',
        asset: 'assets/clothes.jpg',
      );

      expect(collection.id, 'col-001');
      expect(collection.name, 'Clothes');
      expect(collection.description, 'All clothing items');
      expect(collection.asset, 'assets/clothes.jpg');
    });

    test('should create collection from JSON', () {
      final json = {
        'id': 'col-002',
        'name': 'Accessories',
        'description': 'All accessory items',
        'asset': 'assets/accessories.jpg',
      };

      final collection = Collection.fromJson(json);

      expect(collection.id, 'col-002');
      expect(collection.name, 'Accessories');
      expect(collection.description, 'All accessory items');
      expect(collection.asset, 'assets/accessories.jpg');
    });

    test('should convert collection to JSON', () {
      final collection = Collection(
        id: 'col-003',
        name: 'Sale Items',
        description: 'Discounted products',
        asset: 'assets/sale.jpg',
      );

      final json = collection.toJson();

      expect(json['id'], 'col-003');
      expect(json['name'], 'Sale Items');
      expect(json['description'], 'Discounted products');
      expect(json['asset'], 'assets/sale.jpg');
    });

    test('should handle empty description', () {
      final collection = Collection(
        id: 'col-004',
        name: 'Empty Description',
        description: '',
        asset: 'assets/test.jpg',
      );

      expect(collection.description, '');
      expect(collection.description.isEmpty, true);
    });

    test('should handle long description', () {
      final longDescription =
          'This is a very long description that contains multiple sentences. '
          'It describes the collection in great detail and provides comprehensive '
          'information about what customers can expect to find in this category.';

      final collection = Collection(
        id: 'col-005',
        name: 'Test Collection',
        description: longDescription,
        asset: 'assets/test.jpg',
      );

      expect(collection.description, longDescription);
      expect(collection.description.length, greaterThan(100));
    });

    test('should preserve all data through JSON round trip', () {
      final original = Collection(
        id: 'col-006',
        name: 'Round Trip Test',
        description: 'Testing serialization',
        asset: 'assets/roundtrip.jpg',
      );

      final json = original.toJson();
      final restored = Collection.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.name, original.name);
      expect(restored.description, original.description);
      expect(restored.asset, original.asset);
    });

    test('should handle collections with different asset paths', () {
      final collection1 = Collection(
        id: 'col-007',
        name: 'Local Asset',
        description: 'Test',
        asset: 'assets/local.jpg',
      );

      final collection2 = Collection(
        id: 'col-008',
        name: 'Remote Asset',
        description: 'Test',
        asset: 'https://example.com/remote.jpg',
      );

      expect(collection1.asset, 'assets/local.jpg');
      expect(collection2.asset, 'https://example.com/remote.jpg');
    });

    test('should create multiple distinct collections', () {
      final collection1 = Collection(
        id: 'col-009',
        name: 'Collection 1',
        description: 'First collection',
        asset: 'assets/col1.jpg',
      );

      final collection2 = Collection(
        id: 'col-010',
        name: 'Collection 2',
        description: 'Second collection',
        asset: 'assets/col2.jpg',
      );

      expect(collection1.id, isNot(equals(collection2.id)));
      expect(collection1.name, isNot(equals(collection2.name)));
    });

    test('should convert to JSON with all string types', () {
      final collection = Collection(
        id: 'col-011',
        name: 'JSON Test',
        description: 'Testing JSON output',
        asset: 'assets/json.jpg',
      );

      final json = collection.toJson();

      expect(json['id'], isA<String>());
      expect(json['name'], isA<String>());
      expect(json['description'], isA<String>());
      expect(json['asset'], isA<String>());
    });

    test('should handle collections with minimal description', () {
      final collection = Collection(
        id: 'col-012',
        name: 'Minimal',
        description: 'OK',
        asset: 'assets/minimal.jpg',
      );

      expect(collection.description.length, 2);
      expect(collection.description, 'OK');
    });
  });
}
