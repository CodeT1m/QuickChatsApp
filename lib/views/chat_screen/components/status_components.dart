import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/images.dart';
import 'package:demo_application/consts/strings.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget statusComponent() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: btnColor,
            child: Image.asset(
              ic_user,
              color: Colors.white,
            ),
          ),
          title: 'My status'.text.fontFamily(semiBold).color(textColor).make(),
          subtitle: 'Tap to add status updates'.text.gray400.make(),
        ),
        20.heightBox,
        recentUpdates.text.fontFamily(semiBold).color(textColor).make(),
        20.heightBox,
        ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: btnColor, width: 3,)),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Vx.randomPrimaryColor,
                      child: Image.asset(ic_user),
                    ),
                    title: 'Username'
                        .text
                        .fontFamily(semiBold)
                        .color(textColor)
                        .make(),
                    subtitle: 'Today, 8:47 PM'.text.gray400.make(),
                  ),
                ),
              );
            }))
      ],
    ),
  );
}
