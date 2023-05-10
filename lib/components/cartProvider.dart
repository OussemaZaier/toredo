import 'package:flutter/material.dart';

import '../models/cartItem.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void updateQuantity(id) {
    _items.update(
        id,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            name: existingCartItem.name,
            price: existingCartItem.price,
            img: existingCartItem.img,
            quantity: existingCartItem.quantity + 1));
    notifyListeners();
  }

  void minus(id) {
    if (_items[id]!.quantity - 1 > 0) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              name: existingCartItem.name,
              price: existingCartItem.price,
              img: existingCartItem.img,
              quantity: existingCartItem.quantity - 1));
    } else
      removeItem(id);
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get total {
    double s = 0;
    for (var elem in _items.values) {
      s = s + double.parse(elem.price) * elem.quantity;
    }
    return s;
  }

  void addItem(int productId, String name, String price, String img) {
    if (_items.containsKey(productId.toString())) {
      _items.update(
          productId.toString(),
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              name: existingCartItem.name,
              price: existingCartItem.price,
              img: existingCartItem.img,
              quantity: existingCartItem.quantity + 1));
      print('quantity ${_items[productId]?.quantity}');
    } else {
      _items.putIfAbsent(
          productId.toString(),
          () => CartItem(
              id: productId, name: name, price: price, quantity: 1, img: img));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
