import 'package:flutter/material.dart';

import '../models/orderItem.dart';

class OrderProvider with ChangeNotifier {
  Map<String, OrderItem> _items = {};

  Map<String, OrderItem> get items {
    return {..._items};
  }

  int count() {
    return _items.length;
  }

  void addItem(DateTime time, double totalprice, int quantity) {
    _items.putIfAbsent(
        time.toString(),
        () => new OrderItem(
            time: time, numberarticles: quantity, totalPrice: totalprice));
    notifyListeners();
  }
}
