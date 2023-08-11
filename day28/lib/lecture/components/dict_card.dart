import 'package:day28/lecture/components/meaning_card.dart';
import 'package:day28/models/dictionary_model.dart';
import 'package:flutter/material.dart';

class DictCard extends StatelessWidget {
  final Dictionary dict;
  const DictCard({
    super.key,
    required this.dict,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dict.word,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dict.meanings.length,
              itemBuilder: (context, index) {
                return MeaningCard(
                  meaning: dict.meanings[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
