// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:day27/models/address_model.dart';
import 'package:day27/models/company_model.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']),
        address: Address.fromJson(json['address']),
      );
}
