import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/images.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:demo_application/views/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget chatsComponent() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.separated(
      itemBuilder: ((context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Get.to(() => const ChatScreen(), transition: Transition.downToUp);
            },
            leading: CircleAvatar(
              backgroundColor: btnColor,
              radius: 20,
              child: Image.asset(
                ic_user,
                color: Colors.white,
              ),
            ),
            title: 'Username'.text.fontFamily(semiBold).size(14).make(),
            subtitle: 'Message here..'.text.make(),
            trailing: Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.access_time_filled_rounded),
                label: 'Last Seen'.text.color(Vx.gray400).size(12).make(),
              ),
            ),
          ),
        );
      }),
      separatorBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 4),
        );
      },
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
    ),
  );
}
