import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.pSold,
    required this.pQuantity,
    required this.pOffer,
    required this.id,
    required this.pName,
    required this.pDescription,
    required this.pPrice,
    required this.pCategory,
    required this.pStatus,
    required this.pRatingsReviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.pImages,
  });

  int pSold;
  int pQuantity;
  List<String> pImages;
  String pOffer;
  String id;
  String pName;
  String pDescription;
  int pPrice;
  PCategory pCategory;
  String pStatus;
  List<dynamic> pRatingsReviews;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  var quantity = 0;
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        pSold: json["pSold"],
        pQuantity: json["pQuantity"],
        pImages: List<String>.from(json["pImages"].map((x) =>
            "http://c8e0-2400-1a00-b050-b63c-dda4-c419-892d-e64b.ngrok.io/uploads/products/" +
            x)),
        pOffer: json["pOffer"],
        id: json["_id"],
        pName: json["pName"],
        pDescription: json["pDescription"],
        pPrice: json["pPrice"],
        pCategory: PCategory.fromJson(json["pCategory"]),
        pStatus: json["pStatus"],
        pRatingsReviews:
            List<dynamic>.from(json["pRatingsReviews"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
  var isFavorite = false.obs;
  var off = 800;
  double rating = 3;
  var isAvailable = true;
  Map<String, dynamic> toJson() => {
        "pSold": pSold,
        "pQuantity": pQuantity,
        "pImages": List<dynamic>.from(pImages.map((x) => x)),
        "pOffer": pOffer,
        "_id": id,
        "pName": pName,
        "pDescription": pDescription,
        "pPrice": pPrice,
        "pCategory": pCategory.toJson(),
        "pStatus": pStatus,
        "pRatingsReviews": List<dynamic>.from(pRatingsReviews.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class PCategory {
  PCategory({
    required this.id,
    required this.cName,
  });

  String id;
  String cName;

  factory PCategory.fromJson(Map<String, dynamic> json) => PCategory(
        id: json["_id"],
        cName: json["cName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cName": cName,
      };
}
