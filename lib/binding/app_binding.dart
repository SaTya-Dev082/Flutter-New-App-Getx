import 'package:get/get.dart';
import 'package:new_app_getx_course/controller/service_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceController());
    Get.put(ServiceController());
  }
}
