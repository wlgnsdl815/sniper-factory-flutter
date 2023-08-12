// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weekly_assessment/screens/models/nutrition_model.dart';

class Fruit {
  String name;
  int id;
  String family;
  String genus;
  String order;
  Nutrition nutritions;

  Fruit({
    required this.name,
    required this.id,
    required this.family,
    required this.genus,
    required this.order,
    required this.nutritions,
  });

  factory Fruit.fromJson(Map<String, dynamic> json) => Fruit(
        name: json['name'],
        id: json['id'],
        family: json['family'],
        genus: json['genus'],
        order: json['order'],
        nutritions: Nutrition.fromJson(json['nutritions']),
      );
}
