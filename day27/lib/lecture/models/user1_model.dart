// ignore_for_file: public_member_api_docs, sort_constructors_first
class User1Geo {
  String lat;
  String lng;

  User1Geo({
    required this.lat,
    required this.lng,
  });
  factory User1Geo.fromJson(Map<String, dynamic> json) => User1Geo(
        lat: json['lat'],
        lng: json['lng'],
      );
}

class User1Address {
  String street;
  String suite;
  String city;
  String zipcode;
  User1Geo geo;

  User1Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
  factory User1Address.fromJson(Map<String, dynamic> json) => User1Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: User1Geo.fromJson(json['geo']),
      );
}

class User1Company {
  String name;
  String catchPhrase;
  String bs;

  User1Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
  factory User1Company.fromJson(Map<String, dynamic> json) => User1Company(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
      );
}

class User1 {
  int id;
  String name;
  String username;
  String email;
  User1Address address;
  String phone;
  String website;
  User1Company company;

  User1({
    required this.id,
    required this.name,
    required this.username,
    required this.address,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User1.fromJson(Map<String, dynamic> json) => User1(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: User1Address.fromJson(json['address']),
        phone: json['phone'],
        website: json['website'],
        company: User1Company.fromJson(json['company']),
      );
}
