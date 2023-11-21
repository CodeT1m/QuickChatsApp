import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_application/consts/consts.dart';
import 'package:demo_application/views/home_screen/home.dart';
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
    phoneVerificationCompleted = ((credential) async {
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
        phoneNumber: '+60${phoneController.text}',
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e.toString());
    }
  }

  verifyOtp(context) async {
    String otp = '';
    for (var i = 0; i < optController.length; i++) {
      otp += optController[i].text;
    }

    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otp);
      final User? user =
          (await auth.signInWithCredential(phoneAuthCredential)).user;

      if (user != null) {
        DocumentReference store =
            FirebaseFirestore.instance.collection(collectionUser).doc(user.uid);

        await store.set({
          'id': user.uid,
          'name': usernameController.text.toString(),
          'phone': phoneController.text.toString(),
        });

        VxToast.show(context, msg: loggedIn);
        Get.offAll(
          () => const HomeScreen(),
          transition: Transition.downToUp,
        );
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
