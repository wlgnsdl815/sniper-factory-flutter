import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncherWidget extends StatelessWidget {
  const UrlLauncherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Url Launcher Widget'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: false,
        leading: Icon(Icons.people),
        actions: [
          Icon(Icons.share),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('이테디'),
            trailing: IconButton(
              onPressed: () {
                launchUrlString('sms:+8210-0000-0000');
                // 또는 아래와 같이 웹사이트 연결도 가능하다.
                // launchUrlString('https://sniperfactory.com');
              },
              icon: Icon(Icons.call),
            ),
          ),
        ],
      ),
    );
  }
}
