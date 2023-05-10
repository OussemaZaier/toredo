import 'package:toredo/models/product.dart';

class CartItem {
  int id;
  String name, img;
  String price;
  int quantity;
  CartItem(
      {required this.id,
      required this.name,
      this.quantity = 1,
      required this.price,
      required this.img});
}
