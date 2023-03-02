import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class detailsPage extends StatelessWidget {
  detailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = ['halal food', 'bio food', 'gluten free'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          shrinkWrap: true,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0n69IGWG0EJo6Q-y5_hlxrQkcrslN_R_2Gaf6Tbl1J7tq6xw57n7CX5aL0VvE9EUuFtU&usqp=CAU",
            ),
            const Text(
              "Fresh Meat",
              style: TextStyle(
                fontFamily: "Falling",
                fontSize: 35,
                color: Color(0xff123153),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 243, 243, 243)),
              child: Center(
                child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: img.asMap().entries.map((e) {
                      return Attribute(
                        atrributeName: e.value,
                        index: e.key,
                      );
                    }).toList()),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Details',
              style: TextStyle(
                fontFamily: "Falling",
                fontSize: 35,
                color: Color(0xff123153),
              ),
            ),
            const Text(
              'some further inormationhhhhhhh\n'
              'fgdfgdfghgfhgnh\ngfhfghjfjhfjgj'
              'fgdfgdfghgfhgnhgfhfghjfjhfjgj\n'
              'fgdfgdfghgfhg\nlklklklklklklkl\nkjkjijjijijihihi\nnhgfhfghjfjhfjgj\n'
              'fgdfgdfghgfhgnhgfhfghjfjhfjgj\n',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 255, 255, 255)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 20,
                        fontFamily: "Falling",
                      ),
                    ),
                    Text("\$data",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Falling",
                          color: Color(0xff123153),
                        )),
                  ],
                ),
                TextButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff56e39f)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15))),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Color(0xff123153),
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Falling"),
                    )),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

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
            ),
          )
        ],
      ),
    );
  }
}
