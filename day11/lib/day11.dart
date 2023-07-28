// void main() {
//   // // 2-1.
//   // for (int i = 0; i <= 1000; i++) {
//   //   if (i % 49 == 0) {
//   //     print(i);
//   //   }
//   // }
//   // // 2-2.
//   // for (int i = 0; i <= 1000; i++) {
//   //   if (i % 2 == 0) {
//   //     print(i);
//   //   }
//   // }
//   // 2-3.
//   // for (int i = 1; i < 10; i++) {
//   //   print('$i단');
//   //   for (int j = 1; j < 10; j++) {
//   //     print('$i * $j: ${i * j}');
//   //   }
//   // }
//   // 2-4.
//   // for (int i = 0; i < 1; i++) {
//   //   for (int i = 1; i <= 10; i++) {
//   //     print('*' * i);
//   //   }
//   // }
//   // 2-5
//   // startCrawling(String url) {
//   //   //...크롤링 하는 코드... //
//   //   print(url + '에 크롤링 성공함');
//   // }

//   // var defaultUrl = "https://example.sniperfactory.com/board?pages=";

//   // for (int i = 1; i <= 1000; i++) {
//   //   startCrawling(defaultUrl + '$i');
//   // }
//   // 2-6
//   // for (int i = 0; i <= 500; i++) {
//   //   print(i * 2);
//   // }
//   // 2-7
//   // List myVars = [1, 2, 3, 4, 5, 6, 7];
//   // List<int> result = [];
//   // myVars.forEach((element) {
//   //   result.add(element *= 5);
//   // });
//   // print(result);
//   // 2-8
//   //   Column(
//   //   children: [
//   //     Text('0'),
//   //     for(var i=1; i<100; i++)
//   //       Text(i.toString()),
//   //     Text('101'),
//   //   ]
//   // )
//   var randomData = [
//     'x',
//     'p',
//     's',
//     'j',
//     'm',
//     'V',
//     'X',
//     'g',
//     'v',
//     'o',
//     'c',
//     'f',
//     'R',
//     'L',
//     'a',
//     'T',
//     'q',
//     'S',
//     'Z',
//     'l',
//     'F',
//     'E',
//     'D',
//     'r',
//     'k',
//     'G',
//     'H',
//     't',
//     'd',
//     'C',
//     'e',
//     'I',
//     'K',
//     'Q',
//     'B',
//     'i',
//     'W',
//     'N',
//     'J',
//     'O',
//     'h',
//     'w',
//     'U',
//     'P',
//     'u',
//     'A',
//     'Y',
//     'M',
//     'y',
//     'z',
//     'b',
//     'n',
//     'x',
//     'p',
//     's',
//     'j',
//     'm',
//     'V',
//     'X',
//     'g',
//     'v',
//     'o',
//     'c',
//     'f',
//     'R',
//     'L',
//     'a',
//     'T',
//     'q',
//     'S',
//     'Z',
//     'l',
//     'F',
//     'E',
//     'D',
//     'r',
//     'k',
//     'G',
//     'H',
//     't',
//     'd',
//     'C',
//     'e',
//     'I',
//     'K',
//     'Q',
//     'B',
//     'i',
//     'W',
//     'N',
//     'J',
//     'O',
//     'h',
//     'w',
//     'U',
//     'P',
//     'u',
//     'A',
//     'Y',
//     'M'
//   ];
//   var mathData = [
//     26,
//     2,
//     9,
//     47,
//     98,
//     24,
//     43,
//     99,
//     96,
//     45,
//     35,
//     19,
//     37,
//     60,
//     31,
//     74,
//     26,
//     4,
//     28,
//     19,
//     59,
//     14,
//     75,
//     13,
//     93,
//     88,
//     64,
//     15,
//     68,
//     34,
//     96,
//     48,
//     1,
//     44,
//     14,
//     11,
//     31,
//     39,
//     28,
//     100,
//     22,
//     73,
//     78,
//     98,
//     36,
//     49,
//     74,
//     16,
//     35,
//     91,
//     14,
//     73,
//     93,
//     49,
//     3,
//     99,
//     4,
//     29,
//     86,
//     56,
//     17,
//     13,
//     97,
//     55,
//     94,
//     7,
//     100,
//     66,
//     59,
//     85,
//     94,
//     11,
//     16,
//     48,
//     16,
//     44,
//     75,
//     14,
//     17,
//     88,
//     92,
//     12,
//     49,
//     35,
//     42,
//     82,
//     19,
//     27,
//     11,
//     21,
//     34,
//     27,
//     47,
//     40,
//     66,
//     90,
//     99,
//     93,
//     63,
//     90,
//   ];

//   // mathData에 50이 넘는 수의 갯수 구하기
//   print(mathData.where((element) => element > 50).length);

//   // mathData에 80이 넘는 수만 고르고, 각 수에 곱하기2 한 후 mathData2에 저장하기
//   // 1. map() 함수 사용하기
//   List<int> mathData2 = mathData
//       .where((element) => element > 80)
//       .map(
//         (e) => (e *= 2),
//       )
//       .toList();

//   print(mathData2);

//   print('--------------------------------------');
//   // 2. forEach() 함수 사용하기
//   List<int> mathData3 = [];

//   mathData.where((element) => element > 80).forEach(
//     (element) {
//       element *= 2;
//       mathData3.add(element);
//     },
//   );
//   print(mathData3);
//   List<String> stringMathData = mathData.map((e) => e.toString()).toList();

//   // mathData와 randomData의 데이터를 섞어서 결과 만들기
//   for (int i = 0; i < randomData.length; i++) {
//     print('${randomData[i]}${mathData[i]}');
//   }
// }
