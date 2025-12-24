import 'package:get/get.dart';

import '../model/new_model.dart';

class NewHelper extends GetConnect implements GetxService {
  Future<List<NewModel>> getNews() async {
    Response response = await get(
      "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=a9c0b03781794dfe911fa77e728ceb1a",
    );
    List data = response.body["articles"];
    List<NewModel> newsData = data.map((e) => NewModel.fromJson(e)).toList();
    return newsData;
  }

  Future<List<NewModel>> getCategoryNews({required String category}) async {
    Response response = await get(
      "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=a9c0b03781794dfe911fa77e728ceb1a",
    );
    List data = response.body["articles"];
    List<NewModel> newsData = data.map((e) => NewModel.fromJson(e)).toList();
    return newsData;
  }
}
