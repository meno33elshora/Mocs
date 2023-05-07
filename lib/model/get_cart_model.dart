// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class GetCartModel {
  bool status;
  dynamic message;
  Data data;

  GetCartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetCartModel.fromRawJson(String str) => GetCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
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
  List<CartItem> cartItems;
  int subTotal;
  int total;

  Data({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartItems: List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x))),
    subTotal: json["sub_total"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "cart_items": List<dynamic>.from(cartItems.map((x) => x.toJson())),
    "sub_total": subTotal,
    "total": total,
  };
}

class CartItem {
  int id;
  int quantity;
  Product product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromRawJson(String str) => CartItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
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
  List<String> images;
  bool inFavorites;
  bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
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
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}
