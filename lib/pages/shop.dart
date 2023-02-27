import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toredo/components/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
