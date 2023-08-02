# 1단계 월말평가 (뉴스앱)

## Requirements

- 제공되는 API에 데이터 요청을 보내고, 받은 응답 데이터를 통하여 화면에 출력합니다.
- 이 때 각 뉴스를 클릭했을 때 상세 뉴스페이지로 이동됩니다.
- 뉴스페이지로 가게되면 Full Article 버튼이 존재하며, 해당 버튼을 누르게되면 뉴스 원본 URL로 이동합니다.
- 폰트는 구글폰트를 사용하며, MaterialApp 위젯 안의 테마는 다음과 같이 설정하도록 합니다.

```dart 
theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          const TextTheme(),
        ),
      ),
```

## 🧑‍💻 결과
![Alt text](<Simulator Screen Recording - iPhone 14 Pro Max - 2023-08-02 at 11.28.51.gif>)