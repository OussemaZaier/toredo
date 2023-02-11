import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toredo/loginPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset(
                        'assets/images/leaf.png',
                        scale: 5,
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
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              }),
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 1.5,
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
