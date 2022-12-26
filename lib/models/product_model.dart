import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  dynamic tags;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryModel? category;
  List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.galleries,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: double.parse(json["price"].toString()),
        description: json["description"],
        tags: json["tags"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: CategoryModel.fromJson(json["category"]),
        galleries: List<GalleryModel>.from(
          json["galleries"].map((x) => GalleryModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "category": category!.toJson(),
        "galleries": List<dynamic>.from(galleries!.map((x) => x.toJson())),
      };
}

// Fungsi ketika tombol chat di product page tidak ditekan
// Fungsi menghapus produk dari halaman chat
class UninitializedProductModel extends ProductModel {}
