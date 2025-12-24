import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_app_getx_course/controller/service_controller.dart';
import 'package:new_app_getx_course/view/widgets/category_widget.dart';

import '../widgets/home_widget.dart';
import '../widgets/setting_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final controller = Get.put(ServiceController());
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.dialog(
          AlertDialog(
            title: Text("Close App"),
            content: Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("No, Cancel"),
              ),
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text("Yes, Exit"),
              ),
            ],
          ),
        );
      },
      child: GetBuilder<ServiceController>(
        builder:
            (controller) => Scaffold(
              appBar: AppBar(
                title: Text("HomeView"),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      controller.changeThemeMode();
                    },
                    icon: Icon(controller.changeIcon()),
                  ),
                ],
              ),
              body: PageView(
                onPageChanged: (index) {
                  controller.changeIndex(index: index);
                  print(index);
                },
                controller: pageController,
                children: [
                  HomeWidget(list: []),
                  CategoryWidget(),
                  SettingWidget(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                // backgroundColor: Colors.grey[200],
                selectedItemColor: Colors.blue,
                currentIndex: controller.currentIndex,
                onTap: (index) {
                  controller.changeIndex(index: index);
                  pageController.jumpToPage(index);
                  print("Index ${controller.currentIndex}");
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    activeIcon: Icon(Icons.category),
                    label: "Category",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    activeIcon: Icon(Icons.settings),
                    label: "Settings",
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
