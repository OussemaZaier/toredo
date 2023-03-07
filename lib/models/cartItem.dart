import 'package:toredo/models/product.dart';

class CartItem {
  Product product;
  int qte;
  CartItem({required this.product, this.qte = 1});
  setterQte(qte) {
    this.qte = qte;
  }
}
