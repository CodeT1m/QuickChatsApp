import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/strings.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:demo_application/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: letsConnect.text.black.fontFamily(bold).make(),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Vx.gray400,
                    ),
                  ),
                  labelText: 'Phone Number',
                  prefixText: '+92',
                  hintText: '1234567',
                  prefixIcon: const Icon(
                    Icons.phone_android_rounded,
                    color: Vx.gray600,
                  ),
                  labelStyle: TextStyle(
                    color: Vx.gray600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              10.heightBox,
              otp.text.size(16).make(),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.screenWidth - 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: bgColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: continueText.text.semiBold.size(16).make(),
                    onPressed: () {
                      Get.to(() => HomeScreen(), transition: Transition.downToUp);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
