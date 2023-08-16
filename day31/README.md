# day31

## 📄 배운내용

**final, const, static, getter, setter
GetX의 Get.toNamed(), Routing**

## 31일차 과제

1. **외부에서 접근을 할 수 없도록, Private하게 사용할 수 있는 멤버 변수(또는 멤버 함수 등)를 지정하는 방법이 있다. Dart에서는 Private 멤버 변수를 어떻게 설정하는지 알아보고 정리하시오.**
    - 이때, Private으로 멤버변수를 설정시 얻는 이점에 대해서도 추가적으로 고민하여 정리하시오.

1. **클래스에서는 부모의 힘과 기능을 사용할 수있도록 extends가 존재한다.
extends를 사용하게되면 super의 키워드도 간혹볼 수 있는데, 이 때 super의 기능은 무엇인지 정리하시오.**

1. **GetPage의 URL방식 네비게이션을 활용한 페이지 접근은 
원하는 데이터를 포함시키어 다음 페이지로 이동시킬 수 있다.

    - **lib/page/detail_page.dart (코드보기)**
        
        ```dart
        import 'package:flutter/material.dart';
        import 'package:get/get.dart';
        
        class DetailPage extends StatelessWidget {
          const DetailPage({super.key});
          static const String route = '/detail';
        
          @override
          Widget build(BuildContext context) {
            var params = Get.parameters;
            var arguments = Get.arguments;
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$params'),
                    Text('$arguments'),
                  ],
                ),
              ),
            );
          }
        }
        ```
        
- **Get.Parameter가 무엇을 의미하는지, 
Get.toNamed를 활용하여 Parameter를 넘길 수 있는 방법에 대해 연구하고 코드를 제시하시오.**
- **Get.arguments가 무엇을 의미하는지, 
Get.toNamed를 활용하여 arguments를 넘길 수 있는 방법에 대해 연구하고 코드를 제시하시오.**

## 🧑‍💻 결과

![Alt text](<Simulator Screen Recording - iPhone 14 Pro Max - 2023-08-16 at 19.53.02.gif>)