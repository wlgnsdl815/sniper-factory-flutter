// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class Item {
  final int UC_SEQ;
  final String? MAIN_TITLE;
  final String? GUGUN_NM;
  final double? LAT;
  final double? LNG;
  final String? TITLE;
  final String? SUBTITLE;
  final String? ADDR1;
  final String? ADDR2;
  final String? CNTCT_TEL;
  final String? HOMEPAGE_URL;
  final String? USAGE_DAY_WEEK_AND_TIME;
  final String? RPRSNTV_MENU;
  final String? MAIN_IMG_NORMAL;
  final String? MAIN_IMG_THUMB;
  final String? ITEMCNTNTS;

  Item({
    required this.UC_SEQ,
    required this.MAIN_TITLE,
    required this.GUGUN_NM,
    required this.LAT,
    required this.LNG,
    required this.TITLE,
    required this.SUBTITLE,
    required this.ADDR1,
    required this.ADDR2,
    required this.CNTCT_TEL,
    required this.HOMEPAGE_URL,
    required this.USAGE_DAY_WEEK_AND_TIME,
    required this.RPRSNTV_MENU,
    required this.MAIN_IMG_NORMAL,
    required this.MAIN_IMG_THUMB,
    required this.ITEMCNTNTS,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        UC_SEQ: json['UC_SEQ'],
        MAIN_TITLE: json['MAIN_TITLE'],
        GUGUN_NM: json['GUGUN_NM'],
        LAT: json['LAT'],
        LNG: json['LNG'],
        TITLE: json['TITLE'],
        SUBTITLE: json['SUBTITLE'],
        ADDR1: json['ADDR1'],
        ADDR2: json['ADDR2'],
        CNTCT_TEL: json['CNTCT_TEL'],
        HOMEPAGE_URL: json['HOMEPAGE_URL'],
        USAGE_DAY_WEEK_AND_TIME: json['USAGE_DAY_WEEK_AND_TIME'],
        RPRSNTV_MENU: json['RPRSNTV_MENU'],
        MAIN_IMG_NORMAL: json['MAIN_IMG_NORMAL'],
        MAIN_IMG_THUMB: json['MAIN_IMG_THUMB'],
        ITEMCNTNTS: json['ITEMCNTNTS'],
      );
}
