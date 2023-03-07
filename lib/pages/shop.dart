import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:palette_generator/palette_generator.dart';

import 'package:toredo/api/singleton.dart';
import 'package:toredo/pages/detailsPage.dart';
import 'package:toredo/pages/navigation.dart';
import '../components/productCard.dart';
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
    timeDilation = 5.0; // 1.0 means normal animation speed.

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
                  color: darkBlueText,
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
                        AppLocalizations.of(context)!.noData,
                        textAlign: TextAlign.center,
                      )
                    : GridView.count(
                        childAspectRatio: (itemWidth / itemHeight) / 0.7,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: products.map((product) {
                          return ProductCard(product: product);
                        }).toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
