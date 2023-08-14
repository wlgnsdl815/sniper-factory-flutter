// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class AppSettingController extends GetxController {
  final bool isSoundOn;
  final bool isNotificationOn;
  final String appVersion;
  final String appName;
  final String appAuthor;
  final String appPackageName;
  final DateTime? lastUpdated;

  AppSettingController({
    required this.isSoundOn,
    required this.isNotificationOn,
    required this.appVersion,
    required this.appName,
    required this.appAuthor,
    required this.appPackageName,
    this.lastUpdated,
  });
}
