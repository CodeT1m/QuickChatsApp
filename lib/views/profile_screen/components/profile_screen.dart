import 'package:demo_application/consts/consts.dart';
import 'package:demo_application/controllers/profile_controller.dart';
import 'package:demo_application/services/phone_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: profile.text.fontFamily(bold).make(),
        actions: [
          TextButton(
              onPressed: (){
                controller.updateProfile(context);
              },
              child: 'Save'.text.white.fontFamily(semiBold).make())
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
              future: StoreServices.getUser(currentUser!.uid),
              builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  // var data = snapshot.data!.docs[0];
                  var data = snapshot.data!.docs[0];
                  controller.nameController.text = data['name'];
                  controller.phoneController.text = data['phone'];

                  return Column(
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
                            const Positioned(
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
                          controller: controller.nameController,
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
                        subtitle:
                            nameSub.text.fontFamily(semiBold).gray400.make(),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        title: TextFormField(
                          controller: controller.aboutController,
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
                        subtitle:
                            nameSub.text.fontFamily(semiBold).gray400.make(),
                      ),
                      20.heightBox,
                      ListTile(
                        leading: const Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        title: TextFormField(
                          controller: controller.phoneController,
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
                        subtitle:
                            nameSub.text.fontFamily(semiBold).gray400.make(),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Colors.white,
                      ),
                    ),
                  );
                }
              }))),
    );
  }
}
