import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../components/attribute.dart';
import '../models/product.dart';
import '../utils/constants.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  DetailsPage(this.product);
  @override
  Widget build(BuildContext context) {
    var img = product.type;
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
                    child: Hero(
                      tag: product.id,
                      child: product.images.isEmpty
                          ? Image.asset("assets/images/No_image.png")
                          : Image.network(
                              "https://192.168.1.14/" +
                                  product.images[0].src
                                      .toString()
                                      .substring(18),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.45,
                            ),
                    ),
                  ),
                  Text(
                    product.name,
                    style: TextStyle(
                      fontFamily: "Falling",
                      fontSize: 35,
                      color: Color(0xff123153),
                    ),
                  ),
                  product.saleDateTo.isNotEmpty
                      ? Text(
                          AppLocalizations.of(context)!.saleDate +
                              " " +
                              DateFormat("dd-MM-yyyy")
                                  .format(DateTime.parse(product.saleDateTo)),
                          style: TextStyle(
                            fontFamily: "Falling",
                            fontSize: 20,
                            color: Color.fromARGB(255, 248, 125, 111),
                          ),
                        )
                      : SizedBox(
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
                  Text(
                    product.description,
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
                  Row(
                    children: [
                      Text(
                        product.price + "DT",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: darkBlueText),
                      ),
                      Visibility(
                          visible: product.salePrice != "",
                          child: Text(
                            product.regularPrice + "DT",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ))
                    ],
                  ),
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
