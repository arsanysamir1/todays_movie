
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  // 1. FIX: Change this to a getter
  static AuthController get instance => Get.find<AuthController>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 2. FIX: Initialize Rx immediately to avoid "LateInitializationError"
  // Using Rxn<User> is cleaner for nullable types in 2025
  Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  void onInit() { // 3. CHANGE: Use onInit instead of onReady for early binding
    super.onInit();
    _firebaseUser.value = _auth.currentUser;
    _firebaseUser.bindStream(_auth.authStateChanges());

    // Workers like 'ever' should be placed in onInit
    ever(_firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    // Delay is good, but ensure the route names match your GetPage setup
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   if (user == null) {
    //     Get.offAllNamed('/signIn');
    //   } else {
    //     Get.offAllNamed('/homePages');
    //   }
    // });
  }
  //

  // Register Method
  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Login Method
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
    }
  }

  // Logout Method
  Future<void> logout() async => await _auth.signOut();
}