import 'package:flutter/material.dart';

// ListView.build로 동적으로 관리하려면 StatefulWidget으로 바꿔야 한다.
class SecondCode extends StatefulWidget {
  const SecondCode({super.key});

  @override
  State<SecondCode> createState() => _SecondCodeState();
}

class _SecondCodeState extends State<SecondCode> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.separated(
                  shrinkWrap: true, // ListView 크기를 축소해서 사용 가능한 공간에 맞게 설정
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      imgUrl: dataList[index]
                          ['imgUrl']!, // 만들어둔 dataList의 [index]번째 ['imgUrl']
                      title: dataList[index]
                          ['title']!, // 만들어둔 dataList의 [index]번째 ['title']
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.0),
                            Text(
                              '메타버스 교육의 효과를 경험해보세요',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      );
                    }
                    return SizedBox(height: 16.0);
                  },
                  itemCount: dataList.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String imgUrl;
  final String title;

  const CustomListTile({
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
          fit: BoxFit.contain,
          width: 50,
          height: 50,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
      trailing: title == '게더'
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  '추가하기',
                  style: textStyle,
                ),
              ),
            )
          : Icon(Icons.more_horiz),
    );
  }
}

// url과 title을 Map으로 저장. 만들고 보니까 json형태같다.
List<Map<String, String>> dataList = [
  {
    'imgUrl': 'assets/images/gather.jpeg',
    'title': '게더',
  },
  {
    'imgUrl': 'assets/images/insta.png',
    'title': '스나이퍼팩토리 인스타그램',
  },
  {
    'imgUrl': 'assets/images/nblog.png',
    'title': '스나이퍼팩토리 네이버블로그',
  },
  {
    'imgUrl': 'assets/images/tstory.png',
    'title': '스나이퍼팩토리 티스토리',
  },
  {
    'imgUrl': 'assets/images/kakao.jpeg',
    'title': '스나이퍼팩토리 카카오톡채널',
  },
  {
    'imgUrl': 'assets/images/youtube.png',
    'title': '스나이퍼팩토리 유튜브',
  },
  {
    'imgUrl': 'assets/images/zep.png',
    'title': '젭(ZEP) PW:1234',
  },
];
