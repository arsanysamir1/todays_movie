import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todays_movie/features/controllers/auth_controller.dart';
import 'package:todays_movie/features/modules/user.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();
  final _firestore = FirebaseFirestore.instance;

  Rx<MyUser?> currentUser=Rx(null);

  // 1. Remove the direct '!' check here.
  // We will get the UID inside the method.
  String? uid;

  @override
  void onInit() {
    super.onInit();
    setUser();
  }

  Future<void> setUser() async {
    try {
      // 2. Safely get the user from AuthController
      var authUser = Get.find<AuthController>().user;

      if (authUser != null) {
        uid = authUser.uid;

        // Use the uid safely here
        final value = await _firestore.collection('user').doc(uid!+"1").get();
        if (value.exists) {
          print("user got initialized");
          currentUser.value = MyUser.full(
            value.id,
            value["username"],
            value["email"],
            value['phoneNum'],
            value["image"],
            value["sub"],
            value["subDuration"],
            value["numOfDown"],
            value["watchHours"],
            value["downloadedMovies"],
            value["favoriteMovies"],
            value["savedMovies"],
          );
          update();
        }
      } else {
        print("No user logged in yet.");
      }
    } catch (e) {
      print("Error fetching user: $e");
    }
  }
}