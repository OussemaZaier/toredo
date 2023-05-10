import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toredo/components/cartProvider.dart';
import 'package:toredo/models/cartItem.dart';
import 'package:toredo/utils/constants.dart';

import '../components/orderProvider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final order = Provider.of<OrderProvider>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => CartItemWidget(
                  productId: cart.items.keys.toList()[i],
                  name: cart.items.values.toList()[i].name,
                  price: cart.items.values.toList()[i].price,
                  quantity: cart.items.values.toList()[i].quantity,
                  img: cart.items.values.toList()[i].img),
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: cart.itemCount != 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Chip(
                  label: Text(
                    'Total: ${cart.total.toStringAsFixed(2)}DT',
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      cart.clear();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    )),
                IconButton(
                    onPressed: () {
                      order.addItem(DateTime.now(), cart.total, cart.itemCount);
                      cart.clear();
                    },
                    icon: Icon(
                      Icons.check,
                      color: Colors.green[300],
                    )),
                // FlatButton(
                //   onPressed: () {},
                //   child: Text('ORDER NOW'),
                //   textColor: Theme.of(context).primaryColor,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  String productId, name, img;
  int quantity;
  String price;
  CartItemWidget(
      {required this.productId,
      required this.name,
      required this.quantity,
      required this.price,
      required this.img});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(top: 5),
      child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                img,
                width: 100,
                height: 100,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        this.name,
                        style: TextStyle(
                            fontSize: 20, overflow: TextOverflow.visible),
                      ),
                    ),
                    Text(this.price.toString() + " DT",
                        style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        CustomIconButton(
                            icon: Icons.add,
                            fct: () {
                              cart.updateQuantity(productId);
                            }),
                        Text(this.quantity.toString(),
                            style: TextStyle(fontSize: 20)),
                        CustomIconButton(
                            icon: Icons.remove,
                            fct: () {
                              cart.minus(productId);
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  IconData icon;
  VoidCallback fct;
  CustomIconButton({required this.icon, required this.fct});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: fct,
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green[100],
          ),
          child: Icon(
            icon,
          ),
        ));
  }
}
