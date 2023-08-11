// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day28/models/definition_model.dart';

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json['partOfSpeech'],
        definitions: List<Definition>.from(
            json['definitions'].map((e) => Definition.fromJson(e))),
      );
}
