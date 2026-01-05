import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../util/validators/validator.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/signin_Controller.dart';
class signInForm extends StatelessWidget {
  const signInForm({
    super.key,
    required this.width,
  });

  final double width;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    return Form(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 80,
            width: width,
            child: Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
          ),
          TextFormField(
            controller: controller.emailController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: Validator.validateEmail,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(
                Icons.email_rounded,
                color: Colors.white,
              ),
              fillColor: Color(0xff3A1D4F),
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.white, fontSize: 24),
              border: OutlineInputBorder(),
              hintText: "Example@gmail.com",
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: controller.passwordController,
            validator: Validator.validatePassword,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.key, color: Colors.white),
              fillColor: Color(0xff3A1D4F),
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.white, fontSize: 24),
              border: OutlineInputBorder(),
              hintText: "Please enter a strong password",
            ),
          ),
          SizedBox(height: 20,),

              Obx(() => Container(width: width,
                child: CheckboxListTile(
                  title: const Text("Show password"),
                  value: controller.isChecked.value,
                  checkColor: Colors.white,

                  fillColor: WidgetStatePropertyAll(Colors.transparent),
                  onChanged: (val) => controller.toggleCheckbox(val),
                  controlAffinity: ListTileControlAffinity.leading, // Moves box to the left
                  activeColor: Colors.blue, // Color when checked
                ),
              )),


          SizedBox(height: 20),
          Container(
            width: width,
            child: ElevatedButton(
              onPressed: () {AuthController.instance.login(controller.emailController.text, controller.passwordController.text);},
              child: Text("Sign In"),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot your password ?",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account yet?", style: TextStyle(fontSize: 16),),
                TextButton(
                  onPressed: () {
                    Get.offNamed("/signUp");
                  },
                  child: Text(
                    "Sign Up ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),



        ],
      ),
    );
  }
}
