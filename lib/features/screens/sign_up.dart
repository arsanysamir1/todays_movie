import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todays_movie/util/constants/images.dart';
import 'package:todays_movie/util/validators/validator.dart';
import '../../common/image_picker.dart';
import '../controllers/auth_controller.dart';
import '../controllers/signup_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    MImagePicker picker = MImagePicker();

    final controller = Get.put(SignUpController());
    final width = MediaQuery.of(context).size.width;
    Get.put(AuthController());
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), ?Colors.purple[900]],
            stops: [0.0, 0.4],
          ),
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20,),
            SizedBox(
              width: width,
              child: Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  border: Border.all(width: 1),
                ),
                height: 120,
                width: 120,
                child: InkWell(
                  onTap: () {
                    picker.showPicker(context);
                  },
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(MImages.unknownPerson),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                "Put your personal Image",
                style: TextStyle(fontSize: 18),
              ),
            ),
            sign_up_Form(controller: controller, width: width),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You already have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamed("/signIn");
                  },
                  child: Text("Sign In ", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class sign_up_Form extends StatelessWidget {
  const sign_up_Form({
    super.key,
    required this.controller,
    required this.width,
  });

  final SignUpController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Form(

      key: controller.formKey,
      child: Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
            validator: Validator.validateUsername,
            maxLength: 20,
            inputFormatters: [
              // Allow only lowercase letters, numbers, and allowed symbols
              FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9._-]')),
              // Prevent more than 20 characters
              LengthLimitingTextInputFormatter(20),
            ],
            controller: controller.usernameController,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.person, color: Colors.white),
              fillColor: Color(0xff3A1D4F),
              labelText: "Username",
              labelStyle: TextStyle(color: Colors.white, fontSize: 24),
              border: OutlineInputBorder(),
              hintText: "Enter a name or nickname",
            ),
          ),

          SizedBox(height: 20,),

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
          TextFormField(
            controller: controller.conPasswordController,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.key, color: Colors.white),
              fillColor: Color(0xff3A1D4F),
              labelText: "Confirm Password",
              labelStyle: TextStyle(color: Colors.white, fontSize: 24),
              border: OutlineInputBorder(),
              hintText: "Please enter a strong password",
            ),
            validator: controller.validateConfPassword,
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: controller.phoneNumberController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            inputFormatters: [
              // Allow only digits
              FilteringTextInputFormatter.digitsOnly,
              // Limit to 11 characters
              LengthLimitingTextInputFormatter(11),
            ],
            validator: Validator.validateEgyptianPhone,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(
                Icons.phone_android,
                color: Colors.white,
              ),
              fillColor: Color(0xff3A1D4F),
              labelText: "phone number",
              labelStyle: TextStyle(color: Colors.white, fontSize: 24),
              border: OutlineInputBorder(),
              hintText: "example: 01*********",
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: width,
            child: ElevatedButton(
              onPressed: () {
                controller.submitForm();

              },
              child: Text("Sign Up"),
            ),
          ),
        ],
      ),
    );
  }
}
