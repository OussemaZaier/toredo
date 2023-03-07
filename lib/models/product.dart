import 'dart:convert';

import 'package:flutter/material.dart';

class Product {
  late int id;
  late String name,
      description,
      price,
      regularPrice,
      salePrice,
      stockStatus,
      saleDateFrom = "",
      saleDateTo = "";
  List<ImageModel> images = [];
  List<CategoryModel> categories = [];
  List<String> type = [];
  Product(this.id, this.name, this.description, this.price, this.regularPrice,
      this.salePrice, this.stockStatus, this.saleDateFrom, this.saleDateTo);
  Product.fromJson(var json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    stockStatus = json['stock_status'];

    saleDateFrom = json['date_on_sale_from'] == null
        ? ""
        : json['date_on_sale_from'].toString().substring(0, 10);
    saleDateTo = json['date_on_sale_to'] == null
        ? ""
        : json['date_on_sale_to'].toString().substring(0, 10);
    if (json['images'] != null) {
      images = <ImageModel>[];

      json['images'].forEach((img) => {images.add(ImageModel.fromJson(img))});
    }
    if (json['categories'] != null) {
      json['categories']
          .forEach((cat) => {categories.add(CategoryModel.fromJson(cat))});
    }
    if (json['attributes'].isNotEmpty) {
      json['attributes'][0]['options'].forEach((opt) => {type.add(opt)});
    }
    Product product = Product(id, name, description, price, regularPrice,
        salePrice, stockStatus, saleDateFrom, saleDateTo);
    product.images = images;
  }
}

class CategoryModel {
  late int id;
  late String name;
  CategoryModel(this.id, this.name);
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ImageModel {
  late String src;
  ImageModel(this.src);
  ImageModel.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }
}
