import 'package:day18/components/default_layout.dart';
import 'package:day18/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

class ShareSecretScreen extends StatefulWidget {
  const ShareSecretScreen({super.key});

  @override
  State<ShareSecretScreen> createState() => _ShareSecretScreenState();
}

class _ShareSecretScreenState extends State<ShareSecretScreen> {
  // 텍스트 입력을 컨트롤하기 위한 컨트롤러 선언
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              minLines: 15,
              maxLines: 15,
              decoration: InputDecoration(
                filled: true,
                fillColor: boxColor,
                focusColor: fontColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: fontColor,
                  ),
                ),
              ),
              cursorColor: fontColor,
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                SecretCatApi.addSecret(_textEditingController.text);
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      // 3초후에 바텀시트 사라지게 한다.
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pop(context);
                      });
                      return Container(
                        color: boxColor,
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '비밀공유 성공!',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: boxColor,
              ),
              child: Text(
                '비밀공유',
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
