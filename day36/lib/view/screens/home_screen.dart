// ignore_for_file: prefer_const_constructors
import 'package:day36/controllers/home_controller.dart';
import 'package:day36/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    var menuList = controller.getMenuList();
    RxList orderList = controller.orderList;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: Colors.black,
          title: GestureDetector(
            onDoubleTap: () => Get.toNamed(Routes.admin),
            child: Text('분식왕 이테디 주문하기'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '주문 리스트',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (orderList.isNotEmpty)
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: orderList.length,
                    itemBuilder: (context, index) {
                      return Wrap(
                        children: [
                          Chip(
                            onDeleted: () {
                              controller.onChipDelete(index);
                            },
                            label: Text(orderList[index]),
                            deleteIcon: Icon(
                              Icons.cancel,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              if (orderList.isEmpty)
                SizedBox(
                  height: 40.0,
                  child: Align(
                    child: Text('주문한 메뉴가 없습니다.'),
                  ),
                ),
              SizedBox(height: 20.0),
              Text(
                '음식',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onCardTap(menuList[index].name);
                    },
                    child: Card(
                      // 카드로 만들었다.
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              menuList[index].url,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              // 가로 길이를 최대한으로 늘려준다
                            ),
                          ),
                          Text(
                            menuList[index].name,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('[담기]'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: orderList.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () {},
                label: Text('결제하기'),
              )
            : null,
      ),
    );
  }
}
