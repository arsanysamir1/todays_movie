import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todays_movie/util/constants/images.dart';

import '../../util/validators/validator.dart';
import '../controllers/auth_controller.dart';
import '../controllers/signin_Controller.dart';


class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = Get.put(SignInController());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff3A1D4F), Color(0xff250051)],
          stops: [0.0, 0.4],
        ),
      ),
      child: Container(
        width: width,
        height: width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              height: 100,
              width: 100,

              child: Material(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(MImages.purpleIcon),
              ),
            ),
            SizedBox(height: 60),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Material(
                  color: Colors.transparent,
                  child:  Form(
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
                        Obx(
                          () =>  TextFormField(
                            controller: controller.passwordController,
                            validator: Validator.validatePassword,
                            obscureText:controller.isPasswordHidden.value ,
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
                        ),
                        SizedBox(height: 20,),

                        Obx(() => Container(width: width,
                          child: CheckboxListTile(
                            title: const Text("Show password"),
                            value: controller.isChecked.value,
                            checkColor: Colors.white,
                            fillColor: WidgetStatePropertyAll(Colors.transparent),
                            onChanged: (val) {controller.toggleCheckbox(val);controller.Visibility();},
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
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


