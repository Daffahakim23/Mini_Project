// To parse this JSON data, do
//
//     final watchItemsResponse = watchItemsResponseFromJson(jsonString);

import 'dart:convert';

WatchItemsResponse watchItemsResponseFromJson(String str) =>
    WatchItemsResponse.fromJson(json.decode(str));

String watchItemsResponseToJson(WatchItemsResponse data) =>
    json.encode(data.toJson());

class WatchItemsResponse {
  WatchItemsResponse({
    required this.products,
    required this.brands,
  });

  List<Product> products;
  List<Brand> brands;

  factory WatchItemsResponse.fromJson(Map<String, dynamic> json) =>
      WatchItemsResponse(
        products: List<Product>.from(
            json["Products"].map((x) => Product.fromJson(x))),
        brands: List<Brand>.from(json["Brands"].map((x) => Brand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
        "Brands": List<dynamic>.from(brands.map((x) => x.toJson())),
      };
}

class Brand {
  Brand({
    required this.id,
    this.brandName,
    required this.brandLogo,
    this.brandname,
  });

  int id;
  String? brandName;
  String brandLogo;
  String? brandname;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        brandName: json["brandName"],
        brandLogo: json["brandLogo"],
        brandname: json["Brandname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brandName": brandName,
        "brandLogo": brandLogo,
        "Brandname": brandname,
      };
}

class Product {
  Product({
    required this.id,
    required this.productName,
    required this.description,
    required this.image,
    required this.idNprice,
    required this.usAprice,
    required this.diameter,
    required this.material,
    required this.waterResistance,
    required this.reference,
    required this.bracelet,
  });

  int id;
  String productName;
  String description;
  String image;
  String idNprice;
  String usAprice;
  String diameter;
  String material;
  String waterResistance;
  String reference;
  String bracelet;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["productName"],
        description: json["description"],
        image: json["image"],
        idNprice: json["IDNprice"],
        usAprice: json["USAprice"],
        diameter: json["Diameter"],
        material: json["Material"],
        waterResistance: json["Water Resistance"],
        reference: json["Reference"],
        bracelet: json["Bracelet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "description": description,
        "image": image,
        "IDNprice": idNprice,
        "USAprice": usAprice,
        "Diameter": diameter,
        "Material": material,
        "Water Resistance": waterResistance,
        "Reference": reference,
        "Bracelet": bracelet,
      };
}
