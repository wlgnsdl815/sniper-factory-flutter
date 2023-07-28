import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerAssignment extends StatelessWidget {
  const ImagePickerAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포토네컷'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            _CustomContainer(),
            SizedBox(height: 10),
            _CustomContainer(),
            SizedBox(height: 10),
            _CustomContainer(),
            SizedBox(height: 10),
            _CustomContainer(),
            // SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _CustomContainer extends StatefulWidget {
  const _CustomContainer({super.key});

  @override
  State<_CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<_CustomContainer> {
  // 선택된 이미지
  XFile? selectedImg;

  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = ImagePicker();
    return GestureDetector(
      // 더블 탭하면 선택된 이미지를 null로 바꾸어서 없앤다
      onDoubleTap: () {
        setState(() {
          selectedImg = null;
        });
      },
      onTap: () async {
        // image에 임시로 선택된 이미지를 받는다
        XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

        // null이 아니면 선택된 이미지 교체
        if (image != null) {
          setState(() {
            selectedImg = image;
          });
        } else {
          print('이미지 선택해줘!');
        }
      },
      child: Container(
        color: Colors.grey[900],
        width: MediaQuery.of(context).size.width / 1.3,
        height: MediaQuery.of(context).size.height / 5,
        // 선택된 이미지가 null이 아니면 이미지 출력
        child: selectedImg != null
            ? Image.file(
                // XFile.path를 File로 넘겨준다
                File(selectedImg!.path),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }
}
