import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app_getx_course/model/new_model.dart';

import '../../controller/new_controller.dart';
import '../../new_category.dart';
import 'list_items.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController? controller;

  final newsController = Get.put(NewController());

  @override
  void initState() {
    controller = TabController(
      length: CategoryList.categoryItems.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          controller: controller,
          tabs:
              CategoryList.categoryItems.map((e) {
                return Container(child: Text(e));
              }).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children:
                CategoryList.categoryItems.map((e) {
                  return FutureBuilder(
                    future: newsController.getCategoryNews(category: e),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        return ListItems(list: snapShot.data as List<NewModel>);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
