import 'package:day32/assignment/models/document_model.dart';
import 'package:day32/assignment/services/doucument_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController pageController = PageController();

  final RxList<Document> _doc = <Document>[].obs;

  setDocument(List<Document> doc) {
    _doc(doc);
  }

  get doc => _doc;

  readDocuments() {
    DocumentService().getData();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
