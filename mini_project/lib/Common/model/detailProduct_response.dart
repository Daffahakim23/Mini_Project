import 'dart:convert';

import '../common.dart';

DetailWatchResponse detailMovieResponseFromJson(String str) =>
    DetailWatchResponse.fromJson(json.decode(str));

String detailWatchResponseToJson(DetailWatchResponse data) =>
    json.encode(data.toJson());

class DetailWatchResponse {
  DetailWatchResponse({
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

  factory DetailWatchResponse.fromJson(Map<String, dynamic> json) =>
      DetailWatchResponse(
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
        "Image": image,
        "IDNprice": idNprice,
        "USAprice": usAprice,
        "Diameter": diameter,
        "Material": material,
        "Water Resistance": waterResistance,
        "Reference": reference,
        "Bracelet": bracelet,
      };
}
