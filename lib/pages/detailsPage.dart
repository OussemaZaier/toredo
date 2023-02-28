import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class detailsPage extends StatelessWidget {
  detailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0n69IGWG0EJo6Q-y5_hlxrQkcrslN_R_2Gaf6Tbl1J7tq6xw57n7CX5aL0VvE9EUuFtU&usqp=CAU",
            ),
            Text(
              "Fresh Meat",
              style: TextStyle(fontFamily: "Falling", fontSize: 35),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 243, 243, 243)),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/halal.png'),
                        size: 40,
                      ),
                      Text(
                        'Halal',
                        style: TextStyle(fontFamily: 'Falling', fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Details',
              style: TextStyle(fontFamily: "Falling", fontSize: 35),
            )
          ],
        ),
      ),
    ));
  }
}
