# day29

## 🙋 배운내용

- GetX
    - put, find

## 29일차 과제

1. **Getx 패키지를 활용하여 기본적으로 제공되는 다음의 Get의 메서드를 활용하고 실행결과를 포함하여 내용을 정리하시오.**
    - Get.dialog
    - Get.bottomSheet
    - Get.snackbar
2. **i18n이 무엇을 의미하는지 알아내고, Getx 패키지에서 이를 구현하는 방법에 대해 정리하시오.**
3. **GetxController를 활용하여 다음의 정보를 포함하고있는 “전역”컨트롤러를 만드시오**
    - 컨트롤러명은 다음과 같다.
        - AppSettingController
    - 포함되어야 하는 멤버변수는 다음과 같다.
        
        
        | bool | isSoundOn |
        | --- | --- |
        | bool | isNotificationOn |
        | String | appVersion |
        | String | appName |
        | String | appAuthor |
        | String | appPackageName |
        | DateTime? | lastUpdated |
    - 위 데이터를 메인페이지에서 Get.put하여 전역에서 사용할 수 있도록 등록하고, 최소 두 페이지 이상에 Get.find하여 해당 데이터를 불러올 수 있도록 하시오.
    - 페이지 명, 페이지 수는 상관없으며 임의로 존재하는 페이지로 한다.
    이 때 페이지들은 서로 네비게이션을 다음과 같이 할 수 있도록 한다.    

```dart
Get.to(()=>페이지명());
```