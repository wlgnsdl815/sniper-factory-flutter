import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgets_examples/layout/default_layout.dart';

class IntlWidget extends StatelessWidget {
  const IntlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Intl',
      body: Column(
        children: [
          Text(DateFormat('y/M/d EE').format(DateTime.now())),
          // symbol은 앞에 뭐가 붙을 지 적어주면 된다.
          Text(NumberFormat.currency(locale: 'ko_KR', symbol: 'KRW')
              .format(400000000))
        ],
      ),
    );
  }
}
