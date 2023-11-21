import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/firebase_consts.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var optController = List.generate(6, (index) => TextEditingController());

  // variables
  var isOtpSent = false.obs;

  //  auth variables
  late final PhoneVerificationCompleted phoneVerificationCompleted;
  late final PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID = '';

  sendOtp() async {
    phoneVerificationCompleted = ((credential) async{
      await auth.signInWithCredential(credential);
    });
    phoneVerificationFailed = (FirebaseException e) {
      if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
    };
    phoneCodeSent = (String verificationId, int? resendToken) {
      verificationID = verificationId;
    };
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text.toString(),
      verificationCompleted: phoneVerificationCompleted,
      verificationFailed: phoneVerificationFailed,
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    } catch (e) {
      
    }
  }
}
