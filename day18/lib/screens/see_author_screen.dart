import 'package:animate_do/animate_do.dart';
import 'package:day18/const/colors.dart';
import 'package:day18/components/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

class SeeAuthorScreen extends StatelessWidget {
  const SeeAuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: FutureBuilder(
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? GridView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: FadeInDown(
                            duration: Duration(milliseconds: 1000),
                            delay: Duration(milliseconds: 300 * index),
                            child: Image.network(
                                '${snapshot.data![index].avatar}'),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        FadeInUp(
                          child: Text(
                            snapshot.data![index].name,
                            style: TextStyle(
                              color: fontColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              : CircularProgressIndicator();
        },
        future: SecretCatApi.fetchAuthors(),
      ),
    );
  }
}
