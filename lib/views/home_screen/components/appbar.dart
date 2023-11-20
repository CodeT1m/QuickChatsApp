import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/images.dart';
import 'package:demo_application/consts/strings.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:demo_application/views/chat_screen/components/chats_components.dart';
import 'package:demo_application/views/chat_screen/components/status_components.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appBar(GlobalKey<ScaffoldState> key) {
  return Container(
    padding: EdgeInsets.only(right: 12),
    height: 80,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: Container(
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            height: 80,
            width: 100,
            child: const Icon(
              settingsIcon,
              color: Color.fromARGB(255, 97, 43, 43),
            ),
          ),
        ),
        RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: '$appname\n',
                style: TextStyle(
                  fontFamily: bold,
                  fontSize: 22,
                  color: Colors.black,
                )),
            TextSpan(
                text: '\t\t$connectingLives',
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Vx.gray600,
                ))
          ]),
        ),
        CircleAvatar(
          backgroundColor: bgColor,
          radius: 25,
          child: Image.asset(
            ic_user,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget tabBar() {
  return Container(
    child: const RotatedBox(
      quarterTurns: 3,
      child: TabBar(
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Vx.gray500,
          indicator: BoxDecoration(),
          tabs: [
            Tab(
              text: chats,
            ),
            Tab(
              text: status,
            ),
            Tab(
              text: camera,
            ),
          ]),
    ),
  );
}

Widget tabBarView() {
  return Expanded(
      child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12))),
          child: TabBarView(children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(12))),
              child: chatsComponent(),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(12))),
              child: statusComponent(),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(12))),
            )
          ])));
}
