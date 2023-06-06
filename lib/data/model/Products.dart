import 'package:nano_health_assesment/data/model/Reting.dart';

class Products {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;


  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating
  });
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as double,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: json["rating"] as Rating,

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