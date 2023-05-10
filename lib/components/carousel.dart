import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toredo/models/product.dart';
import 'package:toredo/utils/constants.dart';

class CarouselImage extends StatefulWidget {
  late List<Widget> imagesliders;
  late List img;
  CarouselImage({Key? key, required this.imagesliders, required this.img})
      : super(key: key);

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Flexible(
        fit: FlexFit.loose,
        child: CarouselSlider(
          items: widget.imagesliders,
          carouselController: _controller,
          options: CarouselOptions(
              // autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.img.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: _current == entry.key ? 25 : 5,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (_current == entry.key
                      ? navigationColor.withOpacity(0.8)
                      : Colors.grey[400])),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
