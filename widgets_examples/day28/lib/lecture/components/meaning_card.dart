import 'package:day28/models/meaning_model.dart';
import 'package:flutter/material.dart';

class MeaningCard extends StatelessWidget {
  final Meaning meaning;

  const MeaningCard({
    super.key,
    required this.meaning,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meaning.partOfSpeech,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: meaning.definitions.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(meaning.definitions[index].definition),
              );
            }),
          ),
        ],
      ),
    );
  }
}
