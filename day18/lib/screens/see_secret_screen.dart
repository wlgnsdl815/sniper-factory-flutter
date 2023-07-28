import 'package:animate_do/animate_do.dart';
import 'package:day18/const/colors.dart';
import 'package:day18/components/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

class SeeSecretScreen extends StatelessWidget {
  const SeeSecretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: fontColor,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
    return DefaultLayout(
      child: FutureBuilder(
          future: SecretCatApi.fetchSecrets(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? PageView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeInDown(
                              child: Image.asset(
                                'assets/images/onibi.png',
                                width: 80,
                                height: 80,
                              ),
                            ),
                            SizedBox(height: 8),
                            FadeInRight(
                              child: Text(
                                snapshot.data![index].secret,
                                style: textStyle.copyWith(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            FadeInUp(
                              child: Text(
                                snapshot.data![index].author?.name ?? '익명',
                                style: textStyle,
                              ),
                            ),
                          ],
                        )),
                  )
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
