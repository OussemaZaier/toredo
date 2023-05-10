import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toredo/components/orderProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/constants.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.order,
            style: TextStyle(
              fontFamily: 'Falling',
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: textColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              itemCount: order.count(),
              itemBuilder: (ctx, i) => OrderItemWidget(
                id: order.items.keys.toList()[i],
                price: order.items.values.toList()[i].totalPrice,
                quantity: order.items.values.toList()[i].numberarticles,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  String id;
  int quantity;
  double price;
  OrderItemWidget({
    required this.id,
    required this.quantity,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(top: 5),
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green[300]),
                      child: Icon(Icons.done_outline_rounded,
                          color: Colors.white)),
                  Text(
                    DateFormat('yyyy-MM-dd – kk:mm')
                        .format(DateTime.parse(this.id)),
                    style:
                        TextStyle(fontSize: 20, overflow: TextOverflow.visible),
                  ),
                  Column(
                    children: [
                      Text(this.price.toString() + " DT",
                          style: TextStyle(fontSize: 20)),
                      Text('${this.quantity.toString()} articles',
                          style: TextStyle(fontSize: 10)),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
