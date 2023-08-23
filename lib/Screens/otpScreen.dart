
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:http/http.dart';
import 'package:news_project/Screens/homescreen.dart';
import '../Constant/constant.dart';
import '../Controllers/OTPScreenController.dart';
import '../Widgets/customButton.dart';
import '../widgets/customDialog.dart';

class OtpScreen extends StatefulWidget {
  String phone;

  OtpScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? completeAddress;
  String? appbarAddress;
  String? defaultDialogText;
  String? _verificationCode;
  final TextEditingController _otp = TextEditingController();
  OtpScreenController otpScreenController = Get.put(OtpScreenController());



  @override
  void initState() {
    super.initState();
    otpScreenController.verifyPhone(widget.phone,context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          height: SCREEN_HEIGHT(context),
          width: SCREEN_WIDTH(context),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Splash.jpeg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Appbar
                        // Container(
                        //   height: 80,
                        //   width: double.infinity,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       SizedBox(
                        //         height: 40 ,
                        //         width: 70  ,
                        //         child: Align(
                        //           alignment: Alignment.centerLeft,
                        //           child: InkWell(
                        //             onTap: (() => Navigator.pop(context)),
                        //             child: Icon(
                        //               Icons.arrow_back,
                        //               color: APPCOLORS.WHITE_COLOR,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Image(
                        //         image: AssetImage("assets/images/addlogo.png"),
                        //         color: Colors.white,
                        //         height: 50 ,
                        //         // fit: BoxFit.fill,
                        //         width: 190  ,
                        //       ),
                        //       SizedBox(height: 40 ,
                        //         width: 70  ,)
                        //     ],
                        //   ),
                        // ),

                        SizedBox(
                          height: 80 ,
                        ),
                        //Verify mobile number
                        Text(
                          "Verify Mobile Number",
                          style: FONT_STYLE(color: APPCOLORS.PURE_WHITE,fontsize: 19,fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5 ,
                        ),
                        //Enter the otp
                        Text(
                          "Enter the OTP sent to +91 " +
                              "${widget.phone.toString()}",
                            style: FONT_STYLE(color: APPCOLORS.PURE_WHITE,fontsize: 15,fontWeight: FontWeight.bold)),

                        const SizedBox(
                          height: 30,
                        ),
                        // textField

                        TextField(
                          controller: _otp,
                          onSubmitted: (value) async {},
                          cursorHeight: 20,
                          maxLength: 6,
                          style: FONT_STYLE(color: APPCOLORS.PURE_WHITE,
                              fontsize: 20   ,
                              fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.number,
                          cursorColor: APPCOLORS.WHITE_COLOR,

                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: -10),
                            hintText: "Enter OTP",
                            counterStyle:  FONT_STYLE(color: APPCOLORS.PURE_WHITE,fontsize: 10,fontWeight: FontWeight.bold),
                            hintStyle: FONT_STYLE(color: APPCOLORS.PURE_WHITE,
                                fontsize: 20   ,
                                fontWeight: FontWeight.w500),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: APPCOLORS.PURE_WHITE,
                                  width: 1),
                            ),
                            labelStyle: FONT_STYLE(color: APPCOLORS.PURE_WHITE,
                                fontsize: 20   ,
                                fontWeight: FontWeight.w500),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: APPCOLORS.WHITE_COLOR, width: 2),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 80,
                        ),
                        // Didnt Receive Otp

                        Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't receive OTP ?",
                                style:  FONT_STYLE(color: APPCOLORS.PURE_WHITE,fontsize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(width: 10  ,),
                              otpScreenController.timerTick.value <= 0 ?
                              Row(
                                children: [
                                  InkWell(
                                    onTap:()async{
                                      otpScreenController.timerTick.value = 30;
                                      await otpScreenController.startTimer();
                                      otpScreenController.verifyPhone(widget.phone,context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(color: Colors.white,),
                                      ),
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "Resend OTP",
                          style: FONT_STYLE(color: APPCOLORS.PURE_WHITE,fontsize: 14,fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      // Get.offAll(() => Homescreen());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Skip",
                                          style: FONT_STYLE(color: APPCOLORS.PURE_WHITE,fontsize: 14,fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              )
                                  : Text(
                                "${otpScreenController.timerTick.value}",
                                style: FONT_STYLE(color: APPCOLORS.PURE_WHITE,
                                    fontsize: 20   ,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),

              // Button

              CustomButton(
                text: "Verify and Continue",
                borderRadius: 20,
                height: 50,
                onPressed: () {
                  if(_otp.text.isEmpty){
                    CustomWidget().awesomeDialog(
                      context,
                      "OOps !",
                      "Please write correct OTP must be 6 digit",
                    );
                  }else{
                    print("ot");
                    Get.to( () => Homescreen() );
                  }

                },
                textColor: APPCOLORS.GREY_COLOR,
                buttonColor: APPCOLORS.WHITE_COLOR,
              ),
            ],
          ),
        ));
  }


}