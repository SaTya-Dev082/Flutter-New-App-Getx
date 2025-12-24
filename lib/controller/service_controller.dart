import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ServiceController extends GetxController {
  final box = GetStorage();
  void changeThemeMode() {
    String? theme = box.read("theme");
    if (theme == null || theme == "dark") {
      Get.changeThemeMode(ThemeMode.light);
      box.write("theme", "light");
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write("theme", "dark");
    }
    update();
  }

  IconData changeIcon() {
    String? theme = box.read("theme");
    if (theme == "dark") {
      return Icons.dark_mode_outlined;
    } else {
      return Icons.light_mode_outlined;
    }
  }

  int currentIndex = 0;
  void changeIndex({required int index}) {
    currentIndex = index;
    update();
  }
}
