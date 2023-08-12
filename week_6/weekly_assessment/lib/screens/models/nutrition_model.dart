// ignore_for_file: public_member_api_docs, sort_constructors_first
class Nutrition {
  final double calories;
  final double fat;
  final double sugar;
  final double carbohydrates;
  final double protein;

  Nutrition({
    required this.calories,
    required this.fat,
    required this.sugar,
    required this.carbohydrates,
    required this.protein,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        calories: json['calories'] is int?
            ? json['calories'].toDouble()
            : json['calories'],
        fat: json['fat'] is int? ? json['fat'].toDouble() : json['fat'],
        sugar: json['sugar'] is int? ? json['sugar'].toDouble() : json['sugar'],
        carbohydrates: json['carbohydrates'] is int?
            ? json['carbohydrates'].toDouble()
            : json['carbohydrates'],
        protein: json['protein'] is int?
            ? json['protein'].toDouble()
            : json['protein'],
      );
}
