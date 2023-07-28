import 'package:flutter/material.dart';
import 'package:weekly_assessment/component/quizzes_card.dart';
import 'package:weekly_assessment/const/data_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // viewportFraction을 1보다 작게주면, 여러페이지를 볼 수 있다.
  final PageController pageController = PageController(viewportFraction: 0.8);
  List<Widget> result = [];
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: result,
              ),
            ],
          ),
          actions: [
            Padding(
              // 왼쪽과 오른쪽 버튼의 패딩이 조금 달라서 .fromLTRB를 사용
              padding: const EdgeInsets.fromLTRB(8.0, 0, 16, 0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    // goToNextPage();
                    pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    currentPage++;
                    if (currentPage > 5) {
                      currentPage = 5;
                    }
                  });
                },
                icon: Icon(
                  Icons.navigate_next,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (result.length != quizzes.length) {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                    if (result.isNotEmpty) result.removeLast();
                    currentPage--;
                  } else {
                    null;
                  }

                  if (currentPage < 1) {
                    currentPage = 1;
                  }
                });
              },
              icon: Icon(
                Icons.navigate_before,
                size: 40.0,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.pinkAccent,
                Colors.blue,
              ],
            ),
          ),
          child: PageView.builder(
            // 스와이핑으로는 스크롤 불가
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: QuizCard(
                  quiz: quizzes[index],
                  // 정답이면 다음페이지로 넘어가면서 동그라미 아이콘 추가
                  onCorrect: () {
                    setState(() {
                      // goToNextPage();
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      result.length < 5
                          ? result.add(
                              Column(
                                children: [
                                  Text('($currentPage번)'),
                                  Icon(Icons.circle_outlined),
                                ],
                              ),
                            )
                          : null;
                      currentPage++;
                    });
                  },
                  // 정답이면 다음페이지로 넘어가면서 엑스 아이콘 추가
                  onIncorrect: () {
                    setState(() {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      // goToNextPage();
                      result.length < 5
                          ? result.add(
                              Column(
                                children: [
                                  Text('($currentPage번)'),
                                  Icon(Icons.close),
                                ],
                              ),
                            )
                          : null;
                      currentPage++;
                    });
                  },
                ),
              );
            },
            itemCount: quizzes.length,
          ),
        ),
        floatingActionButton: result.length == quizzes.length
            ? FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    pageController.jumpTo(0); // 컨트롤러를 사용해서 제일 처음 페이지로 이동
                    currentPage = 1; // currentPage도 초기화
                    result = []; //result를 초기화 시켜서 점수 초기화
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
              )
            : null);
  }
}
