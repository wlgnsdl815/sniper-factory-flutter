import 'package:animate_do/animate_do.dart';
import 'package:day27/models/user_models.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final User user;
  final String imgUrl;
  const DetailScreen({
    super.key,
    required this.user,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 30.0);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(user.name),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                // 배경 이미지를 어둡게
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                        delay: Duration(milliseconds: 200),
                        child: _renderName()),
                    FadeIn(
                        delay: Duration(milliseconds: 400),
                        child: _renderInfo(textStyle)),
                    FadeIn(
                        delay: Duration(milliseconds: 600),
                        child: _renderCompany(textStyle)),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            top: 255,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imgUrl),
            ),
          ),
        ],
      ),
    );
  }

  Column _renderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 30.0,
            height: 2.5,
          ),
        ),
        Divider(
          color: Colors.grey,
          height: 50,
        ),
      ],
    );
  }

  Column _renderInfo(TextStyle textStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Information',
          style: textStyle,
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Icon(Icons.email),
            Text(user.email),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Icon(Icons.call),
            Text(user.phone),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Icon(Icons.location_on),
            Text(
              '${user.address.city}, ${user.address.street}, ${user.address.suite}',
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
          height: 50,
        ),
      ],
    );
  }

  Column _renderCompany(TextStyle textStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company',
          style: textStyle,
        ),
        SizedBox(height: 10.0),
        Text(user.company.name),
        SizedBox(height: 10.0),
        Text(user.company.catchPhrase),
        SizedBox(height: 10.0),
        Text(user.company.bs),
      ],
    );
  }
}
