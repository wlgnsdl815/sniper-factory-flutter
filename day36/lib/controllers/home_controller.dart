import 'package:day36/models/menu_model.dart';
import 'package:day36/services/menu_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList _orderList = [].obs;

  get orderList => _orderList;

  onCardTap(String menu) {
    _orderList.add(menu);
  }

  onChipDelete(int index) {
    _orderList.removeAt(index);
  }

  List<Menu> getMenuList() {
    return MenuServices().makeAsModel();
  }
}
