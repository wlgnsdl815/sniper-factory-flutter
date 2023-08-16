# day30

## 📄 배운내용

GetX - Rx, Obx, init, ever, once

## 30일차 과제

<aside>
⚠️ **정답 소스코드는 금일 오후 6시에 공개됩니다. 
코드 공개 전까지 제출할 수 있도록 해주세요.**

</aside>

1. **위의 결과물처럼 메인페이지에서의 코인이 1초마다 +1씩 되도록 만드시오.**
    - 사용된 비트코인은 FontAwesome의 아이콘을 활용한다.
        
        ```dart
        Icon(
            FontAwesomeIcons.bitcoin,
            size: 96.0,
            color: Colors.yellow.shade700,
        ),
        ```
        
2. **CoinController를 만들고, GetxController를 extends하여 위와 같은 결과물을 만들 수 있도록 하시오.**
    - 코인은 int형의 데이터를 가지며, 관측가능한 형태의 데이터타입으로 사용한다.
    - 이 때 Timer를 사용할 수 있도록 한다.
    - 코인이 10의 배수가 될때 마때, 코인 10n개를 달성했다는 안내문구를 출력하도록 한다.
    (Getx의 워커중 상황에 맞는 올바른 워커를 사용할 것)
3. **[상점으로 이동하기] 버튼을 누르면 상점 페이지로 이동한다.**
    - 상점페이지에서도 보유한 코인을 볼 수 있다.
    - 코인 리셋을 누르면 보유한 코인이 다시 0개로 바뀐다.

## 🧑‍💻 결과

![Alt text](<Simulator Screen Recording - iPhone 14 Pro Max - 2023-08-16 at 12.36.29.gif>)