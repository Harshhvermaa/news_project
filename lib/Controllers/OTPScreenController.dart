import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../widgets/customDialog.dart';

class OtpScreenController extends GetxController {
  RxInt timerTick = 30.obs;
  RxString verificationID = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimer();
  }

  verifyOtp(String smsCode,String phoneNumber,BuildContext context)async{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID.value,
        smsCode: '$smsCode', // Replace with the actual OTP code retrieved
      );
      try {
        print("object");

      } catch (e) {
        CustomWidget().awesomeDialog(
          context,
          "Sorry !",
          "Please write correct OTP",
        );
        print("OTP verification failed: ${e.toString()}");
      }
  }

  startTimer(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      timerTick > 0 ? timerTick-- : null;
    });
  }

  verifyPhone(String phone,BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print("Logged IN");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          CustomWidget().awesomeDialog(
              context,
              "OOPS",
               "${e.message}",
            okfunction: () {
              print("Something went wrong");
            },
          );
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
            verificationID.value = verficationID!;
            CustomWidget().awesomeDialog(
              context,
              "Success",
              "OTP code sent successfully",
              dialogType: DialogType.success
            );
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          print("OTP code auto retrieval timeout");
        },
        timeout: Duration(seconds: 60),
    );
  }

}
