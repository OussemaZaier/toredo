import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localstorage/localstorage.dart';
import 'package:toredo/api/singleton.dart';
import 'package:toredo/components/settingItem.dart';
import 'package:toredo/pages/homePage.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.settings,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  settingItem(
                    iconName: Icons.person_outline,
                    fct: () {
                      print('clicked 1');
                    },
                    name: AppLocalizations.of(context)!.account,
                    logOut: false,
                  ),
                  settingItem(
                    iconName: Icons.notifications_none,
                    fct: () {
                      print('clicked 2');
                    },
                    name: AppLocalizations.of(context)!.notification,
                    logOut: false,
                  ),
                  settingItem(
                    iconName: Icons.lock_outline,
                    fct: () {
                      print('clicked 2');
                    },
                    name: AppLocalizations.of(context)!.privacy,
                    logOut: false,
                  ),
                  settingItem(
                    iconName: Icons.support_agent,
                    fct: () {
                      print('clicked 2');
                    },
                    name: AppLocalizations.of(context)!.support,
                    logOut: false,
                  ),
                  settingItem(
                    iconName: Icons.help_outline,
                    fct: () {
                      print('clicked 2');
                    },
                    name: AppLocalizations.of(context)!.about,
                    logOut: false,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  settingItem(
                    iconName: Icons.logout,
                    fct: () async {
                      final LocalStorage storage = Singleton.storage;
                      await storage.ready;
                      storage.deleteItem('token');
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (Route<dynamic> route) => false);
                    },
                    name: AppLocalizations.of(context)!.logout,
                    logOut: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
