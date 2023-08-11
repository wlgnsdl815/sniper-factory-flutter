# day28

## 28일차 과제 - 딕셔너리 앱 만들기

1. **다음의 공개된 API를 분석하고, 클래스를 활용하여 적용 후 
딕셔너리 앱을 다음과 같이 만드시오.**
    - [https://api.dictionaryapi.dev/api/v2/entries/en/](https://api.dictionaryapi.dev/api/v2/entries/en/pioneer){검색어}
             
    - **반드시 Dict 클래스를 만들고 Serialization을 진행할 수 있도록 하시오.**
        - 필요한 요소만을 클래스에 적용하는 것은 허용되지만,
        최대한 많은 데이터를 가져올 수 있도록 한다.
    - 이 때, 만약 검색어가 존재하지 않는 단어로 서버에서 정상적인 응답을 못받았을 경우는 아무 것도 출력되지 않도록 한다.
    - 검색어를 입력하고 엔터를 누르면 (TextField의 onSubmitted) 주어진 API를 통해 검색하도록 한다.
        - 이 때, 결과는 아래에 커스텀 위젯을 최대한 활용하여 보여줄 수 있도록한다.
        - 커스텀 위젯은 최대한 분할되어 있을수록 좋다.
            - 예) MeaningCard..

## 🧑‍💻 결과

![Alt text](<Simulator Screen Recording - iPhone 14 Pro Max - 2023-08-11 at 19.40.52.gif>)