import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // XFile은 null일 수도 있는 타입이다.
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    ImagePicker imagerPicker = ImagePicker();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // selectedImage가 널이 아니면 사진을 출력
            if (selectedImage != null)
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 43.0,
                backgroundImage: AssetImage(selectedImage!.path),
              ),
            TextButton(
              child: Text(
                '이미지 불러오기',
              ),
              // 버튼이 눌리면 이미지를 selectedImage에 저장
              onPressed: () async {
                XFile? image =
                    await imagerPicker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  print('이미지가 선택되었습니다');
                  selectedImage = image;
                  setState(() {});
                } else {
                  print('아무것도 선택 안했습니다');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
