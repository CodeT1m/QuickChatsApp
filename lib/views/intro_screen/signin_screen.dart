import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/strings.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:demo_application/controllers/auth_controller.dart';
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
    var controller = Get.put(AuthController());

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
              // username field
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty || value.length < 6) {
                            return "Please enter a valid username";
                          }
                          return null;
                        }),
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Vx.gray400,
                            ),
                          ),
                          labelText: 'Username',
                          hintText: 'e.g. Alex',
                          prefixIcon: const Icon(
                            Icons.phone_android_rounded,
                            color: Vx.gray600,
                          ),
                          labelStyle: const TextStyle(
                            color: Vx.gray600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      10.heightBox,
                      // phone field
                      TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty || value.length < 6) {
                            return "Please enter your phone number";
                          }
                          return null;
                        }),
                        controller: controller.phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Vx.gray400,
                            ),
                          ),
                          labelText: 'Phone Number',
                          prefixText: '+60',
                          hintText: '1234567',
                          prefixIcon: const Icon(
                            Icons.phone_android_rounded,
                            color: Vx.gray600,
                          ),
                          labelStyle: const TextStyle(
                            color: Vx.gray600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
              10.heightBox,
              otp.text.size(16).make(),

              // otp field
              Obx(
                () => Visibility(
                  visible: controller.isOtpSent.value,
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 56,
                          child: TextField(
                            controller: controller.optController[index],
                            cursorColor: btnColor,
                            onChanged: (value) {
                              if (value.length == 1 && index <= 5) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            style: TextStyle(
                              fontFamily: bold,
                              color: btnColor,
                            ),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: '*',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: bgColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: bgColor,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

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
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.isOtpSent.value == false) {
                          controller.isOtpSent.value = true;
                          await controller.sendOtp();
                          // print(controller.phoneController.text);
                        } else {
                          await controller.verifyOtp(context);
                        }
                      }
                      // Get.to(() => HomeScreen(),
                      //     transition: Transition.downToUp);
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
