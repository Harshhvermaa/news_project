import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, required this.text, required this.onPressed, this.textColor,this.buttonColor,this.borderRadius,this.width,this.height,this.textStyle});

  String text;
  VoidCallback onPressed;
  Color? textColor;
  double? borderRadius;
  double? height;
  double? width;
  TextStyle? textStyle;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            width: width ?? 472,
            height: height ?? 65,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 69))),
                  backgroundColor: MaterialStateProperty.all(
                      buttonColor == null ? Color(0xffF9F4F4) : buttonColor)),
              child: Text(
                text,
                style: textStyle ?? TextStyle(
                  color: textColor == null ? Color(0xff4A352C) : textColor,
                  fontFamily: 'unboundR',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

            )
            //   Center(
            //     child: Text(
            //       text,
            //       style: TextStyle(
            //         color: textColor == null ? Color(0xff4A352C) : textColor,
            //         fontFamily: 'unboundR',
            //         fontSize: 18.sp,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ),
            // ),
            ));
  }
}
