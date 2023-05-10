import 'dart:ffi';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toredo/components/orderProvider.dart';
import 'package:toredo/pages/cartPage.dart';
import 'package:toredo/pages/settings.dart';

import 'package:toredo/pages/shop.dart';

import '../components/cartProvider.dart';
import '../utils/constants.dart';
import 'orderPage.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 1;
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => OrderProvider())
        ],
        builder: (context, cart) => Consumer(
              builder: (context, cart, provider) => Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: CurvedNavigationBar(
                  height: 60,
                  backgroundColor: Colors.white,
                  color: Colors.white,
                  buttonBackgroundColor: selectedItemColor,
                  //  Colors.white,
                  animationDuration: Duration(
                    milliseconds: 300,
                  ),
                  onTap: (index) {
                    _pageController.jumpToPage(index);
                  },
                  index: _currentIndex,
                  items: <Widget>[
                    Icon(
                      Icons.list,
                      size: 30,
                      color:
                          _currentIndex != 0 ? navigationColor : Colors.white,
                    ),
                    Icon(
                      Icons.store,
                      size: 30,
                      color:
                          _currentIndex != 1 ? navigationColor : Colors.white,
                    ),
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color:
                          _currentIndex != 2 ? navigationColor : Colors.white,
                    ),
                    Icon(
                      Icons.account_circle_rounded,
                      size: 30,
                      color:
                          _currentIndex != 3 ? navigationColor : Colors.white,
                    ),
                  ],
                ),
                body: SafeArea(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    children: [
                      OrderScreen(),
                      //Main
                      ShopPage(),

                      CartScreen(),
                      Settings(),
                    ],
                  ),
                ),
              ),
            ));
  }
}
