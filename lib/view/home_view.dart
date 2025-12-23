import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_app_getx_course/controller/service_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final controller = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeView"),
        centerTitle: true,
        actions: [
          GetBuilder<ServiceController>(
            builder:
                (controller) => IconButton(
                  onPressed: () {
                    controller.changeThemeMode();
                  },
                  icon: Icon(controller.changeIcon()),
                ),
          ),
        ],
      ),
    );
  }
}
