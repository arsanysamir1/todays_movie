
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:todays_movie/features/controllers/user_controller.dart';

import 'auth_controller.dart';

class ManageUserController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController.text =  UserController.instance.currentUser.value!
        .getUserName();
    emailController.text =  UserController.instance.currentUser.value!.getEmail();

    phoneNumberController.text =  UserController.instance.currentUser.value!
        .getPhoneNum();
  }

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
      if (passwordController.text != "") {
        print("changing password");
        AuthController.instance.user!.updatePassword(passwordController.text);
      }
      //pass updated

      if (emailController.text == "") {
        emailController.text =  UserController.instance.currentUser.value!.getEmail();
      } else if (emailController.text !=
           UserController.instance.currentUser.value!.getEmail()) {}
      if (usernameController.text == "") {
        usernameController.text =  UserController.instance.currentUser.value!
            .getUserName();
      }
      if (phoneNumberController.text == "") {
        phoneNumberController.text =  UserController.instance.currentUser.value!
            .getPhoneNum();
      }

      print( UserController.instance.currentUser.value!.getImage());
       UserController.instance.currentUser.value!.manageUserDetails(
        usernameController.text,
        emailController.text,
        phoneNumberController.text,
         UserController.instance.currentUser.value!.getImage(),
      );

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
