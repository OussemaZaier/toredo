import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:toredo/api/singleton.dart';
import '../utils/constants.dart';
import 'package:toredo/components/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toredo/models/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    List products = [];
    if (Singleton.storage.getItem("products") != null) {
      for (Map<String, dynamic> element
          in (jsonDecode(Singleton.storage.getItem("products")) as List)) {
        products.add(Product.fromJson(element));
      }
      //print(products[0].images[0].src);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 50,
              //   decoration: const BoxDecoration(
              //     color: navigationColor,
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(
              //         50,
              //       ),
              //       bottomRight: Radius.circular(
              //         50,
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              Text(
                AppLocalizations.of(context)!.shopby,
                style: TextStyle(
                  fontFamily: 'Falling',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF101A30),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Category(
                      img: const AssetImage('assets/images/vegetable.png'),
                      name: AppLocalizations.of(context)!.vegetable),
                  Category(
                      img: const AssetImage('assets/images/meat.png'),
                      name: AppLocalizations.of(context)!.meat),
                  Category(
                      img: const AssetImage('assets/images/fruit.png'),
                      name: AppLocalizations.of(context)!.fruits),
                  Category(
                      img: const AssetImage('assets/images/milk.png'),
                      name: AppLocalizations.of(context)!.dairy),
                  Category(
                      img: const AssetImage('assets/images/fish.png'),
                      name: AppLocalizations.of(context)!.fish),
                  Category(
                      img: const AssetImage('assets/images/wheat-sack.png'),
                      name: AppLocalizations.of(context)!.grains),
                ],
              ),
              Expanded(
                child: products.isEmpty
                    ? Text(
                        "No products to show",
                        textAlign: TextAlign.center,
                      )
                    : GridView.count(
                        childAspectRatio: (itemWidth / itemHeight),
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: products.map((product) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    "https://192.168.1.14/" +
                                        product.images[0].src
                                            .toString()
                                            .substring(18),
                                    width: double.infinity,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                product.name,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: darkBlueText),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  product.price + "DT",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: darkBlueText),
                                                ),
                                                Visibility(
                                                    visible:
                                                        product.salePrice != "",
                                                    child: Text(
                                                      product.regularPrice +
                                                          "DT",
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 25,
                                          width: 25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                              )),
                                          child: InkWell(
                                              onTap: () {
                                                print("tapped!!!");
                                              },
                                              child: Icon(
                                                Icons.add,
                                                size: 25,
                                              )),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          );
                        }).toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
