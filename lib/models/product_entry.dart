// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    String description;
    String category;
    int price;
    dynamic thumbnail;
    bool isFeatured;
    dynamic userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.price,
        required this.thumbnail,
        required this.isFeatured,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        price: json["price"],
        thumbnail: json["thumbnail"],
        isFeatured: json["is_featured"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "price": price,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
