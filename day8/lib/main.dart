// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  String varX = '';
  String varY = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '사칙연산',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Builder(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CustomTextField(
                      variable: 'X',
                      onChanged: (String value) {
                        varX = value;
                      },
                    ),
                    _CustomTextField(
                      variable: 'Y',
                      onChanged: (String value) {
                        varY = value;
                      },
                    ),
                    _CustomButton(
                      label: '더하기',
                      onPressed: () {
                        int result = int.parse(varX) + int.parse(varY);
                        showResultDialog(context, result);
                      },
                    ),
                    _CustomButton(
                      label: '곱하기',
                      onPressed: () {
                        int result = int.parse(varX) * int.parse(varY);
                        showResultDialog(context, result);
                      },
                    ),
                    _CustomButton(
                      label: '빼기',
                      onPressed: () {
                        int result = int.parse(varX) - int.parse(varY);
                        showResultDialog(context, result);
                      },
                    ),
                    _CustomButton(
                      label: '나누기',
                      onPressed: () {
                        double result = double.parse(varX) / double.parse(varY);
                        showResultDialog(context, result);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  showResultDialog(BuildContext context, var result) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
                child: Text(
              "$result",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        );
      },
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String variable;
  final ValueChanged<String> onChanged;
  const _CustomTextField({
    super.key,
    required this.variable,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$variable의 값은?',
        ),
        SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 250,
          child: TextField(
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // 커서가 클릭 되었을 때에 위에 올라가는 글자 없애기
              label: Text('$variable값을 입력하세요.'),
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label + '의 결과값은?!'),
    );
  }
}
