# weekly_assessment

## 주어진 앱 구현하기

# Requirements

1. 주어진 패키지를 활용하여 비밀공유 앱을 제작합니다.
2. 구현이 되어야 하는 기능은 다음과 같습니다.
    - BottomSheet
    - Drawer
    - FAB
    - 밑으로 당겨서 새로고침 기능
    - 비밀 수 만큼 생성되는 커스텀 위젯(SecretCard) 생성
3. 이 때 사용된 의존성 패키지는 다음과 같습니다.
    
    ```dart
    // ... pubspec.yaml 파일 일부입니다.
    dependencies:
      flutter:
        sdk: flutter
      animated_bottom_navigation_bar: ^1.1.0+1
      cupertino_icons: ^1.0.2
      font_awesome_flutter: ^10.4.0
      intl: ^0.18.0
      pull_to_refresh: ^2.0.0
      secret_cat_sdk: ^0.0.5+2
    ```
    
4. 커스텀 위젯(SecretCard)의 조각코드가 제공됩니다. 다음의 코드를 필수로 사용하세요.
    ```dart
    class SecretCard extends StatelessWidget {
        const SecretCard({super.key, required this.secret});
        final Secret secret;

    @override
    Widget build(BuildContext context) {
        ...
    ```

## 🧑‍💻 결과

![Alt text](<Simulator Screen Recording - iPhone 14 Pro Max - 2023-07-29 at 15.37.05.gif>)
