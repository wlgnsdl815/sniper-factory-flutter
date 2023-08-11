import 'package:day28/components/meaning_card.dart';
import 'package:day28/services/dictionary_service.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: "Search",
                          suffixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onSubmitted: (value) {
                          DictionaryService()
                              .getData(_textEditingController.text);
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (_textEditingController.text.isNotEmpty)
                Expanded(child: MeaningCard(word: _textEditingController.text)),
            ],
          ),
        );
      }),
    );
  }
}
