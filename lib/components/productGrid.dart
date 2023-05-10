import 'package:flutter/material.dart';
import 'package:toredo/components/productCard.dart';
import 'package:toredo/models/product.dart';

import '../models/CartItem.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({
    super.key,
    required this.itemWidth,
    required this.itemHeight,
    required this.products,
  });

  final double itemWidth;
  final double itemHeight;
  final List products;

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        childAspectRatio: (widget.itemWidth / widget.itemHeight) / 0.7,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: widget.products.map((product) {
          return ProductCard(product: product);
        }).toList());
  }
}
