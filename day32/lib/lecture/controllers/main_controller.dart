import 'package:day32/lecture/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late PageController pageController;
  RxInt curPage = 0.obs;

  onPageTapped(int v) {
    pageController.jumpToPage(v);
    curPage(v);
  }

  logout() {
    Get.find<AuthController>().logout();
    curPage(0);
    // pageController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}
