import 'package:get/get.dart';
import 'package:new_app_getx_course/controller/api_helper.dart';
import 'package:new_app_getx_course/model/new_model.dart';

class NewController extends GetxController {
  NewHelper newHelper = NewHelper();
  List<NewModel> newList = [];
  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() async {
    newList = await newHelper.getNews();
    update();
  }

  Future<List<NewModel>> getCategoryNews({required String category}) async {
    newList = await newHelper.getCategoryNews(category: category);
    return newList;
  }
}
