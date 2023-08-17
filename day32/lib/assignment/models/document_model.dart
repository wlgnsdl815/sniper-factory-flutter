// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class Document {
  String title;
  String content;
  String sec_level;
  String? attachment_url;

  Document({
    required this.title,
    required this.content,
    required this.sec_level,
    this.attachment_url,
  });

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      title: map['title'] as String,
      content: map['content'] as String,
      sec_level: map['sec_level'] as String,
      attachment_url:
          map['attachment_url'] != '' ? map['attachment_url'] : null,
    );
  }
}
