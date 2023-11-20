import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/images.dart';
import 'package:demo_application/consts/strings.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: profile.text.fontFamily(bold).make(),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: btnColor,
              child: Stack(
                children: [
                  Image.asset(
                    ic_user,
                    color: Colors.white,
                  ),
                  Positioned(
                      child: CircleAvatar(
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                    ),
                  ))
                ],
              ),
            ),
            20.heightBox,
            const Divider(
              height: 1,
              color: btnColor,
            ),
            10.heightBox,
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  label: 'Name'.text.make(),
                  isDense: true,
                  labelStyle: const TextStyle(
                    fontFamily: semiBold,
                    color: Colors.white,
                  ),
                ),
              ),
              subtitle: nameSub.text.fontFamily(semiBold).gray400.make(),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  label: 'About'.text.make(),
                  isDense: true,
                  labelStyle: const TextStyle(
                    fontFamily: semiBold,
                    color: Colors.white,
                  ),
                ),
              ),
              subtitle: nameSub.text.fontFamily(semiBold).gray400.make(),
            ),
            20.heightBox,
            ListTile(
              leading: const Icon(
                Icons.call,
                color: Colors.white,
              ),
              title: TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  label: 'Phone'.text.make(),
                  isDense: true,
                  labelStyle: const TextStyle(
                    fontFamily: semiBold,
                    color: Colors.white,
                  ),
                ),
              ),
              subtitle: nameSub.text.fontFamily(semiBold).gray400.make(),
            ),
          ],
        ),
      ),
    );
  }
}
