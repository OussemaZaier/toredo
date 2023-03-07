import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:toredo/models/CartItem.dart';

import '../models/product.dart';
import '../pages/detailsPage.dart';
import '../utils/constants.dart';

class ProductCard extends StatefulWidget {
  Product product;
  List<CartItem> cart;
  ProductCard({required this.product, required this.cart, Key? key})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  PaletteGenerator? paletteGenerator;

  _updatePaletteGenerator(src) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      src,
      size: Size(200, 200),
    );
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.product.images != null) {
      _updatePaletteGenerator(NetworkImage(dotenv.env["URLFPART"]! +
          widget.product.images[0].src.toString().substring(18)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsPage(widget.product)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: paletteGenerator == null
            ? Colors.white
            : paletteGenerator?.lightVibrantColor?.color.withAlpha(200),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Hero(
                  tag: widget.product.id,
                  child: widget.product.images == null
                      ? Image.asset(
                          "assets/images/No_image.png",
                        )
                      : Image.network(
                          dotenv.env["URLFPART"]! +
                              widget.product.images[0].src
                                  .toString()
                                  .substring(18),
                          width: double.infinity,
                        ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 4),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: darkBlueText),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.product.price + "DT",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: darkBlueText),
                                  ),
                                  Visibility(
                                      visible: widget.product.salePrice != "",
                                      child: Text(
                                        widget.product.regularPrice + "DT",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: InkWell(
                              onTap: () {
                                int i = 0;
                                while (i < widget.cart.length &&
                                    widget.cart[i].product.id !=
                                        widget.product.id) {
                                  i++;
                                }
                                if (i >= widget.cart.length) {
                                  widget.cart
                                      .add(CartItem(product: widget.product));
                                } else {
                                  widget.cart[i].qte++;
                                }
                              },
                              child: Icon(
                                Icons.add,
                                size: 25,
                              )),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
