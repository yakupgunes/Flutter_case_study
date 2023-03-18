// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);
import 'dart:convert';

ProductModel productModelFromMap(String str) =>
    ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.id,
  });

  final String name;
  final String image;
  final String price;
  final String description;
  final String id;

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "price": price,
        "description": description,
        "id": id,
      };
}
