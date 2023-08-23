import 'package:day36/const/data_list.dart';
import 'package:day36/models/menu_model.dart';

class MenuServices {
  List<Menu> makeAsModel() {
    var menuList = dataList.map((e) => Menu.fromMap(e)).toList();
    return menuList;
  }
}
