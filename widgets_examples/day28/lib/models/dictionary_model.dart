// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day28/models/license_model.dart';
import 'package:day28/models/meaning_model.dart';
import 'package:day28/models/phonetic_model.dart';

class Dictionary {
  final String word;
  final String? phonetic;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;
  final License license;
  final List<String> sourceUrls;

  Dictionary({
    required this.word,
    this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  factory Dictionary.fromJson(Map<String, dynamic> json) => Dictionary(
        word: json['word'],
        phonetic: json['phonetic'],
        phonetics: List<Phonetic>.from(
            json['phonetics'].map((e) => Phonetic.fromJson(e))),
        meanings: List<Meaning>.from(
            json['meanings'].map((e) => Meaning.fromJson(e))),
        license: License.fromJson(json['license']),
        sourceUrls: List<String>.from(json['sourceUrls']),
      );
}
