// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  bool liked;
  String picture;
  String name;
  String time;
  double value;
  int price;
  String kcal;
  String description;
  String id;

  Food({
    required this.liked,
    required this.picture,
    required this.name,
    required this.time,
    required this.value,
    required this.price,
    required this.kcal,
    required this.description,
    required this.id,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    liked: json["liked"] ?? 'like',
    picture: json["picture"] ?? 'picture',
    name: json["name"] ?? 'name',
    time: json["time"] ?? 'time',
    value: json["value"] ?? 'value',
    price: json["price"] ?? 'price',
    kcal: json["kcal"] ?? 'kcal',
    description: json["description"] ?? 'des',
    id: json["id"] ?? 'id',
  );

  Map<String, dynamic> toJson() => {
    "liked": liked,
    "picture": picture,
    "name": name,
    "time": time,
    "value": value,
    "price": price,
    "kcal": kcal,
    "description": description,
    "id": id,
  };
}
