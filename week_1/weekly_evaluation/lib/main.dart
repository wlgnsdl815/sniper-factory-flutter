// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.separated(
            itemBuilder: (context, index) => _CustomListTile(
                name: dataList[index]['name']!,
                number: dataList[index]['number']!),
            separatorBuilder: (context, index) => SizedBox(height: 24.0),
            itemCount: dataList.length,
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String name;
  final String number;
  const _CustomListTile({
    super.key,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(32.0),
        child: Image.network(
          'https://picsum.photos/100/100',
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      subtitle: Text(
        number,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      trailing: Icon(
        Icons.call,
        size: 32.0,
      ),
    );
  }
}

List<Map<String, String>> dataList = [
  {
    'name': '이테디',
    'number': '010-1000-2000',
  },
  {
    'name': '김스틴',
    'number': '010-9000-8000',
  },
  {
    'name': '이주노',
    'number': '010-3000-3000',
  },
  {
    'name': '임헬렌',
    'number': '010-2000-8000',
  },
  {
    'name': '염해리',
    'number': '010-1000-1000',
  },
];
