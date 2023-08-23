import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/Constant/constant.dart';
import 'package:news_project/Model/newsApiModel.dart';

import '../Controllers/homeScreenController.dart';

class DetailScreen extends StatelessWidget {
  Article aticle;
  DetailScreen({required this.aticle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          Container(
            height: SCREEN_HEIGHT(context),
            width: SCREEN_WIDTH(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    "${aticle.urlToImage}",
                    scale: 1,

                  )),
              color: APPCOLORS.PURE_WHITE,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            // margin: EdgeInsets.all(16),
            height: SCREEN_HEIGHT(context),
            width: SCREEN_WIDTH(context),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:18.0),
                    child: Row(
                      children: [
                        InkWell(

                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.black.withOpacity(0.5)
                            ),
                            child: Icon(Icons.chevron_left,color: Colors.white,),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        // color: Colors.red,
                        height: 50,
                        width: 600,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                            "${aticle.title}",
                            style: FONT_STYLE(
                                color: APPCOLORS.PURE_WHITE,
                                fontsize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // color: Colors.red,
                            height: 27,
                            child: Text(
                                "${aticle.source?.name}",
                                style: FONT_STYLE(
                                    color: APPCOLORS.PURE_WHITE,
                                    fontsize: 15,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Container(
                            // color: Colors.red,
                            margin: EdgeInsets.only(left: 10),
                            height: 17,
                            child: Text(
                                "${formatDate(DateTime.parse(aticle.publishedAt.toString() ?? DateTime.now().toString()))}",
                                style: FONT_STYLE(
                                    color: APPCOLORS.PURE_WHITE,
                                    fontsize: 15,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        // color: Colors.red,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                            "${aticle.description}",
                            style: FONT_STYLE(
                                color: APPCOLORS.PURE_WHITE,
                                fontsize: 15,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
