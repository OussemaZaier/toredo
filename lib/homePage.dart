import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toredo/loginPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toredo/navigation.dart';
import 'package:toredo/shop.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // timeDilation = 3.0; // 1.0 means normal animation speed.
    var x = Radius.circular(MediaQuery.of(context).size.height / 6);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              clipBehavior: Clip.none,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF101A30),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          100,
                        ),
                        bottomRight: Radius.circular(
                          100,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -75,
                    right: MediaQuery.of(context).size.width / 2 - 75,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'appLogo',
                        /*createRectTween: (begin, end) =>
                            CustomRectTween(begin, end),*/
                        child: Image.asset(
                          'assets/images/leaf.png',
                          scale: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75,
            ),
            const Text(
              'Toredo',
              style: TextStyle(
                fontFamily: 'Falling',
                fontSize: 60,
                letterSpacing: -4,
                fontWeight: FontWeight.w100,
                color: Color(0xFF101A30),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.helloMsg,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 2000),
                    reverseTransitionDuration: Duration(milliseconds: 1000),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        LoginPage(
                      isItLoginPage: true,
                    ),
                  ),
                );
              }),
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 1.3,
                decoration: BoxDecoration(
                  color: Color(0xFFA5FB81),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.started,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
