import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import 'package:todays_movie/util/constants/images.dart';


import '../../../common/image_picker.dart';
import '../../../util/validators/edite_validator.dart';
import '../../controllers/manage_user_info_controller.dart';
import '../../controllers/user_controller.dart';

MImagePicker picker = MImagePicker();

class ManageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ManageUserController());

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), ?Colors.purple[900]],
            stops: [0.0, 0.4],
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(bottom: 0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Manage your profile",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () async {
                      picker.showPicker(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(400),
                      child: Image(
                        image: AssetImage(MImages.unknownPerson),
                        fit: BoxFit.fill,
                        height: 110,
                        width: 110,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white24),
                    ),
                    onPressed: () {
                      picker.showPicker(context);
                    },
                    child: Text(
                      'Change Profile Image',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 30),
                  Form(key: controller.formKey,child: Column(
                    children: [
                      TextFormField(
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          labelText: "New Username",
                          hintText: UserController.instance.currentUser!
                              .getUserName(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) => EditeValidator.validateEmail(value),
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          labelText: "New E-mail",
                          hintText: UserController.instance.currentUser!.getEmail(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) => EditeValidator.validatePassword(value),
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          labelText: "New Password",
                          hintText: "New Password",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) => controller.validateConfPassword(value),
                        controller: controller.conPasswordController,
                        decoration: InputDecoration(
                          labelText: "Confirm New Password",
                          hintText: "Confirm New Password",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) => EditeValidator.validateEgyptianPhone(value),
                        controller: controller.phoneNumberController,
                        decoration: InputDecoration(
                          labelText: "New Phone Number",
                          hintText: "New Phone Number",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.submitForm();
                          },
                          child: Text("Save Changes"),
                        ),
                      ),
                    ],
                  )),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsBtn(IconData icon, String text) {
    return Card(
      color: Colors.purple.shade700,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(padding: EdgeInsets.only(right: 5), child: Icon(icon)),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
