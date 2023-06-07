

import 'package:nano_health_assesment/data/model/Reting.dart';
import 'package:nano_health_assesment/data/model/Reting.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;


  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price']== null ? 0.0 : json['price'].toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating:  Rating.fromJson(json['rating'])

    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating" :rating

      };
  @override
  String toString() {
    return '{ id: $id, title: $title,price: $price,description: $description,title: $title,image: $image,rating:$rating}';
  }
}