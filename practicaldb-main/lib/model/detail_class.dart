import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Detail {
  String? img;
  String? name;
  int price;
  RxBool like;
  RxBool cart;
  String? description;
  RxInt count;

  Detail({
    required this.img,
    required this.name,
    required this.price,
    required this.like,
    required this.cart,
    required this.description,
    required this.count,
  });
}

class Product {
  int? id;
  String? name;
  int? price;
  String? description;
  Uint8List? img;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    this.img,
  });
  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
        name: data['name'],
        price: data['price'],
        description: data['description']);
  }
}

List<Product> product = <Product>[
  Product(
      name: "Creepers",
      price: 500,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  Product(
      name: "Wild",
      price: 300,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  Product(
      name: "climbers",
      price: 150,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  Product(
      name: "Herbs",
      price: 450,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  Product(
      name: "Thistle",
      price: 200,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
];
