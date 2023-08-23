import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_project/Constant/constant.dart';
import 'dart:convert';

import '../Model/newsApiModel.dart';


class HomeScreenController extends GetxController{
  RxList<NewsApiResponseModel> newsApiResponse =
      <NewsApiResponseModel>[].obs;


  Future<NewsApiResponseModel> GetNewsData() async {
    EasyLoading.show(status: "loading...");
    var uri = Uri.parse(
        "$baseURL");

    try{
      var response = await http.get(uri)
          .timeout(const Duration(seconds: 25), onTimeout: () {
        return http.Response("Error", 408);
      });
      if (response.statusCode == 200) {
        print(response.body);
        EasyLoading.dismiss();
        return newsApiResponseModelFromJson(response.body);
      } else {
        print(response.body);
        EasyLoading.dismiss();
        return newsApiResponseModelFromJson(response.body);
      }
    }catch(e){
      return newsApiResponseModelFromJson( jsonEncode( {
        "status": false,
        "totalResults": 0,
        "articles": [],
      }) );
    }



  }

  void fetchData() async {
    // Fluttertoast.showToast(msg: "Data Is Null");
    NewsApiResponseModel? fetchedData = await GetNewsData();
    if (fetchedData.articles == null) {
      EasyLoading.dismiss();
      newsApiResponse.clear();
      newsApiResponse.add(fetchedData);
    } else {
      EasyLoading.dismiss();
      newsApiResponse.clear();
      newsApiResponse.add(fetchedData!);
      print(newsApiResponse.first.articles);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
}