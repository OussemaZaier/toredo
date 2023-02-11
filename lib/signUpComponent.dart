import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpComponent extends StatelessWidget {
  ImageProvider image;
  String name;
  SignUpComponent({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 13.0,
        right: 13.0,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: image,
                width: 25,
                height: 25,
              ),
              Text(
                '${AppLocalizations.of(context)!.signUp} $name',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
