// ignore_for_file: public_member_api_docs, sort_constructors_first
class License {
  final String name;
  final String url;

  License({
    required this.name,
    required this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        name: json['name'],
        url: json['url'],
      );
}
