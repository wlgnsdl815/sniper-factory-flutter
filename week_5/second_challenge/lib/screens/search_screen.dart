import 'package:flutter/material.dart';
import 'package:second_challenge/models/email_model.dart';
import 'package:second_challenge/style/colors.dart';

class SearchScreen extends StatefulWidget {
  final List<Email> filteredEmailList;
  const SearchScreen({
    Key? key,
    required this.filteredEmailList,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> searchList = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            filled: true,
            fillColor: Colors.grey[300],
            hintText: '메일 검색',
            focusColor: primaryColor,
          ),
          onSubmitted: (value) {
            setState(() {
              searchList.add(value);
            });

            final List<Email> result = widget.filteredEmailList
                .where((element) => element.from == value)
                .toList();

            if (result.isNotEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('${result.last.from} | ${result.last.title}'),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('검색 결과가 없습니다.'),
                    );
                  });
            }
            textEditingController.clear();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '상세',
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: ((context, index) => ListTile(
              title: Text(
                searchList[index],
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    searchList.removeAt(index);
                  });
                },
                icon: Icon(Icons.close),
              ),
            )),
      ),
    );
  }
}
