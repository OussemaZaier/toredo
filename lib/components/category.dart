import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toredo/utils/constants.dart';

class Category extends StatelessWidget {
  ImageProvider img;
  String name;
  void Function() fct;
  Category({Key? key, required this.img, required this.name, required this.fct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: fct,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  // Color.fromARGB(52, 105, 240, 175),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image(
                    image: img,
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Falling',
                  fontWeight: FontWeight.w100,
                  color: textColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
