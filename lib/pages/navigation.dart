import 'dart:ffi';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toredo/pages/shop.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 2;
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(
      initialPage: 2,
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
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFF101A30),
        buttonBackgroundColor: Colors.white,
        animationDuration: Duration(
          milliseconds: 500,
        ),
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        index: 2,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: _currentIndex != 0 ? Colors.white : Color(0xFF101A30),
          ),
          Icon(
            Icons.list,
            size: 30,
            color: _currentIndex != 1 ? Colors.white : Color(0xFF101A30),
          ),
          Icon(
            Icons.store,
            size: 30,
            color: _currentIndex != 2 ? Colors.white : Color(0xFF101A30),
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: _currentIndex != 3 ? Colors.white : Color(0xFF101A30),
          ),
          Icon(
            Icons.account_circle_rounded,
            size: 30,
            color: _currentIndex != 4 ? Colors.white : Color(0xFF101A30),
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
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            //Main
            ShopPage(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
