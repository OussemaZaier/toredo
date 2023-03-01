import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class detailsPage extends StatelessWidget {
  detailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = ['halal food', 'bio food', 'gluten free'];
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        ListView(
          padding: const EdgeInsets.all(10.0),
          shrinkWrap: true,
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
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 243, 243, 243)),
              padding: EdgeInsets.all(10),
              child: Center(
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    // itemCount: img.length,
                    shrinkWrap: true,
                    children: img.map((e) {
                      return Attribute(atrributeName: e);
                    }).toList()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Details',
              style: TextStyle(fontFamily: "Falling", fontSize: 35),
            ),
            Expanded(
              child: Text(
                'some further inormationhhhhhhh\n'
                'fgdfgdfghgfhgnhgfhfghjfjhfjgj'
                'fgdfgdfghgfhgnhgfhfghjfjhfjgj\n'
                'fgdfgdfghgfhgnhgfhfghjfjhfjgj\nfgdfgdfghgfhgnhgfhfghjfjhfjgj\ndgsfghksdjhfkjdhfdkjsbfkjxczxncxjc\nuhsdfhjsdcjhkhc\n',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}

class Attribute extends StatelessWidget {
  String atrributeName;
  Attribute({
    Key? key,
    required this.atrributeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage('assets/images/' + atrributeName + '.png'),
            size: 30,
          ),
          Text(
            atrributeName[0].toUpperCase() + atrributeName.substring(1),
            style: TextStyle(fontFamily: 'Falling', fontSize: 20),
          )
        ],
      ),
    );
  }
}
