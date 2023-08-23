import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_project/widgets/customButton.dart';

import '../Constant/constant.dart';
import 'otpScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SCREEN_HEIGHT(context),
          width: SCREEN_WIDTH(context),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            // color: Colors.black54
            image: DecorationImage(
                image: AssetImage("assets/Splash.jpeg"),
                fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Appbar Space
                SizedBox(
                  height: 170 ,
                ),
                SizedBox(
                  height: 100 ,
                ),

                /// Lets you in
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Divider(
                            height: 2,
                            color: Colors.white,
                          ),
                        )),
                    Expanded(
                      child: Text(
                        "Let's You In",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'InterB',
                          fontSize: 20 ,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Divider(
                            height: 2,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),

                SizedBox(
                  height: 200,
                ),
                // Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 20 , bottom: 30 ),
                  height: SCREEN_HEIGHT(context) * 0.07,
                  width: 472 ,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                      border: Border.all(color: APPCOLORS.PURE_WHITE, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: TextField(
                      controller: _phoneNumber,

                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        FilteringTextInputFormatter.allow(RegExp(
                            r'^[+]*[(]{0,1}[6-9]{1,4}[)]{0,1}[-\s\./0-9]*$')),
                      ],
                      cursorColor: APPCOLORS.PURE_WHITE,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Color(0xffffffff).withOpacity(0.7),
                            fontFamily: 'InterM',
                            fontSize: 20 ,
                            fontWeight: FontWeight.w300,
                          ),
                          contentPadding: EdgeInsets.only(left: 30)),
                      style: TextStyle(
                        color: Color(0xffffffff).withOpacity(0.9),
                        fontFamily: 'InterM',
                        fontSize: 20 ,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10 ,
                ),

                /// Button
                CustomButton(text: "Verify", onPressed: () {
                  Get.to(()=> OtpScreen(phone: '${_phoneNumber.text}',) );
                },
                height: 50),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
