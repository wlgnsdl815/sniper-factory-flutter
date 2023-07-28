// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:day6/component/starbucks_component/drinkTile.dart';
import 'package:flutter/material.dart';

class StarbucksOrderScreen extends StatelessWidget {
  const StarbucksOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 64,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '주문할 매장을 선택해주세요',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.expand_more,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
              ),
              label: 'Pay'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.coffee,
              ),
              label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
              ),
              label: 'Shop'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
            ),
            label: 'Other',
          ),
        ],
      ),
      appBar: AppBar(
        leading: Icon(
          Icons.navigate_before,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'NEW',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            DrinkTile(
              title: '골든 미모사 그린티',
              subtitle: 'Golden Mimosa Green Tea',
              price: 6100,
              imgUrl: 'assets/item_drink1.jpeg',
            ),
            DrinkTile(
              title: '블랙 햅쌀 고봉 라떼',
              subtitle: 'Black Rice Latte',
              price: 6100,
              imgUrl: 'assets/item_drink2.jpeg',
            ),
            DrinkTile(
              title: '아이스 블랙 햅쌀 고봉 라떼',
              subtitle: 'Ice Black Rice Latte',
              price: 6100,
              imgUrl: 'assets/item_drink3.jpeg',
            ),
            DrinkTile(
              title: '스타벅스 튜메릭 라떼',
              subtitle: 'Starbucks Tumeric Latte',
              price: 6100,
              imgUrl: 'assets/item_drink4.jpeg',
            ),
            DrinkTile(
              title: '아이스 스타벅스 튜메릭 라떼',
              subtitle: 'Ice Starbucks Tumeric Latte',
              price: 6100,
              imgUrl: 'assets/item_drink5.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
