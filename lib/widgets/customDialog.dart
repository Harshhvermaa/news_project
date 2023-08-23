import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidget{
  awesomeDialog( BuildContext context,String title,String desc,
      {VoidCallback? okfunction,DialogType? dialogType,String? btnOkText}){
    AwesomeDialog(
      dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        context: context,
        dialogType: dialogType ?? DialogType.info,
        animType: AnimType.rightSlide,
        title: '$title',
        desc: '$desc',
        btnCancelOnPress: () {},
        btnOkText: btnOkText ?? "ok",
        btnOkOnPress: okfunction ?? (){} ,
    ).show();
  }
}
