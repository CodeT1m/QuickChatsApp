import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_application/consts/consts.dart';

class ProfileController extends GetxController {
  //  text editing controllers
  var nameController = TextEditingController();
  var aboutController = TextEditingController();
  var phoneController = TextEditingController();

  updateProfile(context) async {
    var store =
        firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);
    await store.set({
      'name': nameController.text,
      'about': aboutController.text,
    }, SetOptions(merge: true));

    VxToast.show(context, msg: 'Profile updated successfully!');
  }
}
