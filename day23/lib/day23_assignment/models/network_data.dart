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

  // json형태로 받은 걸 class로 만드는 .fromJson함수 정의
  factory NetworkData.fromJson(Map<String, dynamic> json) => NetworkData(
        image: json['image'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
      );
}
