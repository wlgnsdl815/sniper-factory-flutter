import 'package:day28/services/dictionary_service.dart';
import 'package:flutter/material.dart';

class MeaningCard extends StatelessWidget {
  final String word;
  const MeaningCard({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: DictionaryService().getData(word),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox();
          }
          if (snapshot.hasData) {
            return Column(
              children: [
                Card(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          word,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          var meaning = snapshot.data!.first.meanings[index];
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  meaning.partOfSpeech,
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '- Synonyms:',
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '- Definitions:',
                                ),
                                ...meaning.definitions
                                    .map((e) => Text(e.definition.toString()))
                                    .toList(),
                                SizedBox(height: 10),
                                Text('- Antonyms:'),
                                Divider(
                                  height: 50,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
