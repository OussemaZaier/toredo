import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toredo/category.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFF101A30),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    80,
                  ),
                  bottomRight: Radius.circular(
                    80,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Shop by category',
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
                    name: 'Vegetable'),
                Category(
                    img: const AssetImage('assets/images/meat.png'),
                    name: 'Meat'),
                Category(
                    img: const AssetImage('assets/images/fruit.png'),
                    name: 'Fruits'),
                Category(
                    img: const AssetImage('assets/images/milk.png'),
                    name: 'Diary'),
                Category(
                    img: const AssetImage('assets/images/fish.png'),
                    name: 'Fish'),
                Category(
                    img: const AssetImage('assets/images/wheat-sack.png'),
                    name: 'Grains'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
