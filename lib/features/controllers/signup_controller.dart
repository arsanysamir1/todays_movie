
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../util/constants/images.dart';
import '../modules/user.dart';
import 'auth_controller.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  var isPasswordHidden = true.obs;

  // 2. Form Controllers

  // 3. Validation Logic
  Future<void> submitForm() async {
    // Triggers all 'validator' functions in the Form fields
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        "Success",
        "Form is valid!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.purple,
      );
      await AuthController.instance.register(emailController.text, passwordController.text);
      final myUser=MyUser(AuthController.instance.user!.uid,MImages.unknownPerson,usernameController.text,emailController.text,phoneNumberController.text);
      myUser.signUpUser();

      // Proceed with API call or navigation
    } else {
      Get.snackbar(
        "Error",
        "Please correct the errors in the form",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void Visibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    conPasswordController.dispose();
    super.onClose();
  }

  String? validateConfPassword(String? value) {
    {
      if (value == passwordController.value.text.toString()) {
        return null;
      } else {
        print(passwordController.value.text.toString());
        return "the passwords you entered is not the same";
      }
    }
  }

}
