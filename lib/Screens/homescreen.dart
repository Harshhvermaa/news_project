import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_project/Constant/constant.dart';
import 'package:news_project/Controllers/homeScreenController.dart';
import 'package:news_project/Model/newsApiModel.dart';
import 'package:news_project/Screens/detailScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APPCOLORS.BLACK_COLOR,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("HEADLINES",
            style: FONT_STYLE(
                color: APPCOLORS.PURE_WHITE,
                fontsize: 29,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: APPCOLORS.GREY_COLOR,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ListView.builder(
          itemCount: 30,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  if(controller.newsApiResponse.first.articles?[index] != null){

                  Get.to(()=>DetailScreen(aticle: controller.newsApiResponse.first.articles![index],));
                  }else{
                    Get.showSnackbar(GetSnackBar(title: "Something went wrong",));
                  }
                },
                child: customContainer(context, index));
          },
        ),
      ),
    );
  }

  Widget customContainer(BuildContext context, int index) {
    return Stack(
      children: [
        Container(
          height: SCREEN_HEIGHT(context) * 0.242,
          margin: EdgeInsets.only(top: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  "${controller.newsApiResponse.first.articles?[index].urlToImage}",
                  scale: 1,

                )),
            color: APPCOLORS.PURE_WHITE,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Container(
          height: SCREEN_HEIGHT(context) * 0.242,
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  // color: Colors.red,
                  height: 50,
                  width: 600,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                      "${controller.newsApiResponse.first.articles?[index].title}",
                      style: FONT_STYLE(
                          color: APPCOLORS.PURE_WHITE,
                          fontsize: 20,
                          fontWeight: FontWeight.normal)),
                ),
                Row(
                  children: [
                    Container(
                      // color: Colors.red,
                      height: 17,
                      child: Text(
                          "${controller.newsApiResponse.first.articles?[index].source?.name}",
                          style: FONT_STYLE(
                              color: APPCOLORS.PURE_WHITE,
                              fontsize: 12,
                              fontWeight: FontWeight.normal)),
                    ),
                    Container(
                      // color: Colors.red,
                      margin: EdgeInsets.only(left: 10),
                      height: 17,
                      child: Text(
                          "${formatDate(DateTime.parse(controller.newsApiResponse.first.articles?[index].publishedAt.toString() ?? DateTime.now().toString()))}",
                          style: FONT_STYLE(
                              color: APPCOLORS.PURE_WHITE,
                              fontsize: 12,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
