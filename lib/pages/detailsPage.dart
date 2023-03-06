import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/attribute.dart';

class detailsPage extends StatelessWidget {
  detailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = ['halal food', 'bio food', 'gluten free'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0n69IGWG0EJo6Q-y5_hlxrQkcrslN_R_2Gaf6Tbl1J7tq6xw57n7CX5aL0VvE9EUuFtU&usqp=CAU",
                    ),
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
                        color: Color.fromARGB(216, 249, 249, 249)),
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
                  Text(
                    AppLocalizations.of(context)!.details,
                    style: TextStyle(
                      fontFamily: "Falling",
                      fontSize: 35,
                      color: Color(0xff123153),
                    ),
                  ),
                  const Text(
                    'some further inormationhhhhhhhs',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ],
              )),
        ),
        Container(
          color: Colors.white,
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.price,
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
                              horizontal: 40, vertical: 15))),
                  child: Text(
                    AppLocalizations.of(context)!.add,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff123153),
                        fontSize:
                            Localizations.localeOf(context).toString() == "fr"
                                ? 20
                                : 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Falling"),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
