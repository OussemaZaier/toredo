import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:toredo/api/api.dart';

import 'package:toredo/api/singleton.dart';
import 'package:toredo/components/cartProvider.dart';
import 'package:toredo/models/CartItem.dart';
import 'package:toredo/pages/detailsPage.dart';
import 'package:toredo/pages/navigation.dart';
import '../components/carousel.dart';
import '../components/productCard.dart';
import '../components/productGrid.dart';
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
  List products = [];
  List changeableProducts = [];
  String category = "";
  bool _visible = false;

  late StreamController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new StreamController.broadcast();
    if (Singleton.storage.getItem("products") != null) {
      for (Map<String, dynamic> element
          in (jsonDecode(Singleton.storage.getItem("products")) as List)) {
        products.add(Product.fromJson(element));
        changeableProducts.add(Product.fromJson(element));
      }
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  _filterBy(String name) {
    setState(() {
      changeableProducts = products
          .map((element) {
            var index = 0;
            while (index < element.categories.length &&
                element.categories[index].name != name) {
              index++;
            }
            if (index < element.categories.length) return element;
          })
          .toList()
          .where((element) => element != null)
          .toList();
    });
    category = name;
    _visible = true;
    _controller.add(null);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    // APIService().getCategories();
    var size = MediaQuery.of(context).size;
    timeDilation = 5.0; // 1.0 means normal animation speed.
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width * 0.35;

    List topDealProducts =
        products.where((element) => element.tags.contains('top-deal')).toList();
    List<Widget> productSliders = topDealProducts
        .map(
          (item) => topDeal(item: item),
        )
        .toList();
    print(changeableProducts);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8, top: 15),
          child: ListView(children: [
            CarouselImage(
              imagesliders: productSliders,
              img: topDealProducts,
            ),
            Text(
              AppLocalizations.of(context)!.shopby,
              style: TextStyle(
                fontFamily: 'Falling',
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: textColor,
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
                    name: 'vegetables',
                    fct: () => _filterBy('vegetables')),
                Category(
                    img: const AssetImage('assets/images/meat.png'),
                    name: 'meat',
                    fct: () => _filterBy('meat')),
                Category(
                    img: const AssetImage('assets/images/fruit.png'),
                    name: 'fruits',
                    fct: () => _filterBy('fruits')),
                Category(
                    img: const AssetImage('assets/images/milk.png'),
                    name: 'Dairy',
                    fct: () => _filterBy('Dairy')),
                Category(
                    img: const AssetImage('assets/images/fish.png'),
                    name: 'Fish',
                    fct: () => _filterBy('Fish')),
                Category(
                    img: const AssetImage('assets/images/wheat-sack.png'),
                    name: 'cereals',
                    fct: () => _filterBy('cereals')),
              ],
            ),
            Visibility(
              visible: _visible,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(children: [
                  Text(
                    category.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Falling',
                      fontSize: 20,
                      color: textColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        changeableProducts = products;
                        category = "";
                        _visible = false;
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ]),
              ),
            ),
            Expanded(
                child: changeableProducts.isEmpty
                    ? Center(
                        child: Text(
                          AppLocalizations.of(context)!.noData.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Falling",
                            color: textColor,
                            fontSize: 25,
                          ),
                        ),
                      )
                    : StreamBuilder(
                        stream: _controller.stream,
                        builder: (__, _) => ProductsGrid(
                              itemWidth: itemWidth,
                              itemHeight: itemHeight,
                              products: changeableProducts,
                            ))),
          ]),
        ),
      ),
    );
  }
}

class topDeal extends StatelessWidget {
  var item;
  topDeal({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        Container(
          width: 1000.0,
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  dotenv.env["URLFPART"]! +
                      item.images[0].src.toString().substring(18),
                ),
                fit: BoxFit.cover,
              )),
          margin: const EdgeInsets.all(5.0),
        ),
        Positioned(
          top: p1.maxHeight * 0.5,
          left: 25,
          right: 25,
          child: Text(
            '2DT',
            style: TextStyle(
                color: darkBlueText, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: p1.minHeight * 0.4,
          left: 10,
          child: Text(
            'Top Deal!',
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ]),
    );
  }
}
