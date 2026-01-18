import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todays_movie/features/controllers/auth_controller.dart';

class SignInController extends GetxController{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();


  var isPasswordHidden = true.obs;

  var isChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;

  }

  void Visibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Form is valid!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      try{
        AuthController.instance.login(emailController.text, passwordController.text);
      }catch(e){
        print("error:${e.toString()}");
      }

    } else {
      Get.snackbar("Error", "Please correct the errors in the form",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,

      );
    }
  }



  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();

    super.onClose();
  }

}