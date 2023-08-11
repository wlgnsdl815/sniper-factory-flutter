// ignore_for_file: public_member_api_docs, sort_constructors_first
class Definition {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;
  final String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json['definition'],
        synonyms: List<String>.from(json['synonyms']),
        antonyms: List<String>.from(json['antonyms']),
        example: json['example'],
      );
}
