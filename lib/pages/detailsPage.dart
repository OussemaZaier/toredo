import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class detailsPage extends StatefulWidget {
  detailsPage({Key? key}) : super(key: key);

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
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
            Container(
              color: Colors.white24,
              child: Row(
                children: [],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
