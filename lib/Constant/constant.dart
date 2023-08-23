import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

String baseURL = "https://newsapi.org/v2/everything?q=tesla&from=2023-07-22&sortBy=publishedAt&apiKey=3ac5a19cdcbf4c7bb6639a588c47f12b";
String demoImage = "https://images.unsplash.com/photo-1556888335-95371827d5fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1031&q=80";

class APPCOLORS {
  static final Color GREY_COLOR = Color(0xff494949);
  static final Color BLACK_COLOR = Color(0xff000000);
  static final Color SUBTITLE_COLOR = Color(0xffbababa);
  static final Color WHITE_COLOR = Color(0xffF9F4F4);
  static final Color SERVICES_CONTAINER_COLOR = Color(0xffE0DADA);
  static final Color PURE_WHITE = Color(0xffFFFFFF);
}

String formatDate(DateTime date) {
  String formattedDate = DateFormat("yyyy-MM-dd").format(date);
  return formattedDate.toUpperCase();
}

TextStyle FONT_STYLE({
  Color? color,
  double? fontsize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.robotoSlab(
    color: color ?? APPCOLORS.GREY_COLOR,
    fontSize: fontsize ?? 17,
    fontWeight: fontWeight ?? FontWeight.w100,
  );
}

double SCREEN_HEIGHT(BuildContext context) {
  return MediaQuery
      .of(context)
      .size
      .height;
}

double SCREEN_WIDTH(BuildContext context) {
  return MediaQuery
      .of(context)
      .size
      .height;
}
