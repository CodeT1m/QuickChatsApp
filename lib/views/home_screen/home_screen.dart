import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/views/home_screen/components/drawer.dart';
import 'package:demo_application/views/home_screen/components/appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer(),
        backgroundColor: bgColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: bgColor,
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Column(
          children: [
            appBar(scaffoldKey),
            Expanded(
              child: Row(
                children: [
                  tabBar(),
                  tabBarView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
