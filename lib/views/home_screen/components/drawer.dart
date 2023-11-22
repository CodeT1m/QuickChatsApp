import 'package:demo_application/consts/consts.dart';
import 'package:demo_application/main.dart';
import 'package:demo_application/views/profile_screen/components/profile_screen.dart';

Widget drawer() {
  return Drawer(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(25),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              backIcon,
              color: Colors.white,
            ).onTap(() {}),
            title: settings.text.fontFamily(semiBold).white.make(),
          ),
          20.heightBox,
          CircleAvatar(
            radius: 45,
            backgroundColor: btnColor,
            child: Image.asset(
              ic_user,
              color: Colors.white,
            ),
          ),
          10.heightBox,
          'Username'.text.white.fontFamily(semiBold).size(16).make(),
          20.heightBox,
          const Divider(
            color: btnColor,
            height: 0.5,
          ),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
                drawerIconsList.length,
                (index) => ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(
                              () => const ProfileScreen(),
                              transition: Transition.downToUp,
                            );
                            break;
                          default:
                        }
                      },
                      leading: Icon(
                        drawerIconsList[index],
                        color: Colors.white,
                      ),
                      title: listOfFeatures[index]
                          .text
                          .fontFamily(semiBold)
                          .white
                          .make(),
                    )),
          ),
          10.heightBox,
          const Divider(
            color: btnColor,
            height: 1,
          ),
          10.heightBox,
          ListTile(
            leading: const Icon(
              inviteIcon,
              color: Colors.white,
            ),
            title: invite.text.fontFamily(semiBold).white.make(),
          ),
          const Spacer(),
          ListTile(
            onTap: () async {
              await auth.signOut();
              Get.offAll(() => const ChatApp());
            },
            leading: const Icon(
              logoutIcon,
              color: Colors.white,
            ),
            title: logout.text.fontFamily(semiBold).white.make(),
          )
        ],
      ),
    ),
  );
}
