// ignore_for_file: public_member_api_docs, sort_constructors_first

class NetworkData {
  String image;
  String name;
  String description;
  int price;

  NetworkData({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  factory NetworkData.fromJson(Map<String, dynamic> json) => NetworkData(
        image: json['image'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
      );
}
