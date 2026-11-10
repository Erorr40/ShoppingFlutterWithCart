import 'package:flutter/foundation.dart';
import 'component.dart';

class CartManager extends ChangeNotifier {
  static final CartManager instance = CartManager._internal();
  CartManager._internal();

  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) {
      final price = double.tryParse(item.price) ?? 0.0;
      return sum + price;
    });
  }

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
