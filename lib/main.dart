import 'dart:convert';
import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:localstorage/localstorage.dart';
import 'package:toredo/api/api.dart';
import 'package:toredo/api/singleton.dart';
import 'package:toredo/pages/detailsPage.dart';
import 'package:toredo/pages/homePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toredo/pages/navigation.dart';

Future<void> main() async {
  await dotenv.load();
  HttpOverrides.global = MyHttpOverrides();
  //uploading all products to gain time later
  APIService apiService = new APIService();

  final LocalStorage storage = Singleton.storage;
  await storage.ready;
  //storage.deleteItem('products');
  apiService.getProducts().then((value) async {
    final parsed = json.encode(value);
    await storage.ready;
    storage.setItem(
      'products',
      parsed,
    );
  });
  bool verified = false;
  final token = await storage.getItem('token');
  if (token != null) {
    await apiService.validateToken(token).then((value) {
      final parsed = json.decode(value.toString());
      if (parsed?['data']['status'] == 200) {
        verified = true;
      }
    });
  }

  runApp(MyApp(
    verified: verified,
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Splash extends StatelessWidget {
  bool verified;

  Splash({
    Key? key,
    required this.verified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Expanded(
        child: Column(
          children: [
            Image.asset(
              'assets/images/leaf.png',
              width: 100,
              height: 100,
            ),
            Text(
              'Toredo',
              style: TextStyle(
                  fontFamily: 'Falling',
                  fontSize: 60,
                  letterSpacing: -4,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      nextScreen: verified ? Navigation() : HomePage(),
      //nextScreen: HomePage(),
      // detailsPage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      duration: 4000,
      animationDuration: const Duration(seconds: 1),
      backgroundColor: Color(0xFF101A30),
      splashIconSize: 200,
      centered: true,
    );
  }
}

class MyApp extends StatelessWidget {
  bool verified;

  MyApp({Key? key, required this.verified}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFF101A30));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white, //<-- SEE HERE
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: Locale('en', ''),
      home: Splash(
        verified: verified,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
