import 'package:flutter/material.dart';

class FirstCode extends StatelessWidget {
  const FirstCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 앱바와 색상이 좀 달라서 같은 흰색으로 해주었다
      // appBar: renderAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CustomListTile(
                imgUrl: 'assets/images/gather.jpeg',
                title: '게더',
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  '메타버스 교육의 효과를 경험해보세요',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              _CustomListTile(
                imgUrl: 'assets/images/insta.png',
                title: '스나이퍼팩토리 인스타그램',
              ),
              SizedBox(height: 24.0),
              _CustomListTile(
                imgUrl: 'assets/images/nblog.png',
                title: '스나이퍼팩토리 네이버블로그',
              ),
              SizedBox(height: 24.0),
              _CustomListTile(
                imgUrl: 'assets/images/tstory.png',
                title: '스나이퍼팩토리 티스토리',
              ),
              SizedBox(height: 24.0),
              _CustomListTile(
                imgUrl: 'assets/images/kakao.jpeg',
                title: '스나이퍼팩토리 카카오톡채널',
              ),
              SizedBox(height: 24.0),
              _CustomListTile(
                imgUrl: 'assets/images/youtube.png',
                title: '스나이퍼팩토리 유튜브',
              ),
              SizedBox(height: 24.0),
              _CustomListTile(
                imgUrl: 'assets/images/zep.png',
                title: '젭(ZEP) PW:1234',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String imgUrl;
  final String title;

  const _CustomListTile({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(21),
        child: Image.asset(
          imgUrl,
          fit: BoxFit.contain, // 사이즈에 맞게 이미지 지정
          width: 50,
          height: 50,
        ),
      ),
      title: Text(
        title,
        style: textStyle,
      ),
      trailing: title == '게더'
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  8.0,
                  16.0,
                  8.0,
                  16.0,
                ),
                child: Text(
                  '추가하기',
                  style: textStyle,
                ),
              ),
            )
          : Icon(
              Icons.more_horiz,
            ), // title이 게더면 추가하기 버튼, 아니면 Icon
    );
  }
}
