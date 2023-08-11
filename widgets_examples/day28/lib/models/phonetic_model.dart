// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day28/models/license_model.dart';

class Phonetic {
  final String text;
  final String audio;
  final String sourceUrl;
  final License license;

  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    required this.license,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json['text'],
        audio: json['audio'],
        sourceUrl: json['sourceUrl'],
        license: License.fromJson(json['license']),
      );
}
