import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/new_controller.dart';
import '../../model/new_model.dart';
import 'list_items.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.list});
  final List<NewModel> list;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewController>(
      init: NewController(),
      builder: (controller) {
        return ListItems(list: controller.newList);
      },
    );
  }
}
