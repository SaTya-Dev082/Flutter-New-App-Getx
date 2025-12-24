import 'package:flutter/material.dart';
import 'package:new_app_getx_course/view/screens/home_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    debugPrint(box.read("theme"));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode:
          box.read("theme") == null || box.read("theme") != "dark"
              ? ThemeMode.light
              : ThemeMode.dark,
    );
  }
}
