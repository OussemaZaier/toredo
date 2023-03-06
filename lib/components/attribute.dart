import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Attribute extends StatelessWidget {
  String atrributeName;
  int index;
  static const colors = [0xffc7f4c5, 0xfff3f3c2, 0xffc4f1f5];
  Attribute({Key? key, required this.atrributeName, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Color(colors[index]),
            child: ImageIcon(
              AssetImage('assets/images/' + atrributeName + '.png'),
              size: 30,
            ),
          ),
          Text(
            atrributeName[0].toUpperCase() + atrributeName.substring(1),
            style: const TextStyle(
                fontFamily: 'Falling',
                fontSize: 20,
                color: Color(0xff123153),
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
