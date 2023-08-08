// ignore_for_file: prefer_const_constructors
import 'package:day25/services/post_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: FutureBuilder(
        future: PostService().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                snapshot.data![index].title,
                                style: textStyle.copyWith(fontSize: 30.0),
                              ),
                              SizedBox(height: 20),
                              Text(
                                snapshot.data![index].body,
                              ),
                              SizedBox(height: 60.0)
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(
                        '${snapshot.data![index].id}',
                        style: textStyle,
                      ),
                    ),
                    title: Text(
                      snapshot.data![index].title,
                      style: textStyle,
                    ),
                    subtitle: Text(snapshot.data![index].body),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                if (index % 5 == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Post ${index + 1} ~ ${index + 5}',
                      style: textStyle.copyWith(
                        fontSize: 30.0,
                      ),
                    ),
                  );
                }
                return SizedBox();
              }),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
