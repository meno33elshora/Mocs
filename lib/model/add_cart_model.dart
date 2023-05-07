// To parse this JSON data, do
//
//     final addCartModel = addCartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AddCartModel {
  bool status;
  String message;
  Data data;

  AddCartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddCartModel.fromRawJson(String str) => AddCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  int quantity;
  Product product;

  Data({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    quantity: json["quantity"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "product": product.toJson(),
  };
}

class Product {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"],
    oldPrice: json["old_price"],
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
  };
}
