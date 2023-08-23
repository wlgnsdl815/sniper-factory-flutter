// ignore_for_file: public_member_api_docs, sort_constructors_first
class Menu {
  String name;
  String url;

  Menu({
    required this.name,
    required this.url,
  });

  factory Menu.fromMap(Map<String, dynamic> map) => Menu(
        name: map['name'],
        url: map['url'],
      );
}
