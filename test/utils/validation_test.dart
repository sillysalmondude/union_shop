import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/validation.dart';

void main() {
  group('Validation Utility Tests', () {
    group('isValidEmail', () {
      test('should return true for valid email', () {
        expect(isValidEmail('test@example.com'), true);
      });

      test('should return true for valid email with subdomain', () {
        expect(isValidEmail('user@mail.example.com'), true);
      });

      test('should return true for valid email with numbers', () {
        expect(isValidEmail('user123@example.com'), true);
      });

      test('should return true for valid email with hyphens', () {
        expect(isValidEmail('test-user@example.com'), true);
      });

      test('should return true for valid email with dots', () {
        expect(isValidEmail('test.user@example.com'), true);
      });

      test('should return true for valid email with underscores', () {
        expect(isValidEmail('test_user@example.com'), true);
      });

      test('should return false for empty string', () {
        expect(isValidEmail(''), false);
      });

      test('should return false for email without @', () {
        expect(isValidEmail('testexample.com'), false);
      });

      test('should return false for email without domain', () {
        expect(isValidEmail('test@'), false);
      });

      test('should return false for email without username', () {
        expect(isValidEmail('@example.com'), false);
      });

      test('should return false for email without extension', () {
        expect(isValidEmail('test@example'), false);
      });

      test('should return false for email with spaces', () {
        expect(isValidEmail('test user@example.com'), false);
      });

      test('should return false for email with multiple @', () {
        expect(isValidEmail('test@@example.com'), false);
      });

      test('should return false for invalid characters', () {
        expect(isValidEmail('test!user@example.com'), false);
      });

      test('should return true for short extension', () {
        expect(isValidEmail('test@example.co'), true);
      });

      test('should return true for four character extension', () {
        expect(isValidEmail('test@example.info'), true);
      });

      test('should return false for single character extension', () {
        expect(isValidEmail('test@example.c'), false);
      });

      test('should return false for extension too long', () {
        expect(isValidEmail('test@example.comms'), false);
      });
    });
  });
}
