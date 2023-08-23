# day36

## 📄 배운내용

firebase_storage, 유저 프로필 사진 등록

## 36일차 과제

1. **2주차 주간과제의 키오스크 앱에 작성한 소스코드를 확인하고, 코드 구성과 위젯 구성을 재배치하여 코드를 개선하는 리팩토링을 진행하시오.**
    - 2주차 주간과제는 다음과 같다.
        
        [플러터 | 2주차 주간과제 (키오스크 앱)](https://www.notion.so/2-4427e93ffec643c9bb864d985dfa89d4?pvs=21)
        
    - 리팩토링이란, 소프트웨어를 보다 쉽게 이해할 수 있도록 만드는 작업이다.
        - 본인의 코드에서 부족했던 점을 개선할 수 있도록 한다.
        - 가독성과 유지보수성을 높이는 목표를 가질 수 있도록 한다.
    - 기존 코드를 보고 리팩토링이 적용된 핵심코드를 정리하시오.

## 🧑‍💻 결과
### 리팩토링 내용

- 주어진 데이터를 class화 했다.
- Admin 페이지의 Text를 Custom해서 구현했다.
- GetX 패키지를 사용했다.
    1. 화면이동을 Get.toNamed()로 구현
    2. homeController에 각 버튼별 동작을 구현    