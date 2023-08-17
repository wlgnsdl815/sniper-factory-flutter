import 'package:day32/assignment/controllers/auth_controller.dart';
import 'package:day32/assignment/models/document_model.dart';
import 'package:day32/assignment/services/doucument_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  final RxInt currentScreen = 0.obs;

  final RxList<Document> _doc = <Document>[].obs;

  setDocument(List<Document> doc) {
    _doc(doc);
  }

  get doc => _doc;

  readDocuments() {
    DocumentService().getData();
  }

  onPageTapped(int v) {
    pageController.jumpToPage(v);
    currentScreen(v);
  }

  logout() {
    Get.find<AuthController>().logout();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
