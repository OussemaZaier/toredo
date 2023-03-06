import 'dart:convert';

import 'package:flutter/material.dart';

class Product {
  late int id;
  late String name, description, price, regularPrice, salePrice, stockStatus;
  List<ImageModel> images = [];
  List<CategoryModel> categories = [];
  Product(this.id, this.name, this.description, this.price, this.regularPrice,
      this.salePrice, this.stockStatus);
  Product.fromJson(var json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    stockStatus = json['stock_status'];
    if (json['images'] != null) {
      images = <ImageModel>[];

      json['images'].forEach((img) => {images.add(ImageModel.fromJson(img))});
    }
    if (json['categories'] != null) {
      categories = <CategoryModel>[];

      json['categories']
          .forEach((cat) => {categories.add(CategoryModel.fromJson(cat))});
    }
    Product product = Product(
        id, name, description, price, regularPrice, salePrice, stockStatus);
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
