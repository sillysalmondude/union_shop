import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems {
    int total = 0;
    for (var item in _items) {
      total += item.quantity;
    }
    return total;
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      total += item.subtotal;
    }
    return total;
  }

  String get totalPriceFormatted => '£${totalPrice.toStringAsFixed(2)}';

  bool get isEmpty => _items.isEmpty;

  void addItem(Product product, int quantity, String? size, String? color) {
    _items.add(CartItem(
      product: product,
      quantity: quantity,
      selectedSize: size,
      selectedColor: color,
    ));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int quantity) {
    if (quantity <= 0) {
      _items.removeAt(index);
    } else {
      _items[index] = _items[index].copyWith(quantity: quantity);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
